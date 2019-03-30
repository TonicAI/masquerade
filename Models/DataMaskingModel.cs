using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using PgMaskingProxy.Helpers;
using PgMaskingProxy.Maskers;

namespace PgMaskingProxy
{
    public class DataMaskingModel
    {

        [JsonProperty("column_masks")]
        public List<MaskedColumn> MaskedColumns { get; set; }

        [JsonProperty("data_type_masks")]
        public List<MaskedDataType> MaskedDataTypes { get; set; }

        [JsonProperty("preserve_keys")]
        public bool PreserveKeys { get; set; }

        public DataMaskingModel()
        {
            MaskedColumns = new List<MaskedColumn>();
            MaskedDataTypes = new List<MaskedDataType>();
        }
    }

    public class MaskedDataType
    {
        [JsonProperty("data_type")]
        public string DataType { get; set; }

        [JsonProperty("masking_function")]
        public string MaskingFunctionName
        {
            get {return _maskingFunctionName;}
            set
            {
                _maskingFunctionName = value;
                if(!FunctionGetter.GetAllMaskingFunctions().ContainsKey(_maskingFunctionName))
                {
                    throw new Exception($"Unrecognized function {_maskingFunctionName}.  Method name doesn't exist in PgMaskingProxy.Maskers namespace.");
                }
                MaskingFunction = FunctionGetter.GetAllMaskingFunctions()[_maskingFunctionName];
            }
        }

        public Func<string, string> MaskingFunction { get; set; }
        private string _maskingFunctionName;
    }

    public class MaskedColumn
    {
        [JsonProperty("column")]
        public string ColumnName { get; set; }
        [JsonProperty("schema")]
        public string SchemaName { get; set; }
        [JsonProperty("table")]
        public string TableName { get; set; }

        [JsonProperty("masking_function")]
        public string MaskingFunctionName
        {
            get {return _maskingFunctionName;}
            set
            {
                _maskingFunctionName = value;
                if(!FunctionGetter.GetAllMaskingFunctions().ContainsKey(_maskingFunctionName))
                {
                    throw new Exception($"Unrecognized function {_maskingFunctionName}.  Method name doesn't exist in PgMaskingProxy.Maskers namespace.");
                }
                MaskingFunction = FunctionGetter.GetAllMaskingFunctions()[_maskingFunctionName];
            }
        }

        public Func<string, string> MaskingFunction { get; set; }
        private string _maskingFunctionName;
    }
}
