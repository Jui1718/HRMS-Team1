using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Demo.Interfaces;
using Demo.Models;

namespace Demo.Services
{
    public class DocumentService : DocumentInterface
    {
        SqlConnection conn;
        public DocumentService()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString);
            conn.Open();
        }

        public List<Document> GetAdminDocuments()
        {
            string q = "exec sp_getAdminDocumentList";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            List<Document> documents = new List<Document>();
            while (rdr.Read())
            {
                Document document = new Document();
                document.Id = int.Parse(rdr["Id"].ToString());
                document.DocName = rdr["DocName"].ToString();

                documents.Add(document);
            }

            rdr.Close();
            return documents;
        }


        public Document GetAdminDocumentById(int id)
        {
            string q = "exec sp_getAdminDocumentById @Id";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            Document document = null;
            if (rdr.Read())
            {
                document = new Document();
                document.Id = int.Parse(rdr["Id"].ToString());
                document.DocName = rdr["DocName"].ToString();
            }
            rdr.Close();
            return document;
        }


        public void AddAdminDocument(Document document)
        {
            string q = "exec sp_addAdminDocument @DocName";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue("@DocName", document.DocName);
            cmd.ExecuteNonQuery();
        }


        public void UpdateAdminDocument(Document document)
        {
            string q = "exec UpdateAdminDocument @Id, @DocName";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue("@Id", document.Id);
            cmd.Parameters.AddWithValue("@DocName", document.DocName);
            cmd.ExecuteNonQuery();
        }


        public void DeleteAdminDocument(int id)
        {
            string q = "exec DeleteAdminDocument @Id";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();
        }
    }
}