import os
import subprocess
from gi.repository import Nautilus, GObject
from typing import List
from pathlib import Path
from urllib.parse import unquote, urlparse

class ViewMarkdownExtension(GObject.GObject, Nautilus.MenuProvider):
    def _view_in_browser(self, file_path) -> None:
        php_script = "/etc/mdview/md2html.php"
        subprocess.Popen(["php", php_script, file_path])

    def menu_activate_cb(
        self,
        menu: Nautilus.MenuItem,
        file: Nautilus.FileInfo,
    ) -> None:
        file_uri = file.get_uri()
        file_path = unquote(urlparse(file_uri).path)
        self._view_in_browser(file_path)

    def get_file_items(
        self,
        files: List[Nautilus.FileInfo],
    ) -> List[Nautilus.MenuItem]:
        file = files[0]
        file_name = file.get_name()
        if not file_name.endswith(".md"):
            return []

        # Create a menu item
        item = Nautilus.MenuItem(
            name="ViewMarkdownInBrowser",
            label="View in Browser",
            tip="View this Markdown file in the browser"
        )
        item.connect("activate", self.menu_activate_cb, file)

        return [
            item,
        ]
