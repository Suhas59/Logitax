<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="ExcelIUpload_Logitax.WebForm3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
         
    .mydatagrid
{
width: 80%;
border: solid 2px black;
min-width: 80%;

}
.header
{
background-color: #646464;
font-family: Arial;
color: White;
border: none 0px transparent;
height: 25px;
text-align: center;
font-size: 16px;
}

.rows
{
background-color: #fff;
font-family: Arial;
font-size: 14px;
color: #000;
min-height: 25px;
text-align: left;
border: none 0px transparent;
}
.rows:hover
{
background-color: #ff8000;
font-family: Arial;
color: #fff;
text-align: left;
}
.selectedrow
{
background-color: #ff8000;
font-family: Arial;
color: #fff;
font-weight: bold;
text-align: left;
}
.mydatagrid a /** FOR THE PAGING ICONS **/
{
background-color: Transparent;
padding: 5px 5px 5px 5px;
color: #fff;
text-decoration: none;
font-weight: bold;
}

.mydatagrid a:hover /** FOR THE PAGING ICONS HOVER STYLES**/
{
background-color: #000;
color: #fff;
}
.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
background-color: #c9c9c9;
color: #000;
padding: 5px 5px 5px 5px;
}
.pager
{
background-color: #646464;
font-family: Arial;
color: White;
height: 30px;
text-align: left;
}

.mydatagrid td
{
padding: 5px;
}
.mydatagrid th
{
padding: 5px;
}

    </style>


<script language="javascript" type="text/javascript">  
    
            $(document).ready(function(){
                $('#btnUpdate').click(function(){
                    alert('test')
                    var Name, gender, con, EmailId, emailExp;    
                    Name = document.getElementById("txtUserId").value;    
                    gender = document.getElementById("ddlType").value;
                    con = document.getElementById("txt2").value;    
                    EmailId = document.getElementById("txtmail").value;    
                    emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id    
       
                });
            });
       
</script>   
</head>

   

<body>
    <form id="form1" runat="server">

        <div class="col-md-12">
           <div class="table-responsive">
            <asp:FileUpload ID="fileuploadExcel" runat="server" />&nbsp;&nbsp;
            <asp:Button ID="btnImport" runat="server" Text="Import Data" OnClick="btnImport_Click" />
               <asp:Button ID="btnsave" runat="server" Text="Save Data" OnClick="btnsave_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Visible="False" Font-Bold="True" ForeColor="#009933"></asp:Label><br />


            <asp:GridView ID="grvexcel"  runat="server"  CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%"   >

                <Columns>
                    <asp:TemplateField >
                        <ItemTemplate>
                            <%--<asp:ImageButton ID="imgbtn" ImageUrl="~/Edit.jpg" runat="server" Width="25" Height="25" OnClick="imgbtn_Click" />--%>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Edit_Click">Select</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
               </div>

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />

            <asp:ModalPopupExtender  id="ModalPopupExtender1" runat="server" targetcontrolid="btnShowPopup" popupcontrolid="pnlpopup"
                cancelcontrolid="btnCancel" backgroundcssclass="modalBackground">

                </asp:ModalPopupExtender>

            <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="269px" Width="400px" Style="display: none">

                <table width="100%" style="border: Solid 3px #D55500; width: 100%; height: 100%" cellpadding="0" cellspacing="0">

                    <tr style="background-color: #D55500">

                        <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger" align="center">Update GSTINFO</td>

                    </tr>

                   <%-- <tr style="background-color: #008080; color: #FFFFFF; font-size: large; font-weight: bold">

                        <td align="right" style="width: 45%">No : </td>--%>

                        <td>

                            <asp:Label ID="lblID" runat="server"></asp:Label>

                        </td>

                   <%-- </tr>--%>

                    <tr style="background-color: #FFCCFF; color: #000066; font-size: large; font-weight: bold">

                        <td align="right">Company Name : </td>

                        <td>

                            <asp:TextBox ID="txtcompname" runat="server" />

                        </td>

                    </tr>

                    <tr style="background-color: #FFCCFF; color: #000066; font-size: large; font-weight: bold">

                        <td align="right">GSTIN :

                        </td>

                        <td>

                            <asp:TextBox ID="txtGSTIN" runat="server" /></td>

                    </tr>
                    <tr style="background-color: #FFCCFF; color: #000066; font-size: large; font-weight: bold">

                        <td align="right">Start Date :

                        </td>

                        <td>

                            <asp:TextBox ID="txtstartdate" runat="server" TextMode="Date" /></td>

                    </tr>

                    <tr style="background-color: #FFCCFF; color: #000066; font-size: large; font-weight: bold">

                        <td align="right">End Date :

                        </td>

                        <td>

                            <asp:TextBox ID="txtenddate" runat="server" TextMode="Date" /></td>

                    </tr>

                     <tr style="background-color: #FFCCFF; color: #000066; font-size: large; font-weight: bold">

                        <td align="right">Amount :

                        </td>

                        <td>

                            <asp:TextBox ID="txtamount" runat="server" /></td>

                    </tr>


                     <tr style="background-color: #FFCCFF; color: #000066; font-size: large; font-weight: bold">

                        <td align="right">Email :

                        </td>   

                        <td>

                            <asp:TextBox ID="txtEmail" runat="server" /></td>

                    </tr>

                    <tr style="background-color: #FFCCFF; color: #000066; font-size: large; font-weight: bold">

                        <td align="right">Number :

                        </td>

                        <td>

                            <asp:TextBox ID="txtnumber" runat="server" /></td>

                    </tr>

                    <tr>

                        <td></td>

                        <td>

                            <asp:Button ID="btnUpdate"  runat="server" Text="Update" OnClick="btnUpdate_Click"  /> 
                         

                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" />

                        </td>

                    </tr>

                </table>

            </asp:Panel>
        </div>


    </form>
</body>
</html>
