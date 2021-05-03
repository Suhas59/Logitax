using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ExcelIUpload_Logitax.Startup))]
namespace ExcelIUpload_Logitax
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
