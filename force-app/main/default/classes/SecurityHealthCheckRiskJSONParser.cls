//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//
// The supplied json has fields with names that are not valid in apex
// and so can only be parsed with explicitly generated code, this option
// was auto selected for you.

public class SecurityHealthCheckRiskJSONParser {
  public Integer size { get; set; }
  public Integer totalSize { get; set; }
  public Boolean done { get; set; }
  public Object queryLocator { get; set; }
  public String entityTypeName { get; set; }
  public List<Records> records { get; set; }

  public SecurityHealthCheckRiskJSONParser(JSONParser parser) {
    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          if (text == 'size') {
            size = parser.getIntegerValue();
          } else if (text == 'totalSize') {
            totalSize = parser.getIntegerValue();
          } else if (text == 'done') {
            done = parser.getBooleanValue();
          } else if (text == 'queryLocator') {
            queryLocator = parser.readValueAs(Object.class);
          } else if (text == 'entityTypeName') {
            entityTypeName = parser.getText();
          } else if (text == 'records') {
            records = arrayOfRecords(parser);
          } else {
            consumeObject(parser);
          }
        }
      }
    }
  }

  public class Attributes {
    public String type_Z { get; set; } // in json: type
    public String url { get; set; }

    public Attributes(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'type') {
              type_Z = parser.getText();
            } else if (text == 'url') {
              url = parser.getText();
            } else {
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Records {
    public Attributes attributes { get; set; }
    public String DurableId { get; set; }
    public String OrgValue { get; set; }
    public String OrgValueRaw { get; set; }
    public String RiskType { get; set; }
    public Object SecurityHealthCheckId { get; set; }
    public String Setting { get; set; }
    public String SettingGroup { get; set; }
    public String SettingRiskCategory { get; set; }
    public String StandardValue { get; set; }
    public String StandardValueRaw { get; set; }

    public Records(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'attributes') {
              attributes = new Attributes(parser);
            } else if (text == 'DurableId') {
              DurableId = parser.getText();
            } else if (text == 'OrgValue') {
              OrgValue = parser.getText();
            } else if (text == 'OrgValueRaw') {
              OrgValueRaw = parser.getText();
            } else if (text == 'RiskType') {
              RiskType = parser.getText();
            } else if (text == 'SecurityHealthCheckId') {
              SecurityHealthCheckId = parser.readValueAs(Object.class);
            } else if (text == 'Setting') {
              Setting = parser.getText();
            } else if (text == 'SettingGroup') {
              SettingGroup = parser.getText();
            } else if (text == 'SettingRiskCategory') {
              SettingRiskCategory = parser.getText();
            } else if (text == 'StandardValue') {
              StandardValue = parser.getText();
            } else if (text == 'StandardValueRaw') {
              StandardValueRaw = parser.getText();
            } else {
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public static SecurityHealthCheckRiskJSONParser parse(String json) {
    System.JSONParser parser = System.JSON.createParser(json);
    return new SecurityHealthCheckRiskJSONParser(parser);
  }

  public static void consumeObject(System.JSONParser parser) {
    Integer depth = 0;
    do {
      System.JSONToken curr = parser.getCurrentToken();
      if (
        curr == System.JSONToken.START_OBJECT ||
        curr == System.JSONToken.START_ARRAY
      ) {
        depth++;
      } else if (
        curr == System.JSONToken.END_OBJECT ||
        curr == System.JSONToken.END_ARRAY
      ) {
        depth--;
      }
    } while (depth > 0 && parser.nextToken() != null);
  }

  private static List<Records> arrayOfRecords(System.JSONParser p) {
    List<Records> res = new List<Records>();
    if (p.getCurrentToken() == null)
      p.nextToken();
    while (p.nextToken() != System.JSONToken.END_ARRAY) {
      res.add(new Records(p));
    }
    return res;
  }

  /*
         * {
  "size" : 37,
  "totalSize" : 37,
  "done" : true,
  "queryLocator" : null,
  "entityTypeName" : "SecurityHealthCheckRisks",
  "records" : [ {
    "attributes" : {
      "type" : "SecurityHealthCheckRisks",
      "url" : "/services/data/v47.0/tooling/sobjects/SecurityHealthCheckRisks/SessionSettings.enableSmsIdentity"
    },
    "DurableId" : "SessionSettings.enableSmsIdentity",
    "OrgValue" : "Disabled",
    "OrgValueRaw" : "false",
    "RiskType" : "HIGH_RISK",
    "SecurityHealthCheckId" : null,
    "Setting" : "Let users verify their identity by text (SMS)",
    "SettingGroup" : "SessionSettings",
    "SettingRiskCategory" : "HIGH_RISK",
    "StandardValue" : "Enabled",
    "StandardValueRaw" : "true"
  }, {
    "attributes" : {
      "type" : "SecurityHealthCheckRisks",
      "url" : "/services/data/v47.0/tooling/sobjects/SecurityHealthCheckRisks/SessionSettings.clickjackVisualForceHeaders"
    },
    "DurableId" : "SessionSettings.clickjackVisualForceHeaders",
    "OrgValue" : "Disabled",
    "OrgValueRaw" : "false",
    "RiskType" : "HIGH_RISK",
    "SecurityHealthCheckId" : null,
    "Setting" : "Enable clickjack protection for customer Visualforce pages with standard headers",
    "SettingGroup" : "SessionSettings",
    "SettingRiskCategory" : "HIGH_RISK",
    "StandardValue" : "Enabled",
    "StandardValueRaw" : "true"
  }, {
    "attributes" : {
      "type" : "SecurityHealthCheckRisks",
      "url" : "/services/data/v47.0/tooling/sobjects/SecurityHealthCheckRisks/SessionSettings.clickjackVisualForceNoHeaders"
    },
    "DurableId" : "SessionSettings.clickjackVisualForceNoHeaders",
    "OrgValue" : "Disabled",
    "OrgValueRaw" : "false",
    "RiskType" : "HIGH_RISK",
    "SecurityHealthCheckId" : null,
    "Setting" : "Enable clickjack protection for customer Visualforce pages with headers disabled",
    "SettingGroup" : "SessionSettings",
    "SettingRiskCategory" : "HIGH_RISK",
    "StandardValue" : "Enabled",
    "StandardValueRaw" : "true"
  }, {
    "attributes" : {
      "type" : "SecurityHealthCheckRisks",
      "url" : "/services/data/v47.0/tooling/sobjects/SecurityHealthCheckRisks/SessionSettings.requireHttpOnly"
    },
    "DurableId" : "SessionSettings.requireHttpOnly",
    "OrgValue" : "Disabled",
    "OrgValueRaw" : "false",
    "RiskType" : "HIGH_RISK",
    "SecurityHealthCheckId" : null,
    "Setting" : "Require HttpOnly attribute",
    "SettingGroup" : "SessionSettings",
    "SettingRiskCategory" : "HIGH_RISK",
    "StandardValue" : "Enabled",
    "StandardValueRaw" : "true"
}]}
*/
}
