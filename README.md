# Automatic Installer - PaperMC 🧱

Automatic installation script for **PaperMC 1.21.4**, designed for **Ubuntu Server** with multilingual support (Portuguese, English, and Spanish).

---

## 🌍 Supported Languages

- 🇧🇷 Portuguese  
- 🇺🇸 English  
- 🇪🇸 Spanish  

---

## ⚙️ Requirements

- Ubuntu Server (recommended)  
- Internet access  
- `curl`, `tar`, and `ufw` installed  
- At least **2GB of RAM** available  

---

## 🚀 What the Script Does

✔️ Creates the `Paper` server folder  
✔️ Downloads and configures **Java 21**  
✔️ Downloads **PaperMC 1.21.4 (Build 222)**  
✔️ Detects available RAM and configures automatically  
✔️ Asks if the server will be **online (premium) or cracked**  
✔️ Creates `start.sh`, `eula.txt`, and `server.properties`  
✔️ Opens port **25565** in the firewall (if possible)  
✔️ No errors!

---

## 💡 How to Use

### 1. Give execution permission:
```bash
chmod +x install.sh
```
### 2. Run the installer:
```bash
./install.sh
```
---

🎉 Done! Your server is ready to go!
