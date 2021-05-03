<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExcelIUpload_Logitax._Default" %>

<!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-6">
            <div class="container">
                <h4 class="fs-title" style="color: Highlight;">Adding Data into Table</h4>

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red;">Company Name</label>
                        </div>

                        <div class="col-sm-2">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red;">GSTIN</label>
                        </div>

                        <div class="col-sm-2">
                            <asp:TextBox ID="txtgst" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red">Email</label>
                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>

                      <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red">Mobile</label>
                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red">Time Period</label>
                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="txtTimeperiod" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red">Negative Amount</label>
                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="txtnegativeamt" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <label style="color: red">Select File</label>
                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>


                </div>

            </div>
    </form>
</body>
</html>
