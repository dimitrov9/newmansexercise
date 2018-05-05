using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Example1.Models
{
    public class Administrator
    {
        [Key]
        [ForeignKey(nameof(Employee))]
        public int EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [MaxLength(100)]
        public string Email { get; set; }

        [Required]
        [MaxLength(100)]
        public string Username { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [MaxLength(100)]
        public string Password { get; set; }

        public virtual List<Card> Cards { get; set; }
    }
}