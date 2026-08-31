using Demo.Controllers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

public class TaskService : TaskInterface
{
    SqlConnection conn;

    public TaskService()
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        conn = new SqlConnection(cs);
    }


    // get all projects
    public List<Projects> GetAllProjects()
    {
        string q = "exec sp_getAllProjects";
        SqlCommand cmd = new SqlCommand(q, conn);
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();

        List<Projects> projects = new List<Projects>();
        while (rdr.Read())
        {
            Projects project = new Projects();
            project.ProjectId =int.Parse(rdr["ProjectId"].ToString());
            project.ProjectName = rdr["ProjectName"].ToString();
            projects.Add(project);
        }
        rdr.Close();
        return projects;
    }


    //  members of selected project fetching
    public List<ProjectMember> GetProjectMembers(
        int projectId)
    {
        string q = "exec sp_getprojectmembers @ProjectId";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@ProjectId", projectId);
        conn.Open   ();
        SqlDataReader rdr = cmd.ExecuteReader();
        List<ProjectMember> members = new List<ProjectMember>();
        while (rdr.Read())
        {
            ProjectMember member = new ProjectMember();
            member.UserId = int.Parse(rdr["UserId"].ToString());
            member.MemberName = rdr["MemberName"].ToString();
            members.Add(member);
        }
        conn.Close();
        rdr.Close();
        return members;
    }


    // task inserting
    public int AddTask(Tasks task)
    {
        string q = "exec sp_addTask @ProjectId, @Title, @Description, @Status, @Priority, @FilePath, @Deadline"; q =  "exec sp_addTask '{@ProjectId}','{@Title}','{@Description}','{@Status}','{@Priority}','{@FilePath}','{@Deadline}'";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@ProjectId", task.ProjectId);
        cmd.Parameters.AddWithValue("@Title", task.Title);
        cmd.Parameters.AddWithValue("@Description", task.Description);
        cmd.Parameters.AddWithValue("@Status", task.Status);
        cmd.Parameters.AddWithValue("@Priority", task.Priority);
        if (string.IsNullOrEmpty(task.FilePath))
        {
            cmd.Parameters.AddWithValue("@FilePath", DBNull.Value);
        }
        else
        {
            cmd.Parameters.AddWithValue("@FilePath", task.FilePath);
        }
        cmd.Parameters.AddWithValue("@Deadline", task.DeadLine);
        conn.Open();
        int taskId = int.Parse(cmd.ExecuteScalar().ToString());
        return taskId;
    }


    //  adding task member
    public void AddTaskMember(int taskId, int userId)
    {
        string q = "exec sp_addTaskMember @TaskId, @UserId";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@TaskId", taskId);
        cmd.Parameters.AddWithValue("@UserId", userId);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }


    // get all tasks
    public List<Tasks> GetAllTasks()
    {
        string q = "exec sp_getAllTasks";
        SqlCommand cmd = new SqlCommand(q, conn);
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        List<Tasks> tasks = new List<Tasks>();
        while (rdr.Read())
        {
            Tasks task = new Tasks();
            task.TaskId = int.Parse(rdr["TaskId"].ToString());
            task.ProjectName = rdr["ProjectName"].ToString();
            task.Title = rdr["Title"].ToString();
            task.Members = rdr["Members"].ToString();
            task.DeadLine = DateTime.Parse(rdr["Deadline"].ToString());
            task.Priority = rdr["Priority"].ToString();
            task.Status = rdr["Status"].ToString();
            tasks.Add(task);
        }
        rdr.Close();
        conn.Close();
        return tasks;
    }


    // getting task bassed on priority

    public List<Tasks> GetTasksByPriority(
        string priority)
    {
        string q = "exec sp_getTasksByPriority @Priority";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@Priority", priority);
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        List<Tasks> tasks = new List<Tasks>();
        while (rdr.Read())
        {
            Tasks task = new Tasks();
            task.TaskId = int.Parse(rdr["TaskId"].ToString());
            task.ProjectName = rdr["ProjectName"].ToString();
            task.Title = rdr["Title"].ToString();
            task.Members = rdr["Members"].ToString();
            task.DeadLine = DateTime.Parse(rdr["Deadline"].ToString());
            task.Priority = rdr["Priority"].ToString();
            task.Status = rdr["Status"].ToString();
            tasks.Add(task);
        }
        rdr.Close();
        conn.Close();
        return tasks;
    }


    // get task by date

    public List<Tasks> GetTasksByDate(
        DateTime date)
    {
        string q = "exec sp_getTasksByDate @Deadline";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@Deadline", date);
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        List<Tasks> tasks = new List<Tasks>();
        while (rdr.Read())
        {
            Tasks task = new Tasks();
            task.TaskId = int.Parse(rdr["TaskId"].ToString());
            task.ProjectName = rdr["ProjectName"].ToString();
            task.Title = rdr["Title"].ToString();
            task.Members = rdr["Members"].ToString();
            task.DeadLine = DateTime.Parse(rdr["Deadline"].ToString());
            task.Priority = rdr["Priority"].ToString();
            task.Status = rdr["Status"].ToString();
            tasks.Add(task);
        }
        rdr.Close();
        conn.Close();
        return tasks;
    }
    //for taskboard progress dropdown
    public List<Tasks> GetTasksByStatus(string status)
    {
        string q = "exec sp_getTasksByStatus @Status";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@Status", status);
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        List<Tasks> tasks = new List<Tasks>();
        while (rdr.Read())
        {
            Tasks task = new Tasks();
            task.TaskId = int.Parse(rdr["TaskId"].ToString());
            task.Title = rdr["Title"].ToString();
            task.DeadLine = DateTime.Parse(rdr["Deadline"].ToString());
            task.Priority = rdr["Priority"].ToString();
            task.Status = rdr["Status"].ToString();
            tasks.Add(task);
        }
        rdr.Close();
        conn.Close();
        return tasks;
    }

    public List<Tasks> GetTasksByProject(int projectId)
    {
        string q = "exec sp_getTasksByProject @ProjectId";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@ProjectId", projectId);
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        List<Tasks> tasks = new List<Tasks>();
        while (rdr.Read())
        {
            Tasks task = new Tasks();
            task.TaskId = int.Parse(rdr["TaskId"].ToString());
            task.Title = rdr["Title"].ToString();
            tasks.Add(task);
        }
        rdr.Close();
        conn.Close();
        return tasks;
    }

    public List<Projects> GetProjects()
    {
        string q = "SELECT ProjectId, ProjectName FROM AllProjects";
        SqlCommand cmd = new SqlCommand(q, conn);
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        List<Projects> projects = new List<Projects>();
        while (rdr.Read())
        {
            Projects project = new Projects();
            project.ProjectId = int.Parse(rdr["ProjectId"].ToString());
            project.ProjectName = rdr["ProjectName"].ToString();
            projects.Add(project);
        }
        rdr.Close();
        conn.Close();
        return projects;
    }
    public void AddTaskBoard(
    int projectId,
    int taskId,
    int percentage,
    DateTime dueDate)
    {
        string q = "exec sp_addTaskBoard '{@ProjectId}', '{@TaskId}', '{@Percentage}', '{@DueDate}'";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@ProjectId", projectId);
        cmd.Parameters.AddWithValue("@TaskId", taskId);
        cmd.Parameters.AddWithValue("@Percentage", percentage);
        cmd.Parameters.AddWithValue("@DueDate", dueDate);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

}