using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestEntityFramework.Models
{
    public class Pricing
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DateTime FromDateTime { get; set; }

        [Required]
        public DateTime ToDateTime { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public int Price { get; set; }

        public virtual CardInfo CardInfo { get; set; }
    }
}