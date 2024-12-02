# 🖥️ **mdview**  
Effortlessly view your Markdown files in your web browser directly from GNOME Nautilus on Linux.  

✨ **How it works:**  
Right-click any `.md` file in Nautilus and select **"View in Browser"** to instantly open and render your Markdown content in your default browser.  

⚡ **As simple as: Write → View → Print**  

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
- **php-parsedown-extra**  
- **highlight.js**  
- **mathjax**  

Install them all at once with:  
```bash
sudo apt install -y php python3-nautilus php-parsedown php-parsedown-extra libjs-highlight.js libjs-mathjax
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

## ⚙️ **Temporary File Handling**

When Markdown files are converted to HTML, they are saved as a temporary file in `/tmp`. As a result, refreshing the browser does not reflect any changes made to the Markdown file. To view updates, close the browser tab and reopen the Markdown file.

---

## 🏗️ **Building Debian Package**

If you wish to build a Debian package, follow these steps:

1. **Ensure the `rules` file is executable**:  
   ```bash
   sudo chmod +x debian/rules
   ```

2. **Build the package**:  
   - Without signing:  
     ```bash
     sudo dpkg-buildpackage -uc -us
     ```
   - With signing (replace `<KEY_ID>` with your GPG key ID):  
     ```bash
     sudo dpkg-buildpackage -k<KEY_ID>
     ```
     *To list your GPG keys, use `gpg --list-keys`.*

3. **Cleanup build files**:  
   After building the package, remove temporary files with:  
   ```bash
   sudo debclean
   ```
   *This ensures your workspace is clean and free of leftover build artifacts.*

### Notes:
- Ensure you use `sudo` for all commands.
- Your newly created package files will be in the parent directory.

---

### 📜 **License**  
`mdview` is open-source software, licensed under the [MIT License](LICENSE). Contributions are welcome!  

---

💡 Let us know how you're using `mdview` or contribute to the project. Happy Markdowning!  

