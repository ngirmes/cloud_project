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

## Environment Setup:
1. Create VE
2. Activcate VE: .venv\Scripts\activate
3. Install Azure CLI for easy authentication via `az login`
4. pip install -r requirements.txt

## Local Development Tools and Commands:
### Terraform
- terraform init
- terraform plan
- terraform apply
- terraform destroy

### Azure
- `Azurite: Start` (a *local* Azure Storage emulator)
- `az login` (Azure CLI command to connect to Azure, allows terraform commits)

### VS Code
- 'F5' (triggers debug mode, VS Code follows the settings in your launch.json file)



