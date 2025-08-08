param location string = resourceGroup().location
param logAnalyticsWorkspaceName string = 'la-${uniqueString(resourceGroup().id)}'
param dataCollectionRuleName string = 'dcr-vm-perf'
param actionGroupName string = 'ag-critical-alerts'
param actionGroupEmail string = 'admin@contoso.com'
param alertRuleName string = 'alert-vm-disk-memory'
//param virtualMachineName string

module laWorkspace 'modules/logAnalyticsWorkspace.bicep' = {
  name: 'laWorkspace'
  params: {
    name: logAnalyticsWorkspaceName
    location: location
  }
}

module dcr 'modules/dataCollectionRule.bicep' = {
  name: 'dcr'
  params: {
    name: dataCollectionRuleName
    location: location
    workspaceId: laWorkspace.outputs.id
  }
}

//module dcrAssoc 'modules/dcrAssociation.bicep' = {
//  name: 'dcrAssoc'
//  params: {
//    dataCollectionRuleName: dataCollectionRuleName
//    vmName: virtualMachineName
//  }
//}

module ag 'modules/actionGroup.bicep' = {
  name: 'ag'
  params: {
    name: actionGroupName
    email: actionGroupEmail
  }
}

module alert 'modules/alertRule.bicep' = {
  name: 'alert'
  params: {
    name: alertRuleName
    location: location
    workspaceId: laWorkspace.outputs.id
    actionGroupId: ag.outputs.id
    description: 'Alert when VM disk or memory usage exceeds threshold'
    query: 'Perf | where ObjectName == "LogicalDisk" or ObjectName == "Memory"'
    threshold: 80
  }
}
