using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Example1.Models
{
    public class Visit
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DateTime Arrival { get; set; }

        [Required]
        public DateTime Leave { get; set; }

        public virtual Card Card { get; set; }

        public virtual Locker Locker { get; set; }
    }
}