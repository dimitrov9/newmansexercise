using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TestEntityFramework.Models
{
    public class Employee
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        [Index("IX_First_Name", IsClustered = false, Order = 1)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(50)]
        [Index("IX_Last_Name", IsClustered = false, Order = 2)]
        public string LastName { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime BirthDate { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public int Salary { get; set; }

        [MaxLength(200)]
        public string Address { get; set; }

        [MaxLength(20)]
        //[RegularExpression("[0-9]+")]
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }
    }
}