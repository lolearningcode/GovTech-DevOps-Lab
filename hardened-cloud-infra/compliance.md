# 🛡️ Compliance Report: CIS/STIG Hardening for EC2

## Overview

This project automates the application of **CIS Benchmarks** and **STIG-aligned security controls** on Amazon EC2 instances using **Infrastructure as Code (Terraform)** and **Configuration as Code (Ansible)**. The automation is triggered via **AWS Systems Manager (SSM)** and logs are streamed to **Amazon CloudWatch** for auditability.

---

## Security Frameworks Implemented

| Standard         | Coverage     | Method                         |
|------------------|--------------|--------------------------------|
| CIS Ubuntu 22.04 Benchmark | Full Sections 1–7 | Ansible Role: `ansible-lockdown.UBUNTU22-CIS` |
| DISA STIG Mapping | Partial (via CIS) | Aligned through community-maintained Ansible role |
| NIST 800-53       | Indirect      | Controls indirectly supported via CIS/STIG baseline |

---

## Compliance-as-Code Components

### ✅ Terraform

- Provisions EC2 with proper IAM roles for SSM execution.
- Boots SSM automation document (`cis-bootstrap.json`) to invoke hardening playbook.

### ✅ AWS SSM Document (`cis-bootstrap.json`)

- Uses `aws:runShellScript` to:
  - Install Ansible & dependencies in a virtual environment.
  - Download a zip file containing the hardened playbook.
  - Execute the playbook locally on the EC2 instance.

### ✅ Ansible

- Role: [`ansible-lockdown.UBUNTU22-CIS`](https://galaxy.ansible.com/ansible-lockdown/UBUNTU22-CIS)
- Sections executed:
  - Initial Setup
  - Services
  - Network Configuration
  - Logging and Auditing
  - Permissions and Auth
  - System Maintenance
  - SSH Config

### ✅ Logging & Audit Trail

- Output from the Ansible playbook is stored locally at `/tmp/ansible-output.log`.
- SSM session logs are streamed to **Amazon CloudWatch Logs** under `/ssm/cis-playbook`.

---

## Evidence of Compliance

- ✅ Successful execution logs in `/tmp/ansible-output.log`
- ✅ Real-time logs available in CloudWatch (`stdout`, `stderr`)
- ✅ Terraform state managed securely
- ✅ EC2 connected to SSM with appropriate IAM permissions
- ✅ Ansible playbook mapped to CIS benchmarks

---

## Future Work

- Add automated STIG validation using:
  - **InSpec**
  - **OpenSCAP**
- Integrate with:
  - **AWS Config conformance packs**
  - **AWS Security Hub**
- Store logs in S3 for long-term archival
- Generate machine-readable compliance evidence (e.g., JSON, JUnit XML)

---

## Compliance Contact

**Engineer:** Cleo Howard  
**Project:** GovTech Hardened Cloud Infra Lab  
**Date:** August 2025  
**Purpose:** DevSecOps Automation for Government Cloud Compliance Projects