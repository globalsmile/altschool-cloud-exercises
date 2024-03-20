# Terraform AWS Deployment with Ansible and Docker Setup
This repository contains Terraform configurations to deploy AWS instances in multiple regions with Ansible and Docker setup. The infrastructure is modularized, reusable, and can be deployed to different environments (e.g., dev, prod).

# Prerequisites
Before you begin, ensure you have the following installed:

- Terraform
- AWS CLI
- Git
Make sure you have AWS credentials configured either through environment variables or AWS CLI.

# Directory Structure
```
root/
  ├── main.tf
  ├── variables.tf
  ├── vpc/
  │   ├── main.tf
  │   ├── variables.tf
  │   └── outputs.tf
  ├── instances/
  │   ├── main.tf
  │   ├── variables.tf
  │   └── scripts/
  │       └── user_data.sh
  └── environments/
      ├── dev/
      │   └── main.tfvars
      └── prod/
          └── main.tfvars
```

# Usage
Clone Repository: Clone this repository to your local machine.

Navigate to Terraform Directory: cd into the terraform directory.

Initialize Terraform: Run terraform init to initialize the working directory.

Choose Environment: Navigate to the desired environment directory (dev or prod).

Deploy Infrastructure: Run terraform apply -var-file=main.tfvars to create infrastructure in the chosen environment.

Access Instances: Once deployment is complete, you can access the deployed instances using SSH.

# Customization
Modify variables.tf to adjust variables such as regions, instance types, AMIs, etc.
Customize user_data.sh script in instances/scripts/ directory to include additional setup for Ansible and Docker if needed.

# Cleanup
To clean up and destroy all resources created by Terraform, run:
```
terraform destroy -var-file=main.tfvars
```

# Contributing
Contributions are welcome! Feel free to open issues or pull requests for any improvements or suggestions.

