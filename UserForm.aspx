<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="ProjectDemo.UserForm" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <meta name="description" content="Smarthr - Bootstrap Admin Template" />
    <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects" />
    <meta name="author" content="Dreams technologies - Bootstrap Admin Template" />
    <meta name="robots" content="noindex, nofollow" />
    <title>Smarthr Admin Template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png" />

    <!-- Theme Script js -->
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

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css" />
    <link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css" />

    <!-- Daterangepikcer CSS -->
    <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css" />

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap5.min.css" />

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />
</head>

<body>


    <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Page Wrapper -->
        <div class="page-wrapper">
            <div class="content">

                <!-- Breadcrumb -->
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
                               data-bs-original-title="Collapse"
                               id="collapse-header">
                                <i class="ti ti-chevrons-up"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->


                <div class="row">

                    <!-- Employee Profile -->
                    <div class="col-xl-4">
                        <div class="card card-bg-1">
                            <div class="card-body p-0">

                                <!-- Profile Image -->
                                <span class="avatar avatar-xl avatar-rounded border border-2 border-white m-auto d-flex mb-2">
                                    <img src="/@ViewBag.Path"
                                         class="w-auto h-auto"
                                         alt="Employee Image">
                                </span>

                                <!-- Employee Summary -->
                                <div class="text-center px-3 pb-3 border-bottom">
                                    <div class="mb-3">
                                        <h5 class="d-flex align-items-center justify-content-center mb-1">
                                            @ViewBag.FirstName @ViewBag.LastName
                                            <i class="ti ti-discount-check-filled text-success ms-1"></i>
                                        </h5>

                                        <span class="badge badge-soft-dark fw-medium">
                                            <i class="ti ti-point-filled me-1"></i>
                                            @ViewBag.Designation
                                        </span>
                                    </div>

                                    <div>

                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <span class="d-inline-flex align-items-center">
                                                <i class="ti ti-id me-2"></i>
                                                Client ID
                                            </span>
                                            <p class="text-dark mb-0">@ViewBag.UserId</p>
                                        </div>

                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <span class="d-inline-flex align-items-center">
                                                <i class="ti ti-star me-2"></i>
                                                Department
                                            </span>
                                            <p class="text-dark mb-0">@ViewBag.Department</p>
                                        </div>

                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <span class="d-inline-flex align-items-center">
                                                <i class="ti ti-calendar-check me-2"></i>
                                                Date Of Join
                                            </span>
                                            <p class="text-dark mb-0">
                                                @ViewBag.DOJ.ToShortDateString()
                                            </p>
                                        </div>

                                        <div class="d-flex align-items-center justify-content-between">
                                            <span class="d-inline-flex align-items-center">
                                                <i class="ti ti-calendar-check me-2"></i>
                                                Report Office
                                            </span>

                                            <p class="text-gray-9 mb-0">
                                                @ViewBag.ReportManager
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

                                <!-- Basic Information -->
                                <div class="p-3">

                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <h6>Basic Information</h6>

                                        <a href="javascript:void(0);"
                                           class="btn btn-icon btn-sm"
                                           data-bs-toggle="modal"
                                           data-bs-target="#edit_employee">
                                            <i class="ti ti-edit"></i>
                                        </a>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <span class="d-inline-flex align-items-center">
                                            <i class="ti ti-phone me-2"></i>
                                            Phone
                                        </span>
                                        <p class="text-dark mb-0">@ViewBag.PhoneNumber</p>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <span class="d-inline-flex align-items-center">
                                            <i class="ti ti-mail-check me-2"></i>
                                            Email
                                        </span>

                                        <span class="text-info d-inline-flex align-items-center">
                                            @ViewBag.Email
                                            <i class="ti ti-copy text-dark ms-2"></i>
                                        </span>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <span class="d-inline-flex align-items-center">
                                            <i class="ti ti-gender-male me-2"></i>
                                            Gender
                                        </span>

                                        <p class="text-dark text-end mb-0">
                                            @ViewBag.Gender
                                        </p>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <span class="d-inline-flex align-items-center">
                                            <i class="ti ti-cake me-2"></i>
                                            Birthday
                                        </span>

                                        <p class="text-dark text-end mb-0">
                                            @ViewBag.DOB.ToShortDateString()
                                        </p>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="d-inline-flex align-items-center">
                                            <i class="ti ti-map-pin-check me-2"></i>
                                            Address
                                        </span>

                                        <p class="text-dark text-end mb-0">
                                            @ViewBag.Add
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Employee Profile -->


                    <!-- Employee Details -->
                    <div class="col-xl-8">
                        <div class="tab-content custom-accordion-items">
                            <div class="tab-pane active show">

                                <div class="accordion accordions-items-seperate" id="accordionExample">

                                    <!-- About Employee -->
                                    <div class="accordion-item">
                                        <div class="accordion-header" id="headingOne">
                                            <div class="accordion-button">
                                                <div class="d-flex align-items-center flex-fill">
                                                    <h5>About Employee</h5>

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
                                                       aria-expanded="true"
                                                       aria-controls="primaryBorderOne">
                                                        <i class="ti ti-chevron-down fs-18"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="primaryBorderOne"
                                             class="accordion-collapse collapse show border-top"
                                             aria-labelledby="headingOne"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body mt-2">
                                                @ViewBag.About
                                            </div>

                                        </div>
                                    </div>
                                    <!-- /About Employee -->


                                    <!-- Bank Information -->
                                    <div class="accordion-item">

                                        <div class="accordion-header" id="headingTwo">
                                            <div class="accordion-button">
                                                <div class="d-flex align-items-center flex-fill">

                                                    <h5>Bank Information</h5>

                                                    <button type="button"
                                                            class="btn btn-sm btn-icon ms-auto"
                                                            id="editBankDetails"
                                                            value="@ViewBag.UserId">
                                                        <i class="ti ti-edit"></i>
                                                    </button>

                                                    <a href="#"
                                                       class="btn btn-icon btn-sm"
                                                       id="addBankDetails">
                                                        <i class="ti ti-plus"></i>
                                                    </a>

                                                    <a href="#"
                                                       class="d-flex align-items-center collapsed collapse-arrow"
                                                       data-bs-toggle="collapse"
                                                       data-bs-target="#primaryBorderTwo"
                                                       aria-expanded="false"
                                                       aria-controls="primaryBorderTwo">
                                                        <i class="ti ti-chevron-down fs-18"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>

                                        <div id="primaryBorderTwo"
                                             class="accordion-collapse collapse border-top"
                                             aria-labelledby="headingTwo"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body">

                                                <div class="row">

                                                    @if (ViewBag.BankDetails != null)
                                                    {
                                                        foreach (var bank in ViewBag.BankDetails)
                                                        {
                                                            <div class="col-md-3 mb-3">
                                                                <span class="d-inline-flex align-items-center">
                                                                    Bank Id
                                                                </span>
                                                                <h6 class="mt-1">
                                                                    @bank.BankDetailId
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span class="d-inline-flex align-items-center">
                                                                    Bank Name
                                                                </span>
                                                                <h6 class="mt-1">
                                                                    @bank.BankName
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span class="d-inline-flex align-items-center">
                                                                    Bank Account No
                                                                </span>
                                                                <h6 class="mt-1">
                                                                    @bank.AccountNumber
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span class="d-inline-flex align-items-center">
                                                                    IFSC Code
                                                                </span>
                                                                <h6 class="mt-1">
                                                                    @bank.IFSCCode
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span class="d-inline-flex align-items-center">
                                                                    Branch
                                                                </span>
                                                                <h6 class="mt-1">
                                                                    @bank.BranchName
                                                                </h6>
                                                            </div>
                                                        }
                                                    }

                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <!-- /Bank Information -->


                                    <!-- Family Information -->
                                    <div class="accordion-item">

                                        <div class="accordion-header" id="headingThree">
                                            <div class="accordion-button">

                                                <div class="d-flex align-items-center justify-content-between flex-fill">

                                                    <h5>Family Information</h5>

                                                    <div class="d-flex">

                                                        <a href="#"
                                                           class="btn btn-icon btn-sm"
                                                           id="addFamilyDetails">
                                                            <i class="ti ti-plus"></i>
                                                        </a>

                                                        <button type="button"
                                                                class="btn btn-sm"
                                                                id="editFamilyDetails"
                                                                value="@ViewBag.UserId">
                                                            <i class="ti ti-edit"></i>
                                                        </button>

                                                        <a href="#"
                                                           class="d-flex align-items-center collapsed collapse-arrow"
                                                           data-bs-toggle="collapse"
                                                           data-bs-target="#primaryBorderThree"
                                                           aria-expanded="false"
                                                           aria-controls="primaryBorderThree">
                                                            <i class="ti ti-chevron-down fs-18"></i>
                                                        </a>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>

                                        <div id="primaryBorderThree"
                                             class="accordion-collapse collapse border-top"
                                             aria-labelledby="headingThree"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body">

                                                <div class="row">

                                                    @if (ViewBag.FamilyDetails != null)
                                                    {
                                                        foreach (var family in ViewBag.FamilyDetails)
                                                        {
                                                            <div class="col-md-3 mb-3">
                                                                <span>Family Id</span>
                                                                <h6 class="mt-1">
                                                                    @family.FamilyDetailId
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span>Name</span>
                                                                <h6 class="mt-1">
                                                                    @family.Name
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span>Relationship</span>
                                                                <h6 class="mt-1">
                                                                    @family.Relation
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span>Date Of Birth</span>
                                                                <h6 class="mt-1">
                                                                    @family.DateOfBirth.ToShortDateString()
                                                                </h6>
                                                            </div>

                                                            <div class="col-md-3 mb-3">
                                                                <span>Phone</span>
                                                                <h6 class="mt-1">
                                                                    @family.phone
                                                                </h6>
                                                            </div>
                                                        }
                                                    }

                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <!-- /Family Information -->


                                    <!-- Education & Experience -->
                                    <div class="row">

                                        <!-- Education -->
                                        <div class="col-md-6">
                                            <div class="accordion-item">

                                                <div class="accordion-header" id="headingFour">
                                                    <div class="accordion-button">

                                                        <div class="d-flex align-items-center justify-content-between flex-fill">

                                                            <h5>Education Details</h5>

                                                            <div class="d-flex">

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   id="addEducationDetails">
                                                                    <i class="ti ti-plus"></i>
                                                                </a>

                                                                <button type="button"
                                                                        class="btn btn-sm"
                                                                        id="editEducationDetails"
                                                                        value="@ViewBag.UserId">
                                                                    <i class="ti ti-edit"></i>
                                                                </button>

                                                                <a href="#"
                                                                   class="d-flex align-items-center collapsed collapse-arrow"
                                                                   data-bs-toggle="collapse"
                                                                   data-bs-target="#primaryBorderFour"
                                                                   aria-expanded="false"
                                                                   aria-controls="primaryBorderFour">
                                                                    <i class="ti ti-chevron-down fs-18"></i>
                                                                </a>

                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>

                                                <div id="primaryBorderFour"
                                                     class="accordion-collapse collapse border-top"
                                                     aria-labelledby="headingFour"
                                                     data-bs-parent="#accordionExample">

                                                    <div class="accordion-body">

                                                        @if (ViewBag.EducationDetails != null)
                                                        {
                                                            foreach (var edu in ViewBag.EducationDetails)
                                                            {
                                                                <div class="mb-3">

                                                                    <div class="d-flex align-items-center justify-content-between">

                                                                        <div>
                                                                            <span class="d-inline-flex align-items-center fw-normal">
                                                                                @edu.EducationDetailsId - @edu.UniversityName
                                                                            </span>

                                                                            <h6 class="mt-1">
                                                                                @edu.EducationType
                                                                            </h6>
                                                                        </div>

                                                                        <p class="text-dark mb-0">
                                                                            @edu.startdate.ToShortDateString()
                                                                            -
                                                                            @edu.enddate.ToShortDateString()
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            }
                                                        }

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- /Education -->


                                        <!-- Experience -->
                                        <div class="col-md-6">
                                            <div class="accordion-item">

                                                <div class="accordion-header" id="headingFive">
                                                    <div class="accordion-button">

                                                        <div class="d-flex align-items-center justify-content-between flex-fill">

                                                            <h5>Experience</h5>

                                                            <div class="d-flex">

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   id="addExperienceDetails">
                                                                    <i class="ti ti-plus"></i>
                                                                </a>

                                                                <button type="button"
                                                                        class="btn btn-sm"
                                                                        id="editExperienceDetails"
                                                                        value="@ViewBag.UserId">
                                                                    <i class="ti ti-edit"></i>
                                                                </button>

                                                                <a href="#"
                                                                   class="d-flex align-items-center collapsed collapse-arrow"
                                                                   data-bs-toggle="collapse"
                                                                   data-bs-target="#primaryBorderFive"
                                                                   aria-expanded="false"
                                                                   aria-controls="primaryBorderFive">
                                                                    <i class="ti ti-chevron-down fs-18"></i>
                                                                </a>

                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>

                                                <div id="primaryBorderFive"
                                                     class="accordion-collapse collapse border-top"
                                                     aria-labelledby="headingFive"
                                                     data-bs-parent="#accordionExample">

                                                    <div class="accordion-body">

                                                        @if (ViewBag.ExperianceDetails != null)
                                                        {
                                                            foreach (var ex in ViewBag.ExperianceDetails)
                                                            {
                                                                <div class="mb-3">

                                                                    <div class="d-flex align-items-center justify-content-between">

                                                                        <div>

                                                                            <h6 class="d-inline-flex align-items-center fw-medium">
                                                                                @ex.ExperienceId. @ex.CompanyName
                                                                            </h6>

                                                                            <span class="d-flex align-items-center badge bg-secondary-transparent mt-1">
                                                                                <i class="ti ti-point-filled me-1"></i>
                                                                                @ex.DesignationName
                                                                            </span>

                                                                        </div>

                                                                        <p class="text-dark mb-0">
                                                                            @ex.FromDate.ToShortDateString()
                                                                            -
                                                                            @ex.ToDate.ToShortDateString()
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            }
                                                        }

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- /Experience -->

                                    </div>
                                    <!-- /Education & Experience -->

                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /Employee Details -->

                </div>
            </div>


            <!-- Footer -->
            <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
                <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
                <p class="mb-0">
                    Designed &amp; Developed By
                    <a href="#" class="text-primary">Dreams</a>
                </p>
            </div>
            <!-- /Footer -->

        </div>
        <!-- /Page Wrapper -->


        <!-- ========================================================= -->
        <!-- EDIT EMPLOYEE MODAL -->
        <!-- ========================================================= -->

        <div class="modal fade" id="edit_employee">
            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">
                        <h4 class="modal-title">Edit Employee</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>
                    </div>

                    <form id="editProfileForm" enctype="multipart/form-data">

                        <div class="contact-grids-tab">
                            <ul class="nav nav-underline" id="myTab2">
                                <li class="nav-item">
                                    <button class="nav-link active"
                                            type="button">
                                        Basic Information
                                    </button>
                                </li>
                            </ul>
                        </div>

                        <div class="modal-body pb-0">

                            <div class="row">

                                <!-- Profile Image -->
                                <div class="col-md-12">

                                    <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">

                                        <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
                                            <img src="/@ViewBag.Path"
                                                 alt="Employee Image"
                                                 class="rounded-circle">
                                        </div>

                                        <input type="hidden"
                                               id="editUserId"
                                               name="UserId"
                                               value="@ViewBag.UserId">

                                        <div class="profile-upload">

                                            <div class="mb-2">
                                                <h6 class="mb-1">Upload Profile Image</h6>
                                                <p class="fs-12 mb-0">Image should be below 4 MB</p>
                                            </div>

                                            <div class="profile-uploader d-flex align-items-center">

                                                <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                                    Upload

                                                    <input type="file"
                                                           class="form-control image-sign"
                                                           id="editProfilePicture"
                                                           name="ProfilePicture"
                                                           accept="image/*">
                                                </div>

                                                <a href="javascript:void(0);"
                                                   class="btn btn-light btn-sm">
                                                    Cancel
                                                </a>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                                <!-- /Profile Image -->


                                <!-- First Name -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">
                                            First Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               id="FirstName"
                                               name="FirstName"
                                               value="@ViewBag.FirstName">
                                    </div>
                                </div>


                                <!-- Last Name -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Last Name</label>

                                        <input type="text"
                                               class="form-control"
                                               id="editLastName"
                                               name="LastName"
                                               value="@ViewBag.LastName">
                                    </div>
                                </div>


                                <!-- Date Of Birth -->
                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Date of Birth
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   placeholder="dd/mm/yyyy"
                                                   id="editDOB"
                                                   name="DateOfBirth"
                                                   value="@ViewBag.DOB">

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>
                                    </div>
                                </div>


                                <!-- Email -->
                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Email
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="email"
                                               class="form-control"
                                               id="editEmail"
                                               name="Email"
                                               value="@ViewBag.Email">

                                    </div>
                                </div>


                                <!-- Phone -->
                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Phone Number
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               id="editPhoneNumber"
                                               name="PhoneNumber"
                                               value="@ViewBag.PhoneNumber">

                                    </div>
                                </div>


                                <!-- Address -->
                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Address
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               id="editAddress"
                                               name="Address"
                                               value="@ViewBag.Add">

                                    </div>
                                </div>


                                <!-- About -->
                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            About
                                            <span class="text-danger">*</span>
                                        </label>

                                        <textarea class="form-control"
                                                  rows="3"
                                                  id="editAboutEmployee"
                                                  name="AboutEmployee">@ViewBag.About</textarea>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-outline-light border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="button"
                                    class="btn btn-primary"
                                    id="saveEditProfile">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>
        </div>


        <!-- ========================================================= -->
        <!-- EDIT BANK DETAILS -->
        <!-- ========================================================= -->

        <div class="modal fade" id="editbankDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Bank Details</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="editBankDetailsForm">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       id="editBankUserId"
                                       value="@ViewBag.UserId">

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Bank Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="BankName"
                                               id="editBankName"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Bank Id
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="BankDetailId"
                                               id="editBankDetailId"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Bank Account No
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="AccountNumber"
                                               id="editAccountNumber"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            IFSC Code
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="IFSCCode"
                                               id="editCode"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Branch Address
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="BranchName"
                                               id="editBranchName"
                                               required>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    class="btn btn-primary"
                                    id="SaveBankDetails">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- ADD BANK DETAILS -->
        <!-- ========================================================= -->

        <div class="modal fade" id="addBankDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Bank Details</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="addBankDetailsForm">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       value="@ViewBag.UserId">

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Bank Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="BankName"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Bank Account No
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="AccountNumber"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            IFSC Code
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="IFSCCode"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Branch Address
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="BranchName"
                                               required>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    class="btn btn-primary"
                                    id="saveBankDetails">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- ADD FAMILY -->
        <!-- ========================================================= -->

        <div class="modal fade" id="addFamilyDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Family Information</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="addFamilyDetailsForm">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       value="@ViewBag.UserId">

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="Name"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Relationship
                                        </label>

                                        <input type="text"
                                               name="Relation"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Phone
                                        </label>

                                        <input type="text"
                                               name="Phone"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Date Of Birth
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   name="DateOfBirth"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    class="btn btn-primary"
                                    id="saveFamilyDetails">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- EDIT FAMILY -->
        <!-- ========================================================= -->

        <div class="modal fade" id="editFamilyDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Family Information</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="editFamilyDetailsForm">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       id="editFamilyUserId">

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="Name"
                                               id="editName"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Family Id
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="FamilyDetailId"
                                               id="FamilyDetailId"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Relationship
                                        </label>

                                        <input type="text"
                                               name="Relation"
                                               id="editRelation"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Phone
                                        </label>

                                        <input type="text"
                                               name="Phone"
                                               id="editPhone"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Date Of Birth
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   name="DateOfBirth"
                                                   id="editDateOfBirth"
                                                   class="form-control datetimepicker"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    class="btn btn-primary"
                                    id="SaveFamilyDetails">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- ADD EDUCATION -->
        <!-- ========================================================= -->

        <div class="modal fade" id="addEducationDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Education Information</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="addEducationDetailsForm" method="post">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       value="@ViewBag.UserId">

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Institution Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               id="UniversityName"
                                               name="UniversityName"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Course
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               id="EducationType"
                                               name="EducationType"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Start Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   id="startdate"
                                                   name="startdate"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            End Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   id="enddate"
                                                   name="enddate"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    class="btn btn-primary"
                                    id="saveEducationDetails">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- EDIT EDUCATION -->
        <!-- ========================================================= -->

        <div class="modal fade" id="editeducationDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Education Information</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="editEducationDetailsForm">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       value="@ViewBag.UserId">

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Institution Id
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="EducationDetailsId"
                                               id="editEducationDetailsId"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Institution Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="UniversityName"
                                               id="editUniversityName"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Course
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="EducationType"
                                               id="editEducationType"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Start Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   name="startdate"
                                                   id="editstartdate"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            End Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   name="enddate"
                                                   id="editenddate"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    id="saveeditEducationDetails"
                                    class="btn btn-primary">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- ADD EXPERIENCE -->
        <!-- ========================================================= -->

        <div class="modal fade" id="addExperienceDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Company Information</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="addExperienceDetailsForm">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       value="@ViewBag.UserId">

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Previous Company Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="CompanyName"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Designation
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="DesignationName"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Start Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   name="FromDate"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            End Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   class="form-control datetimepicker"
                                                   name="ToDate"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    id="saveExperienceDetails"
                                    class="btn btn-primary">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- EDIT EXPERIENCE -->
        <!-- ========================================================= -->

        <div class="modal fade" id="editexperienceDetailsModal">

            <div class="modal-dialog modal-dialog-centered modal-lg">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">Company Information</h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>

                    </div>

                    <form id="editExperienceDetailsForm">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <input type="hidden"
                                       name="UserId"
                                       value="@ViewBag.UserId">

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Previous Company Id
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="ExperienceId"
                                               id="editExperienceId"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Previous Company Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="CompanyName"
                                               id="editCompanyName"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Designation
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="DesignationName"
                                               id="editDesignationName"
                                               class="form-control"
                                               required>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            Start Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   name="FromDate"
                                                   id="editFromDate"
                                                   class="form-control datetimepicker"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">

                                        <label class="form-label">
                                            End Date
                                            <span class="text-danger">*</span>
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   name="ToDate"
                                                   id="editToDate"
                                                   class="form-control datetimepicker"
                                                   placeholder="dd/mm/yyyy"
                                                   required>

                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>

                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <button type="button"
                                    class="btn btn-white border me-2"
                                    data-bs-dismiss="modal">
                                Cancel
                            </button>

                            <button type="submit"
                                    id="saveeditExperienceDetails"
                                    class="btn btn-primary">
                                Save
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>
    <!-- /Main Wrapper -->


  

</body>
</html>
