using Demo.Service;
using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class ResolvedTicket : System.Web.UI.Page
    {
        TicketRaiseService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new TicketRaiseService();

            // TEMP - testing only. Remove this once your friend's login/auth sets Session["UserId"] for real.
            if (Session["UserId"] == null)
            {
                Session["UserId"] = 42;
            }

            if (!IsPostBack)
            {
                FetchMyTickets();
            }
            Pagination();
        }

        public void Pagination()
        {
            if (gvMyTickets.Rows.Count > 0)
            {
                gvMyTickets.UseAccessibleHeader = true;
                gvMyTickets.HeaderRow.TableSection = TableRowSection.TableHeader;
                foreach (GridViewRow row in gvMyTickets.Rows)
                {
                    row.TableSection = TableRowSection.TableBody;
                }
            }
        }

        private int GetLoggedInUserId()
        {
            if (Session["UserId"] == null)
            {
                throw new Exception("No logged-in user found in Session. Make sure Session[\"UserId\"] is set at login.");
            }
            return int.Parse(Session["UserId"].ToString());
        }

        public void FetchMyTickets()
        {
            int myUserId = GetLoggedInUserId();

            // Show only tickets assigned to the logged-in employee.
            var myTickets = service.FetchAll() .Where(t => t.AssignedTo.HasValue && t.AssignedTo.Value == myUserId) .ToList();
            string statusFilter = ddlFilterByStatus.SelectedValue;
            if (statusFilter == "pending")
            {
                myTickets = myTickets.Where(t => t.Status != "Resolved").ToList();
            }
            else if (statusFilter == "Resolved")
            {
                myTickets = myTickets.Where(t => t.Status == "Resolved").ToList();
            }

            if (ddlSortBy.SelectedValue == "asc")
            {
                myTickets = myTickets.OrderBy(t => t.CreatedAt).ToList();
            }
            else
            {
                myTickets = myTickets.OrderByDescending(t => t.CreatedAt).ToList();
            }

            gvMyTickets.DataSource = myTickets;
            gvMyTickets.DataBind();
            Pagination();
        }

        protected void gvMyTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ticketId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "CloseItem")
            {
                // Open the resolve modal for this ticket.
                hdnResolveTicketId.Value = ticketId.ToString();
                litTicketId.Text = ticketId.ToString();
                txtSolution.Text = "";

                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('resolve_ticket')); m.show(); };</script>");
            }
            else if (e.CommandName == "DownloadItem")
            {
                DownloadFile(ticketId);
            }
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            int ticketId = int.Parse(hdnResolveTicketId.Value);

            string solutionFilePath = "";
            string solutionOriginalFileName = "";

            if (fileSolution.HasFile)
            {
                string folderPath = Server.MapPath("~/Uploads/TicketSolutions/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(fileSolution.FileName);
                fileSolution.SaveAs(folderPath + uniqueFileName);

                solutionFilePath = uniqueFileName;
                solutionOriginalFileName = Path.GetFileName(fileSolution.FileName);
            }

            string msg = service.ResolveTicket(ticketId, txtSolution.Text, solutionFilePath, solutionOriginalFileName);

            FetchMyTickets();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Modal is closed client-side via data-bs-dismiss on the Cancel button's
            // parent markup normally, but since this is a server Button (needs CausesValidation=false
            // to skip validation), the postback just leaves the modal closed on reload.
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

            if (File.Exists(filePath))
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=\"" + downloadName + "\"");

                FileInfo fileInfo = new FileInfo(filePath);
                Response.AppendHeader("Content-Length", fileInfo.Length.ToString());

                Response.TransmitFile(filePath);

                Response.Flush();
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg",
                    "alert('Error: The file could not be found on the server.');", true);
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchMyTickets();
        }

        protected void ddlFilterByStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchMyTickets();
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