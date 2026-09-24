# Axion Landing Zone - Infrastructure as Code (IaC)

**Victor Global Services (VGS)** — Azure Infrastructure Provisioning using Terraform.

---

## 📌 Overview

This repository contains modularized **Terraform** configuration code for deploying and managing Azure Landing Zone infrastructure across environments (**Preprod**, **Prod**). The architecture utilizes dynamic maps and `for_each` meta-arguments in reusable Terraform modules to enable efficient, scalable infrastructure provisioning.

---

## 📁 Repository Structure

```text
AxionLandinZone/
├── Modules/
│   ├── AZ_Resource_Group/
│   │   ├── main.tf          # Resource Group definition using for_each loop
│   │   └── Provider.tf      # AzureRM provider configuration
│   └── AZ_Storage_Account/
│       ├── main.tf          # Storage Account definition using for_each loop
│       └── Provider.tf      # AzureRM provider configuration
├── Preprod/
│   ├── main.tf              # Pre-production environment module invocations
│   └── Terraform.tfvars     # Pre-production variable definitions
├── Prod/                    # Production environment folder
├── .gitignore               # Git ignore pattern for Terraform state files and credentials
└── README.md                # Project documentation
```

---

## 🚀 Reusable Modules

### 1. Resource Group Module (`Modules/AZ_Resource_Group`)
Provisions Azure Resource Groups dynamically from input map data (`m_rg`).

**Example Configuration:**
```hcl
preprod_rg = {
  rg1 = {
    name     = "rg1"
    location = "East US"
  }
  rg2 = {
    name     = "rg2"
    location = "East US"
  }
}
```

### 2. Storage Account Module (`Modules/AZ_Storage_Account`)
Provisions Azure Storage Accounts dynamically linked to designated resource groups from input map data (`m_sa`).

**Example Configuration:**
```hcl
preprod_sa = {
  sa1 = {
    name                     = "sa1"
    resource_group_name      = "rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
```

---

## 🛠️ Prerequisites

1. **[Terraform CLI](https://developer.hashicorp.com/terraform/downloads)** (v1.0.0 or higher)
2. **[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)** installed
3. Active **Microsoft Azure Subscription** with appropriate permissions (e.g., Contributor or Owner role)

---

## ⚙️ How to Deploy

### Step 1: Azure Authentication
Log in to your Azure account and select the target subscription:
```bash
az login
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
```

### Step 2: Navigate to Environment Directory
Change directory to the desired environment (e.g., `Preprod`):
```bash
cd Preprod
```

### Step 3: Initialize Terraform Directory
Initialize the environment directory to download the `azurerm` provider plugin:
```bash
terraform init
```

### Step 4: Preview Infrastructure Changes
Run `terraform plan` to inspect the resources to be created:
```bash
terraform plan -var-file="Terraform.tfvars"
```

### Step 5: Provision Resources
Apply the configuration to provision resources in Azure:
```bash
terraform apply -var-file="Terraform.tfvars"
```

---

## 🛡️ Security & Governance

- **State & Secrets Safety**: State files (`*.tfstate`), local lock files, and sensitive variable overrides are safely excluded from source control using [.gitignore](file:///D:/Devops/AxionLandinZone/.gitignore).
- **Backend Storage**: For collaborative and production deployments, configure a remote Azure Blob Storage backend for Terraform state locking and state encryption.
- **Credential Management**: Avoid hardcoding secrets or subscription IDs in `Provider.tf` files. Use Azure CLI session context or standard environment variables (`ARM_SUBSCRIPTION_ID`, `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`).

---

## 🏢 Maintainer

**Victor Global Services (VGS)**
