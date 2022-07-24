using System;

namespace WebForm.client
{
    public partial class Default : System.Web.UI.Page
    {
        TrademarkService.TrademarkServiceSoapClient trademark = new TrademarkService.TrademarkServiceSoapClient();
        ProductService.ProductServiceSoapClient product = new ProductService.ProductServiceSoapClient();
        SliderService.SliderServiceSoapClient slider = new SliderService.SliderServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptCategoryList.DataSource = trademark.GetTable();
                rptCategoryList.DataBind();
                rptProductList.DataSource = product.GetTable();
                rptProductList.DataBind();
                rptSliderList.DataSource = slider.GetTableActive();
                rptSliderList.DataBind();
            }
        }

        public static string ObjToVnd(object ojb) => Convert.ToInt32(ojb).ToString("C0", System.Globalization.CultureInfo.GetCultureInfo("vi-vn"));

        public static string PriceSales(object price, object percentSales)
        {
            int value = Convert.ToInt32(price) - (Convert.ToInt32(price) * Convert.ToInt32(percentSales) / 100);
            return ObjToVnd(value);
        }
    }
}