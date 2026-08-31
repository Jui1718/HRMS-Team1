<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="ProjectDemo.UserDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />

    <meta name="description" content="SmartHR Employee Details" />
    <meta name="keywords" content="employee, details, HR, admin, bootstrap" />
    <meta name="author" content="Project Demo" />

    <title>Employee Details</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />

    <!-- Theme Script -->
    <script src="assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Feather CSS -->
    <link rel="stylesheet" href="assets/plugins/icons/feather/feather.css" />

    <!-- Tabler CSS -->
    <link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css" />

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css" />
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />

</head>

<body>

<form id="form1" runat="server">

    <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Page Wrapper -->
        <div class="page-wrapper">

            <div class="content">

                <!-- ===================================================== -->
                <!-- BREADCRUMB -->
                <!-- ===================================================== -->

                <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                    <div class="my-auto mb-2">

                        <h6 class="fw-medium d-inline-flex align-items-center mb-0">
                            Employee Details
                        </h6>

                    </div>

                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                        <div class="head-icons ms-2">

                            <a href="javascript:void(0);"
                               data-bs-toggle="tooltip"
                               data-bs-placement="top"
                               title="Collapse">

                                <i class="ti ti-chevrons-up"></i>

                            </a>

                        </div>

                    </div>

                </div>

                <!-- ===================================================== -->
                <!-- MAIN ROW -->
                <!-- ===================================================== -->

                <div class="row">

                    <!-- ================================================= -->
                    <!-- EMPLOYEE PROFILE -->
                    <!-- ================================================= -->

                    <div class="col-xl-4">

                        <div class="card card-bg-1">

                            <div class="card-body p-0">

                                <!-- Profile Image -->

                                <span class="avatar avatar-xl avatar-rounded border border-2 border-white m-auto d-flex mb-2">

                                    <img src="assets/img/profiles/avatar-01.jpg"
                                         class="w-auto h-auto"
                                         alt="Employee Image" />

                                </span>


                                <!-- Employee Summary -->

                                <div class="text-center px-3 pb-3 border-bottom">

                                    <div class="mb-3">

                                        <h5 class="d-flex align-items-center justify-content-center mb-1">

                                            John Smith

                                            <i class="ti ti-discount-check-filled text-success ms-1"></i>

                                        </h5>

                                        <span class="badge badge-soft-dark fw-medium">

                                            <i class="ti ti-point-filled me-1"></i>

                                            Senior Software Developer

                                        </span>

                                    </div>


                                    <!-- Employee Information -->

                                    <div>

                                        <div class="d-flex align-items-center justify-content-between mb-2">

                                            <span class="d-inline-flex align-items-center">

                                                <i class="ti ti-id me-2"></i>

                                                Employee ID

                                            </span>

                                            <p class="text-dark mb-0">
                                                EMP-1001
                                            </p>

                                        </div>


                                        <div class="d-flex align-items-center justify-content-between mb-2">

                                            <span class="d-inline-flex align-items-center">

                                                <i class="ti ti-star me-2"></i>

                                                Department

                                            </span>

                                            <p class="text-dark mb-0">
                                                Information Technology
                                            </p>

                                        </div>


                                        <div class="d-flex align-items-center justify-content-between mb-2">

                                            <span class="d-inline-flex align-items-center">

                                                <i class="ti ti-calendar-check me-2"></i>

                                                Date Of Join

                                            </span>

                                            <p class="text-dark mb-0">
                                                15/06/2021
                                            </p>

                                        </div>


                                        <div class="d-flex align-items-center justify-content-between">

                                            <span class="d-inline-flex align-items-center">

                                                <i class="ti ti-user-check me-2"></i>

                                                Reporting Manager

                                            </span>

                                            <p class="text-gray-9 mb-0">
                                                Robert Johnson
                                            </p>

                                        </div>


                                        <div class="row gx-2 mt-3">

                                            <div class="col-12">

                                                <a href="#"
                                                   class="btn btn-dark w-100"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#edit_employee">

                                                    <i class="ti ti-edit me-1"></i>

                                                    Edit Info

                                                </a>

                                            </div>

                                        </div>

                                    </div>

                                </div>


                                <!-- ================================================= -->
                                <!-- BASIC INFORMATION -->
                                <!-- ================================================= -->

                                <div class="p-3">

                                    <div class="d-flex align-items-center justify-content-between mb-3">

                                        <h6>
                                            Basic Information
                                        </h6>

                                        <a href="#"
                                           class="btn btn-icon btn-sm"
                                           data-bs-toggle="modal"
                                           data-bs-target="#edit_employee">

                                            <i class="ti ti-edit"></i>

                                        </a>

                                    </div>


                                    <!-- Phone -->

                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-phone me-2"></i>

                                            Phone

                                        </span>

                                        <p class="text-dark mb-0">
                                            +91 98765 43210
                                        </p>

                                    </div>


                                    <!-- Email -->

                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-mail-check me-2"></i>

                                            Email

                                        </span>

                                        <span class="text-info d-inline-flex align-items-center">

                                            john.smith@example.com

                                        </span>

                                    </div>


                                    <!-- Gender -->

                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-gender-male me-2"></i>

                                            Gender

                                        </span>

                                        <p class="text-dark text-end mb-0">
                                            Male
                                        </p>

                                    </div>


                                    <!-- Birthday -->

                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-cake me-2"></i>

                                            Birthday

                                        </span>

                                        <p class="text-dark text-end mb-0">
                                            12/04/1995
                                        </p>

                                    </div>


                                    <!-- Address -->

                                    <div class="d-flex align-items-center justify-content-between">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-map-pin-check me-2"></i>

                                            Address

                                        </span>

                                        <p class="text-dark text-end mb-0">
                                            Mumbai, Maharashtra
                                        </p>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- EMPLOYEE DETAILS -->
                    <!-- ================================================= -->

                    <div class="col-xl-8">

                        <div class="tab-content custom-accordion-items">

                            <div class="tab-pane active show">

                                <div class="accordion accordions-items-seperate"
                                     id="accordionExample">


                                    <!-- ========================================= -->
                                    <!-- ABOUT EMPLOYEE -->
                                    <!-- ========================================= -->

                                    <div class="accordion-item">

                                        <div class="accordion-header"
                                             id="headingOne">

                                            <div class="accordion-button">

                                                <div class="d-flex align-items-center flex-fill">

                                                    <h5>
                                                        About Employee
                                                    </h5>

                                                    <a href="#"
                                                       class="btn btn-sm btn-icon ms-auto"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#edit_employee">

                                                        <i class="ti ti-edit"></i>

                                                    </a>

                                                    <a href="#"
                                                       class="d-flex align-items-center collapsed collapse-arrow"
                                                       data-bs-toggle="collapse"
                                                       data-bs-target="#primaryBorderOne"
                                                       aria-expanded="true">

                                                        <i class="ti ti-chevron-down fs-18"></i>

                                                    </a>

                                                </div>

                                            </div>

                                        </div>


                                        <div id="primaryBorderOne"
                                             class="accordion-collapse collapse show border-top"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body mt-2">

                                                <p class="mb-0">

                                                    John Smith is a Senior Software Developer
                                                    with over 5 years of experience in designing,
                                                    developing and maintaining enterprise web
                                                    applications. He specializes in ASP.NET,
                                                    C#, SQL Server, JavaScript and Bootstrap.

                                                    He is responsible for developing scalable
                                                    applications, reviewing code, solving
                                                    technical issues and mentoring junior
                                                    developers.

                                                </p>

                                            </div>

                                        </div>

                                    </div>


                                    <!-- ========================================= -->
                                    <!-- BANK INFORMATION -->
                                    <!-- ========================================= -->

                                    <div class="accordion-item">

                                        <div class="accordion-header"
                                             id="headingTwo">

                                            <div class="accordion-button">

                                                <div class="d-flex align-items-center justify-content-between flex-fill">

                                                    <h5>
                                                        Bank Information
                                                    </h5>

                                                    <div class="d-flex align-items-center">

                                                        <a href="#"
                                                           class="btn btn-icon btn-sm"
                                                           data-bs-toggle="modal"
                                                           data-bs-target="#editBankModal">

                                                            <i class="ti ti-edit"></i>

                                                        </a>

                                                        <a href="#"
                                                           class="d-flex align-items-center collapsed collapse-arrow ms-2"
                                                           data-bs-toggle="collapse"
                                                           data-bs-target="#primaryBorderTwo"
                                                           aria-expanded="false">

                                                            <i class="ti ti-chevron-down fs-18"></i>

                                                        </a>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>


                                        <div id="primaryBorderTwo"
                                             class="accordion-collapse collapse border-top"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body">

                                                <div class="row">

                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Bank Name
                                                        </span>

                                                        <h6 class="fw-medium mt-1">
                                                            HDFC Bank
                                                        </h6>

                                                    </div>


                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Bank Account No
                                                        </span>

                                                        <h6 class="fw-medium mt-1">
                                                            501234567890
                                                        </h6>

                                                    </div>


                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            IFSC Code
                                                        </span>

                                                        <h6 class="fw-medium mt-1">
                                                            HDFC0001234
                                                        </h6>

                                                    </div>


                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Branch
                                                        </span>

                                                        <h6 class="fw-medium mt-1">
                                                            Andheri West
                                                        </h6>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>


                                    <!-- ========================================= -->
                                    <!-- FAMILY INFORMATION -->
                                    <!-- ========================================= -->

                                    <div class="accordion-item">

                                        <div class="accordion-header"
                                             id="headingThree">

                                            <div class="accordion-button">

                                                <div class="d-flex align-items-center justify-content-between flex-fill">

                                                    <h5>
                                                        Family Information
                                                    </h5>

                                                    <div class="d-flex align-items-center">

                                                        <a href="#"
                                                           class="btn btn-icon btn-sm"
                                                           data-bs-toggle="modal"
                                                           data-bs-target="#familyDetailsModal">

                                                            <i class="ti ti-plus"></i>

                                                        </a>

                                                        <a href="#"
                                                           class="btn btn-icon btn-sm"
                                                           data-bs-toggle="modal"
                                                           data-bs-target="#familyDetailsModal">

                                                            <i class="ti ti-edit"></i>

                                                        </a>

                                                        <a href="#"
                                                           class="d-flex align-items-center collapsed collapse-arrow ms-2"
                                                           data-bs-toggle="collapse"
                                                           data-bs-target="#primaryBorderThree"
                                                           aria-expanded="false">

                                                            <i class="ti ti-chevron-down fs-18"></i>

                                                        </a>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>


                                        <div id="primaryBorderThree"
                                             class="accordion-collapse collapse border-top"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body">

                                                <div class="row">

                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Family ID
                                                        </span>

                                                        <h6 class="mt-1">
                                                            FAM-001
                                                        </h6>

                                                    </div>


                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Name
                                                        </span>

                                                        <h6 class="mt-1">
                                                            Sarah Smith
                                                        </h6>

                                                    </div>


                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Relationship
                                                        </span>

                                                        <h6 class="mt-1">
                                                            Wife
                                                        </h6>

                                                    </div>


                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Date Of Birth
                                                        </span>

                                                        <h6 class="mt-1">
                                                            18/08/1997
                                                        </h6>

                                                    </div>


                                                    <div class="col-md-3 mb-3">

                                                        <span>
                                                            Phone
                                                        </span>

                                                        <h6 class="mt-1">
                                                            +91 98765 12345
                                                        </h6>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>


                                    <!-- ========================================= -->
                                    <!-- EDUCATION AND EXPERIENCE -->
                                    <!-- ========================================= -->

                                    <div class="row">


                                        <!-- ===================================== -->
                                        <!-- EDUCATION -->
                                        <!-- ===================================== -->

                                        <div class="col-md-6">

                                            <div class="accordion-item">

                                                <div class="accordion-header"
                                                     id="headingFour">

                                                    <div class="accordion-button">

                                                        <div class="d-flex align-items-center justify-content-between flex-fill">

                                                            <h5>
                                                                Education Details
                                                            </h5>

                                                            <div class="d-flex align-items-center">

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#educationDetailsModal">

                                                                    <i class="ti ti-plus"></i>

                                                                </a>

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#educationDetailsModal">

                                                                    <i class="ti ti-edit"></i>

                                                                </a>

                                                                <a href="#"
                                                                   class="d-flex align-items-center collapsed collapse-arrow ms-2"
                                                                   data-bs-toggle="collapse"
                                                                   data-bs-target="#primaryBorderFour"
                                                                   aria-expanded="false">

                                                                    <i class="ti ti-chevron-down fs-18"></i>

                                                                </a>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>


                                                <div id="primaryBorderFour"
                                                     class="accordion-collapse collapse border-top"
                                                     data-bs-parent="#accordionExample">

                                                    <div class="accordion-body">


                                                        <div class="mb-3">

                                                            <div class="d-flex align-items-center justify-content-between">

                                                                <div>

                                                                    <span class="fw-normal">
                                                                        EDU-001 - University of Mumbai
                                                                    </span>

                                                                    <h6 class="mt-1">
                                                                        Bachelor of Engineering - Computer Science
                                                                    </h6>

                                                                </div>

                                                                <p class="text-dark mb-0">
                                                                    2013 - 2017
                                                                </p>

                                                            </div>

                                                        </div>


                                                        <div class="mb-3">

                                                            <div class="d-flex align-items-center justify-content-between">

                                                                <div>

                                                                    <span class="fw-normal">
                                                                        EDU-002 - Mumbai University
                                                                    </span>

                                                                    <h6 class="mt-1">
                                                                        Master of Computer Applications
                                                                    </h6>

                                                                </div>

                                                                <p class="text-dark mb-0">
                                                                    2017 - 2019
                                                                </p>

                                                            </div>

                                                        </div>


                                                    </div>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- ===================================== -->
                                        <!-- EXPERIENCE -->
                                        <!-- ===================================== -->

                                        <div class="col-md-6">

                                            <div class="accordion-item">

                                                <div class="accordion-header"
                                                     id="headingFive">

                                                    <div class="accordion-button">

                                                        <div class="d-flex align-items-center justify-content-between flex-fill">

                                                            <h5>
                                                                Experience
                                                            </h5>

                                                            <div class="d-flex align-items-center">

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#experienceDetailsModal">

                                                                    <i class="ti ti-plus"></i>

                                                                </a>

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#experienceDetailsModal">

                                                                    <i class="ti ti-edit"></i>

                                                                </a>

                                                                <a href="#"
                                                                   class="d-flex align-items-center collapsed collapse-arrow ms-2"
                                                                   data-bs-toggle="collapse"
                                                                   data-bs-target="#primaryBorderFive"
                                                                   aria-expanded="false">

                                                                    <i class="ti ti-chevron-down fs-18"></i>

                                                                </a>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>


                                                <div id="primaryBorderFive"
                                                     class="accordion-collapse collapse border-top"
                                                     data-bs-parent="#accordionExample">

                                                    <div class="accordion-body">


                                                        <div class="mb-3">

                                                            <div class="d-flex align-items-center justify-content-between">

                                                                <div>

                                                                    <h6 class="fw-medium">
                                                                        1. ABC Technologies Pvt Ltd
                                                                    </h6>

                                                                    <span class="d-flex align-items-center badge bg-secondary-transparent mt-1">

                                                                        <i class="ti ti-point-filled me-1"></i>

                                                                        Software Developer

                                                                    </span>

                                                                </div>

                                                                <p class="text-dark mb-0">
                                                                    2019 - 2021
                                                                </p>

                                                            </div>

                                                        </div>


                                                        <div class="mb-3">

                                                            <div class="d-flex align-items-center justify-content-between">

                                                                <div>

                                                                    <h6 class="fw-medium">
                                                                        2. XYZ Solutions Pvt Ltd
                                                                    </h6>

                                                                    <span class="d-flex align-items-center badge bg-secondary-transparent mt-1">

                                                                        <i class="ti ti-point-filled me-1"></i>

                                                                        Senior Software Developer

                                                                    </span>

                                                                </div>

                                                                <p class="text-dark mb-0">
                                                                    2021 - Present
                                                                </p>

                                                            </div>

                                                        </div>


                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>


                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- ========================================================= -->
            <!-- FOOTER -->
            <!-- ========================================================= -->

            <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

                <p class="mb-0">
                    2026 &copy; Project Demo
                </p>

                <p class="mb-0">

                    Designed &amp; Developed By

                    <a href="#" class="text-primary">
                        Project Demo
                    </a>

                </p>

            </div>

        </div>


        <!-- ============================================================= -->
        <!-- EDIT EMPLOYEE MODAL -->
        <!-- ============================================================= -->

        <div class="modal fade"
             id="edit_employee"
             tabindex="-1"
             aria-hidden="true">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">


                    <div class="modal-header">

                        <h4 class="modal-title">
                            Edit Employee
                        </h4>

                        <button type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                        </button>

                    </div>


                    <div class="modal-body">

                        <div class="row">


                            <!-- Profile -->

                            <div class="col-md-12">

                                <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">

                                    <div class="avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0">

                                        <img src="assets/img/profiles/avatar-01.jpg"
                                             alt="Employee Image"
                                             class="rounded-circle" />

                                    </div>


                                    <div class="profile-upload">

                                        <div class="mb-2">

                                            <h6 class="mb-1">
                                                Upload Profile Image
                                            </h6>

                                            <p class="fs-12 mb-0">
                                                Image should be below 4 MB
                                            </p>

                                        </div>


                                        <div class="profile-uploader">

                                            <label class="btn btn-sm btn-primary">

                                                Upload

                                                <input type="file"
                                                       class="form-control d-none"
                                                       accept="image/*" />

                                            </label>

                                        </div>

                                    </div>

                                </div>

                            </div>


                            <!-- First Name -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        First Name
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value="John" />

                                </div>

                            </div>


                            <!-- Last Name -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Last Name
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value="Smith" />

                                </div>

                            </div>


                            <!-- DOB -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Date of Birth
                                    </label>

                                    <input type="date"
                                           class="form-control"
                                           value="1995-04-12" />

                                </div>

                            </div>


                            <!-- Email -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Email
                                    </label>

                                    <input type="email"
                                           class="form-control"
                                           value="john.smith@example.com" />

                                </div>

                            </div>


                            <!-- Phone -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Phone Number
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value="+91 98765 43210" />

                                </div>

                            </div>


                            <!-- Address -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Address
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value="Mumbai, Maharashtra" />

                                </div>

                            </div>


                            <!-- About -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        About
                                    </label>

                                    <textarea class="form-control"
                                              rows="4">Senior Software Developer with experience in ASP.NET, C#, SQL Server and JavaScript.</textarea>

                                </div>

                            </div>


                        </div>

                    </div>


                    <div class="modal-footer">

                        <button type="button"
                                class="btn btn-outline-light border"
                                data-bs-dismiss="modal">

                            Cancel

                        </button>

                        <button type="button"
                                class="btn btn-primary">

                            Save Changes

                        </button>

                    </div>


                </div>

            </div>

        </div>


        <!-- ============================================================= -->
        <!-- BANK MODAL -->
        <!-- ============================================================= -->

        <div class="modal fade"
             id="editBankModal"
             tabindex="-1"
             aria-hidden="true">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">


                    <div class="modal-header">

                        <h4 class="modal-title">
                            Bank Details
                        </h4>

                        <button type="button"
                                class="btn-close"
                                data-bs-dismiss="modal">
                        </button>

                    </div>


                    <div class="modal-body">

                        <div class="row">


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Bank Name
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="HDFC Bank" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Bank Account No
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="501234567890" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    IFSC Code
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="HDFC0001234" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Branch
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="Andheri West" />

                            </div>


                        </div>

                    </div>


                    <div class="modal-footer">

                        <button type="button"
                                class="btn btn-light border"
                                data-bs-dismiss="modal">

                            Cancel

                        </button>

                        <button type="button"
                                class="btn btn-primary">

                            Save

                        </button>

                    </div>


                </div>

            </div>

        </div>


        <!-- ============================================================= -->
        <!-- FAMILY MODAL -->
        <!-- ============================================================= -->

        <div class="modal fade"
             id="familyDetailsModal"
             tabindex="-1"
             aria-hidden="true">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">


                    <div class="modal-header">

                        <h4 class="modal-title">
                            Family Information
                        </h4>

                        <button type="button"
                                class="btn-close"
                                data-bs-dismiss="modal">
                        </button>

                    </div>


                    <div class="modal-body">

                        <div class="row">


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Name
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="Sarah Smith" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Relationship
                                </label>

                                <select class="form-select">

                                    <option>Wife</option>
                                    <option>Husband</option>
                                    <option>Father</option>
                                    <option>Mother</option>
                                    <option>Brother</option>
                                    <option>Sister</option>
                                    <option>Son</option>
                                    <option>Daughter</option>

                                </select>

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Date Of Birth
                                </label>

                                <input type="date"
                                       class="form-control"
                                       value="1997-08-18" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Phone
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="+91 98765 12345" />

                            </div>


                        </div>

                    </div>


                    <div class="modal-footer">

                        <button type="button"
                                class="btn btn-light border"
                                data-bs-dismiss="modal">

                            Cancel

                        </button>

                        <button type="button"
                                class="btn btn-primary">

                            Save

                        </button>

                    </div>


                </div>

            </div>

        </div>


        <!-- ============================================================= -->
        <!-- EDUCATION MODAL -->
        <!-- ============================================================= -->

        <div class="modal fade"
             id="educationDetailsModal"
             tabindex="-1"
             aria-hidden="true">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">


                    <div class="modal-header">

                        <h4 class="modal-title">
                            Education Details
                        </h4>

                        <button type="button"
                                class="btn-close"
                                data-bs-dismiss="modal">
                        </button>

                    </div>


                    <div class="modal-body">

                        <div class="row">


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    University / Institute
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="University of Mumbai" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Education Type
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="Bachelor of Engineering - Computer Science" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Start Date
                                </label>

                                <input type="date"
                                       class="form-control"
                                       value="2013-06-01" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    End Date
                                </label>

                                <input type="date"
                                       class="form-control"
                                       value="2017-05-31" />

                            </div>


                        </div>

                    </div>


                    <div class="modal-footer">

                        <button type="button"
                                class="btn btn-light border"
                                data-bs-dismiss="modal">

                            Cancel

                        </button>

                        <button type="button"
                                class="btn btn-primary">

                            Save

                        </button>

                    </div>


                </div>

            </div>

        </div>


        <!-- ============================================================= -->
        <!-- EXPERIENCE MODAL -->
        <!-- ============================================================= -->

        <div class="modal fade"
             id="experienceDetailsModal"
             tabindex="-1"
             aria-hidden="true">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">


                    <div class="modal-header">

                        <h4 class="modal-title">
                            Experience Details
                        </h4>

                        <button type="button"
                                class="btn-close"
                                data-bs-dismiss="modal">
                        </button>

                    </div>


                    <div class="modal-body">

                        <div class="row">


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Company Name
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="XYZ Solutions Pvt Ltd" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Designation
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="Senior Software Developer" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    From Date
                                </label>

                                <input type="date"
                                       class="form-control"
                                       value="2021-06-01" />

                            </div>


                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    To Date
                                </label>

                                <input type="date"
                                       class="form-control" />

                            </div>


                            <div class="col-md-12">

                                <div class="form-check">

                                    <input class="form-check-input"
                                           type="checkbox"
                                           id="currentlyWorking" />

                                    <label class="form-check-label"
                                           for="currentlyWorking">

                                        Currently Working

                                    </label>

                                </div>

                            </div>


                        </div>

                    </div>


                    <div class="modal-footer">

                        <button type="button"
                                class="btn btn-light border"
                                data-bs-dismiss="modal">

                            Cancel

                        </button>

                        <button type="button"
                                class="btn btn-primary">

                            Save

                        </button>

                    </div>


                </div>

            </div>

        </div>


    </div>


    <!-- ============================================================= -->
    <!-- JAVASCRIPT -->
    <!-- ============================================================= -->

    <script src="assets/js/jquery-3.7.1.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/feather.min.js"></script>

    <script src="assets/js/jquery.slimscroll.min.js"></script>

    <script src="assets/js/script.js"></script>

</form>

</body>

</html>
