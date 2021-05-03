using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System.IO;

namespace ExcelIUpload_Logitax
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string sqlcon = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileExtention.ToLower() != ".xlsx" && fileExtention.ToLower() != ".xls")
                {
                    
                    lblmessage.Text = "select excel files to upload";
                    lblmessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    showgrid();
                    FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + FileUpload1.FileName));
                    
                    lblmessage.Text = "File Uploaded";
                    lblmessage.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {

                lblmessage.Text = "Please select File";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        public void showgrid()
        {
           
            string filePath = Server.MapPath("~/Uploads/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(filePath);
            //Open the Excel file in Read Mode using OpenXml.
            using (SpreadsheetDocument doc = SpreadsheetDocument.Open(filePath, false))
            {
                //Read the first Sheets from Excel file.
                Sheet sheet = doc.WorkbookPart.Workbook.Sheets.GetFirstChild<Sheet>();

                //Get the Worksheet instance.
                Worksheet worksheet = (doc.WorkbookPart.GetPartById(sheet.Id.Value) as WorksheetPart).Worksheet;

                //Fetch all the rows present in the Worksheet.
                IEnumerable<Row> rows = worksheet.GetFirstChild<SheetData>().Descendants<Row>();

                //Create a new DataTable.
                DataTable dt = new DataTable();

                //Loop through the Worksheet rows.
                foreach (Row row in rows)
                {
                    //Use the first row to add columns to DataTable
                    if (row.RowIndex.Value == 1)
                    {
                        foreach (Cell cell in row.Descendants<Cell>())
                        {
                            dt.Columns.Add(GetValue(doc, cell));
                        }
                    }
                    else
                    {
                        //Add rows to DataTable.
                        dt.Rows.Add();
                        int i = 0;
                        foreach (Cell cell in row.Descendants<Cell>())
                        {
                            dt.Rows[dt.Rows.Count - 1][i] = GetValue(doc, cell);
                            i++;
                        }


                    }
                }

                grdexcel.DataSource = dt;
                grdexcel.DataBind();
            }
      
        }
        private string GetValue(SpreadsheetDocument doc, Cell cell)
        {
            string value = cell.CellValue.InnerText;
            if (cell.DataType != null && cell.DataType.Value == CellValues.SharedString)
            {
                return doc.WorkbookPart.SharedStringTablePart.SharedStringTable.ChildElements.GetItem(int.Parse(value)).InnerText;
            }
           
            return value;
        }

        protected void ViewFiles_Click(object sender, EventArgs e)
        {
            showgrid();


        }

        protected void grdexcel_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdexcel.EditIndex = e.NewEditIndex;

        }

        protected void grdexcel_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = (Convert.ToInt32(((Label)grdexcel.Rows[e.RowIndex].FindControl("Label1")).Text));
            string name = ((TextBox)grdexcel.Rows[e.RowIndex].FindControl("TextBox2")).Text;
            string gst = ((TextBox)grdexcel.Rows[e.RowIndex].FindControl("TextBox3")).Text;
            string startdate = ((TextBox)grdexcel.Rows[e.RowIndex].FindControl("TextBox4")).Text;
            string enddate = ((TextBox)grdexcel.Rows[e.RowIndex].FindControl("TextBox5")).Text;
            string TurnOverAmount = ((TextBox)grdexcel.Rows[e.RowIndex].FindControl("TextBox6")).Text;
            string email = ((TextBox)grdexcel.Rows[e.RowIndex].FindControl("TextBox7")).Text;


            string number = ((TextBox)grdexcel.Rows[e.RowIndex].FindControl("TextBox8")).Text;

            SqlConnection con = new SqlConnection(sqlcon);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            string str = ("update GST_Info set Company_Name='" + name + "',GSTIN='" + gst + "',StartDate='" + startdate + "',EndDate='" + enddate + "',TurnOverAmount='" + TurnOverAmount + "',Email='" + email + "',MobileNo='" + number + "' where id='" + id + "'");
            //SqlCommand cmd = new SqlCommand("update GST_Info set Company Name = '" + name + "', GSTIN = '" + gst + "', StartDate = '" + startdate + "', EndDate = '" + enddate + "', TurnOverAmount = '" + TurnOverAmount + "', Email = '" + email + "', MobileNo = '" + number + "' where id = '"+id+"'" );
            cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();

            con.Close();
            grdexcel.EditIndex = -1;
            showgrid();

        }

    }
}