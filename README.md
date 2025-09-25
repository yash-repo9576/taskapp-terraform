# Jenkins CI/CD Server on AWS with Terraform

This project provisions a Jenkins server on AWS EC2 using Terraform. It automates the setup of Jenkins, Docker, and all required dependencies, making it easy to deploy a production-ready CI/CD environment.

## Features

- **Jenkins**: Automated installation and setup.
- **Docker**: Installed and configured for Jenkins and Ubuntu user.
- **Security Groups**: SSH, HTTP, and Jenkins UI ports are open to a specified IP.
- **Ubuntu 24.04 LTS**: Uses the latest Canonical AMI.
- **User Data**: Bootstraps the instance with all necessary packages.

## Files

- [`main.tf`](main.tf): Main Terraform configuration for resources.
- [`variables.tf`](variables.tf): Input variables for customization.
- [`outputs.tf`](outputs.tf): Outputs such as public IP and Jenkins URL.
- [`provider.tf`](provider.tf): AWS provider configuration.
- [`userdata.sh`](userdata.sh): Bash script for instance initialization.

## Usage

1. **Configure AWS Credentials**  
   Ensure your AWS credentials are set in your environment.

2. **Customize Variables**  
   Edit [`variables.tf`](variables.tf) to set your key name and other parameters.

3. **Initialize Terraform**
   ```sh
   terraform init
   ```

4. **Apply the Configuration**
   ```sh
   terraform apply
   ```
   Review the plan and confirm.

5. **Access Jenkins**
   - Find the Jenkins URL in the Terraform output or [`terraform.tfstate`](terraform.tfstate).
   - Open `http://<jenkins_public_ip>:8080` in your browser.

## Security

- Change the `cidr_blocks` in [`main.tf`](main.tf) to restrict/allow access as needed.

## Customization

- Change `instance_type`, `project_name`, or other variables in [`variables.tf`](variables.tf).
- Modify [`userdata.sh`](userdata.sh) to install additional packages or customize Jenkins setup.

## Clean Up

To destroy all resources:
```sh
terraform destroy
```

---

**Powered by Terraform & AWS**