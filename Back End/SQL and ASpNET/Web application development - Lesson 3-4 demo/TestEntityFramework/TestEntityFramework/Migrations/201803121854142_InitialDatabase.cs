namespace TestEntityFramework.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDatabase : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Administrators",
                c => new
                    {
                        EmployeeId = c.Int(nullable: false),
                        Email = c.String(nullable: false, maxLength: 100),
                        Username = c.String(nullable: false, maxLength: 30),
                        Password = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.EmployeeId)
                .ForeignKey("dbo.Employees", t => t.EmployeeId)
                .Index(t => t.EmployeeId);
            
            CreateTable(
                "dbo.Cards",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PaidOn = c.DateTime(nullable: false),
                        StartDateTime = c.DateTime(nullable: false),
                        EndDateTime = c.DateTime(nullable: false),
                        Administrator_EmployeeId = c.Int(),
                        CardInfo_Id = c.Int(),
                        Member_Id = c.Int(),
                        PaymentMethod_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Administrators", t => t.Administrator_EmployeeId)
                .ForeignKey("dbo.CardInfoes", t => t.CardInfo_Id)
                .ForeignKey("dbo.Members", t => t.Member_Id)
                .ForeignKey("dbo.PaymentMethods", t => t.PaymentMethod_Id)
                .Index(t => t.Administrator_EmployeeId)
                .Index(t => t.CardInfo_Id)
                .Index(t => t.Member_Id)
                .Index(t => t.PaymentMethod_Id);
            
            CreateTable(
                "dbo.CardInfoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                        Duration = c.String(nullable: false, maxLength: 3),
                        VisitsInWeek = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Pricings",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FromDateTime = c.DateTime(nullable: false),
                        ToDateTime = c.DateTime(nullable: false),
                        Price = c.Int(nullable: false),
                        CardInfo_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CardInfoes", t => t.CardInfo_Id)
                .Index(t => t.CardInfo_Id);
            
            CreateTable(
                "dbo.Members",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false, maxLength: 50),
                        LastName = c.String(nullable: false, maxLength: 50),
                        Address = c.String(maxLength: 200),
                        PhoneNumber = c.String(maxLength: 20),
                        IsMale = c.Boolean(nullable: false),
                        CratedOn = c.DateTime(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PaymentMethods",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Visits",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ArrivalDateTime = c.DateTime(nullable: false),
                        LeaveDateTime = c.DateTime(nullable: false),
                        Card_Id = c.Int(),
                        Locker_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Cards", t => t.Card_Id)
                .ForeignKey("dbo.Lockers", t => t.Locker_Id)
                .Index(t => t.Card_Id)
                .Index(t => t.Locker_Id);
            
            CreateTable(
                "dbo.Lockers",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Number = c.Int(nullable: false),
                        IsForMale = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Employees",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false, maxLength: 50),
                        LastName = c.String(nullable: false, maxLength: 50),
                        StartDate = c.DateTime(nullable: false),
                        BirthDate = c.DateTime(nullable: false),
                        Salary = c.Int(nullable: false),
                        Address = c.String(maxLength: 200),
                        PhoneNumber = c.String(maxLength: 20),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.FirstName, name: "IX_First_Name")
                .Index(t => t.LastName, name: "IX_Last_Name");
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Administrators", "EmployeeId", "dbo.Employees");
            DropForeignKey("dbo.Visits", "Locker_Id", "dbo.Lockers");
            DropForeignKey("dbo.Visits", "Card_Id", "dbo.Cards");
            DropForeignKey("dbo.Cards", "PaymentMethod_Id", "dbo.PaymentMethods");
            DropForeignKey("dbo.Cards", "Member_Id", "dbo.Members");
            DropForeignKey("dbo.Pricings", "CardInfo_Id", "dbo.CardInfoes");
            DropForeignKey("dbo.Cards", "CardInfo_Id", "dbo.CardInfoes");
            DropForeignKey("dbo.Cards", "Administrator_EmployeeId", "dbo.Administrators");
            DropIndex("dbo.Employees", "IX_Last_Name");
            DropIndex("dbo.Employees", "IX_First_Name");
            DropIndex("dbo.Visits", new[] { "Locker_Id" });
            DropIndex("dbo.Visits", new[] { "Card_Id" });
            DropIndex("dbo.Pricings", new[] { "CardInfo_Id" });
            DropIndex("dbo.Cards", new[] { "PaymentMethod_Id" });
            DropIndex("dbo.Cards", new[] { "Member_Id" });
            DropIndex("dbo.Cards", new[] { "CardInfo_Id" });
            DropIndex("dbo.Cards", new[] { "Administrator_EmployeeId" });
            DropIndex("dbo.Administrators", new[] { "EmployeeId" });
            DropTable("dbo.Employees");
            DropTable("dbo.Lockers");
            DropTable("dbo.Visits");
            DropTable("dbo.PaymentMethods");
            DropTable("dbo.Members");
            DropTable("dbo.Pricings");
            DropTable("dbo.CardInfoes");
            DropTable("dbo.Cards");
            DropTable("dbo.Administrators");
        }
    }
}
