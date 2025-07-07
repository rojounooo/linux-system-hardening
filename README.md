# ✅ Linux System Hardening Project
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)


## 🎯 Aim
One of the core responsibilities of a Security Engineer is to harden a system. I aimed to manually secure a minimal Ubuntu Server installation by following the suggestions from security assessment tools and through research of common hardening techniques.The end goal is to produce a hardened Linux server and automation scripts for replicating the process on other systems. This project focused on:

- Reducing attack surface
- Enforcing least privilege
- Strengthening SSH and network configurations


---

## 📋 About
The project:
- Hardens a default Ubuntu installation
- Follows Lynis recommendations
- Includes parsed before / after reports of the Lynis and OpenSCAP scans
- Provides automation scripts for replicating the process written in Bash or Python

---

## 📂 Repository Structure

| Folder/File   | Description                                         |
|---------------|-----------------------------------------------------|
| [docs/](./docs)       | Contains my step-by-step guide and the checklist I followed |
| scripts/      | Bash and Python scripts for automating tasks       |
| configs/      | Example hardened configuration files               |
| assessments/  | Before/after Lynis and OpenSCAP reports            |
| README.md     | Landing page                                        |
| LICENSE       | Project License (MIT)                               |


## 🛠️ Features

- Manual Hardening: Followed suggestions from report step-by-step to better understand the changes I made
- Automation: Finalised scripts for automating each section e.g. harden_ssh.py

## 📜 License
This project is licensed under the MIT License.