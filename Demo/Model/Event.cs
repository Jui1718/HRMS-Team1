using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Model
{
    public class Event
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int EventTypeId { get; set; }
        public DateTime Date { get; set; }
        public string Status { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
    }
}