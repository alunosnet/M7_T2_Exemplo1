using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m7_t2_exemplo1
{
    public partial class masterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //se tem o cookie
            HttpCookie cookie = Request.Cookies["aviso"] as HttpCookie;
            if (cookie != null)
            {
                //esconder a div do aviso
                div_aviso.Visible = false;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //criar cookie
            HttpCookie cookie = new HttpCookie("aviso","mostrado");
            //prazo de validade do cookie
            cookie.Expires = DateTime.Now.AddYears(1);
            //enviar o cookie para o browser
            Response.Cookies.Add(cookie);
            //esconder a div do aviso
            div_aviso.Visible = false;
        }
    }
}