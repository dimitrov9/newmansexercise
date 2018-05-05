using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Example1.Models;

namespace Example1Project.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult NoView()
        {
            Employee employee = new Employee()
            {
                FirstName = "Test name",
                LastName = "Test Last Name",
                Address = "ORce nikolov u hollywoord",
                Phone = "+389754911111111",
                Salary = 16000,
                StartDay = new DateTime(2018,4,4),
                BirthDay = new DateTime(1996,08,28),
                StillWorksHere = true
            };

            return View("Index", employee);
        }
    }
}