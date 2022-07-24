using System;
using System.Data;
using System.IO;

namespace WebForm.admin.slider
{
    public partial class list : System.Web.UI.Page
    {
        SliderService.SliderServiceSoapClient slider = new SliderService.SliderServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["edit-id"] != null)
                {
                    string id = Request.QueryString["edit-id"];
                    DataRow row = slider.GetTableByID(id).Rows[0];
                    txtID_Edit.Text = row["SliderID"].ToString();
                    txtName_Edit.Text = row["SliderName"].ToString();
                    txtDesc_Edit.Text = row["Description"].ToString();
                    ddlStatus_Edit.SelectedValue = Convert.ToInt32(row["Status"]).ToString();
                }

                if (Request.QueryString["del-id"] != null)
                {
                    string id = Request.QueryString["del-id"];
                    slider.Delete(id);
                }

                Initial();
            }
        }

        private void Initial()
        {
            rptList.DataSource = slider.GetTable();
            rptList.DataBind();
        }

        private bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }

        public string UploadFile()
        {
            string fileName = "";
            if (Page.IsValid && fThumbnail_Add.HasFile && CheckFileType(fThumbnail_Add.FileName))
            {
                fileName = "/uploads/" + fThumbnail_Add.FileName;
                string filePath = MapPath(fileName);
                fThumbnail_Add.SaveAs(filePath);
            }
            if (Page.IsValid && fThumbnail_Edit.HasFile && CheckFileType(fThumbnail_Edit.FileName))
            {
                fileName = "/uploads/" + fThumbnail_Edit.FileName;
                string filePath = MapPath(fileName);
                fThumbnail_Edit.SaveAs(filePath);
            }
            return fileName;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (slider.Add(txtName_Add.Text, UploadFile(), txtDesc_Add.Text, ddlStatus_Add.SelectedValue))
                Initial();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (slider.Update(txtID_Edit.Text, txtName_Edit.Text, UploadFile(), txtDesc_Edit.Text, ddlStatus_Edit.SelectedValue))
                Response.Redirect("list.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = slider.Search(txtSearch.Text);
            rptList.DataSource = dt;
            rptList.DataBind();

            lblList.Text = dt.Rows.Count == 0 ? "<tr class='text-center'><td colspan='100%'><i>Không có dữ liệu</i></td></tr>" : "";
        }
    }
}