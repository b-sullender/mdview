# Makefile for installing md2html

INSTALL_DIR_ETC = /etc/md2html
INSTALL_DIR_NAUTILUS = /usr/share/nautilus-python/extensions

all:
	@echo "Use 'make install' to install md2html."

install:
	@echo "Creating directories..."
	mkdir -p $(INSTALL_DIR_ETC)
	mkdir -p $(INSTALL_DIR_NAUTILUS)
	@echo "Copying files..."
	cp source/md2html.php $(INSTALL_DIR_ETC)/md2html.php
	cp source/md2html.py $(INSTALL_DIR_NAUTILUS)/md2html.py
	@echo "Installation complete."

uninstall:
	@echo "Removing installed files..."
	rm -rf $(INSTALL_DIR_ETC)/md2html.php
	rm -rf $(INSTALL_DIR_NAUTILUS)/md2html.py
	@echo "Uninstall complete."
