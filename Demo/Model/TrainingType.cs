using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Model
{
    public class TrainingType
    {
        public int TrainingTypeId { get; set; }
        public string TrainingTypeName { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
    }
}