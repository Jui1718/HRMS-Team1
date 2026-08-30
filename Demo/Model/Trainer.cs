using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Model
{
    public class Trainer
    {
        public int TrainerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Role { get; set; }
        public string Email { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public string Phone { get; set; }
        public string ProfilePicture { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}