using PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Factories
{
    public static class PaymentFactory
    {
        public static Payment CreatePayment(string type, double amount)
        {
            return type.ToLower() switch
            {
                "card" => new CardPayment(amount),
                "cash" => new CashPayment(amount),
                "installment" => new InstallmentPayment(amount, 12),
                _ => throw new ArgumentException("Unknown payment type")
            };
        }
    }
}
