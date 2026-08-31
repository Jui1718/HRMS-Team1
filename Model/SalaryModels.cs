using System;

namespace ProjectDemo
{
    public class EarningItemModel
    {
        public int EarningsId { get; set; }
        public string EarningName { get; set; }
        public decimal EarningsPercentage { get; set; }
    }

    public class DeductionItemModel
    {
        public int DeductionId { get; set; }
        public string DeductionName { get; set; }
        public decimal DeductionPercentage { get; set; }
    }
}
