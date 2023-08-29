<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="TaskAsp_RegLoginWelcome_.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            // Cache the elements and the button
            var txtName = $("#<%= TxtName.ClientID %>");
        var txtNumber = $("#<%= TxtNumber.ClientID %>");
        var txtUId = $("#<%= TxtUId.ClientID %>");
        var txtPwd = $("#<%= TxtPwd.ClientID %>");
        var txtCPwd = $("#<%= TxtCPwd.ClientID %>");
        var ddlSquestion = $("#<%= DropDownList1.ClientID %>");
        var txtAnswer = $("#<%= TxtAnswer.ClientID %>");
        var btnReg = $("#<%= BtnReg.ClientID %>");

        // Check fields and enable/disable button
        function checkFields() {
            if (
                txtName.val() !== "" &&
                txtNumber.val() !== "" &&
                txtUId.val() !== "" &&
                txtPwd.val() !== "" &&
                txtCPwd.val() !== "" &&
                ddlSquestion.val() !== "Select" &&
                txtAnswer.val() !== ""
            ) {
                btnReg.prop("disabled", false);
            } else {
                btnReg.prop("disabled", true);
            }
        }

        // Call the checkFields function when fields change
        txtName.on("input", checkFields);
        txtNumber.on("input", checkFields);
        txtUId.on("input", checkFields);
        txtPwd.on("input", checkFields);
        txtCPwd.on("input", checkFields);
        ddlSquestion.on("change", checkFields);
        txtAnswer.on("input", checkFields);

        // Initial check
        checkFields();
    });
    </script>


    <style type="text/css">
        body {
            background-image: url('https://cdn.wallpapersafari.com/96/56/hUOmEZ.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            padding-top: 50px; /* Adjust as needed */
        }

        /* Center the form on the page */
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Adjust the height as needed */
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 163px;
        }

        .auto-style3 {
            width: 163px;
            height: 23px;
        }

        .auto-style4 {
            height: 23px;
        }

        .auto-style5 {
            width: 163px;
            height: 26px;
        }

        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 163px;
            height: 33px;
        }
        .auto-style8 {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="centered-form">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LblTitleMsg" runat="server" BackColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="REGISTRATION FORM"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LblName" runat="server" Text="NAME" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtName" ErrorMessage="*Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LblMobile" runat="server" Text="MOBILE NUMBER" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtNumber" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtNumber" ErrorMessage="*Please Enter Mobile Number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LblUId" runat="server" Text="USER ID" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtUId" runat="server" ReadOnly="True"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtUId" ErrorMessage="*Please Enter UserID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LblPwd" runat="server" Text="PASSWORD" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPwd" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtPwd" ErrorMessage="*Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxtPwd" ControlToValidate="TxtCPwd" ErrorMessage="*Password &amp; Confirm Password Should be same" ForeColor="Red"></asp:CompareValidator>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblcpwd" runat="server" Text="CONFIRM PASSWORD" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TxtCPwd" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtCPwd" ErrorMessage="*Please Enter Confirm Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="LblSquestion" runat="server" Text="SECURITY QUESTION" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>What Is Your Child Name?</asp:ListItem>
                            <asp:ListItem>What Is Your Faviourate Movie?</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:RequiredFieldValidator InitialValue="Select" ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*Please Enter Security Question" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LblAnswer" runat="server" Text="ANSWER" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtAnswer" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtAnswer" ErrorMessage="*Please Enter Answer" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="BtnReg" runat="server" OnClick="BtnReg_Click" Text="REGISTER" Disabled="true" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HypLgn" runat="server" NavigateUrl="~/LoginForm.aspx">Login </asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="LblMsg" runat="server" Text="Message" ForeColor="White"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
