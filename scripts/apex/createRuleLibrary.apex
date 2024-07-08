/*
    WHAT: This script creates a Rule Library record for the Configurator usage type
    WHY: To enable Product Configuration Rules a related Rule Library needs to exist so it can create the RuleLibraryDefinition
        once the setting is enabled. When deploying with Data Tool this object is skipped.
    WHO: Derrick
    WHEN: June 2024
*/

String ruleApiName = 'RLM_Configurator_Rule_Library';

try {
    List<RuleLibrary> rules = [SELECT Id FROM RuleLibrary WHERE ApiName = :ruleApiName LIMIT 1];

    if(rules.isEmpty()) {
        RuleLibrary rule = new RuleLibrary();
        rule.Name = 'Configurator Rule Library';
        rule.ApiName = 'RLM_Configurator_Rule_Library';
        rule.UsageType = 'Configurator';
        rule.ContextDefinitionName = 'RLM_SalesTransactionContext';
        insert rule;
        System.debug(ruleApiName + ' Rule Library has been created');
    } else {
        System.debug(ruleApiName + ' Rule Library already exists');
    }
} catch (Exception e) {
    System.debug('createRuleLibrary error: ' + e.getMessage());
}