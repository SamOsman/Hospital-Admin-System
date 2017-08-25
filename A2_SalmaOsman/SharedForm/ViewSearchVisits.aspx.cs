using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace A2_SalmaOsman.SharedForm
{
    public partial class ViewSearchPatients : System.Web.UI.Page
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
                string name = Session["name"].ToString();
                string status = Session["status"].ToString();

                lblHeader.Text = "You are logged in as " + name;
                lblStatus.Text = "Status: " + status;

            }

            lblMsg.Text = "";
        }

        protected void SelectedIndexChange_SimpleSearch(object sender, EventArgs e)
        {
            int searchOption = ddlSearchOptions.SelectedIndex;
            

            if (searchOption == 0)
            {
                lblMsg.Text = "Choose valid Search option";
                lblMsg.ForeColor = Color.Red;

            } else
            {
                DataSet patientData = GetData(getQuery(searchOption));
                //display the data in the gridview
                if (patientData.Tables.Count > 0)
                {
                    GridViewPaients.DataSource = patientData;
                    GridViewPaients.DataBind();
  
                }
                else
                {
                    lblMsg.Text = "No data found";
                    lblMsg.ForeColor = Color.Red;
                }
            }

        }

        protected string getQuery(int selectedIndex)
        {
            string finalQuery = "";
            string query = "select p.firstname, p.lastname, p.OHIP, v.visit_start, v.visit_end, d.firstname, d.lastname from patients p  JOIN visits v on p.Id = v.patient_id  JOIN doctors d on d.Id = v.doctor_id ";
            string query_admit_date = " WHERE visit_start is not null";
            string query_release_date = " WHERE visit_end is not null";

            switch (selectedIndex)
            {
                case 1:
                    //user seacrhed by name
                    finalQuery = query;
                    break;
                case 2:
                    //searched by admission date
                    //finalQuery = query;
                    finalQuery = query + query_admit_date;
                    break;
                case 3:
                    //by release date
                    //finalQuery = query;
                    finalQuery = query + query_release_date;
                    break;
            }

            return finalQuery;

        }

        protected DataSet GetData(string query)
        {
            DataSet dataSet = new DataSet();
            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

                //fill the dataset
                adapter.Fill(dataSet);
            }

            return dataSet;
        }

        protected void SetDocHeader(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[5].Text = "Doc FirstN";
                e.Row.Cells[6].Text = "Doc LastN";
               
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            //since this page is shared by both users and admin
            //when someone wants to navigate back, 
            string status = Session["status"].ToString();
            if (status.Equals("admin"))
            {
                Response.Redirect("~/AdminHome/AdminHome.aspx");
            }
            else
            {
                Response.Redirect("~/UserHome/UserHome.aspx");
            }
        }
    }
}