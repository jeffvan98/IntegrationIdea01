namespace Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [Schema(@"http://Schemas.InventoryUpdate",@"InventoryUpdate")]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"InventoryUpdate"})]
    public sealed class InventoryUpdate : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns=""http://Schemas.InventoryUpdate"" xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" targetNamespace=""http://Schemas.InventoryUpdate"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:element name=""InventoryUpdate"">
    <xs:complexType>
      <xs:sequence>
        <xs:element minOccurs=""1"" maxOccurs=""1"" name=""ProductName"" type=""xs:string"" />
        <xs:element minOccurs=""0"" maxOccurs=""1"" name=""SerialNumber"" type=""xs:string"" />
        <xs:element minOccurs=""1"" maxOccurs=""1"" name=""QuantityChange"" type=""xs:integer"" />
        <xs:element minOccurs=""1"" maxOccurs=""1"" name=""Location"" type=""xs:string"" />
        <xs:element minOccurs=""1"" maxOccurs=""1"" name=""UpdateDate"" type=""xs:date"" />
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>";
        
        public InventoryUpdate() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [1];
                _RootElements[0] = "InventoryUpdate";
                return _RootElements;
            }
        }
        
        protected override object RawSchema {
            get {
                return _rawSchema;
            }
            set {
                _rawSchema = value;
            }
        }
    }
}
