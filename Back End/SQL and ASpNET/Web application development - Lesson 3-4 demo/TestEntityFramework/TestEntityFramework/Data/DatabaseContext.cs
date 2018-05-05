using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using TestEntityFramework.Models;

namespace TestEntityFramework.Data
{
    public class DatabaseContext: DbContext
    {
        public DatabaseContext() : base("DefaultConnection")
        {
        }

        public DbSet<Employee> Employees { get; set; }
        public DbSet<Administrator> Administrators { get; set; }
        public DbSet<Card> Cards { get; set; }
        public DbSet<CardInfo> CardInfos { get; set; }
        public DbSet<Member> Members { get; set; }
        public DbSet<PaymentMethod> PaymentMethods { get; set; }
        public DbSet<Visit> Visits { get; set; }
        public DbSet<Locker> Lockers { get; set; }
        public DbSet<Pricing> Pricings { get; set; }
    }
}