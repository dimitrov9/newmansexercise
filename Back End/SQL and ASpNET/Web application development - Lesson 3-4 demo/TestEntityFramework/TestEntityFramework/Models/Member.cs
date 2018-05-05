using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestEntityFramework.Models
{
    public class Member
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [MaxLength(200)]
        public string Address { get; set; }

        [MaxLength(20)]
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }

        [Required]
        [DefaultValue(false)]
        public bool IsMale { get; set; }

        [Required]
        public DateTime CratedOn { get; set; }

        [Required]
        [DefaultValue(false)]
        public bool IsDeleted { get; set; }

        public virtual List<Card> Cards { get; set; }
    }
}