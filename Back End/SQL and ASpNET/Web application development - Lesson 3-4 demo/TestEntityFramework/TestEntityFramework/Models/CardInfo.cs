using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestEntityFramework.Models
{
    public class CardInfo
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        [Required]
        [MaxLength(3)]
        [MinLength(2)]
        public string Duration { get; set; }

        [Required]
        [Range(1,7)]
        public int VisitsInWeek { get; set; }

        public virtual List<Card> Cards { get; set; }

        public virtual List<Pricing> Pricings { get; set; }
    }
}