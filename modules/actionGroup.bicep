param name string
param email string

resource actionGroup 'Microsoft.Insights/actionGroups@2019-06-01' = {
  name: name
  location: 'global'
  properties: {
    groupShortName: 'critalert'
    enabled: true
    emailReceivers: [
      {
        name: 'admin-email'
        emailAddress: email
        useCommonAlertSchema: true
      }
    ]
  }
}

output id string = actionGroup.id
output actionGroupId string = actionGroup.id
