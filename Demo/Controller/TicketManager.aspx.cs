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
    public partial class TicketManager : System.Web.UI.Page
    {
        TicketRaiseService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new TicketRaiseService();

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

        private void FetchTickets()
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

        // Fills the employee dropdown in each row after the row's data has been bound.
        protected void gvTicket_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlAssignTo = (DropDownList)e.Row.FindControl("ddlAssignTo");

                EmployeeService employeeService = new EmployeeService();
                var employees = employeeService.FetchAll();

                ddlAssignTo.DataSource = employees;
                ddlAssignTo.DataTextField = "EmployeeName";
                ddlAssignTo.DataValueField = "EmployeeId";
                ddlAssignTo.DataBind();
            }
        }

        protected void gvTicket_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ticketId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "AssignItem")
            {
                // Find the dropdown inside the same row that raised this command.
                GridViewRow row = ((Control)e.CommandSource).NamingContainer as GridViewRow;
                DropDownList ddlAssignTo = (DropDownList)row.FindControl("ddlAssignTo");

                int assignedTo = int.Parse(ddlAssignTo.SelectedValue);

                string msg = service.AssignTicket(ticketId, assignedTo);

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