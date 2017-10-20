using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(managementPortalWebforms.Startup))]
namespace managementPortalWebforms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
