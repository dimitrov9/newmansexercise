using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Example1.Models
{
    public class CardInfo
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        [Required]
        [MaxLength(4)]
        //[RegularExpression()]
        public string Duration { get; set; }

        public virtual ICollection<Pricing> Pricings { get; set; }

        public virtual ICollection<Card> Cards { get; set; }
    }
}