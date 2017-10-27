<%@ Page ValidateRequest="false" Title="About" Language="C#" MasterPageFile="~/portal/asdf/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="managementPortalWebforms.About" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>
    
    
    <div class="form-horizontal">
         <div style="border: solid 1px black;">
            <div style="width: 30%; float: left;">
               <h4>List of items</h4> 
            </div>
            <div style="float: right; margin-left: 15px;">
            <h5><a href="addabout.aspx">Add item</a></h5>
            </div>
            <div style="float: right; margin-left: 15px;">
            <h5><a class="activeLink" href="about.aspx">List item</a></h5>    
            </div>
       </div>
        <hr style=" clear: both;" />
        
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting">
            <EmptyDataTemplate>
                Sorry No Item present. Please <a href="addabout.aspx"> add an item </a> 
            </EmptyDataTemplate>
            <Columns>        
                <%--<asp:BoundField ReadOnly="True" 
                  HeaderText="Id" InsertVisible="False" 
                  DataField="Id"
                    SortExpression="Id"></asp:BoundField>--%>
                <asp:BoundField HeaderText="Title" 
                  DataField="Title" SortExpression="Title">
                </asp:BoundField>
                <asp:BoundField HeaderText="Is Active" 
                  DataField="IsActive" SortExpression="IsActive">
                </asp:BoundField>
                <asp:BoundField HeaderText="Date Created" DataFormatString="{0:dd/MM/yyyy}" 
                  DataField="DateCreated"  SortExpression="DateCreated">
                </asp:BoundField>
                <asp:BoundField HeaderText="Summary" 
                  DataField="Summary" >
                </asp:BoundField>
                <asp:BoundField HeaderText="Description" 
                  DataField="Description">
                </asp:BoundField>

                <asp:TemplateField HeaderText="" >
                    <ItemTemplate> 
                        <a runat="server" ID="editLink" >Edit</a>
                    </ItemTemplate> 
                </asp:TemplateField>               
                <asp:CommandField runat="server" ShowDeleteButton="True" DeleteText="Delete"  />
            </Columns>
        </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ connectionStrings:DefaultConnection %>'
     SelectCommand="Select * FROM items ORDER BY [Id] desc"
     DeleteCommand="Delete FROM items WHERE id = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
     </asp:SqlDataSource>
        <br/><br/><br/>
        
    </div>
</asp:Content>
