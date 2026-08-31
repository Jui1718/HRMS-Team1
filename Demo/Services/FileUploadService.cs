using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Demo.Interfaces;
using Demo.Models;

namespace Demo.Services
{
    public class FileUploadService : FileUploadInterface
    {
        SqlConnection conn;

        public FileUploadService()
        {
            conn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString
            );

            conn.Open();
        }


        // GET USERS
        public List<UserDropdown> GetUsersForFileUpload()
        {
            string q = "exec sp_getUsersForFileUpload";

            SqlCommand cmd = new SqlCommand(q, conn);

            SqlDataReader rdr = cmd.ExecuteReader();

            List<UserDropdown> users =
                new List<UserDropdown>();

            while (rdr.Read())
            {
                UserDropdown user =
                    new UserDropdown();

                user.UserId =
                    Convert.ToInt32(rdr["UserId"]);

                user.Email =
                    rdr["Email"].ToString();

                users.Add(user);
            }

            rdr.Close();

            return users;
        }


        // GET ADMIN DOCUMENT NAMES
        public List<AdminDocumentName> GetAdminDocumentNames()
        {
            string q = "exec sp_getAdminDocumentNamesForUpload";

            SqlCommand cmd = new SqlCommand(q, conn);

            SqlDataReader rdr = cmd.ExecuteReader();

            List<AdminDocumentName> documents =
                new List<AdminDocumentName>();

            while (rdr.Read())
            {
                AdminDocumentName document =
                    new AdminDocumentName();

                document.Id =
                    Convert.ToInt32(rdr["Id"]);

                document.DocName =
                    rdr["DocName"].ToString();

                documents.Add(document);
            }

            rdr.Close();

            return documents;
        }


      
        public void AddFileUpload(FileUpload fileUpload)
        {
            string q =
                "exec AddFileUpload @FileName, @FilePath, @UserId";

            SqlCommand cmd =
                new SqlCommand(q, conn);

            cmd.Parameters.AddWithValue(
                "@FileName",
                fileUpload.FileName
            );

            cmd.Parameters.AddWithValue(
                "@FilePath",
                fileUpload.FilePath
            );

            cmd.Parameters.AddWithValue(
                "@UserId",
                fileUpload.UserId
            );

            cmd.ExecuteNonQuery();
        }

        public List<FileUpload> GetUploadedAdminDocuments()
        {
            string q = "exec GetUploadedAdminDocuments";

            SqlCommand cmd = new SqlCommand(q, conn);

            SqlDataReader rdr = cmd.ExecuteReader();

            List<FileUpload> files = new List<FileUpload>();

            while (rdr.Read())
            {
                FileUpload file = new FileUpload();

                file.id = Convert.ToInt32(rdr["DocumentId"]);
                file.DocumentName = rdr["DocumentName"].ToString();
                file.UserId = Convert.ToInt32(rdr["UserId"]);
                file.FileName = rdr["FileName"].ToString();
                file.FilePath = rdr["FilePath"].ToString();

                files.Add(file);
            }

            rdr.Close();

            return files;
        }
        public string GetFilePath(int id)
        {
            string q = "SELECT FilePath FROM FileUploads WHERE id = @id";

            SqlCommand cmd = new SqlCommand(q, conn);

            cmd.Parameters.AddWithValue("@id", id);

            string path = cmd.ExecuteScalar()?.ToString();

            return path;
        }
    }
}