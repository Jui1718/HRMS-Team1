using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class TaskMembers
    {
    public int AssignedId {  get; set; }
    public int TaskId { get; set; } 
    public Tasks Task {  get; set; }
    //following are foreign keys from User
    public int UserId {  get; set; }
    //public User User { get; set; }
    }
