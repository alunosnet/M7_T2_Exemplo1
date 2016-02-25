<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="m7_t2_exemplo1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Página inicial</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Página inicial</h1>
    <div runat="server" id="div_login">
    <!--Login-->
    <!--Nome utilizador-->
    Nome:<asp:TextBox ID="tbNome" runat="server"></asp:TextBox>
    <!--Palavra passe-->
    Palavra passe:<asp:TextBox ID="tbPassword" TextMode="Password" runat="server"></asp:TextBox>
    <!--submeter-->
    <asp:Button ID="Button1" runat="server" Text="Login" />
    <!--Mensagem-->
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    <!--SqlDataSource-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t2_exemploConnectionString %>" SelectCommand="SELECT nome, perfil, nprocesso FROM Utilizadores WHERE (nome = @nome) AND (palavra_passe = @palavra_passe)">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbNome" Name="nome" PropertyName="Text" />
            <asp:ControlParameter ControlID="tbPassword" Name="palavra_passe" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--DetailsView-->
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="nome" DataSourceID="SqlDataSource1" OnDataBound="DetailsView1_DataBound">
        <Fields>
            <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome" />
            <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil" />
            <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso" />
        </Fields>
    </asp:DetailsView>
    </div>
</asp:Content>
