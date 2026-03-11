using PMS.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Models
{
    public class PaymentContracts
    {
        public record PaymentRequest(PaymentType Type, double Amount, int Months = 12);

        public record PaymentResponse(bool IsSuccess, string Message, Payment? Data);
    }
}
