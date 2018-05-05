using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Example1.Models
{
    public class Pricing
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DateTime From { get; set; }

        [Required]
        public DateTime To { get; set; }
        
        [Required]
        [Range(0,int.MaxValue)]
        public int Price { get; set; }

        public virtual CardInfo CardInfo { get; set; }
    }
}