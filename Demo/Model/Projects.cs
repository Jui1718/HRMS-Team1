using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Projects
    {
    public int ProjectId { get; set;  }
    public string ProjectName {  get; set; }
    public string ClientName {  get; set; }
    public string Description {  get; set; }
    public DateTime StartDate {  get; set; }
    public DateTime EndDate { get; set; }
    public string Priority {  get; set; }
    public string ProjectValue { get; set; }
    public string TeamMembers { get; set; }
    public DateTime Deadline { get; set; }

    public string PriceType {  get; set; }
    public string FilePath {  get; set; }
    public string LogoPath {  get; set; }
    public String Status {  get; set; }
    public string ManagerName {  get; set; }
    public ICollection<Tasks> Tasks { get; set; }
    //public virtual ICollection<User> Users { get; set; }
    //public List<Timesheet> Timesheets { get; set; }





}
