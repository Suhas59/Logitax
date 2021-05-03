using DocumentFormat.OpenXml.Packaging;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExcelIUpload_Logitax
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private String strConnString = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
            
        protected void btnImport_Click(object sender, EventArgs e)
        {
            String strConnection = "ConnectionString";
            string connectionString = "";
            if (fileuploadExcel.HasFile)
            {
                string fileName = Path.GetFileName(fileuploadExcel.PostedFile.FileName);
                fileName = DateTime.Now.ToShortDateString().Replace("/", "-") + "_" + DateTime.Now.TimeOfDay.Hours + "_" + DateTime.Now.TimeOfDay.Minutes + "_" + DateTime.Now.TimeOfDay.Seconds + "_" + fileName;
                string fileExtension = Path.GetExtension(fileuploadExcel.PostedFile.FileName);
                string fileLocation = Server.MapPath("~/App_Data/" + fileName);
                fileuploadExcel.SaveAs(fileLocation);
                if (fileExtension == ".xls")
                {
                    connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                      fileLocation + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                }
                else if (fileExtension == ".xlsx")
                {
                    connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" +
                      fileLocation + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                }
                OleDbConnection con = new OleDbConnection(connectionString);
                OleDbCommand cmd = new OleDbCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.Connection = con;
                OleDbDataAdapter dAdapter = new OleDbDataAdapter(cmd);
                DataTable dtExcelRecords = new DataTable();
                con.Open();
                DataTable dtExcelSheetName = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                string getExcelSheetName = dtExcelSheetName.Rows[0]["Table_Name"].ToString();
                cmd.CommandText = "SELECT * FROM [" + getExcelSheetName + "]";
                dAdapter.SelectCommand = cmd;
                dAdapter.Fill(dtExcelRecords);
                grvexcel.DataSource = dtExcelRecords;
                grvexcel.DataBind();
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            //string country = row.Cells[2].Text; // here you will get Name 
            string ID = row.Cells[1].Text;
            string companyname = row.Cells[2].Text;
            string gst = row.Cells[3].Text;
            DateTime  startdate = Convert.ToDateTime(row.Cells[4].Text);
            DateTime enddate = Convert.ToDateTime(row.Cells[5].Text);
            string amount = row.Cells[6].Text;
            string email = row.Cells[7].Text;
            string number = row.Cells[8].Text;
            lblID.Text = ID;
            txtcompname.Text = companyname;
            txtGSTIN.Text = gst;
            txtstartdate.Text = startdate.ToString("yyyy-MM-dd");
            txtenddate.Text = enddate.ToString("yyyy-MM-dd");
            txtamount.Text = amount;
            txtEmail.Text = email;
            txtamount.Text = amount;
            txtnumber.Text = number;
            this.ModalPopupExtender1.Show();

            //Fetch value of Country
            //string country = row.Cells[1].Text;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddUpdateCustomer";
                cmd.Parameters.AddWithValue("@ID", lblID.Text);
                cmd.Parameters.AddWithValue("@CompanyName", txtcompname.Text);
                cmd.Parameters.AddWithValue("@GSTIN", txtGSTIN.Text);

                DateTime startdate = Convert.ToDateTime(txtstartdate.Text);
                DateTime enddate = Convert.ToDateTime(txtenddate.Text);
                cmd.Parameters.AddWithValue("@StartDate", startdate.ToString("dd/MM/yyyy"));
                cmd.Parameters.AddWithValue("@EndDate", enddate.ToString("dd/MM/yyyy"));
                cmd.Parameters.AddWithValue("@Amount", txtamount.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Number", txtnumber.Text);
                grvexcel.DataSource = this.GetData(cmd);
                grvexcel.DataBind();
            }

        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    dt = con.GetSchema(SqlClientMetaDataCollectionNames.Tables, new string[] { null, null, "[Table_Name]" });
                    string getExcelSheetName = dt.Rows[0].Table.ToString();
                    cmd.CommandText= "SELECT * FROM [" + getExcelSheetName + "]";
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                    return dt;
                }
            }
        }



        protected void grvexcel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvexcel.EditIndex = -1;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

        }
        
    }
}