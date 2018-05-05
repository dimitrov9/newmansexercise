using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestEntityFramework.Data;
using TestEntityFramework.Models;

namespace TestEntityFramework.Controllers
{
    public class CardInfoController : Controller
    {
        DatabaseContext db = new DatabaseContext();

        // GET: CardInfo
        public ActionResult Index()
        {
            //db.Pricings.RemoveRange(db.Pricings);
            //db.CardInfos.RemoveRange(db.CardInfos);
            //db.SaveChanges();

            if (!db.CardInfos.Any())
            {
                CardInfo cardInfo1 = new CardInfo()
                {
                    Name = "OneDay",
                    Duration = "1d",
                    VisitsInWeek = 1
                };
                CardInfo cardInfo2 = new CardInfo()
                {
                    Name = "Weekly",
                    Duration = "1w",
                    VisitsInWeek = 3
                };
                CardInfo cardInfo3 = new CardInfo()
                {
                    Name = "Monthly",
                    Duration = "1m",
                    VisitsInWeek = 3
                };

                db.CardInfos.Add(cardInfo1);
                db.CardInfos.Add(cardInfo2);
                db.CardInfos.Add(cardInfo3);

                Pricing price1 = new Pricing()
                {
                    Price = 150,
                    FromDateTime = new DateTime(2018, 1, 1),
                    ToDateTime = new DateTime(2019, 12, 31),
                    CardInfo = cardInfo1
                };
                Pricing price1_2 = new Pricing()
                {
                    Price = 100,
                    FromDateTime = new DateTime(2017, 1, 1),
                    ToDateTime = new DateTime(2017, 12, 31),
                    CardInfo = cardInfo1
                };

                Pricing price2 = new Pricing()
                {
                    Price = 500,
                    FromDateTime = new DateTime(2018, 1, 1),
                    ToDateTime = new DateTime(2019, 12, 31),
                    CardInfo = cardInfo2
                };

                Pricing price3 = new Pricing()
                {
                    Price = 1500,
                    FromDateTime = new DateTime(2018, 1, 1),
                    ToDateTime = new DateTime(2019, 12, 31),
                    CardInfo = cardInfo3
                };

                db.Pricings.Add(price1);
                db.Pricings.Add(price1_2);
                db.Pricings.Add(price2);
                db.Pricings.Add(price3);

                db.SaveChanges();
            }

            return View(db.CardInfos.ToList());
        }
    }
}