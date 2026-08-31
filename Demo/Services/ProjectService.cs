using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices.ComTypes;

public class ProjectService : ProjectInterface
{
    SqlConnection conn;

    public ProjectService()
    {
        string cmf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

        conn = new SqlConnection(cmf);
        conn.Open();
    }


    public string addProject(Projects p)
    {
        string q = $"exec sp_addproject '{p.ProjectName}','{p.ClientName}','{p.Description}','{p.StartDate}','{p.EndDate}','{p.Priority}','{p.ProjectValue}','{p.PriceType}','{p.FilePath}','{p.LogoPath}','{p.Status}','{p.ManagerName}'";
        SqlCommand cmd = new SqlCommand(q, conn);
        string msg = cmd.ExecuteScalar().ToString();
        return msg;
    }


    public List<Projects> fetchProject()
    {
        string q = "exec GetProjectList";

        SqlCommand cmd = new SqlCommand(q, conn);

        SqlDataReader rdr = cmd.ExecuteReader();

        var projects = new List<Projects>();

        while (rdr.Read())
        {
            var project = new Projects()
            {
                ProjectId = int.Parse(rdr["ProjectId"].ToString()),
                ProjectName = rdr["ProjectName"].ToString(),
                ManagerName = rdr["TeamMembers"].ToString(),
                EndDate = DateTime.Parse(rdr["Deadline"].ToString()),
                Priority = rdr["Priority"].ToString(),
                Status = rdr["Status"].ToString()
            };

            projects.Add(project);
        }

        rdr.Close();

        return projects;
    }


    public Projects fetchProjectById(int id)
    {
        
        string q = $"exec dbo.sp_SearchProjectById '{id}'";
        SqlCommand cmd = new SqlCommand(q, conn);

        SqlDataReader rdr = cmd.ExecuteReader();

        rdr.Read();

        var project = new Projects()
        {
            ProjectId = int.Parse(rdr["ProjectId"].ToString()),
            ProjectName = rdr["ProjectName"].ToString(),
            ClientName = rdr["ClientName"].ToString(),
            Description = rdr["Description"].ToString(),
            StartDate = DateTime.Parse(rdr["StartDate"].ToString()),
            EndDate = DateTime.Parse(rdr["EndDate"].ToString()),
            Priority = rdr["Priority"].ToString(),
            ProjectValue = rdr["ProjectValue"].ToString(),
            PriceType = rdr["PriceType"].ToString(),
            FilePath = rdr["FilePath"].ToString(),
            LogoPath = rdr["LogoPath"].ToString(),
            Status = rdr["Status"].ToString(),
            ManagerName = rdr["ManagerName"].ToString()
        };

        rdr.Close();

        return project;
    }
     
    //for projectlist page to delete project
    public string deleteProject(int id)
    {
        string q = $"exec sp_DeleteProject '{id}'";
        SqlCommand cmd = new SqlCommand(q, conn);
        string msg = cmd.ExecuteScalar().ToString();
        return msg;
    }

    //in edit project for save changes button 
    public void updateProject(Projects p)
    {
        string q = $"exec dbo.sp_UpdateProject '{p.ProjectId}','{p.ProjectName}', '{p.ClientName}', '{p.Description}', '{p.StartDate:yyyy-MM-dd}','{p.EndDate:yyyy-MM-dd}', '{p.Priority}', '{p.ProjectValue}','{p.PriceType}', '{p.Status}'";

        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.ExecuteNonQuery();
    }

    //for editproject page only to fetch the members 
    //in edit form to fetch team members inchde checklist
    public List<ProjectMember> GetProjectMembers(int projectId)
    {
        string q = "exec GetProjectMembers '{p.ProjectId}'";

        SqlCommand cmd = new SqlCommand(q, conn);
        SqlDataReader rdr = cmd.ExecuteReader();
        List<ProjectMember> members = new List<ProjectMember>();
        while (rdr.Read())
        {
            ProjectMember member = new ProjectMember();
            member.UserId = int.Parse(rdr["UserId"].ToString());
            member.MemberName = rdr["MemberName"].ToString();
            members.Add(member);
        }
        rdr.Close();
        return members;
    }

    public List<ProjectManager> GetProjectManagers()
    {
        string q = "exec GetProjectManagers";
        SqlCommand cmd = new SqlCommand(q, conn);
        SqlDataReader rdr = cmd.ExecuteReader();
        List<ProjectManager> managers = new List<ProjectManager>();
        while (rdr.Read())
        {
            ProjectManager manager = new ProjectManager();
            manager.UserId = int.Parse(rdr["UserId"].ToString());
            manager.FirstName = rdr["FirstName"].ToString();
            managers.Add(manager);
        }
        rdr.Close();
        return managers;
    }

    //for add project page only
    public List<ProjectManager> GetMembers()
    {
        string q = "exec fetchMembers";
        SqlCommand cmd = new SqlCommand(q, conn);
        SqlDataReader rdr = cmd.ExecuteReader();
        List<ProjectManager> members = new List<ProjectManager>();
        while (rdr.Read())
        {
            ProjectManager member = new ProjectManager();
            member.UserId = int.Parse(rdr["UserId"].ToString());
            member.FirstName = rdr["FirstName"].ToString();
            members.Add(member);
        }
        rdr.Close();
        return members;
    }

    public int AddProject(
    string projectName,
    string clientName,
    string description,
    DateTime startDate,
    DateTime endDate,
    string priority,
    decimal projectValue,
    string priceType,
    string filePath,
    string logoPath,
    string status,
    string managerName)
    {
        string q = "exec AddProject '{@ProjectName}', '{@ClientName}', '{@Description}', '{@StartDate}', '{@EndDate}', '{@Priority}', '{@ProjectValue}', '{@PriceType}', '{@FilePath}', '{@LogoPath}', '{@Status}', '{@ManagerName}'";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@ProjectName", projectName);
        cmd.Parameters.AddWithValue("@ClientName", clientName);
        cmd.Parameters.AddWithValue("@Description", description);
        cmd.Parameters.AddWithValue("@StartDate", startDate);
        cmd.Parameters.AddWithValue("@EndDate", endDate);
        cmd.Parameters.AddWithValue("@Priority", priority);
        cmd.Parameters.AddWithValue("@ProjectValue", projectValue);
        cmd.Parameters.AddWithValue("@PriceType", priceType);
        cmd.Parameters.AddWithValue("@FilePath", filePath);
        cmd.Parameters.AddWithValue("@LogoPath", logoPath);
        cmd.Parameters.AddWithValue("@Status", status);
        cmd.Parameters.AddWithValue("@ManagerName", managerName);
        int projectId = Convert.ToInt32(cmd.ExecuteScalar());
        return projectId;
    }


    public void AddProjectUser(int projectId, int userId)
    {
        string q = "exec AddProjectUser @ProjectId, @UserId";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.Parameters.AddWithValue("@ProjectId", projectId);
        cmd.Parameters.AddWithValue("@UserId", userId);
        cmd.ExecuteNonQuery();
    }
}