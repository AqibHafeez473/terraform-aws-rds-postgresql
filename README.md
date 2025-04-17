# terraform-aws-rds-postgresql
A Terraform-based infrastructure setup to provision an Amazon RDS PostgreSQL instance on AWS. This project automates database deployment, ensuring a scalable and secure environment for modern cloud applications.


# 🚀 Terraform AWS RDS PostgreSQL Setup

This project provisions an Amazon RDS PostgreSQL instance on AWS using Terraform. It helps developers and DevOps engineers automate the creation of a secure and scalable PostgreSQL database on AWS.

## 📦 Features
- ✅ Automatically sets up an RDS PostgreSQL instance
- 🔐 Configures security groups for secure access
- ⚙️ Customizable via variables
- ☁️ Infrastructure as Code using Terraform
- 📈 Ready for production and scalable environments

## 🛠️ Technologies Used
- **Terraform** – For Infrastructure as Code (IaC)
- **Amazon Web Services (AWS)** – Cloud provider
- **PostgreSQL** – Open-source relational database

## 📂 Project Structure
```plaintext
terraform-aws-rds-postgresql/
│
├── main.tf            → Core RDS PostgreSQL resource definition
├── variables.tf       → Input variables used across the setup
├── outputs.tf         → Output values after deployment (e.g., endpoint)
├── provider.tf        → AWS provider setup and region config
├── terraform.tfvars   → Actual values assigned to variables
├── .gitignore         → Ignored files (e.g., tfstate, secrets)
└── README.md          → Project overview and usage guide

