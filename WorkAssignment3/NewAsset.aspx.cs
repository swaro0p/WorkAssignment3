using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WorkAssignment3
{
    public partial class NewAsset : System.Web.UI.Page
    {
        CultureInfo cultureInfo;
        string constr = ConfigurationManager.ConnectionStrings["AssetRegister"].ConnectionString;
       
        void DropDownData()//Displays DropDownList
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select VendorName from Vendor", con);   
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                    {
                        DropDownListVendorName.Items.Add(dataSet.Tables[0].Rows[i][0].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('Error:'" + ex + ");</script>");
            }
        }
        void InsertAsset() //Inserts Data into Asset Table
        {
            cultureInfo = CultureInfo.CurrentCulture;
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {                   
                    con.Open();
                    SqlCommand command = new SqlCommand("insert into Asset values('"+TextBoxName.Text+"','"+DropDownListVendorName.Text+"','"+Convert.ToDateTime(TextBoxDate.Text,cultureInfo)+"','"+Convert.ToDecimal(TextBoxCost.Text)+"')",con);

                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {

                        Response.Write("<script language=javascript>alert('Error:'" + ex.Message + ");</script>");
                    }
                   
                    Response.Write("<script language=javascript>alert('New Asset Added');</script>");
                }
            }
            catch (FormatException f)
            {
                Response.Write("<script language=javascript>alert('Error:'" + f.Message + ");</script>");
            }
            catch (Exception e)
            {
                Response.Write("<script language=javascript>alert('Error:'" +e.Message+ ");</script>");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownData();
            TextBoxDate_CalendarExtender.EndDate = DateTime.Now;//Disables Future Date Selection
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            InsertAsset();//Insert data into Asset table on button click
           
        }
    }
}