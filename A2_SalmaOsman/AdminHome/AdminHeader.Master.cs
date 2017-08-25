using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A2_SalmaOsman
{
    public partial class AdminHeader : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if the user hasn't logged in, then the session variable 
            //will be null and they will be redirected to the login page
            if (Session["logged_in"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                //user logged in, display their name in header
                string name = (string)Session["name"].ToString();
                lblAdminHeader.Text = "You are logged in as " + name; 
                lblStatus.Text =  "Status: Admin" ;

            }
        }
    }
}