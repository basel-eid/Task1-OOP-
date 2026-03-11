using PMS.Enums;
using PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static PMS.Models.PaymentContracts;

namespace PMS.Factories
{
    public static class PaymentFactory
    {
        // Now takes the Request Object instead of individual parameters
        public static PaymentContracts.PaymentResponse CreatePayment(PaymentRequest request)
        {
            try
            {
                Payment payment = request.Type switch
                {
                    PaymentType.Card => new CardPayment(request.Amount),

                    PaymentType.Cash => new CashPayment(request.Amount),

                    // Using the Months from the request object
                    PaymentType.Installment => new InstallmentPayment(request.Amount, request.Months),

                    _ => null
                };

                // 1. Check if the type was valid
                if (payment == null)
                {
                    return new PaymentContracts.PaymentResponse(false, "Unknown payment type.", null);
                }

                // 2. Run the internal validation logic (e.g., Cash limit or Amount > 0)
                if (!payment.Validate())
                {
                    return new PaymentContracts.PaymentResponse(false, "Validation failed for the provided amount/details.", payment);
                }

                // 3. Return success with the payment object
                return new PaymentContracts.PaymentResponse(true, "Payment created successfully.", payment);
            }
            catch (Exception ex)
            {
                // Catch-all for unexpected errors
                return new PaymentContracts.PaymentResponse(false, $"Error: {ex.Message}", null);
            }
        }
    }
}
