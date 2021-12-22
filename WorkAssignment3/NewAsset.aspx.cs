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
    public partial class NewAsset : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["AssectRegister"].ConnectionString;
       
        void DropDownData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from Vendor", con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);

                    DropDownListVendorName.DataSource = dataSet;

                   // DropDownListVendorName.DataBind();
                    DropDownListVendorName.DataTextField = "VendorName";
                    //DropDownListVendorName.DataValueField = "VendorId";
                    DropDownListVendorName.DataValueField = "VendorName";
                    DropDownListVendorName.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        void InsertAsset()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                   
                    con.Open();
                    SqlCommand command = new SqlCommand("insert into Asset values('"+TextBoxName.Text+"','"+DropDownListVendorName.Text+"','"+Convert.ToDateTime(TextBoxDate.Text)+"','"+Convert.ToDecimal(TextBoxCost.Text)+"')",con);
                    command.ExecuteNonQuery();

                }
            }
            catch (Exception e)
            {
                Response.Write("Error:" + e);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownData();
            TextBoxDate_CalendarExtender.EndDate = DateTime.Now;
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            InsertAsset();
        }
    }
}