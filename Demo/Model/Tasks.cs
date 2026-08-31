using System;
using System.Collections.Generic;

public class Tasks
{
    public int TaskId { get; set; }

    public int ProjectId { get; set; }

    public Projects Project { get; set; }

  
    public string ProjectName { get; set; }

    public string Title { get; set; }

    public string Members { get; set; }

    public string Description { get; set; }

    public string Status { get; set; }

    public string Priority { get; set; }

    public string FilePath { get; set; }

    public DateTime DeadLine { get; set; }

    public List<TaskBoards> TaskBoards { get; set; }

    public List<TaskMembers> Taskmember { get; set; }
}