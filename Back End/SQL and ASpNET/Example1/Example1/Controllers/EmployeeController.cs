using System.Web.Mvc;
using Example1.View_Models;

namespace Example1.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }

        [Route("{firstName}/{lastName}")]
        public ActionResult AddEmployee(string firstName,string lastName)
        {
            if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName))
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

        [HttpPost]
        public JsonResult UpdateEmployee(string firstName, string lastName)
        {
            JsonResultViewModel result = new JsonResultViewModel();

            if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName))
            {
                //todo add in database...

                result.IsSuccessfull = true;
                result.Message = "Successfuly updated";

                //ViewBag.Message = "Successfully insterted employee";
            }
            else
            {
                result.IsSuccessfull = false;
                result.Message = "Failed to updated";
                //ViewBag.Message = "Failed to add employee";
            }

            return Json(result,JsonRequestBehavior.AllowGet);
        }
    }
}