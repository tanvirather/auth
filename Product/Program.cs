using Zuhid.Base;

namespace Zuhid.Product;

public class Program {
  public static void Main(string[] args) {
    var builder = WebApplicationExtension.AddServices(args);
    var appSetting = new AppSetting(builder.Configuration);
    builder.AddDatabase<ProductContext, ProductContext>(appSetting.Product);
    builder.BuildServices().Run();
  }
}
