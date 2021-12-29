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
    public partial class AssetList : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["AssetRegister"].ConnectionString;
        void AssetListGridView() //Feeds values to GridView
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from Asset",con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    GridViewAssetList.DataSource = dataSet;
                    GridViewAssetList.DataBind();                    
                }
            }
            catch (Exception e)
            {
                Response.Write("<script language=javascript>alert('Error:'" + e + ");</script>");
            }
        }

        public void EditDropDownList()//Display Vendor names in dropdown list
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand command = new SqlCommand("select VendorName from Vendor", con);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    DropDownListEditVendorAsset.Items.Add(dataSet.Tables[0].Rows[i][0].ToString());
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                TextBoxEditAssetId.Enabled = false;
                AssetListGridView();
                Clear();
            }
           
        }

        //Searches values in asset table 
        protected void TextBoxVendorSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select AssetID,AssetName,VendorName,Cost from Asset where AssetName like '" + TextBoxVendorSearch.Text + "%'", con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    GridViewAssetList.DataSource = dataSet;
                    GridViewAssetList.DataBind();                  
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('Error:'"+ex+");</script>");
            }
              
        }
        public void Clear() //Clears Data inside controls
        {
            TextBoxEditAssetId.Text = "";
            TextBoxEditAssetName.Text = "";
            DropDownListEditVendorAsset.Items.Clear();
            TextBoxEditCost.Text = "";
        }

        //Updates Asset Table
        protected void ButtonEditAsset_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Asset set AssetName='" + TextBoxEditAssetName.Text + "',VendorName='" + DropDownListEditVendorAsset.Text + "', Cost='" + Convert.ToDecimal(TextBoxEditCost.Text) + "' where AssetID='" + Convert.ToInt32(TextBoxEditAssetId.Text) + "'", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script language=javascript>alert('Asset Value Changed');</script>");
            }
            AssetListGridView();
            Clear();
        }
        //selects the row that user clicks on
        protected void GridViewAssetList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            DropDownListEditVendorAsset.Items.Clear();
            TextBoxEditAssetId.Text = GridViewAssetList.Rows[e.NewSelectedIndex].Cells[0].Text;
            TextBoxEditAssetName.Text = GridViewAssetList.Rows[e.NewSelectedIndex].Cells[1].Text;
            DropDownListEditVendorAsset.Items.Insert(0, new ListItem(GridViewAssetList.Rows[e.NewSelectedIndex].Cells[2].Text));
            EditDropDownList();           
            TextBoxEditCost.Text = GridViewAssetList.Rows[e.NewSelectedIndex].Cells[3].Text;
        }

        //Button event to clear textbox
        protected void ButtonCancelEdit_Click(object sender, EventArgs e)
        {
            Clear();
        }

       //Deletes from Asset table
        protected void GridViewAssetList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridViewAssetList.Rows[e.RowIndex];
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Asset where AssetID='" + Convert.ToInt32(GridViewAssetList.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
                cmd.ExecuteNonQuery();
                AssetListGridView();
                Clear();
            }
        }
    }
}