using PMS.Interfaces;
using PMS.Models;

public class CardPayment : Payment, IRefundatable
{
    public CardPayment(double amount) : base(amount) { }

    public override bool validate()
    {
        Console.WriteLine("Checking credit limit...");
        return Amount > 0;
    }

    public override void Process() => Console.WriteLine($"Charged ${Amount} to Card.");

    public void Refund() => Console.WriteLine($"Refunded ${Amount} to Card.");
}
public class CashPayment : Payment
{
    public CashPayment(double amount) : base(amount) { }

    public override bool validate() => true;

    public override void Process() => Console.WriteLine($"Cash payment of ${Amount} received.");
}
public class InstallmentPayment : Payment
{
    public int Months { get; set; }
    public InstallmentPayment(double amount, int months) : base(amount) => Months = months;

    public override bool validate() => Amount > 0 && Months > 0;

    public override void Process() => Console.WriteLine($"Processed ${Amount} over {Months} months.");
}