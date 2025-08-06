# 🛡️ GovTech DevOps Lab

Welcome to the **GovTech DevOps Lab** — a hands-on portfolio of secure, automated, and compliance-aware infrastructure projects designed for federal cloud environments.

Each project demonstrates real-world skills required for U.S. Government contracts, including **FISMA**, **FedRAMP**, **CMMC**, and **NIST 800-53** compliance alignment.

Built using **Terraform**, **AWS**, **Ansible**, **GitHub Actions (OIDC)**, and security tools like **tfsec**, **Checkov**, and **Trivy**.

---

## 📦 Project Index

| Project | Description |
|--------|-------------|
| [`hardened-cloud-infra`](./hardened-cloud-infra) | 3-tier AWS infrastructure with STIG/CIS hardening, IAM least privilege, CloudTrail, and full IaC automation |
| [`incident-response-playbook`](./incident-response-playbook) | Simulated breach response with automated log collection, alerting, and forensics tooling |
| [`immutable-ci-cd`](./immutable-ci-cd) | Secure CI/CD pipeline for ECS with Docker image scanning, IAM lockdown, and Terraform |
| [`iam-access-governance`](./iam-access-governance) | Role-based IAM structure with MFA enforcement, audit trails, and periodic access review automation |
| [`secrets-zero-trust`](./secrets-zero-trust) | Secrets management using IAM-based access to SSM/Secrets Manager with optional Vault integration |

---

## 🎯 Why This Lab Matters

Federal systems require more than uptime and scale — they demand **security by design**.

These projects are built to show:

- Infrastructure-as-Code skills aligned with **government controls**
- Secure AWS deployments with **audit trails and zero trust**
- CI/CD pipelines that pass **compliance scanning and hardening**
- DevSecOps mindset from **design to deployment**

---

## 🧠 Who This Is For

- Cloud and DevOps Engineers targeting **GovTech roles**
- Candidates pursuing **Public Trust**, **Secret**, or **Top Secret** clearances
- Professionals transitioning into **federal contracting** or **cleared consulting**

---

## 🧰 Stack

- AWS (VPC, EC2, ECS, CloudTrail, GuardDuty, S3, KMS, IAM)
- Terraform + tfsec + Checkov
- Ansible (CIS/STIG hardening roles)
- GitHub Actions with OpenID Connect (OIDC)
- Docker + Trivy
- Lambda + EventBridge + SNS

---

## 🔒 Compliance Themes Covered

| Framework | Examples |
|----------|----------|
| **NIST 800-53** | AC-2, AC-6, AU-9, IR-4, SI-4, SC-12, SC-28 |
| **FedRAMP Moderate** | Logging, Encryption, IAM, CI/CD security |
| **CMMC Level 2** | IAM scope, secrets mgmt, audit controls |
| **CIS Benchmarks** | Linux EC2 hardening via Ansible |
| **STIG** | Password policy, auditd, root login disabled |

---

## 💬 Questions?

If you're a recruiter, hiring manager, or cleared team member and want to discuss these projects further, feel free to reach out via LinkedIn or email (contact info in project repos).

Let’s automate secure, compliant infrastructure — at scale.

---