<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="gerir_notas_admin.aspx.cs" Inherits="m7_t2_exemplo1.gerir_notas_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gerir Notas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir Notas</h1>
    <!--Sqldatasource Notas-->
    <asp:SqlDataSource ID="SQLNotas" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t2_exemploConnectionString %>" DeleteCommand="DELETE FROM notas WHERE (id = @id)" InsertCommand="INSERT INTO notas(id_disciplinas, nprocesso, valor, data, nrmodulo) VALUES (@id_disciplinas, @nprocesso, @valor, @data, @nrmodulo)" SelectCommand="SELECT notas.* FROM notas" UpdateCommand="UPDATE notas SET id_disciplinas = @id_disciplinas, nprocesso = @nprocesso, valor = @valor, data = @data, nrmodulo = @nrmodulo WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_disciplinas" />
            <asp:Parameter Name="nprocesso" />
            <asp:Parameter Name="valor" />
            <asp:Parameter Name="data" DbType="Date"/>
            <asp:Parameter Name="nrmodulo" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_disciplinas" />
            <asp:Parameter Name="nprocesso" />
            <asp:Parameter Name="valor" />
            <asp:Parameter Name="data" DbType="Date"/>
            <asp:Parameter Name="nrmodulo" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--sqldatasource alunos-->
    <asp:SqlDataSource ID="SQLAlunos" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t2_exemploConnectionString %>" SelectCommand="SELECT alunos.* FROM alunos"></asp:SqlDataSource>
    <!--sqldatasource disciplinas-->
    <asp:SqlDataSource ID="SQLDisciplinas" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t2_exemploConnectionString %>" SelectCommand="SELECT disciplinas.* FROM disciplinas"></asp:SqlDataSource>
    <!--formview-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SQLNotas" Width="363px">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            id_disciplinas:
            <asp:TextBox ID="id_disciplinasTextBox" runat="server" Text='<%# Bind("id_disciplinas") %>' />
            <br />
            nprocesso:
            <asp:TextBox ID="nprocessoTextBox" runat="server" Text='<%# Bind("nprocesso") %>' />
            <br />
            valor:
            <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("valor") %>' />
            <br />
            data:
            <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
            <br />
            nrmodulo:
            <asp:TextBox ID="nrmoduloTextBox" runat="server" Text='<%# Bind("nrmodulo") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            id_disciplinas:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SQLDisciplinas" DataTextField="nome" DataValueField="id" SelectedValue='<%# Bind("id_disciplinas") %>'>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Tem de indicar a disciplina"></asp:RequiredFieldValidator>
            <br />
            nprocesso:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SQLAlunos" DataTextField="nome" DataValueField="nprocesso" SelectedValue='<%# Bind("nprocesso") %>'>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Tem de indicar o aluno"></asp:RequiredFieldValidator>
            <br />
            valor:
            <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("valor") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="valorTextBox" ErrorMessage="Tem de indicar a nota"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="valorTextBox" ErrorMessage="A nota indicada não é válida" MaximumValue="20" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            data:
            <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dataTextBox" ErrorMessage="Tem de indicar a data"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dataTextBox" ErrorMessage="A data não é válida" MaximumValue="01-01-2100" MinimumValue="01-01-2000" Type="Date"></asp:RangeValidator>
            <br />
            nrmodulo:
            <asp:TextBox ID="nrmoduloTextBox" runat="server" Text='<%# Bind("nrmodulo") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="nrmoduloTextBox" ErrorMessage="Tem de indicar o número do módulo"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="nrmoduloTextBox" ErrorMessage="O número de módulo indicado não é válido" MaximumValue="99" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            id_disciplinas:
            <asp:Label ID="id_disciplinasLabel" runat="server" Text='<%# Bind("id_disciplinas") %>' />
            <br />
            nprocesso:
            <asp:Label ID="nprocessoLabel" runat="server" Text='<%# Bind("nprocesso") %>' />
            <br />
            valor:
            <asp:Label ID="valorLabel" runat="server" Text='<%# Bind("valor") %>' />
            <br />
            data:
            <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>' />
            <br />
            nrmodulo:
            <asp:Label ID="nrmoduloLabel" runat="server" Text='<%# Bind("nrmodulo") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <!--gridview-->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SQLNotas">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
</asp:GridView>
</asp:Content>
