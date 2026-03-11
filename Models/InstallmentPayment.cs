using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Models
{
    public class InstallmentPayment : Payment
    {
        // Private set ensures the months cannot be changed after creation
        public int Months { get; private set; }

        public InstallmentPayment(double amount, int months) : base(amount)
        {
            this.Months = months;
        }
        //add validation for installment payments
        public override bool Validate() => Amount > 0 && Months >= 3 && Months <= 24;

        public override PaymentResponse Process()
        {
            
            Console.WriteLine($"[{PaymentDate}] Checking credit limit for ${Amount}...");
            return new PaymentResponse(true, "Success");
        }
    }
}
