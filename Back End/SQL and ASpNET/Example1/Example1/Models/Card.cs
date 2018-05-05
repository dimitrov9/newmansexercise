using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Example1.Models;

namespace Example1.Models
{
    public class Card
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DateTime Start { get; set; }

        [Required]
        public DateTime End { get; set; }

        [Required]
        public DateTime CreatedOn { get; set; }

        public virtual CardInfo CardInfo { get; set; }

        public virtual Member Member { get; set; }

        public virtual PaymentType PaymentType { get; set; }

        public virtual Administrator Administrator { get; set; }

        public virtual List<Visit> Visits { get; set; }
    }
}