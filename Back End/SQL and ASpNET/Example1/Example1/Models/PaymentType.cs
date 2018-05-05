namespace Example1.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class PaymentType
    {
        [Key]
        public int Id { get; set; }

        [MaxLength(50)]
        [Required]
        public string Type { get; set; }

        public virtual List<Card> Cards { get; set; }
    }


}