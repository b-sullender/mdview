# Makefile for installing mdview

INSTALL_DIR_ETC = /etc/mdview
INSTALL_DIR_NAUTILUS = /usr/share/nautilus-python/extensions

# Variable for changing root installation directory (e.g., alternate root environments)
DESTDIR =

all:
	@echo "Use 'sudo make install' to install mdview."

install:
	@if [ "$$(id -u)" -ne 0 ]; then echo "Please run as root 'sudo make install'"; exit 1; fi
	@echo "Creating directories..."
	install -d $(DESTDIR)$(INSTALL_DIR_ETC)
	install -d $(DESTDIR)$(INSTALL_DIR_NAUTILUS)
	@echo "Installing files..."
	install -m 755 source/md2html.php $(DESTDIR)$(INSTALL_DIR_ETC)/md2html.php
	install -m 644 source/style.css $(DESTDIR)$(INSTALL_DIR_ETC)/style.css
	install -m 755 source/mdview.py $(DESTDIR)$(INSTALL_DIR_NAUTILUS)/mdview.py
	install -m 644 VERSION $(DESTDIR)$(INSTALL_DIR_ETC)/VERSION
	install -m 644 LICENSE $(DESTDIR)$(INSTALL_DIR_ETC)/LICENSE
	@echo "Installation complete."

uninstall:
	@if [ "$$(id -u)" -ne 0 ]; then echo "Please run as root 'sudo make uninstall'"; exit 1; fi
	@echo "Removing installed files..."
	rm -rf $(DESTDIR)$(INSTALL_DIR_ETC)/md2html.php
	rm -rf $(DESTDIR)$(INSTALL_DIR_ETC)/style.css
	rm -rf $(DESTDIR)$(INSTALL_DIR_NAUTILUS)/mdview.py
	rm -rf $(DESTDIR)$(INSTALL_DIR_ETC)/VERSION
	rm -rf $(DESTDIR)$(INSTALL_DIR_ETC)/LICENSE
	@echo "Uninstall complete."
