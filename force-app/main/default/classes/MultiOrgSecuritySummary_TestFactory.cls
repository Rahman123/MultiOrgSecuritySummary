@isTest
public with sharing class MultiOrgSecuritySummary_TestFactory {
  public static void setUpDefaultThisOrgData(Date dt) {
    createDailyOrgSummary(dt);
    createSecurityHealthCheckOrgWithId(dt);
    multioss__Security_Skill__c securitySkill = createSecuritySkill();
    createAdminSecuritySkill(securitySkill.Id);
  }

  /* Create a default set of data, including the org record */
  public static MultiOrgSecuritySummaryService.DailyOrgSummary createDailyOrgSummary(
    Date dt
  ) {
    MultiOrgSecuritySummaryService.DailyOrgSummary dos = new MultiOrgSecuritySummaryService.DailyOrgSummary();
    dos.org = createSecurityHealthCheckOrg(dt);
    dos.healthCheck = createSecurityHealthCheckAndRisks(dos.org, dt, 'This');

    return dos;
  }

  public static Security_Health_Check_Org__c createSecurityHealthCheckOrg(
    Date dt
  ) {
    List<multioss__Security_Health_Check_Config__mdt> securityHealthCheckConfigs = [
      SELECT Id, multioss__Token__c
      FROM multioss__Security_Health_Check_Config__mdt
      LIMIT 1
    ];
    multioss__Security_Health_Check_Config__mdt securityHealthCheckConfig = (securityHealthCheckConfigs.size() ==
      1)
      ? securityHealthCheckConfigs.get(0)
      : null;

    Security_Health_Check_Org__c shco = new Security_Health_Check_Org__c();
    shco.multioss__Organization_Id__c = '1234556789012345';
    shco.multioss__Token__c = securityHealthCheckConfig.multioss__Token__c;
    shco.multioss__Refresh_Token__c = false;
    shco.Name = 'Demo Org 1';
    shco.Active__c = true;
    shco.Category__c = 'Production';
    shco.Description__c = 'This is a demo org';
    insert shco;
    return shco;
  }

  public static Security_Health_Check_Org__c createSecurityHealthCheckOrgWithId(
    Date dt
  ) {
    List<Organization> organizations = [SELECT Id FROM Organization LIMIT 1];
    Organization organization = (organizations.size() == 1)
      ? organizations.get(0)
      : null;

    Security_Health_Check_Org__c shco = new Security_Health_Check_Org__c();
    shco.multioss__Organization_Id__c = organization.Id;
    shco.multioss__Token__c = '12345678';
    shco.Name = 'Demo Org 1';
    shco.Active__c = true;
    shco.Category__c = 'Production';
    shco.Description__c = 'This is a demo org';
    insert shco;
    return shco;
  }

  public static Security_Health_Check__c createSecurityHealthCheckAndRisks(
    Security_Health_Check_Org__c shco,
    date dt,
    String source
  ) {
    Security_Health_Check__c shc = new Security_Health_Check__c();

    shc.Check_Date__c = dt;
    shc.CustomBaselineId__c = '0';
    shc.DurableId__c = '0';
    shc.Org_Identifier__c = shco.Organization_Id__c;
    shc.Org_Name__c = shco.Name;
    shc.Previous_Score__c = 50;
    shc.Score__c = 70;
    shc.Security_Health_Check_Org__c = shco.Id;
    shc.Source__c = source;

    insert shc;

    // Now create the risks
    List<Security_Health_Check_Risk__c> risks = new List<Security_Health_Check_Risk__c>{
      new Security_Health_Check_Risk__c(
        DurableId__c = 'SessionSettings.enableSmsIdentity',
        OrgValue__c = 'Disabled',
        OrgValueRaw__c = 'false',
        RiskType__c = 'HIGH_RISK',
        Security_Health_Check__c = shc.Id,
        Setting__c = 'Let users verify their identity',
        SettingGroup__c = 'SessionSettings',
        SettingRiskCategory__c = 'HIGH_RISK',
        StandardValue__c = 'Enabled',
        StandardValueRaw__c = 'true'
      )
    };
    insert risks;

    return shc;
  }

  public static multioss__Security_Skill__c createSecuritySkill() {
    multioss__Security_Skill__c skill = new multioss__Security_Skill__c();

    skill.Name = 'Test';
    skill.multioss__Description__c = 'test';
    skill.multioss__Image_Path__c = 'testimagetestimagetestimagetestimage.png';
    skill.multioss__Point_Value__c = 10;

    insert skill;

    return skill;
  }

  public static multioss__Admin_Security_Skill__c createAdminSecuritySkill(
    Id skillId
  ) {
    multioss__Admin_Security_Skill__c adminSecuritySkill = new multioss__Admin_Security_Skill__c();

    adminSecuritySkill.multioss__Security_Skill__c = skillId;
    adminSecuritySkill.multioss__User__c = UserInfo.getUserId();

    insert adminSecuritySkill;

    return adminSecuritySkill;
  }
}
