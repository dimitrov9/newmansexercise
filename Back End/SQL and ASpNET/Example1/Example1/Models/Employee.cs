using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Example1.Models
{
    public class Employee
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        [DisplayName("First Name")]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(50)]
        [DisplayName("Презиме")]
        public string LastName { get; set; }

        [Required]
        [MaxLength(200)]
        public string Address { get; set; }

        [Required]
        [MaxLength(20)]
        public string Phone { get; set; }

        [Required]
        [DefaultValue(true)]
        public bool StillWorksHere { get; set; }

        [Required]
        [Range(0,300000)]
        public int Salary { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime BirthDay { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime StartDay { get; set; }
    }
}