using System.Collections.Generic;

namespace PgMaskingProxy.Models
{
    public class RowDescriptionMessage
    {
        public ushort NumFields { get; set; }
        public bool ShouldModify { get; set; }
        public List<RowDescriptionField> FieldDescriptions { get; set; }
    }
}
