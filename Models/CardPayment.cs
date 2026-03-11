using PMS.Interfaces;
using PMS.Models;

public class CardPayment : Payment, IRefundatable
{
    public CardPayment(double amount) : base(amount) { }

    public override bool Validate()
    {
        
        return Amount > 0;
    }

    public override PaymentResponse Process()
    {
        Console.WriteLine($"[{PaymentDate}] Authorizing Card Transaction for ${Amount}...");
        return new PaymentResponse(true, "Success");
    }
    public double Refund()
    {
        return Amount;
    }
}
