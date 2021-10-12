using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace PayFutureAPI.Models
{
    public partial class Merchant
    {
        [NotMapped]
        [Column("merchant_id")]
        public int MerchantId { get; set; }
        public string MerchantName { get; set; }
        public string IntegrationKey { get; set; }
        public string MerchantLogoUrl { get; set; }
    }
}
