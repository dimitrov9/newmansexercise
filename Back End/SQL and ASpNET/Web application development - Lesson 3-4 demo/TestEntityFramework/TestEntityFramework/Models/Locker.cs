using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestEntityFramework.Models
{
    public class Locker
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Range(0, 1000)]
        public int Number { get; set; }

        [Required]
        [DefaultValue(false)]
        public bool IsForMale { get; set; }

        public virtual List<Visit> Visits { get; set; }
    }
}