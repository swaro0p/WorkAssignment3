using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WorkAssignment3
{
    public partial class Vendor : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["AssectRegister"].ConnectionString;

        void PopulateVendorGridview()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {

                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select VendorId,VendorName,VendorEmail,Contact from Vendor", con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);

                    GridViewVendor.DataSource = dataSet;

                    GridViewVendor.DataBind();
                }
            }
            catch (Exception e)
            {
                Response.Write(e);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateVendorGridview();
            /*  if (!Page.IsPostBack)
              {
                  PopulateVendorGridview();
              }*/
        }

        protected void GridViewVendor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewVendor_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        con.Open();
                        DropDownList DropDownList1 = (e.Row.FindControl("DropDownList1") as DropDownList);
                        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select CityName from City", con);
                        DataSet dataSet = new DataSet();
                        sqlDataAdapter.Fill(dataSet);
                        con.Close();
                        DropDownList1.DataSource = dataSet;
                        DropDownList1.DataTextField = "CityName";
                        DropDownList1.DataValueField = "CityName";
                        DropDownList1.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}