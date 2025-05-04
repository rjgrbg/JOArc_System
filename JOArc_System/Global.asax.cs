using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace JOArc_System
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Register routes for the application
            RegisterRoutes(RouteTable.Routes);
        }

        private void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "Default",
                "",
                "~/Landingpage.aspx"
            );

            routes.MapPageRoute(
                "Landing",
                "home",
                "~/Landingpage.aspx"
            );

            // Add more routes as needed for other pages
        }
    }
}