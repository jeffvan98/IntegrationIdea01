namespace Maps {
    
    
    [Microsoft.XLANGs.BaseTypes.SchemaReference(@"Schemas.InventoryUpdate", typeof(global::Schemas.InventoryUpdate))]
    [Microsoft.XLANGs.BaseTypes.SchemaReference(@"ProductServices.Schemas.Procedure_dbo+UpdateInventory", typeof(global::ProductServices.Schemas.Procedure_dbo.UpdateInventory))]
    public sealed class InventoryUpdateToOutput : global::Microsoft.XLANGs.BaseTypes.TransformBase {
        
        private const string _strMap = @"<?xml version=""1.0"" encoding=""UTF-16""?>
<xsl:stylesheet xmlns:xsl=""http://www.w3.org/1999/XSL/Transform"" xmlns:msxsl=""urn:schemas-microsoft-com:xslt"" xmlns:var=""http://schemas.microsoft.com/BizTalk/2003/var"" exclude-result-prefixes=""msxsl var s0"" version=""1.0"" xmlns:ns0=""http://schemas.microsoft.com/Sql/2008/05/Procedures/dbo"" xmlns:ns3=""http://schemas.datacontract.org/2004/07/System.Data"" xmlns:s0=""http://Schemas.InventoryUpdate"">
  <xsl:output omit-xml-declaration=""yes"" method=""xml"" version=""1.0"" />
  <xsl:template match=""/"">
    <xsl:apply-templates select=""/s0:InventoryUpdate"" />
  </xsl:template>
  <xsl:template match=""/s0:InventoryUpdate"">
    <ns0:UpdateInventory>
      <ns0:ProductName>
        <xsl:value-of select=""ProductName/text()"" />
      </ns0:ProductName>
      <xsl:if test=""SerialNumber"">
        <ns0:SerialNumber>
          <xsl:value-of select=""SerialNumber/text()"" />
        </ns0:SerialNumber>
      </xsl:if>
      <ns0:QuantityChange>
        <xsl:value-of select=""QuantityChange/text()"" />
      </ns0:QuantityChange>
      <ns0:Location>
        <xsl:value-of select=""Location/text()"" />
      </ns0:Location>
      <ns0:UpdateDate>
        <xsl:value-of select=""UpdateDate/text()"" />
      </ns0:UpdateDate>
    </ns0:UpdateInventory>
  </xsl:template>
</xsl:stylesheet>";
        
        private const string _xsltEngine = @"";
        
        private const int _useXSLTransform = 0;
        
        private const string _strArgList = @"<ExtensionObjects />";
        
        private const string _strSrcSchemasList0 = @"Schemas.InventoryUpdate";
        
        private const global::Schemas.InventoryUpdate _srcSchemaTypeReference0 = null;
        
        private const string _strTrgSchemasList0 = @"ProductServices.Schemas.Procedure_dbo+UpdateInventory";
        
        private const global::ProductServices.Schemas.Procedure_dbo.UpdateInventory _trgSchemaTypeReference0 = null;
        
        public override string XmlContent {
            get {
                return _strMap;
            }
        }
        
        public override string XsltEngine {
            get {
                return _xsltEngine;
            }
        }
        
        public override int UseXSLTransform {
            get {
                return _useXSLTransform;
            }
        }
        
        public override string XsltArgumentListContent {
            get {
                return _strArgList;
            }
        }
        
        public override string[] SourceSchemas {
            get {
                string[] _SrcSchemas = new string [1];
                _SrcSchemas[0] = @"Schemas.InventoryUpdate";
                return _SrcSchemas;
            }
        }
        
        public override string[] TargetSchemas {
            get {
                string[] _TrgSchemas = new string [1];
                _TrgSchemas[0] = @"ProductServices.Schemas.Procedure_dbo+UpdateInventory";
                return _TrgSchemas;
            }
        }
    }
}
