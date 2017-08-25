using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

/*
This page is shared between users and admins 
cannot use hyperlink to go back home
a button wil be used to go back
user's session status is checked befre sent back to appropriate home
*/

/*
****The below discribtion is no longer applied, since I am using a grid view, 
all data is automatically displayed*****

User can search for patients in two ways:
1. Simlple search: select choice from drop down menu, user can choose name, admit date or release date.
Only records with the chosen choice will be displyed.

2. Key word search: user enters key word and program uses wild card to find relevant information
*/
namespace A2_SalmaOsman.SharedForm
{
    public partial class SearchPatients : System.Web.UI.Page
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

            getAllPatientRecords();
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
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

        protected void btnSearchKeyword_Click(object sender, EventArgs e)
        {
            if (!txtSearchKeyWord.Text.Equals(""))
            {
                string keyword = txtSearchKeyWord.Text;

                DataSet patients = GetData(keyword);
                if (patients.Tables.Count > 0)
                {
                    /****  
                    BUG: This evaluates to true even when no 
                         data is returned, no table is displayed in this case
                    ****/
                    GridViewPatients.DataSource = patients;
                    GridViewPatients.DataBind();

                    lblMsg.Text = "Data found";
                    lblMsg.ForeColor = Color.Green;
                    txtSearchKeyWord.Focus();
                   
                }
                else
                {
                    lblMsg.Text = "No data matching keyword '" + keyword + "' was found";
                    lblMsg.ForeColor = Color.Red;
                    txtSearchKeyWord.Focus();
                }

            } else
            {
                lblMsg.Text = "No data was entered";
                lblMsg.ForeColor = Color.Red;
            }

            
        }

        protected DataSet GetData(string keyword)
        {
            string query = "select * from patients where firstname like @keyword OR lastname like @keyword or age like @keyword or OHIP like @keyword";
            DataSet dataSet = new DataSet();
            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                adapter.SelectCommand.Parameters.AddWithValue("@keyword", "%" + keyword + "%");

                //fill the dataset
                adapter.Fill(dataSet);
            }

            return dataSet;
        }

        protected void SetHeader(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //e.Row.Cells[5].Text = "Doc FirstN";
                //e.Row.Cells[6].Text = "Doc LastN";

            }
        }

        protected void getAllPatientRecords()
        {
            //get all patient records
            DataSet patients = new DataSet();
            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                string query = "select * from patients";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

                //fill the dataset
                adapter.Fill(patients);


                //display all patient records
                if (patients.Tables.Count > 0)
                {
                    GridViewPatients.DataSource = patients;
                    GridViewPatients.DataBind();
                }
                else
                {
                    lblMsg.Text = "No data avaialable at the moment!";
                    lblMsg.ForeColor = Color.Green;
                }

            }

        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            getAllPatientRecords();
        }
    }
}