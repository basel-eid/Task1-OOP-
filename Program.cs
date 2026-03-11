using PMS.Enums;
using PMS.Factories;
using PMS.Interfaces;
using PMS.Models;
using static PMS.Models.PaymentContracts;

namespace PMS
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Payment> paymentList = new List<Payment>();

            // Mocking the Factory calls (assuming your Factory returns the Response object)
            paymentList.Add(PaymentFactory.CreatePayment(new PaymentRequest(PaymentType.Card, 250)).Data);
            paymentList.Add(PaymentFactory.CreatePayment(new PaymentRequest(PaymentType.Cash, 20)).Data);
            paymentList.Add(PaymentFactory.CreatePayment(new PaymentRequest(PaymentType.Installment, 1000, 6)).Data);

            Console.WriteLine("--- Starting Processing ---");

            foreach (Payment p in paymentList)
            {
                Models.PaymentResponse response = p.Process();
                Console.WriteLine(response.Message);

                // 2. Handle Refund (for Card/Cash)
                if (p is IRefundatable refundable)
                {
                    double refundValue = refundable.Refund();
                    Console.WriteLine($"Refund Processed: ${refundValue}");
                }

                // 3. Handle Installment-specific details
                if (p is InstallmentPayment installment)
                {
                    Console.WriteLine($"Plan Duration: {installment.Months} months");
                }

                Console.WriteLine($"Transaction Date: {p.PaymentDate}");
                Console.WriteLine("---------------------------");
            }
        }
    }
}
