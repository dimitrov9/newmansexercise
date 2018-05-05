using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestEntityFramework.Data;
using TestEntityFramework.Models;

namespace TestEntityFramework.Controllers
{
    public class LockerController : Controller
    {
        DatabaseContext db = new DatabaseContext();

        // GET: Locker
        public ActionResult Index()
        {
            if (!db.Lockers.Any())
            {
                for (int i = 1; i <= 50; i++)
                {
                    Locker locker = new Locker();
                    locker.Number = i;
                    locker.IsForMale = true;
                    db.Lockers.Add(locker);
                    db.SaveChanges();
                }

                for (int i = 1; i <= 50; i++)
                {
                    Locker locker = new Locker();
                    locker.Number = i;
                    locker.IsForMale = false;
                    db.Lockers.Add(locker);
                    db.SaveChanges();
                }
            }

            ///LINQ
            List<Locker> model = new List<Locker>();
            //model = db.Lockers.ToList()

            model = db.Lockers.Where(x => x.Number > 25 && x.Number < 35 && x.IsForMale == false).OrderByDescending(x => x.Number).ToList();

            return View(model);
        }


    }
}