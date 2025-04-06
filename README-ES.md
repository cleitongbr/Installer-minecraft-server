# Instalador Automático - PaperMC 🧱

Script de instalación automática para **PaperMC 1.21.4**, desarrollado para **Ubuntu Server** con soporte multilenguaje (Portugués, Inglés y Español).

---

## 🌍 Idiomas Soportados

- 🇧🇷 Portugués  
- 🇺🇸 Inglés  
- 🇪🇸 Español  

---

## ⚙️ Requisitos

- Ubuntu Server (recomendado)  
- Acceso a internet  
- `curl`, `tar` y `ufw` instalados  
- Al menos **2GB de RAM** disponibles  

---

## 🚀 ¿Qué Hace el Script?

✔️ Crea la carpeta del servidor `Paper`  
✔️ Descarga y configura **Java 21**  
✔️ Descarga **PaperMC 1.21.4 (Build 222)**  
✔️ Detecta la cantidad de RAM y configura automáticamente  
✔️ Pregunta si el servidor será **premium o no premium (pirata)**  
✔️ Crea los archivos `start.sh`, `eula.txt` y `server.properties`  
✔️ Abre el puerto **25565** en el firewall (si es posible)  
✔️ ¡Sin errores!

---

## 💡 ¿Cómo Usarlo?

### 1. Dar permiso de ejecución:
```bash
chmod +x install.sh
```
### 2. Ejecutar el instalador:
```bash
./install.sh
```
---
🎉 ¡Listo! ¡Tu servidor está funcionando! 
