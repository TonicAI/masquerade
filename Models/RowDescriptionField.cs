namespace PgMaskingProxy.Models
{
    public class RowDescriptionField
    {
        public string FieldName { get; set; }
        public uint ObjectId { get; set; } //If the field can be identified as a column of a specific table, the object ID of the table; otherwise zero.
        public ushort AttrId { get; set; } //if field is column of specific table then it is the attribute number of the column, otherwise 0.
        public uint DataTypeObjectId { get; set; } //object id of field data type
        public ushort DataTypeSize { get; set; } //see pg_type.typlen
        public uint TypeModifier { get; set; } //see pg_attribute.atttypmod
        public ushort FormatCode { get; set; } //zero (text) or one (binary)
    }
}
