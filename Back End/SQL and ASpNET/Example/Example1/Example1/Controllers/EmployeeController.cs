using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Example1Project.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddEmployee(string firstName,string lastName)
        {
            if(!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName))
            {
                //todo add to database...

                ViewBag.Message = "Successfully insterted employee";
            }
            else
            {
                ViewBag.Message = "Failed to add employee";
            }

            return View();
        }
    }
}