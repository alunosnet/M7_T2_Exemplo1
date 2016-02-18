<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="gerir_disciplinas_admin.aspx.cs" Inherits="m7_t2_exemplo1.gerir_disciplinas_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>Gerir Disciplinas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Gerir Disciplinas</h1>
 <!--SQLDataSource-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t2_exemploConnectionString %>" DeleteCommand="DELETE FROM disciplinas WHERE (id = @id)" InsertCommand="INSERT INTO disciplinas(nome, nr_modulos) VALUES (@nome, @nr_modulos)" SelectCommand="select * from disciplinas" UpdateCommand="UPDATE disciplinas SET nome = @nome, nr_modulos = @nr_modulos WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="nr_modulos" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="nr_modulos" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
 <!--Formview-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="363px">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            nr_modulos:
            <asp:TextBox ID="nr_modulosTextBox" runat="server" Text='<%# Bind("nr_modulos") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nomeTextBox" ErrorMessage="O nome da disciplina é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <br />
            nr_modulos:
            <asp:TextBox ID="nr_modulosTextBox" runat="server" Text='<%# Bind("nr_modulos") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nr_modulosTextBox" ErrorMessage="Deve indicar o número de módulos da disciplina"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="nr_modulosTextBox" ErrorMessage="O número indicado não é válido" MaximumValue="99" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            nome:
            <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            nr_modulos:
            <asp:Label ID="nr_modulosLabel" runat="server" Text='<%# Bind("nr_modulos") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
 <!--Gridview-->
    <asp:GridView ID="GridView1" CssClass="table table-responsive" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="nr_modulos" HeaderText="nr_modulos" SortExpression="nr_modulos" />
        </Columns>
    </asp:GridView>
</asp:Content>
