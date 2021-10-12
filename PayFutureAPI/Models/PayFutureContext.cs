using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace PayFutureAPI.Models
{
    public partial class PayFutureContext : DbContext
    {
        public PayFutureContext()
        {
        }

        public PayFutureContext(DbContextOptions<PayFutureContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Merchant> Merchants { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Merchant>(entity =>
            {
                entity.Property(e => e.MerchantId).HasColumnName("merchant_id");

                entity.Property(e => e.IntegrationKey)
                    .IsRequired()
                    .HasMaxLength(256)
                    .IsUnicode(false)
                    .HasColumnName("integration_key")
                    .IsFixedLength(true);

                entity.Property(e => e.MerchantLogoUrl)
                    .HasMaxLength(250)
                    .IsUnicode(false)
                    .HasColumnName("merchant_logo_url")
                    .IsFixedLength(true);

                entity.Property(e => e.MerchantName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("merchant_name")
                    .IsFixedLength(true);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
