using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

  public class TaskBoards
    {
    public int TaskBoardId {  get; set; }
    //from Projects
    public int ProjectId {  get; set; }
    public Projects Project {  get; set; }
    //from Tasks
    public int TaskId {  get; set; }
    public Tasks Task {  get; set; }
    public int Percentage {  get; set; }
    public DateTime DueDate {  get; set; }
    }
