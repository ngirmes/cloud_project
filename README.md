# Project Summary
Build a **serverless web app** on **Azure**, integrating with cloud services like **Azure Functions** and **Azure Cosmos DB**. Use **Terraform** for Infrastructure as Code (IaC) and **GitHub Actions** for Continuous Integration/Continuous Deployment (CI/CD) automation.

## Goals:
- Create a basic Flask API ✔️
- Morphe Flask API into an Azure Function ✔️
- Create an Azure Cosmos DB (Core(SQL)) resource ✔️
- Create function app endpoints to emulate Wordle
- Ensure appropriate data storage with encryption
- Automate all Azure resource creation with Terraform
- Learn about GitHub actions

## First Time Environment Setup:
1. Create VE
2. Activcate VE: .venv\Scripts\activate
3. `choco install terraform`
4. Install Azure CLI for easy authentication via `az login`
5. Create a service principle (SP): `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>`
   
   - a SP is an identity created in Azure Active Directory (AAD) specifically for applications, tools, or scripts (like Terraform) to access Azure resources programmatically
     
6. Set ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, and ARM_TENANT_ID as environment variables 
7. Install Azure Functions Core Tools (either through VS Code or web)
8. `func init MyProjFolder --worker-runtime python --model V2` (creates a Python project that uses the desired programming model version)
   

## Development Tools and Commands:
### Terraform
- `terraform init`
- `terraform fmt` (automatically updates configurations in the current directory for readability and consistency.)
- `terraform validate` (makes sure your configuration is syntactically valid and internally consistent)
- `terraform plan`
- `terraform apply`
- `terraform destroy`

### Azure
#### Authentication
- `Azurite: Start` (a *local* Azure Storage emulator)
- `az login` (Azure CLI command to connect to Azure, allows terraform commits)
#### Functions Core Tools
- `func init`
- `func start`
- `func new --template "Http Trigger" --name MyHttpTrigger` (for creating new functions)
### VS Code
- 'F5' (triggers debug mode, VS Code follows the settings in your launch.json file)



