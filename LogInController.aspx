<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="LogInController.aspx.cs"
    Inherits="ProjectDemo.Controllers.LogInController" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <meta name="description" content="Smarthr - Bootstrap Admin Template" />
    <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects" />
    <meta name="author" content="Dreams technologies - Bootstrap Admin Template" />
    <meta name="robots" content="noindex, nofollow" />

    <title>SmartHR - Employees</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png" />

    <!-- Theme Script -->
    <script src="assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Feather CSS -->
    <link rel="stylesheet" href="assets/plugins/icons/feather/feather.css" />

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css" />

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css" />

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css" />
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />

    <!-- Color Picker CSS -->
    <link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css" />
    <link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css" />

    <!-- Daterangepicker CSS -->
    <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css" />

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap5.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />

    <style>

    html,
    body {
        height: 100%;
        margin: 0;
    }

    .login-wrapper {
        min-height: 100vh;
    }

    .login-left {
        min-height: 100vh;
        background-color: #f8f9fa;
    }

    .login-content {
        width: 100%;
        max-width: 520px;
        margin: auto;
    }

    .login-logo {
        max-width: 180px;
        height: auto;
    }

    .input-group .form-control {
        height: 45px;
    }

    .input-group-text {
        height: 45px;
        background-color: #fff;
    }

    .password-wrapper {
        position: relative;
    }

    .password-wrapper .form-control {
        height: 45px;
        padding-right: 45px;
    }

    .toggle-password {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        z-index: 5;
    }

    .google-btn {
        height: 45px;
    }

    .login-or {
        position: relative;
        text-align: center;
        margin: 25px 0;
    }

    .login-or::before {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        top: 50%;
        border-top: 1px solid #e5e5e5;
    }

    .span-or {
        position: relative;
        background: #fff;
        padding: 0 15px;
        color: #6c757d;
    }

    @media (max-width: 991px) {

        .login-content {
            max-width: 500px;
            padding: 30px !important;
        }

    }

    @media (max-width: 575px) {

        .login-content {
            padding: 20px !important;
        }

    }

</style>


</head>

<body>

    <form id="form1" runat="server">

        <div class="container-fluid p-0">
            <div class="row g-0 login-wrapper">

                <!-- LEFT SIDE -->
                <div class="col-lg-5 d-none d-lg-flex align-items-center justify-content-center login-left">

                    <div class="text-center p-5">

                        <img src="https://smarthr.dreamstechnologies.com/html/template/assets/img/bg/authentication-bg-03.svg"
                             alt="Login"
                             class="img-fluid"
                             style="max-width: 500px;" />

                    </div>

                </div>

                <!-- RIGHT SIDE -->
                <div class="col-lg-7 col-md-12 d-flex align-items-center justify-content-center">

                    <div class="login-content p-4">

                        <!-- LOGO -->
                        <div class="text-center mb-4">

                            <!-- Temporary logo -->
                            <img src="https://smarthr.dreamstechnologies.com/html/template/assets/img/logo.svg"
                                 alt="Pulse360 Logo"
                                 class="login-logo" />

                        </div>

                        <!-- TITLE -->
                        <div class="text-center mb-4">

                            <h2 class="fw-bold mb-2">
                                Sign In
                            </h2>

                            <p class="text-muted mb-0">
                                Please enter your details to sign in
                            </p>

                        </div>

                        <!-- EMAIL -->
                        <div class="mb-3">

                            <label class="form-label">
                                Email Address
                            </label>

                            <div class="input-group">

                                <asp:TextBox
                                    ID="TextBox1"
                                    runat="server"
                                    CssClass="form-control"
                                    placeholder="Enter Email ID">
                                </asp:TextBox>

                                <span class="input-group-text">
                                    <i class="fa-regular fa-envelope"></i>
                                </span>

                            </div>

                        </div>

                        <!-- PASSWORD -->
                        <div class="mb-3">

                            <label class="form-label">
                                Password
                            </label>

                            <div class="password-wrapper">

                                <asp:TextBox
                                    ID="TextBox2"
                                    runat="server"
                                    TextMode="Password"
                                    CssClass="form-control"
                                    placeholder="Enter Password">
                                </asp:TextBox>

                                <span class="toggle-password"
                                      onclick="togglePassword()">

                                    <i id="passwordIcon"
                                       class="fa-regular fa-eye-slash"></i>

                                </span>

                            </div>

                        </div>

                        <!-- REMEMBER / FORGOT -->
                        <div class="d-flex align-items-center justify-content-between mb-4">

                            <div class="form-check">

                                <asp:CheckBox
                                    ID="chkRemember"
                                    runat="server"
                                    CssClass="form-check-input" />

                                <label class="form-check-label"
                                       for="chkRemember">

                                    Remember Me

                                </label>

                            </div>

                            <div>

                                <a href="#"
                                   class="text-danger text-decoration-none">

                                    Forgot Password?

                                </a>

                            </div>

                        </div>

                        <!-- SIGN IN -->
                        <div class="mb-3">

                            <asp:Button
                                ID="btnSignIn"
                                runat="server"
                                Text="Sign In"
                                CssClass="btn btn-primary w-100" OnClick="btnSignIn_Click1"
                                 />

                        </div>

                        <!-- OR -->
                        <div class="login-or">

                            <span class="span-or">
                                Or
                            </span>

                        </div>

                        <!-- GOOGLE -->
                        <div class="mt-2">

                            <asp:Button
                                ID="btnGoogleLogin"
                                runat="server"
                                Text="Sign in with Google"
                                CssClass="btn btn-outline-secondary google-btn w-100"
                                 />

                        </div>

                        <!-- FOOTER -->
                        <div class="text-center mt-5">

                            <p class="text-muted mb-0">
                                Copyright &copy; 2025 - Pulse360
                            </p>

                        </div>

                    </div>

                </div>

            </div>
        </div>


                <!-- jQuery -->
        <script src="assets/js/jquery-3.7.1.min.js"></script>

        <!-- Bootstrap -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!-- Feather -->
        <script src="assets/js/feather.min.js"></script>

        <!-- Slimscroll -->
        <script src="assets/js/jquery.slimscroll.min.js"></script>

        <!-- Color Picker -->
        <script src="assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

        <!-- DataTable -->
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap5.min.js"></script>

        <!-- Moment -->
        <script src="assets/js/moment.js"></script>

        <!-- Date Range Picker -->
        <script src="assets/plugins/daterangepicker/daterangepicker.js"></script>

        <!-- DateTime Picker -->
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Select2 -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Apex Chart -->
        <script src="assets/plugins/apexchart/apexcharts.min.js"></script>
        <script src="assets/plugins/apexchart/chart-data.js"></script>

        <!-- Theme -->
        <script src="assets/js/theme-colorpicker.js"></script>
        <script src="assets/js/script.js"></script>




    </form>

    <!-- Bootstrap JS -->
    



</body>
</html>