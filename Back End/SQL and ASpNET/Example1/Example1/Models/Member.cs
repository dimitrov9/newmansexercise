using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Example1.Models
{
    public class Member
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(50)]
        public string LastName { get; set; }

        [MaxLength(100)]
        public string Address { get; set; }

        [MaxLength(20)]
        public string Phone { get; set; }

        [Required]
        [DefaultValue(false)]
        public bool IsDeleted { get; set; }

        public virtual List<Card> Cards { get; set; }
    }
}