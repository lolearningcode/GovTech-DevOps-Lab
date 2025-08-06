# 🛡️ Hardened Cloud Infrastructure for Federal Workloads

This project simulates a compliance-ready AWS infrastructure deployment using **Terraform**, **Ansible**, and **GitHub Actions**, aligned with federal cybersecurity best practices like **STIG**, **CIS**, **IAM least privilege**, and **NIST 800-53** controls.

---

## 🎯 Objective

To provision a secure, auditable, and hardened 3-tier architecture on AWS that could pass a **FISMA Low** or **FedRAMP Moderate** security review.

---

## 🧱 Stack

- **Terraform** — IaC for AWS infrastructure
- **Ansible** — CIS/STIG OS hardening (auditd, sshd, passwd policy)
- **GitHub Actions** — Secure CI pipeline with tfsec + OIDC auth
- **tfsec** + **Checkov** — IaC scanning
- **AWS** — VPC, EC2, ALB, IAM, S3, CloudTrail, KMS

---

## 🔐 Security + Compliance Features

| Control | Implementation |
|--------|----------------|
| **IAM Least Privilege** | Terraform IAM roles + scoped policies |
| **STIG/CIS Hardening** | Ansible role disables root login, enforces password policy, enables auditd |
| **Audit Logs** | CloudTrail enabled and sent to encrypted S3 |
| **Encryption** | KMS used for S3 and EBS |
| **IaC Scanning** | tfsec + Checkov run in CI pipeline |
| **CI/CD Hardening** | GitHub Actions uses OIDC (no long-lived keys) |

---

## 📁 Key Modules

### `terraform/`
- `main.tf`: VPC, subnets, ALB, EC2, IAM
- `iam.tf`: Custom IAM roles and policies
- `provider.tf`: AWS + backend config
- `outputs.tf`: Public IPs, ALB DNS
- `variables.tf`: Inputs for modularity

### `ansible/`
- `playbook.yml`: Applies hardening via roles
- `cis-hardening/`: Custom Ansible role based on CIS benchmarks

### `ci/`
- `github-actions.yml`: Runs tfsec, Ansible syntax check, Terraform plan/apply

---

## 🔄 CI/CD Pipeline Flow

1. Developer pushes to `main`
2. GitHub Actions triggers:
   - `tfsec` and `checkov` scans
   - Terraform plan/apply with OIDC-auth
   - Optional: Run Ansible playbook via SSH or EC2 user-data

---

## 📜 Compliance Mapping

| Framework | Controls |
|----------|----------|
| **NIST 800-53** | AC-2, AC-6, AU-9, SI-4, SC-12, SC-28 |
| **CIS Benchmark** | Level 1 hardening for Linux |
| **STIG** | Password policy, auditd, sshd settings |
| **FISMA Low** | Logging, access control, encryption |

---

## 🧠 Interview Talking Points

> “This repo simulates a 3-tier AWS architecture hardened with STIG/CIS via Ansible, secured with IAM least privilege, and CI/CD-integrated using tfsec and GitHub OIDC. It aligns with NIST 800-53 controls and is production-ready for FISMA Low environments.”

---

## 🚀 Future Add-Ons

- 🔐 Add AWS Config for drift detection
- 📊 Publish logs to CloudWatch with metric filters
- 🧪 Add InSpec or OpenSCAP compliance validation

---

## 👨‍💻 Author

Cleo Howard — Cloud & DevSecOps Engineer  
✅ Security+ (in progress) | AWS DevOps Certified | Clearance Eligible