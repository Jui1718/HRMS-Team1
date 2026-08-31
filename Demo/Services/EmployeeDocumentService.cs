using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using Demo.Interfaces;
using Demo.Models;

namespace Demo.Services
{
    public class EmployeeDocumentService : EmployeeDocumentInterface
    {
        SqlConnection conn;

        public EmployeeDocumentService()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString);
            conn.Open();
        }

        // get all employee document
        public List<EmployeeDocument> GetEmployeeDocuments()
        {
            string q = "exec sp_getEmployeeDocumentList";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            List<EmployeeDocument> documents = new List<EmployeeDocument>();
            while (rdr.Read())
            {
                EmployeeDocument document = new EmployeeDocument();

                document.Id =int.Parse(rdr["Id"].ToString());
                document.DocName = rdr["DocName"].ToString();
                documents.Add(document);
            }
            rdr.Close();
            return documents;
        }


        // get document by id
        public EmployeeDocument GetEmployeeDocumentById(int id)
        {
            string q = "exec sp_getEmployeeDocumentById @Id";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            EmployeeDocument document = null;
            if (rdr.Read())
            {
                document = new EmployeeDocument();
                document.Id =int.Parse(rdr["Id"].ToString());
                document.DocName =rdr["DocName"].ToString();
            }
            rdr.Close();
            return document;
        }


        // insert document
        public void AddEmployeeDocument(EmployeeDocument document)
        {
            string q = "exec sp_addEmployeeDocument '{@DocName}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue(
                "@DocName",
                document.DocName
            );

            cmd.ExecuteNonQuery();
        }


        // update document

        public void UpdateEmployeeDocument(EmployeeDocument document)
        {
            string q = "exec sp_updateEmployeeDocument '{@Id}', '{@DocName}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue(
                "@Id",
                document.Id
            );

            cmd.Parameters.AddWithValue(
                "@DocName",
                document.DocName
            );
            cmd.ExecuteNonQuery();
        }


        // delete
        public void DeleteEmployeeDocument(int id)
        {
            string q = "exec sp_deleteEmployeeDocument @Id";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();
        }
    }
}