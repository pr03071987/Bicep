# Azure Monitoring Framework

This project provides a framework for deploying Azure monitoring resources using Bicep templates. It includes the following components:

## Components

1. **Log Analytics Workspace**: A workspace for collecting and analyzing log data.
   - Defined in: `modules/logAnalyticsWorkspace.bicep`

2. **Data Collection Rule (DCR)**: A rule for collecting disk and memory metrics from virtual machines.
   - Defined in: `modules/dataCollectionRule.bicep`

3. **DCR Association**: Associates the Data Collection Rule with a specified virtual machine.
   - Defined in: `modules/dcrAssociation.bicep`

4. **Action Group**: A group that includes an email receiver for notifications.
   - Defined in: `modules/actionGroup.bicep`

5. **Log-based Alert Rule**: An alert rule that uses KQL to evaluate log data and trigger alerts based on specified conditions.
   - Defined in: `modules/logAlertRule.bicep`

## Deployment Instructions

1. **Prerequisites**:
   - Ensure you have the Azure CLI installed and configured.
   - Install Bicep CLI if not already installed.

2. **Parameters**:
   - Customize the `parameters.json` file to set resource properties such as names, locations, and other settings.

3. **Deployment**:
   - Use the following command to deploy the resources defined in `main.bicep`:
     ```
     az deployment group create --resource-group <your-resource-group> --template-file main.bicep --parameters parameters.json
     ```

## Resource Descriptions

- **Log Analytics Workspace**: Centralized location for log data.
- **Data Collection Rule**: Specifies what data to collect from the virtual machine.
- **DCR Association**: Links the DCR to the virtual machine for data collection.
- **Action Group**: Defines how notifications are sent when alerts are triggered.
- **Log-based Alert Rule**: Monitors log data and triggers alerts based on defined criteria.

## Additional Information

For more details on each component, refer to the respective Bicep module files in the `modules` directory.