param dataCollectionRuleName string
param vmName string

resource targetVm 'Microsoft.Compute/virtualMachines@2022-08-01' existing = {
  name: vmName
}


resource dcrAssociation 'Microsoft.Insights/dataCollectionRuleAssociations@2021-04-01' = {
  name: 'default'
  scope: targetVm
  properties: {
    dataCollectionRuleId: resourceId('Microsoft.Insights/dataCollectionRules', dataCollectionRuleName)
  }
}
