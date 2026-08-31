using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Demo.Models;

namespace Demo.Interfaces
{
    public interface FileUploadInterface
    {
        List<UserDropdown> GetUsersForFileUpload();

        List<AdminDocumentName> GetAdminDocumentNames();

        void AddFileUpload(FileUpload fileUpload);
        List<FileUpload> GetUploadedAdminDocuments();
        string GetFilePath(int id);
    }
}
