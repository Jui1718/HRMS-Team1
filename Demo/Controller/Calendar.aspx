<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Demo.Controller.CalendarPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events Calendar</title>
    <link rel="stylesheet" href="~/assets/css/bootstrap.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/plugins/tabler-icons/tabler-icons.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/style.css" runat="server">
    <style>
        #calendar { max-width: 100%; }
        .fc-event { cursor: default; border: none; }

        .upcoming-card {
            background: #fff;
            border: 1px solid #f0f0f0;
            border-radius: 8px;
            padding: 14px 18px;
            margin-bottom: 14px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.06);
        }
        .upcoming-card .title {
            font-weight: 700;
            font-size: 16px;
            color: #1a1a2e;
            margin-bottom: 4px;
        }
        .upcoming-card .date {
            color: #16a34a;
            font-size: 14px;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-wrapper">
        <div class="content">

            <div class="row">
                <div class="col-md-9">
                    <div id="calendar"></div>
                </div>

                <div class="col-md-3">
                    <div class="d-flex justify-content-end mb-3">
                        <asp:LinkButton ID="btnAddEvent" runat="server" CssClass="btn btn-primary w-100 d-flex align-items-center justify-content-center"
                            OnClick="btnAddEvent_Click">
                            <i class="ti ti-circle-plus me-1"></i>Add New Event
                        </asp:LinkButton>
                    </div>
                    <div id="upcomingList">
                        <asp:Repeater ID="RptUpcoming" runat="server">
                            <ItemTemplate>
                                <div class="upcoming-card">
                                    <div class="title"><%# Eval("Title") %></div>
                                    <div class="date"><%# Eval("Date", "{0:yyyy-MM-dd}") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Add / Edit Event Modal -->
    <div class="modal fade" id="new_event">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        <asp:Literal ID="LitModalTitle" runat="server" Text="Add Event"></asp:Literal>
                    </h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Event Title</label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Event Type</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Event Date</label>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Add" />
                </div>
            </div>
        </div>
    </div>
    <!-- /Add / Edit Event Modal -->

    </form>

    <script src="<%= ResolveUrl("~/assets/js/jquery-3.7.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/bootstrap.bundle.min.js") %>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.11/index.global.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                height: 'auto',
                events: function (info, successCallback, failureCallback) {
                    fetch('Calendar.aspx/GetEvents', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: '{}'
                    })
                        .then(function (res) { return res.json(); })
                        .then(function (data) {
                            var events = JSON.parse(data.d);
                            successCallback(events);
                        })
                        .catch(function (err) { failureCallback(err); });
                }
            });

            calendar.render();
        });
    </script>
</body>
</html>