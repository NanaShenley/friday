<%@ Page Title="Log in" Language="C#" MasterPageFile="~/portal/asdf/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="managementPortalWebforms.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - My ASP.NET Application</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body>

<%--<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">--%>
    <%--<h2><%: Title %>.</h2>--%>
    <form runat="server" class="container body-content" style="border: solid 1px black; width: 500px">
    <div class="rowx">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4 style="color: black;">Use a local account to log in.</h4>
                    <div style="border-top:solid 1px black;"/><br/>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-4 control-label">Email</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" BorderStyle="Solid" BorderWidth="1px" BorderColor="black"  />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password</asp:Label>
                        <div class="col-md-8" style="">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" BorderStyle="Solid" BorderWidth="1px" BorderColor="black" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="col-md-offset-4 col-md-10">
                            <div class="checkbox" >
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" BorderStyle="Solid" BorderWidth="1px" BorderColor="black" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ForeColor="black" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                </p>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

       <%-- <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>--%>
    </div>
     </form>
<%--</asp:Content>--%>
    </body>
    </html>