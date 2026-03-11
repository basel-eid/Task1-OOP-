using PMS.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Models
{
    public class CashPayment : Payment, IRefundatable
    {
        public CashPayment(double amount) : base(amount) { }

        // Removed return true and implemented specific logic
        public override bool Validate()
        {
            // added validation for cash payments
            if (Amount < 1) return false;
            if (Amount > 10000)
            {
                Console.WriteLine("Error: Cash payments cannot exceed $10000.");
                return false;
            }
            return true;
        }

        public override PaymentResponse Process()
        {
            Console.WriteLine($"[{PaymentDate}] Checking credit limit for ${Amount}...");
            return new PaymentResponse(true, "Success");
        }

        public double Refund() => Amount;
    }
}
