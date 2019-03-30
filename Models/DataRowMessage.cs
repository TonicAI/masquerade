using System.Collections.Generic;

namespace PgMaskingProxy.Models
{
    public class DataRowMessage
    {
        public ushort NumFields { get; set; }
        public List<DataRowField> DataRowFields { get; set; }
    }
}
