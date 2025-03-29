using System.ComponentModel.DataAnnotations;

namespace ERP_System.Server.Models;

public class Users
{
    public int Id { get; set; } 
   
    [Required]
    public string UserID { get; set; }
   
    public string Username { get; set; }
   
    public string Password { get; set; }
   
    public string? NormalizedName { get; set; }

    public DateTime? Dob { get; set; }
   
    public DateTime CreatedDateTime { get; set; } = DateTime.UtcNow;
}