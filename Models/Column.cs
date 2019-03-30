    public class ColumnModel
    {
        public string Column { get; set; }
        public string Schema { get; set; }
        public string Table { get; set; }

        public override bool Equals(object a)
        {
            if(a as ColumnModel != null)
                return (a as ColumnModel).Schema == this.Schema && (a as ColumnModel).Table == this.Table && (a as ColumnModel).Column == this.Column;
            else
                return false;
        }

        public override int GetHashCode()
        {
            return this.Schema.GetHashCode() ^ this.Table.GetHashCode() ^ this.Column.GetHashCode();
        }
    }
