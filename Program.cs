using PMS.Factories;
using PMS.Models;

namespace PMS
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Payment> paymentList = new List<Payment>();

            paymentList.Add(PaymentFactory.CreatePayment("card", 250.00));
            paymentList.Add(PaymentFactory.CreatePayment("cash", 20.00));
            paymentList.Add(PaymentFactory.CreatePayment("installment", 1000.00));

            Console.WriteLine("--- Starting Processing ---");

            foreach (Payment p in paymentList)
            {
                if (p.validate())
                {
                    p.Process();
                }
                else
                {
                    Console.WriteLine("Validation failed for payment.");
                }
            }
        }
    }
}
