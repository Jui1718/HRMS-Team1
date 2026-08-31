using System;
using System.Collections.Generic;

interface ProjectInterface
{
    string addProject(Projects p);

    List<Projects> fetchProject();

    string deleteProject(int id);

    void updateProject(Projects p);

    Projects fetchProjectById(int id);
    List<ProjectManager> GetProjectManagers();

    List<ProjectManager> GetMembers();

    int AddProject(
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
     string managerName
 );

    void AddProjectUser(int projectId, int userId);

    
}