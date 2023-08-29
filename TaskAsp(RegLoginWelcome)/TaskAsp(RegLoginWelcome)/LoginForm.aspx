<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="TaskAsp_RegLoginWelcome_.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="Scripts/angular.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" rel="stylesheet" />
   
    <script>
        $(document).ready(function () {
            $("#togglePassword").click(function () {
                var pwdField = $("#<%= TxtPwd.ClientID %>");
            var toggleBtn = $(this);

            if (pwdField.attr("type") === "password") {
                pwdField.attr("type", "text");
                toggleBtn.html('<i class="fas fa-eye-slash"></i>');
            } else {
                pwdField.attr("type", "password");
                toggleBtn.html('<i class="fas fa-eye"></i>');
            }
        });
    });
    </script>

   <script>
       $(document).ready(function () {
           // Cache the elements and the button
           var txtUId = $("#<%= TxtUId.ClientID %>");
        var txtPwd = $("#<%= TxtPwd.ClientID %>");
        var txtCaptcha = $("#<%= captchacode.ClientID %>");
        var btnLogin = $("#<%= BtnLgn.ClientID %>");

        // Check fields and enable/disable button
        function checkFields() {
            if (txtUId.val() !== "" && txtPwd.val() !== "" && txtCaptcha.val() !== "") {
                btnLogin.prop("disabled", false);
            } else {
                btnLogin.prop("disabled", true);
            }
        }

        // Call the checkFields function when fields change
        txtUId.on("input", checkFields);
        txtPwd.on("input", checkFields);
        txtCaptcha.on("input", checkFields);

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
            height: 23px;
        }

        .auto-style3 {
            height: 23px;
            width: 119px;
        }

        .auto-style4 {
            width: 119px;
        }

        .auto-style5 {
            width: 119px;
            height: 30px;
        }

        .auto-style6 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="centered-form">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblTitleMsg" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="White" Text="LOGIN FORM" BackColor="Black" BorderColor="#99CC00"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="USERID" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtUId" runat="server" ForeColor="Red" ToolTip="Enter UserID"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUId" ErrorMessage="*Please Enter UserID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style5">
                        
                        <asp:Label ID="LblPwd" runat="server" Text="PASSWORD" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TxtPwd" runat="server" TextMode="Password" ForeColor="Red" ToolTip="Enter Password"></asp:TextBox>
                        <button type="button" id="togglePassword" class="btn btn-link"><i class="fas fa-eye"></i></button>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPwd" ErrorMessage="*Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;</td>
                    
                </tr>
               
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="LblCaptcha" runat="server" Text="Enter Captcha" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="captchaImage" runat="server" Height="40px" Width="150px" ImageUrl="~/MyCaptcha.aspx" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="captchacode" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Button ID="BtnLgn" runat="server" OnClick="BtnLgn_Click" Text="LOGIN" Disabled="true" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RecoveryForm.aspx">Change Password</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HypReg" runat="server" NavigateUrl="~/RegistrationForm.aspx">Register</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Label ID="LblMsg" runat="server" Text="Message" ForeColor="White"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
