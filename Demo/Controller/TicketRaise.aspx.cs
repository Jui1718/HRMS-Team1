using Demo.Service;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class TicketRaise : System.Web.UI.Page
    {
        TicketRaiseService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new TicketRaiseService();

            // temp auth as shubham is working on this
            if (Session["UserId"] == null)
            {
                Session["UserId"] = 36;
            }

            if (!IsPostBack)
            {
                FetchTickets();
            }
            Pagination();
        }

        public void Pagination()
        {
            if (gvTicket.Rows.Count > 0)
            {
                gvTicket.UseAccessibleHeader = true;
                gvTicket.HeaderRow.TableSection = TableRowSection.TableHeader;
                foreach (GridViewRow row in gvTicket.Rows)
                {
                    row.TableSection = TableRowSection.TableBody;
                }
            }
        }

        public int GetLoggedInUserId()
        {
            if (Session["UserId"] == null)
            {
                throw new Exception("No logged-in user found in Session. Make sure Session[\"UserId\"] is set at login.");
            }
            return int.Parse(Session["UserId"].ToString());
        }

        public void FetchTickets()
        {
            var tickets = service.FetchAll();
            string dateFilter = ddlFilterByDate.SelectedValue;
            if (dateFilter == "today")
            {
                tickets = tickets.Where(t => t.CreatedAt.Date == DateTime.Today).ToList();
            }
            else if (dateFilter == "last7days")
            {
                tickets = tickets.Where(t => t.CreatedAt.Date >= DateTime.Today.AddDays(-7)).ToList();
            }
            else if (dateFilter == "lastmonth")
            {
                tickets = tickets.Where(t => t.CreatedAt.Date >= DateTime.Today.AddMonths(-1)).ToList();
            }

            if (ddlSortBy.SelectedValue == "desc")
            {
                tickets = tickets.OrderByDescending(t => t.CreatedAt).ToList();
            }
            else
            {
                tickets = tickets.OrderBy(t => t.CreatedAt).ToList();
            }
            gvTicket.DataSource = tickets;
            gvTicket.DataBind();
            Pagination();
        }

        public void ClearForm()
        {
            txtTicket.Text = "";
            txtTicketDetail.Text = "";
            hdnTicketId.Value = "0";
            hdnExistingFile.Value = "";
            hdnExistingOriginalName.Value = "";
        }

        protected void btnAddTicket_Click(object sender, EventArgs e)
        {
            ClearForm();
            btnAdd.Text = "Add";
            LitModalTitle.Text = "Raise Ticket";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_ticket')); m.show(); };</script>");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string msg;

            string filePath = hdnExistingFile.Value;
            string originalFileName = hdnExistingOriginalName.Value;

            if (fileAttach.HasFile)
            {
                string folderPath = Server.MapPath("~/Uploads/TicketAttachments/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(fileAttach.FileName);
                fileAttach.SaveAs(folderPath + uniqueFileName);

                filePath = uniqueFileName;
                originalFileName = Path.GetFileName(fileAttach.FileName);
            }

            int ticketId = int.Parse(hdnTicketId.Value);

            if (ticketId > 0)
            {
                var t = new Demo.Model.TicketRaise()
                {
                    TicketId = ticketId,
                    TicketTitle = txtTicket.Text,
                    TicketDetail = txtTicketDetail.Text,
                    FilePath = filePath,
                    OriginalFileName = originalFileName
                };
                msg = service.Update(t);
                btnAdd.Text = "Add";
            }
            else
            {
                var t = new Demo.Model.TicketRaise()
                {
                    TicketTitle = txtTicket.Text,
                    TicketDetail = txtTicketDetail.Text,
                    RaisedBy = GetLoggedInUserId(),
                    FilePath = filePath,
                    OriginalFileName = originalFileName
                };
                msg = service.Add(t);
            }

            ClearForm();
            FetchTickets();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        protected void gvTicket_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ticketId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditItem")
            {
                var obj = service.GetById(ticketId);

                txtTicket.Text = obj.TicketTitle;
                txtTicketDetail.Text = obj.TicketDetail;
                hdnExistingFile.Value = obj.FilePath;
                hdnExistingOriginalName.Value = obj.OriginalFileName;
                hdnTicketId.Value = ticketId.ToString();

                btnAdd.Text = "Update";
                LitModalTitle.Text = "Edit Ticket";

                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_ticket')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteItem")
            {
                string msg = service.Delete(ticketId);

                FetchTickets();

                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
            else if (e.CommandName == "DownloadItem")
            {
                DownloadFile(ticketId);
            }
        }

        private void DownloadFile(int ticketId)
        {
            var obj = service.GetById(ticketId);

            if (obj == null || string.IsNullOrEmpty(obj.FilePath))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg",
                    "alert('No file attached to this ticket.');", true);
                return;
            }

            string downloadName = string.IsNullOrEmpty(obj.OriginalFileName) ? obj.FilePath : obj.OriginalFileName;
            string filePath = Server.MapPath("~/Uploads/TicketAttachments/" + obj.FilePath);

            if (!File.Exists(filePath))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg",
                    "alert('Error: The file could not be found on the server.');", true);
                return;
            }

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment; filename=\"" + downloadName + "\"");
            Response.WriteFile(filePath);       
            Response.End(); 
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTickets();
        }

        protected void ddlFilterByDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTickets();
        }

        public string GetStatusBadgeClass(string status)
        {
            switch (status)
            {
                case "Resolved":
                    return "bg-success";
                case "Assigned":
                    return "bg-warning text-dark";
                case "Pending":
                default:
                    return "bg-danger";
            }
        }
    }
}