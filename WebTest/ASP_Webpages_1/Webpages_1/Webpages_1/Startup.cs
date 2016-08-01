using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Webpages_1.Startup))]
namespace Webpages_1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
