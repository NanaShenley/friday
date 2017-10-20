<%@ Page Title="About" Language="C#" MasterPageFile="~/portal/asdf/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="managementPortalWebforms.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>
    
    
    <div class="form-horizontal">
        <h4>Create a new item</h4> 
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <%--<div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Titles" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Titles" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Titles"
                    CssClass="text-danger" ErrorMessage="The title field is required." />
            </div> 
        </div>--%>
        <%--<div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>--%>
        <%--<div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Submit" CssClass="btn btn-default" />
            </div>
        </div>--%>
        
        <%--<asp:FormView ID="FormView1" runat="server" >
            <InsertItemTemplate>
                <asp:Label runat="server" AssociatedControlID="Titles" CssClass="col-md-2 control-label">Password</asp:Label>
                <div class="col-md-10">
                    <asp:Label runat="server" AssociatedControlID="Titles" CssClass="col-md-2 control-label">Title</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Titles" CssClass="form-control" TextMode="SingleLine" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Titles"
                            CssClass="text-danger" ErrorMessage="The title field is required." />
                    </div>
                </div>
            </InsertItemTemplate>
        </asp:FormView>--%>
        
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" ForeColor="#333333"
        DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="true">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <table border="1">
                <tr>
                    <td>Title</td>
                    <td><%# Eval("Title") %></td>
                </tr>
                 <tr>
                    <td>Title</td>
                    <td><%# Eval("Summary") %></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><%# Eval("Description") %></td>
                </tr>
                <tr>
                    <td> </td>
                    <td>
                        <asp:Button ID="btnEdit" runat="Server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="btnInsert" runat="Server" CommandName="New" Text="New" />
                        <asp:Button ID="btnDelete" runat="Server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure to Delete?');" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <EditItemTemplate>
            <table border="1">
                <tr>
                    <td>Id</td>
                    <td><%# Eval("Id") %></td>
                </tr>      
                <tr>
                    <td>Title</td>
                    <td><asp:TextBox ID="TextBox1" runat="Server" Text='<%# Bind("Title")%>'></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Summary</td>
                    <td><asp:TextBox ID="TextBox2" runat="Server" Text='<%# Bind("Summary")%>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><asp:TextBox ID="TextBox4" runat="Server" Text='<%# Bind("Description")%>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td> </td>
                    <td>
                        <asp:Button ID="btnUpdate" runat="Server" CommandName="Update" Text="Update" />
                        <asp:Button ID="Button1" runat="Server" CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table border="1">
                <tr>
                    <td>Id</td>
                    <td><%# Eval("Id") %></td>
                </tr>
                <tr>
                    <td>Title</td>
                    <td><asp:TextBox ID="TextBox1" runat="Server" Text='<%# Bind("Title")%>'></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Title</td>
                    <td><asp:TextBox ID="TextBox3" runat="Server" Text='<%# Bind("Summary")%>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><asp:TextBox ID="TextBox5" runat="Server" Text='<%# Bind("Description")%>'></asp:TextBox></td>
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
        <textarea id="TextArea1" cols="20" rows="2"></textarea>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ connectionStrings:DefaultConnection %>'
     SelectCommand="Select * FROM items ORDER BY [Id]"
     DeleteCommand="Delete FROM items WHERE id = @Id"
     UpdateCommand="UPDATE items SET Title = @Title, Summary = @Summary, Description = @Description WHERE Id = @Id"
     InsertCommand="INSERT INTO items (Title, Summary) VALUES (@Title, @Summary)">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Title" Type="string" Size="50" />
            <asp:Parameter Name="Summary" Type="string" Size="50" />
            <asp:Parameter Name="Description" Type="string" />

        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Title" Type="string" Size="50" />
            <asp:Parameter Name="Summary" Type="string" Size="50" />
            <asp:Parameter Name="Description" Type="string" />
        </InsertParameters>
     </asp:SqlDataSource>
        <ajaxToolkit:HtmlEditorExtender ID="HtmlEditorExtender1" 
        TargetControlID="TextBox1" runat="server"/>
        <Toolbar> 
            <ajaxToolkit:Undo />
            <ajaxToolkit:Redo />
            <ajaxToolkit:Bold />
            <ajaxToolkit:Italic />
            <ajaxToolkit:CreateLink />
            <ajaxToolkit:UnLink />
            <ajaxToolkit:RemoveFormat />
            <ajaxToolkit:SelectAll />
            <ajaxToolkit:UnSelect />
            <ajaxToolkit:Delete />
            <ajaxToolkit:Cut />
            <ajaxToolkit:Copy />
            <ajaxToolkit:Paste />
        </Toolbar>
    </ajaxToolkit:HtmlEditorExtender>
    </div>
</asp:Content>
