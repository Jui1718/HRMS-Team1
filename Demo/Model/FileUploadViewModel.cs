using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class FileUploadViewModel
    {
    public int UserId {  get; set; }
    public List<string> DocumentTypes { get; set; } = new List<string>();
    //public List<IFormFile> Files { get; set; } = new List<IFormFile>();

    //from AddAdminDocName
    public int Id { get; set; }
    //public AddAdminDocName AddAdminDocName { get; set; }
    }
