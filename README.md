# ✅ Linux System Hardening
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)


## 🎯 Aim
One of the core responsibilities of a Security Engineer is to harden a system. I aimed to manually secure a minimal Ubuntu Server installation by following the suggestions from the Lynis tool and through research of common hardening techniques.The end goal is to produce a hardened Linux server and automation scripts for replicating the process on other systems. This project focused on:

- Reducing attack surface
- Enforcing least privilege
- Strengthening SSH and network configurations
- Logging and Auditing 
- Automating updates and patching 

---

## 📋 About
The project:
- Hardens a default Ubuntu installation
- Follows Lynis recommendations
- Includes parsed before / after reports of the Lynis audits
- Provides automation scripts for replicating the process written in either Bash or Python depending on complexity

---

## 📂 Repository Structure

| Folder/File   | Description                                         |
|---------------|-----------------------------------------------------|
| [docs/](./docs)       | Contains my step-by-step guide and the checklist I followed |
| [scripts/](./scripts/)      | Bash and Python scripts for automating tasks |
| [configs/](./configs/)      | Example hardened configuration files |
| [assessments/](./assessments/) | Before/after Lynis and OpenSCAP reports |
| README.md     | Landing page |
| LICENSE       | Project License (MIT) |


## 🛠️ Features

- Manual Hardening: Followed suggestions from report step-by-step to better understand the changes I made
- Automation: Finalised scripts for automating each section e.g. harden_ssh.py

## 📜 License
This project is licensed under the MIT License.
