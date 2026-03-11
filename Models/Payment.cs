using PMS.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Models
{
    public abstract class Payment
    {
        public double Amount { get; }
        public DateTime PaymentDate { get; } // Added the date property

        public Payment(double amount)
        {
            this.Amount = amount;
            this.PaymentDate = DateTime.Now; 
        }

        // New return type: returns a record containing status and message
        public abstract PaymentResponse Process();

        public virtual bool Validate() => Amount > 0;
    }
    public record PaymentResponse(bool IsSuccess, string Message);
}
