﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m7_t2_exemplo1
{
    public partial class perfil_aluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar se tem login e se é aluno
            if (Session["perfil"] == null ||
                Session["perfil"].Equals("0"))
                Response.Redirect("index.aspx");
        }
    }
}