param name string
param location string
param workspaceId string

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2021-09-01-preview' = {
  name: name
  location: location
  properties: {
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceId
          name: 'centralWorkspace'
        }
      ]
    }
    dataSources: {
      performanceCounters: [
        {
          name: 'diskPerf'
          streams: [
            'Microsoft-Perf'
          ]
          samplingFrequencyInSeconds: 60
          counterSpecifiers: [
            'LogicalDisk\\% Free Space'
            'LogicalDisk\\Free Megabytes'
          ]
        }
        {
          name: 'memoryPerf'
          streams: [
            'Microsoft-Perf'
          ]
          samplingFrequencyInSeconds: 60
          counterSpecifiers: [
            'Memory\\% Committed Bytes In Use'
            'Memory\\Available MBytes'
          ]
        }
        {
          name: 'cpuPerf'
          streams: [
            'Microsoft-Perf'
          ]
          samplingFrequencyInSeconds: 60
          counterSpecifiers: [
            'Processor\\% Processor Time'
          ]
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Microsoft-Perf'
        ]
        destinations: [
          'centralWorkspace'
        ]
        transformKql: 'source'
      }
    ]
  }
}

output id string = dataCollectionRule.id
