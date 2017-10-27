<%@ Page ValidateRequest="false" Title="About" Language="C#" MasterPageFile="~/portal/asdf/Site.Master" AutoEventWireup="true" CodeBehind="addabout.aspx.cs" Inherits="managementPortalWebforms.addabout" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.1.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>
    
    
    <div class="form-horizontal">
        <div style="border: solid 1px black;">
            <div style="width: 30%; float: left;">
               <h4>Create a new item</h4> 
            </div>
            <div style="float: right; margin-left: 15px;">
            <h5><a class="activeLink" href="addabout.aspx">Add item</a></h5>
            </div>
            <div style="float: right; margin-left: 15px;">
            <h5><a href="about.aspx">List items</a></h5>
            </div>
      </div>
       </div>
       <hr style=" clear: both;" />
       <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" CellPadding="4" ForeColor="#333333" 
         DataKeyNames="Id" DataSourceID="SqlDataSource1"  OnItemCreated="FormView1_ItemCreated" OnItemInserting="FormView1_ItemInserting" OnItemInserted="FormView1_ItemInserted1" >
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" /> 
        <InsertItemTemplate>
            <table border="0px" style="text-align: left;">
                <tr>
                    <td>Active</td>
                    <td>
                        <%--<asp:TextBox ID="TextBox2" runat="Server" Text='<%# Bind("IsActive")%>'></asp:TextBox>--%>
                        <asp:CheckBox ID="CheckBox1" Checked='<%# Bind("IsActive")%>' runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Date Created</td>
                    <td>
                        <asp:TextBox ID="TextBox3" BorderWidth="1px" BorderColor="black" BorderStyle="Solid" runat="Server" Text='<%# Bind("DateCreated")%>'></asp:TextBox>
                        <cc1:CalendarExtender ID="ceLoanTakenDate" runat="server" Format="dd/MM/yyyy"     PopupButtonID="TextBox3" TargetControlID="TextBox3">
                        </cc1:CalendarExtender>
                    </td> 
                </tr>
                <tr>
                    <td>Title</td>
                    <td><asp:TextBox Width="400px" ID="TextBox1" BorderWidth="1px" BorderColor="black" BorderStyle="Solid" runat="Server" Text='<%# Bind("Title")%>'></asp:TextBox></td>
                </tr>  
                <tr>
                    <td>Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" Width="280px" BorderWidth="1px" BorderColor="black" BorderStyle="Solid" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>Summary</td>
                    <td><FTB:FreeTextbox  runat="server" id="FreeTextbox4" Text='<%# Bind("Summary")%>' /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><FTB:FreeTextbox  runat="server" id="FreeTextbox5" Text='<%# Bind("Description")%>' /> </td>
                </tr>
                <tr>
                    <td> </td>
                    <td>
                        <asp:Button ID="btnSave" runat="Server" CommandName="insert" Text="Insert" />
                        <asp:Button ID="Button1" runat="Server" CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
   <%-- <FTB:FreeTextBox ID="FTB1" runat="server" Width="100%" Height="280px"
                    ToolbarLayout="ParagraphMenu, Bold, Italic, Underline, Strikethrough, CreateLink, Unlink, RemoveFormat, JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, BulletedList, NumberedList, Indent, Outdent, Cut, Copy, Paste, Undo, Redo, ieSpellCheck">
   </FTB:FreeTextBox>--%>
   <%--BackColor="red" GutterBackColor="red" ToolbarStyleConfiguration="Office2000"--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ connectionStrings:DefaultConnection %>'
     InsertCommand="INSERT INTO items (Title, Image, Summary, Description, IsActive, DateCreated) VALUES (@Title, @Image, @Summary, @Description, @IsActive, @DateCreated)">
        <InsertParameters>
            <asp:Parameter Name="Title" Type="string" Size="50" />
            <asp:Parameter Name="Summary" Type="string" />
            <asp:Parameter Name="Description" Type="string" />
            <asp:Parameter Name="Image" Type="string" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
        </InsertParameters>
     </asp:SqlDataSource>
        <br/><br/><br/>
</asp:Content>
