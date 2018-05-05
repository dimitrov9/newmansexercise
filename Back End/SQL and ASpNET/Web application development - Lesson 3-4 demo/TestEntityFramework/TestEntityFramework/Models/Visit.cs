using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestEntityFramework.Models
{
    public class Visit
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DateTime ArrivalDateTime { get; set; }

        [Required]
        public DateTime LeaveDateTime { get; set; }

        public virtual Locker Locker { get; set; }

        public virtual Card Card { get; set; }
    }
}