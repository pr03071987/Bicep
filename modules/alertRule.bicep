param name string
param location string
param workspaceId string
param actionGroupId string
param description string
param query string
param threshold int
param operator string = 'GreaterThan' // Optional, default to GreaterThan

resource alert 'Microsoft.Insights/scheduledQueryRules@2021-08-01' = {
  name: name
  location: location
  properties: {
    description: description
    severity: 2
    enabled: true
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: [
      workspaceId
    ]
    criteria: {
      allOf: [
        {
          query: query
          timeAggregation: 'Average'
          metricMeasureColumn: 'CounterValue'
          dimensions: []
          operator: operator
          threshold: threshold
          failingPeriods: {
            numberOfEvaluationPeriods: 1
            minFailingPeriodsToAlert: 1
          }
        }
      ]
    }
    actions: {
      actionGroups: [
        actionGroupId
      ]
    }
    autoMitigate: false
  }
}
