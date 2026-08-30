using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Model
{
    public class Training
    {
        public int TrainingId { get; set; }
        public int TrainerId { get; set; }
        public int TrainingTypeId { get; set; }
        public int UserId { get; set; }
        public decimal TrainingCost { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string ModifiedBy { get; set; }
        // GridView display
        public string TrainerName { get; set; }
        public string TrainingTypeName { get; set; }
        public string EmployeeName { get; set; }
    }
}