using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(first_site_web.Startup))]
namespace first_site_web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
