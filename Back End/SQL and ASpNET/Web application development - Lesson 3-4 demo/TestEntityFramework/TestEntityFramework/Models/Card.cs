using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestEntityFramework.Models
{
    public class Card
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DateTime PaidOn { get; set; }

        [Required]
        public DateTime StartDateTime { get; set; }

        [Required]
        public DateTime EndDateTime { get; set; }

        public virtual CardInfo CardInfo { get; set; }

        public virtual List<Visit> Visits { get; set; }

        public virtual Administrator Administrator { get; set; }
        public virtual Member Member { get; set; }
        public virtual PaymentMethod PaymentMethod { get; set; }
    }
}