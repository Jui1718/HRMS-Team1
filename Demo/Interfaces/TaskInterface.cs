using System;
using System.Collections.Generic;

public interface TaskInterface
{
    List<Projects> GetAllProjects();

    List<ProjectMember> GetProjectMembers(int projectId);

    int AddTask(Tasks task);

    void AddTaskMember(int taskId, int userId);

    List<Tasks> GetAllTasks();

    List<Tasks> GetTasksByPriority(string priority);

    List<Tasks> GetTasksByDate(DateTime date);

    List<Tasks> GetTasksByProject(int projectId);
    List<Projects> GetProjects();

    void AddTaskBoard(int projectId, int taskId, int percentage, DateTime dueDate);
}