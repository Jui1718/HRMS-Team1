<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="Demo.Controllers.AddProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Project</title>
    <!-- Bootstrap CSS --> 
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" /> 
    <!-- Tabler Icons --> 
    <link rel="stylesheet" href="../assets/plugins/tabler-icons/tabler-icons.css" /> 
    <!-- Main CSS --> 
    <link rel="stylesheet" href="../assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <%--<form id="form2" runat="server">--%>

<div class="modal fade show"
     id="add_project"
     tabindex="-1"
     role="dialog"
     aria-modal="true"
     style="display:block;">

    <div class="modal-dialog modal-dialog-centered modal-lg">

        <div class="modal-content">

            <div class="modal-header header-border align-items-center justify-content-between">

                <h5 class="modal-title">
                    Add Project
                </h5>

                <button type="button"
                        class="btn-close custom-btn-close"
                        onclick="window.history.back();"
                        aria-label="Close">
                    <i class="ti ti-x"></i>
                </button>

            </div>

            <div class="modal-body">

                <div class="row">
            <br />
            <div class="col-md-12">
    <div class="mb-3">

        <label class="form-label">
            Project Name
        </label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            Client Name :
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>            <br />
            <br />
            Description :
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            Start Date :
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            End Date :
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            Priority :
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                <asp:ListItem Enabled="False">Select Priority</asp:ListItem>
                <asp:ListItem>High</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem>Low</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            ProjectValue :
            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>    
            <br />
            <br />
            PriceType :
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select">
                <asp:ListItem Enabled="False">Select Currency Type</asp:ListItem>
                <asp:ListItem>(¤)</asp:ListItem>
                <asp:ListItem>Afghan Afghani (؋)</asp:ListItem>
                <asp:ListItem>Albanian Lek (Lekë)</asp:ListItem>
                <asp:ListItem>Algerian Dinar (دج)</asp:ListItem>
                <asp:ListItem>Angolan Kwanza (Kz)</asp:ListItem>
                <asp:ListItem>Argentine Peso ($)</asp:ListItem>
                <asp:ListItem>Armenian Dram (֏)</asp:ListItem>
                <asp:ListItem>Aruban Florin (Afl.)</asp:ListItem>
                <asp:ListItem>Australian Dollar ($)</asp:ListItem>
                <asp:ListItem>Azerbaijani Manat (₼)</asp:ListItem>
                <asp:ListItem>Bahamian Dollar ($)</asp:ListItem>
                <asp:ListItem>Bahraini Dinar (د.ب)</asp:ListItem>
                <asp:ListItem>Bangladeshi Taka (৳)</asp:ListItem>
                <asp:ListItem>Barbadian Dollar ($)</asp:ListItem>
                <asp:ListItem>Belarusian Ruble (Br)</asp:ListItem>
                <asp:ListItem>Belize Dollar ($)</asp:ListItem>
                <asp:ListItem>Bermudan Dollar ($)</asp:ListItem>
                <asp:ListItem>Bhutanese Ngultrum (Nu.)</asp:ListItem>
                <asp:ListItem>Bolivian Boliviano (Bs)</asp:ListItem>
                <asp:ListItem>Bosnia-Herzegovina Convertible Mark (KM)</asp:ListItem>
                <asp:ListItem>Botswana Pula (P)</asp:ListItem>
                <asp:ListItem>Brazilian Real (R$)</asp:ListItem>
                <asp:ListItem>British Pound (£)</asp:ListItem>
                <asp:ListItem>Brunei Dollar ($)</asp:ListItem>
                <asp:ListItem>Bulgarian Lev (лв.)</asp:ListItem>
                <asp:ListItem>Burundian Franc (FBu)</asp:ListItem>
                <asp:ListItem>Cambodian Riel (៛)</asp:ListItem>
                <asp:ListItem>Canadian Dollar ($)</asp:ListItem>
                <asp:ListItem>Cape Verdean Escudo</asp:ListItem>
                <asp:ListItem>Cayman Islands Dollar ($)</asp:ListItem>
                <asp:ListItem>Central African CFA Franc (FCFA)</asp:ListItem>
                <asp:ListItem>CFP Franc (FCFP)</asp:ListItem>
                <asp:ListItem>Chilean Peso (CLP)</asp:ListItem>
                <asp:ListItem>Chinese Yuan (¥)</asp:ListItem>
                <asp:ListItem>Colombian Peso ($)</asp:ListItem>
                <asp:ListItem>Comorian Franc (CF)</asp:ListItem>
                <asp:ListItem>Congolese Franc (FC)</asp:ListItem>
                <asp:ListItem>Costa Rican Colón (₡)</asp:ListItem>
                <asp:ListItem>Croatian Kuna (HRK)</asp:ListItem>
                <asp:ListItem>Cuban Peso ($)</asp:ListItem>
                <asp:ListItem>Czech Koruna (Kč)</asp:ListItem>
                <asp:ListItem>Danish Krone (kr.)</asp:ListItem>
                <asp:ListItem>Djiboutian Franc (Fdj)</asp:ListItem>
                <asp:ListItem>Dominican Peso (RD$)</asp:ListItem>
                <asp:ListItem>East Caribbean Dollar (EC$)</asp:ListItem>
                <asp:ListItem>Egyptian Pound (ج.م)</asp:ListItem>
                <asp:ListItem>Eritrean Nakfa (Nfk)</asp:ListItem>
                <asp:ListItem>Ethiopian Birr (Br)</asp:ListItem>
                <asp:ListItem>Euro (€)</asp:ListItem>
                <asp:ListItem>Falkland Islands Pound (£)</asp:ListItem>
                <asp:ListItem>Fijian Dollar ($)</asp:ListItem>
                <asp:ListItem>Gambian Dalasi (D)</asp:ListItem>
                <asp:ListItem>Georgian Lari (₾)</asp:ListItem>
                <asp:ListItem>Ghanaian Cedi (GH₵)</asp:ListItem>
                <asp:ListItem>Gibraltar Pound (£)</asp:ListItem>
                <asp:ListItem>Guatemalan Quetzal (Q)</asp:ListItem>
                <asp:ListItem>Guinean Franc (FG)</asp:ListItem>
                <asp:ListItem>Guyanaese Dollar ($)</asp:ListItem>
                <asp:ListItem>Haitian Gourde (G)</asp:ListItem>
                <asp:ListItem>Honduran Lempira (L)</asp:ListItem>
                <asp:ListItem>Hong Kong Dollar (HK$)</asp:ListItem>
                <asp:ListItem>Hungarian Forint (Ft)</asp:ListItem>
                <asp:ListItem>Icelandic Króna (ISK)</asp:ListItem>
                <asp:ListItem>Indian Rupee (₹)</asp:ListItem>
                <asp:ListItem>Indonesian Rupiah (IDR)</asp:ListItem>
                <asp:ListItem>Iranian Rial (IRR)</asp:ListItem>
                <asp:ListItem>Iraqi Dinar (ع.د)</asp:ListItem>
                <asp:ListItem>Israeli New Shekel (₪)</asp:ListItem>
                <asp:ListItem>Jamaican Dollar ($)</asp:ListItem>
                <asp:ListItem>Japanese Yen (¥)</asp:ListItem>
                <asp:ListItem>Jordanian Dinar (د.ا)</asp:ListItem>
                <asp:ListItem>Kazakhstani Tenge (₸)</asp:ListItem>
                <asp:ListItem>Kenyan Shilling (Ksh)</asp:ListItem>
                <asp:ListItem>Kuwaiti Dinar (د.ك)</asp:ListItem>
                <asp:ListItem>Kyrgyzstani Som (сом)</asp:ListItem>
                <asp:ListItem>Laotian Kip (₭)</asp:ListItem>
                <asp:ListItem>Lebanese Pound (ل.ل)</asp:ListItem>
                <asp:ListItem>Liberian Dollar ($)</asp:ListItem>
                <asp:ListItem>Libyan Dinar (ل.د)</asp:ListItem>
                <asp:ListItem>Macanese Pataca (MOP$)</asp:ListItem>
                <asp:ListItem>Macedonian Denar (ден.)</asp:ListItem>
                <asp:ListItem>Malagasy Ariary (Ar)</asp:ListItem>
                <asp:ListItem>Malawian Kwacha (MK)</asp:ListItem>
                <asp:ListItem>Malaysian Ringgit (RM)</asp:ListItem>
                <asp:ListItem>Maldivian Rufiyaa (ރ.)</asp:ListItem>
                <asp:ListItem>Mauritanian Ouguiya (أ.م)</asp:ListItem>
                <asp:ListItem>Mauritian Rupee (Rs)</asp:ListItem>
                <asp:ListItem>Mexican Peso ($)</asp:ListItem>
                <asp:ListItem>Moldovan Leu (L)</asp:ListItem>
                <asp:ListItem>Mongolian Tugrik (₮)</asp:ListItem>
                <asp:ListItem>Moroccan Dirham (د.م.)</asp:ListItem>
                <asp:ListItem>Mozambican Metical (MTn)</asp:ListItem>
                <asp:ListItem>Myanmar Kyat (K)</asp:ListItem>
                <asp:ListItem>Namibian Dollar ($)</asp:ListItem>
                <asp:ListItem>Nepalese Rupee (नेरू)</asp:ListItem>
                <asp:ListItem>Netherlands Antillean Guilder (NAƒ.)</asp:ListItem>
                <asp:ListItem>New Taiwan Dollar ($)</asp:ListItem>
                <asp:ListItem>New Zealand Dollar ($)</asp:ListItem>
                <asp:ListItem>Nicaraguan Córdoba (C$)</asp:ListItem>
                <asp:ListItem>Nigerian Naira (NGN)</asp:ListItem>
                <asp:ListItem>North Korean Won (KPW)</asp:ListItem>
                <asp:ListItem>Norwegian Krone (kr)</asp:ListItem>
                <asp:ListItem>Omani Rial (ع.ر.)</asp:ListItem>
                <asp:ListItem>Pakistani Rupee (Rs)</asp:ListItem>
                <asp:ListItem>Panamanian Balboa (B/.)</asp:ListItem>
                <asp:ListItem>Papua New Guinean Kina (K)</asp:ListItem>
                <asp:ListItem>Paraguayan Guarani (Gs.)</asp:ListItem>
                <asp:ListItem>Peruvian Sol (S/)</asp:ListItem>
                <asp:ListItem>Philippine Piso (₱)</asp:ListItem>
                <asp:ListItem>Polish Zloty (zł)</asp:ListItem>
                <asp:ListItem>Qatari Rial (ر.ق.)</asp:ListItem>
                <asp:ListItem>Romanian Leu (RON)</asp:ListItem>
                <asp:ListItem>Russian Ruble (RUB)</asp:ListItem>
                <asp:ListItem>Rwandan Franc (RF)</asp:ListItem>
                <asp:ListItem>Samoan Tala (WS$)</asp:ListItem>
                <asp:ListItem>São Tomé &amp; Príncipe Dobra (Db)</asp:ListItem>
                <asp:ListItem>Saudi Riyal (ر.س.)</asp:ListItem>
                <asp:ListItem>Serbian Dinar (RSD)</asp:ListItem>
                <asp:ListItem>Seychellois Rupee (SR)</asp:ListItem>
                <asp:ListItem>Sierra Leonean Leone (Le)</asp:ListItem>
                <asp:ListItem>Singapore Dollar ($)</asp:ListItem>
                <asp:ListItem>Solomon Islands Dollar ($)</asp:ListItem>
                <asp:ListItem>Somali Shilling (S)</asp:ListItem>
                <asp:ListItem>South African Rand (R)</asp:ListItem>
                <asp:ListItem>South Korean Won (₩)</asp:ListItem>
                <asp:ListItem>South Sudanese Pound (£)</asp:ListItem>
                <asp:ListItem>Sri Lankan Rupee (රු.)</asp:ListItem>
                <asp:ListItem>St. Helena Pound (£)</asp:ListItem>
                <asp:ListItem>Sudanese Pound (ج.س)</asp:ListItem>
                <asp:ListItem>Surinamese Dollar ($)</asp:ListItem>
                <asp:ListItem>Swazi Lilangeni (E)</asp:ListItem>
                <asp:ListItem>Swedish Krona (kr)</asp:ListItem>
                <asp:ListItem>Swiss Franc (CHF)</asp:ListItem>
                <asp:ListItem>Syrian Pound (ل.س.)</asp:ListItem>
                <asp:ListItem>Tajikistani Somoni (сом.)</asp:ListItem>
                <asp:ListItem>Tanzanian Shilling (TSh)</asp:ListItem>
                <asp:ListItem>Thai Baht (฿)</asp:ListItem>
                <asp:ListItem>Tongan Paʻanga (T$)</asp:ListItem>
                <asp:ListItem>Trinidad &amp; Tobago Dollar ($)</asp:ListItem>
                <asp:ListItem>Tunisian Dinar (د.ت)</asp:ListItem>
                <asp:ListItem>Turkish Lira (₺)</asp:ListItem>
                <asp:ListItem>Turkmenistani Manat (TMT)</asp:ListItem>
                <asp:ListItem>Ugandan Shilling (USh)</asp:ListItem>
                <asp:ListItem>Ukrainian Hryvnia (₴)</asp:ListItem>
                <asp:ListItem>United Arab Emirates Dirham (د.إ)</asp:ListItem>
                <asp:ListItem>Uruguayan Peso ($)</asp:ListItem>
                <asp:ListItem>US Dollar ($)</asp:ListItem>
                <asp:ListItem>Uzbekistani Som (сўм)</asp:ListItem>
                <asp:ListItem>Vanuatu Vatu (VT)</asp:ListItem>
                <asp:ListItem>Venezuelan Bolívar (Bs.S)</asp:ListItem>
                <asp:ListItem>Vietnamese Dong (₫)</asp:ListItem>
                <asp:ListItem>West African CFA Franc (CFA)</asp:ListItem>
                <asp:ListItem>Yemeni Rial (﷼)</asp:ListItem>
                <asp:ListItem>Zambian Kwacha (K)</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Status :
            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select">
                <asp:ListItem Enabled="False">Select Status</asp:ListItem>
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <%--here fetch all the members First Name from [User]--%> 
            Team Members :
            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            </asp:CheckBoxList>
&nbsp;<br />
            <br />
            <%--here we have to fetch managers only whose designation name as manager inside designation table --%>
            Manager Name :
            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-select">
            </asp:DropDownList>
            <br />
            <br />
            Upload File Logo :
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            <br />
            <br />
            Upload File :
            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
