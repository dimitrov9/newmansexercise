using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Example1Project
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "AddEmployee",
                url: "AddEmployee/{firstName}/{lastName}",
                defaults: new { controller = "Employee", 
                                action = "AddEmpolyee",
                                firstName = "",
                                lastName = ""}
            );

            routes.MapRoute(
                name: "AdminRoutes",
                url: "Admin/{controller}/{action}/{id}",
                defaults: new { controller = "Admin", action = "Dashboard", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
