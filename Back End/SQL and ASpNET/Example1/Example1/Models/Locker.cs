using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Example1.Models
{
    public class Locker
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Range(1,100)]
        public short Number { get; set; }

        [Required]
        [DefaultValue(false)]
        public bool IsForMale { get; set; }

        public virtual List<Visit> Visits { get; set; }
    }
}