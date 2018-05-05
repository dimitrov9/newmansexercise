using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TestEntityFramework.Startup))]
namespace TestEntityFramework
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
