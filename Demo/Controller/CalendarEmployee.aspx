<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalendarEmployee.aspx.cs" Inherits="Demo.Controller.CalendarEmployeePage" %>

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
    </form>

    <script src="<%= ResolveUrl("~/assets/js/jquery-3.7.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/bootstrap.bundle.min.js") %>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.11/index.global.min.js"></script>
    <script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        height: 'auto',
        events: function(info, successCallback, failureCallback) {
            fetch('CalendarEmployee.aspx/GetEvents', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: '{}'
            })
                .then(function(res) { return res.json(); })
                .then(function(data) {
                    var events = JSON.parse(data.d);
                    successCallback(events);
                })
                .catch(function(err) { failureCallback(err); });
        }
    });

    calendar.render();
        });
    </script>
</body>
</html>