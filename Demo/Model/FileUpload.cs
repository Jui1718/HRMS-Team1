namespace Demo.Models
{
    public class FileUpload
    {
        public int id { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public int UserId { get; set; }
        public int DocumentId { get; set; }
        public string DocumentName { get; set; }
    }

    public class UserDropdown
    {
        public int UserId { get; set; }
        public string Email { get; set; }
    }

    public class AdminDocumentName
    {
        public int Id { get; set; }
        public string DocName { get; set; }
    }
}