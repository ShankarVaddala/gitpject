<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoveryForm.aspx.cs" Inherits="TaskAsp_RegLoginWelcome_.RecoveryForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
    $(document).ready(function () {
        // Cache the elements and the button
        var txtUId = $("#<%= TxtUId.ClientID %>");
        var ddlSquestion = $("#<%= DropDownList1.ClientID %>");
        var txtAnswer = $("#<%= TxtAnswer.ClientID %>");
        var txtNPwd = $("#<%= TxtNPwd.ClientID %>");
        var txtCNPwd = $("#<%= TxtCNPwd.ClientID %>");
        var btnSbmt = $("#<%= BtnSbmt.ClientID %>");

        // Check fields and enable/disable button
        function checkFields() {
            if (
                txtUId.val() !== "" &&
                ddlSquestion.val() !== "Select" &&
                txtAnswer.val() !== "" &&
                txtNPwd.val() !== "" &&
                txtCNPwd.val() !== ""
            ) {
                btnSbmt.prop("disabled", false);
            } else {
                btnSbmt.prop("disabled", true);
            }
        }

        // Call the checkFields function when fields change
        txtUId.on("input", checkFields);
        ddlSquestion.on("change", checkFields);
        txtAnswer.on("input", checkFields);
        txtNPwd.on("input", checkFields);
        txtCNPwd.on("input", checkFields);

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

        .auto-style3 {
            width: 250px;
        }

        .auto-style4 {
            height: 23px;
        }

        .auto-style5 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="centered-form">
        <div>
        <table class="auto-style1">
            
            <tr>
                <td class="auto-style4" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LblTitleMsg" runat="server" BackColor="Black" Font-Bold="True" Font-Size="Larger" ForeColor="White" Text="RECOVERY FORM"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LblUId" runat="server" Text="USER ID" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtUId" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUId" ErrorMessage="*Please Enter UserID" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LblSquestion" runat="server" Text="SECURITY QUESTION" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>What Is Your Child Name?</asp:ListItem>

                        <asp:ListItem>What Is Your Faviourate Movie?</asp:ListItem>

                    </asp:DropDownList>
                    &nbsp;<asp:RequiredFieldValidator InitialValue="Select" ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*Please Enter Security Question" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="LblAnswer" runat="server" Text="ANSWER" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TxtAnswer" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtAnswer" ErrorMessage="*Please Enter Answer" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LblNpwd" runat="server" Text="NEW PASSWORD" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtNPwd" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtNPwd" ErrorMessage="*Please Enter New Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxtNPwd" ControlToValidate="TxtCNPwd" ErrorMessage="*New Password &amp; Confirm Password Should be same" ForeColor="Red"></asp:CompareValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LblCNpwd" runat="server" Text="CONFIRM NEW PASSWORD" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtCNPwd" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtCNPwd" ErrorMessage="*Please Enter Confirm Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="BtnSbmt" runat="server" Text="SUBMIT" OnClick="BtnSbmt_Click" Disabled="true" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginForm.aspx">Login</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Label ID="LblMsg" runat="server" Text="Message" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
