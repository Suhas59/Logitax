    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ExcelIUpload_Logitax.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <h4 class="fs-title" style="color: Highlight;">Adding Data into Table</h4>

            <div class="form-group">
                <%--   <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red;">Company Name</label>
                        </div>

                        <div class="col-sm-2">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>


                <div class="row">
                    <div class="col-sm-2">
                        <label>GSTIN</label>
                    </div>

                    <div class="col-sm-2">
                        <asp:TextBox ID="txtgst" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <label>Email</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2">
                        <label>Mobile</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <label>Time Period</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtTimeperiod" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2">
                        <label>Negative Amount</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtnegativeamt" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-sm-2">
                        <label>Select File</label>
                    </div>
                    <div class="col-sm-2">

                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" ToolTip="Select Only Excel File" />
                        </td>
                        <td>
                            <asp:Button ID="Upload" runat="server" Text="Upload File" OnClick="Upload_Click" />

                        </td>
                        <td>
                            <asp:Button ID="ViewFiles" runat="server" Text="View Files" OnClick="ViewFiles_Click" />
                        </td>
                    </div>
                </div>
                <br />

                <asp:Label ID="lblmessage" runat="server" Font-Bold="true" ></asp:Label>

                 <asp:Label ID="lblmessage2" runat="server" Font-Bold="true" ></asp:Label>
               


            </div>

        </div>
        <%--<asp:GridView ID="GridView1" runat="server" EmptyDataText="No Record found!" Height="25px">
        </asp:GridView>--%>


        <div class="col-md-12">
       <div class="form-horizontal">
           <asp:GridView ID="grdexcel"  RowStyle-HorizontalAlign="Center"  runat="server" AutoGenerateColumns="False" CssClass="table"  AllowPaging="True" OnRowEditing="grdexcel_RowEditing" OnRowUpdating="grdexcel_RowUpdating">
    <%--<Columns>
     

        

        <asp:BoundField ItemStyle-Width="150px" DataField="ID" HeaderStyle-HorizontalAlign="Center"   HeaderText="No" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Company Name" HeaderText="Company" />
        <asp:BoundField ItemStyle-Width="150px" DataField="GSTIN" HeaderText="GSTIN" />
        <asp:BoundField ItemStyle-Width="150px" DataField="StartDate" HeaderText="Start Date" />
        <asp:BoundField ItemStyle-Width="150px" DataField="EndDate" HeaderText="End Date" />
        <asp:BoundField ItemStyle-Width="150px" DataField="TurnOverAmount" HeaderText="Turnover Amount"  />
         <asp:BoundField ItemStyle-Width="150px" DataField="Email" HeaderText=" Contact Email" />
         <asp:BoundField ItemStyle-Width="150px" DataField="MobileNo" HeaderText=" Contact Number" />
          </Columns>--%>
               <Columns>
                   <asp:TemplateField HeaderText="ID">
                       <EditItemTemplate>
                        <%--   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>--%>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Company Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Company_Name]]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Company_Name]]") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="GSTIN">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GSTIN") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%# Bind("GSTIN") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Start Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="End Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Turn Over Amount">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("TurnOverAmount") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%# Bind("TurnOverAmount") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Contact Email">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox7" runat="server"  Text='<%# Bind("Email") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Contact Number">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("MobileNo") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label8" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:CommandField HeaderText="Actions" ShowEditButton="True" />
               </Columns>
<RowStyle HorizontalAlign="Center"></RowStyle>
</asp:GridView>
       </div>
   </div>
        <br />
        <br />
         <div class="row">
                    <div class="table">
                        <tr>
                            <td>
                                <asp:Button ID="Button3" runat="server" Text="Save" />
                            </td>
                            <td>
                                 <asp:Button ID="Button4" runat="server" Text="Cancel" />
                            </td>
                        </tr>
                    </div>
                </div>
    </form>
</body>
</html>
