using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Collections.Generic;
using Demo.Models;

namespace Demo.Interfaces
{
    public interface DocumentInterface
    {
        List<Document> GetAdminDocuments();

        Document GetAdminDocumentById(int id);

        void AddAdminDocument(Document document);

        void UpdateAdminDocument(Document document);

        void DeleteAdminDocument(int id);
    }
}