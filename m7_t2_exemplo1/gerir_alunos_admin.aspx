<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="gerir_alunos_admin.aspx.cs" Inherits="m7_t2_exemplo1.gerir_alunos_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gerir Alunos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir Alunos</h1>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t2_exemploConnectionString %>" DeleteCommand="DELETE FROM alunos WHERE (nprocesso = @nprocesso)" InsertCommand="INSERT INTO alunos(nome, morada, cp, data_nascimento) VALUES (@nome, @morada, @cp, @data_nascimento)" SelectCommand="select * from alunos" UpdateCommand="UPDATE alunos SET nome = @nome, morada = @morada, cp = @cp, data_nascimento = @data_nascimento WHERE (nprocesso = @nprocesso)">
        <DeleteParameters>
            <asp:Parameter Name="nprocesso" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="morada" />
            <asp:Parameter Name="cp" />
            <asp:Parameter Name="data_nascimento" 
                DbType="Date"/>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="morada" />
            <asp:Parameter Name="cp" />
            <asp:Parameter Name="data_nascimento" 
                DbType="Date"/>
            <asp:Parameter Name="nprocesso" />
        </UpdateParameters>
    </asp:SqlDataSource>
<!--Formulário para adicionar alunos novos-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            nprocesso:
            <asp:Label ID="nprocessoLabel1" runat="server" Text='<%# Eval("nprocesso") %>' />
            <br />
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            morada:
            <asp:TextBox ID="moradaTextBox" runat="server" Text='<%# Bind("morada") %>' />
            <br />
            cp:
            <asp:TextBox ID="cpTextBox" runat="server" Text='<%# Bind("cp") %>' />
            <br />
            data_nascimento:
            <asp:TextBox ID="data_nascimentoTextBox" runat="server" Text='<%# Bind("data_nascimento") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Novo" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nomeTextBox" ErrorMessage="O campo nome é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <br />
            Morada:
            <asp:TextBox ID="moradaTextBox" runat="server" Text='<%# Bind("morada") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="moradaTextBox" ErrorMessage="A morada é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <br />
            Código Postal:
            <asp:TextBox ID="cpTextBox" runat="server" Text='<%# Bind("cp") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cpTextBox" ErrorMessage="O código postal é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <br />
            Data Nascimento:
            <asp:TextBox ID="data_nascimentoTextBox" runat="server" Text='<%# Bind("data_nascimento") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="data_nascimentoTextBox" ErrorMessage="A data de nascimento é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="data_nascimentoTextBox" ErrorMessage=" A data indicada não é válida" MaximumValue="01-01-2100" MinimumValue="01-01-1900" Type="Date"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            nprocesso:
            <asp:Label ID="nprocessoLabel" runat="server" Text='<%# Eval("nprocesso") %>' />
            <br />
            nome:
            <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            morada:
            <asp:Label ID="moradaLabel" runat="server" Text='<%# Bind("morada") %>' />
            <br />
            cp:
            <asp:Label ID="cpLabel" runat="server" Text='<%# Bind("cp") %>' />
            <br />
            data_nascimento:
            <asp:Label ID="data_nascimentoLabel" runat="server" Text='<%# Bind("data_nascimento") %>' />
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Novo" />
        </ItemTemplate>
    </asp:FormView>
    <!--Gridview para gerir alunos-->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="nprocesso" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" InsertVisible="False" ReadOnly="True" SortExpression="nprocesso" />
            <asp:TemplateField HeaderText="nome" SortExpression="nome">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="O campo nome é obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="morada" SortExpression="morada">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("morada") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2" ErrorMessage="A morada é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("morada") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="cp" SortExpression="cp">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cp") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("cp") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="data_nascimento" SortExpression="data_nascimento">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("data_nascimento") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="A data é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="A data indicada não é válida" MaximumValue="01-01-2100" MinimumValue="01-01-1900"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("data_nascimento") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

