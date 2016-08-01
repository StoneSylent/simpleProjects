using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVC_test1.Startup))]
namespace MVC_test1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
