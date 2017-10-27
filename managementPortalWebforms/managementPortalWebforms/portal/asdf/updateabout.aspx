<%@ Page ValidateRequest="false" Title="Update" Language="C#" MasterPageFile="~/portal/asdf/Site.Master" AutoEventWireup="true" CodeBehind="updateabout.aspx.cs" Inherits="managementPortalWebforms.updateabout" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>
    
    
    <div class="form-horizontal">
         <div style="border: solid 1px black;">
            <div style="width: 30%; float: left;">
               <h4>Update item</h4> 
            </div>
            
            <div style="float: right;  margin-left: 15px;">
            <h5><a href="addabout.aspx">Add item</a></h5>
            </div>
            <div style="float: right;  margin-left: 15px;">
            <h5><a href="about.aspx">List items</a></h5>
            </div>
             <div style="float: right;  margin-left: 15px;">
            <h5><span class="activeLink">Update</span></h5>
            </div>
            </div>
       </div>
       <hr style=" clear: both;" />
      
        <asp:FormView DefaultMode="Edit" ID="FormView1" runat="server" CellPadding="4" ForeColor="#333333" 
         DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" OnItemUpdating="FormView1_ItemUpdating" OnItemUpdated="FormView1_ItemUpdated" OnDataBound="FormView1_DataBound">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditItemTemplate>
            <table border="1">    
                <tr>
                    <td>Title</td>
                    <td><asp:TextBox ID="TextBox1" runat="Server" Text='<%# Bind("Title")%>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Is Active</td>
                    <td><asp:TextBox ID="TextBox2" runat="Server" Text='<%# Bind("IsActive")%>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Date Created</td>
                    <td><asp:TextBox ID="TextBox3" runat="Server" Text='<%# Bind("DateCreated")%>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Image ID="Image" runat="server" Width="200px" Height="200px" />
                    </td>
                </tr>
                 <tr>
                    <td>Summary</td>
                    <td>
                        <FTB:FreeTextbox runat="server" id="FreeTextbox1" Text='<%# Bind("Summary")%>' /> 
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>
                        <FTB:FreeTextbox runat="server" id="FreeTextbox2" Text='<%# Bind("Description")%>' />  
                    </td>
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
    </asp:FormView>
    s<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ connectionStrings:DefaultConnection %>'
     SelectCommand="Select * FROM items WHERE id = @Id"
     UpdateCommand="UPDATE items SET Title = @Title, Summary = @Summary, Description = @Description, Image = @Image, DateCreated = @DateCreated, IsActive = @IsActive WHERE Id = @Id">
        <UpdateParameters> 
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Title" Type="string" Size="50" />
            <asp:Parameter Name="Summary" Type="string" />
            <asp:Parameter Name="Description" Type="string" />
            <asp:Parameter Name="Image" Type="string" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
        </UpdateParameters>
         <SelectParameters> 
           <asp:QueryStringParameter Name="Id" QueryStringField="id" />
        </SelectParameters>
     </asp:SqlDataSource>
        <br/><br/><br/>
       
</asp:Content>
