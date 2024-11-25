# 🖥️ **mdview**  
Effortlessly view your Markdown files in your web browser directly from GNOME Nautilus on Linux.  

✨ **How it works:**  
Right-click any `.md` file in Nautilus and select **"View in Browser"** to instantly open and render your Markdown content in your default browser.

---

## 🚀 **Features**  
- **Seamless Integration**: Adds a simple context menu option in GNOME Nautilus.  
- **Open-Source & Lightweight**: Built with simplicity and Linux-first design.

---

## 📦 **Dependencies**  

Ensure the following packages are installed:  

### For Debian-based systems:  
- **php**  
- **python3-nautilus**  
- **php-parsedown**  

Install them all at once with:  
```bash
sudo apt install -y php python3-nautilus php-parsedown
```

---

## 🛠️ **Installation**  

1. Clone the repository and navigate to the project folder.  
2. Install with:  
   ```bash
   sudo make install
   ```
3. Restart Nautilus to apply changes:  
   ```bash
   nautilus -q && nautilus
   ```

You're good to go! 🎉  

---

## ❌ **Uninstalling**  

Want to remove `mdview`? No problem!  
Simply run:  
```bash
sudo make uninstall
```

---

### 📜 **License**  
`mdview` is open-source software, licensed under the [MIT License](LICENSE). Contributions are welcome!  

---

💡 Let us know how you're using `mdview` or contribute to the project. Happy Markdowning!  

