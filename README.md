# 🖥️ Log Archive Tool

A **Bash script** designed to automate log management by archiving log files, compressing them to save disk space, and enforcing retention policies, ideal for maintaining clean and organized Linux servers.

---

## ⚙️ Features

The `log-archive.sh` script provides:

- 📂 **Configurable Log Source Directory** — Defines a target log directory (`/var/log/myapp`) containing application log files to manage.
- 🗃️ **Automatic Archive Directory Creation** — Ensures the archive directory (`/var/log/archives`) exists before processing.
- 🕒 **Timestamped Archives** — Generates uniquely named `.tar.gz` files using a precise date-time format (`YYYYMMDDHHMMSS`).
- 📦 **Log Compression** — Compresses log files into `.tar.gz` archives to reduce disk usage.
- 🧹 **Old Log Detection** — Automatically finds `.log` files older than **7 days** using `find` and `mtime`.
- 🔐 **Safe File Handling** — Uses `-print0` and `xargs -0` to safely process files with spaces or special characters.
- ♻️ **Retention Policy Enforcement** — Deletes archived log files older than the configured retention period (**30 days**).
- 🧩 **Modular Function Design** — Separates responsibilities into reusable functions for clarity and maintainability.
- 📢 **Execution Feedback** — Prints clear status messages to indicate progress and completion time.

---

## 🚀 Usage

Clone the repository or manually copy the script to your server:

```bash
git clone https://github.com/Juaaanits/log-archive-tool.git
cd log-archive-tool
```

Make the script executable:

```bash
chmod +x log-archive-tool.sh
```

Run the script:

```bash
./log-archive-tool.sh
```

(Optional) Schedule with ``cron`` for automation:

```bash
./log-archive-tool.sh
```

---

## 📦 Requirements

- Linux-based system  
- Bash shell (`/bin/bash`)  
- Standard Unix utilities:
  - `find` 
  - `tar`
  - `xargs`
  - `mkdir`
  - `date`

---

## 🔗 Project Link

🌐 [Roadmap.sh Project Page](https://roadmap.sh/projects/log-archive-tool)

---

## 👤 Author

**Juanito M. Ramos II**  
[GitHub](https://github.com/Juaaanits)

---

## 📜 License

This project is licensed under the **MIT License**.

---

### ✅ Possible Enhancements (Optional)

- Add **dry-run mode** for safe testing
- Implement **logging to a separate audit file**
- Add **email or Slack notifications** on completion
- Parameterize retention days via CLI arguments
