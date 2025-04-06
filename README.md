# Instalador Automático - PaperMC 🧱

Script de instalação automática do servidor **PaperMC 1.21.4**, desenvolvido para **Ubuntu Server** com suporte multilíngue (Português, Inglês e Espanhol).

---

## 🌍 Idiomas Suportados

- 🇧🇷 Português
- 🇺🇸 English
- 🇪🇸 Español

---

## ⚙️ Requisitos

- Ubuntu Server (recomendado)
- Acesso à internet
- `curl`, `tar` e `ufw` instalados
- Pelo menos **2GB de RAM** disponível

---

## 🚀 O que o script faz:

✔️ Cria a pasta do servidor `Paper`  
✔️ Baixa e configura o **Java 21**  
✔️ Baixa a versão **PaperMC 1.21.4 (Build 222)**  
✔️ Detecta a quantidade de memória RAM e configura automaticamente  
✔️ Pergunta se o servidor será **para contas oficiais ou piratas**  
✔️ Cria os arquivos `start.sh`, `eula.txt` e `server.properties`  
✔️ Libera a porta **25565** no firewall (se possível) 
✔️ Sem erros!

---

## 💡 Como usar

### 1. Dê permissão de execução:
```bash
chmod +x install.sh
```
### 2. Rode o instalador:
```bash
./install.sh
```

---

e Pronto!! 
