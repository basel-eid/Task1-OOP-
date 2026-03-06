using PMS.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Models
{
    public abstract class Payment : IValidate
    {
        public double Amount { get;}
        public DateTime PaymentDate { get;}
        public Payment(double amount)
        {
            this.Amount = amount;
        }
        public abstract void Process();
        public virtual bool validate() => Amount > 0;

    }
}
