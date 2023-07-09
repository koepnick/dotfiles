import subprocess
import os
import sys
import yaml

# This is pretty anemic at the moment
# We'll want some better error handling
# and security


class WofiTUI(object):
    config = {}
    menus = []
    current_level = {}

    class Command:
        tui = []
        pdf = []
        img = []

    def __init__(self, baselevel):
        self.load_config()
        if baselevel:
            self.current_level = next((x for x in self.config['menus']['items'] if x['title'] == baselevel))
        else:
            self.current_level = self.config['menus'] 

    def _selection_callback(self, selection):
        """
        Let's check to see if this selection has any children
        """
        self.current_level = next((x for x in self.current_level['items'] if x['title'] == selection))
        if 'items' in self.current_level:
            # We need to display a submenu
            submenus = []
            for item in self.current_level['items']:
                submenus.append(item['title'])
            self.display('\n'.join(submenus))
        elif 'action' in self.current_level:
            action = self.current_level['action']
            match action:
                case 'pdf':
                    path = os.path.join(self.config['commands']['pdf']['basedir'], self.current_level['path'])
                    subprocess.run(self.Command.pdf + [path])
                case 'command':
                    subprocess.run(self.current_level['command'].split(' '))
                case 'tui':
                    subprocess.run(["alacritty", "--class", "AlacrittyTUI", "--command", self.current_level['command']])
                case 'img':
                    path = os.path.join(self.config['commands']['img']['basedir'], self.current_level['path'])
                    subprocess.run(self.Command.img + [path])

            print(self.current_level['action'])



    def display_base(self):
        menus = []
        [menus.append(menu['title']) for menu in self.current_level['items']]
        self.display("\n".join(menus))


    def display(self, input):
        proc = subprocess.run(["wofi", "--show", "dmenu"], input=input, text=True, capture_output=True)
        selection = proc.stdout.strip()
        # category = next((x for x in self.menus if x['category'] == category_text))
        self._selection_callback(selection)
        

    def load_config(self, path='/home/skoepnick/.config/wofi/scripts/config.yml'):
        with open(path) as fh:
            self.config = yaml.load(fh.read(), Loader=yaml.SafeLoader)
            self.menus = self.config['menus']
            self.Command.tui = self.config['commands']['tui']['command'].split(' ')
            self.Command.pdf = self.config['commands']['pdf']['command'].split(' ')
            self.Command.img = self.config['commands']['img']['command'].split(' ')

    def tui(self, cmd):
        proc = subprocess.run(["alacritty", "--class", "AlacrittyTUI", "--command", cmd])


if __name__ == "__main__":
    try:
        baselevel = sys.argv[1]
    except:
        baselevel = ""
    tui = WofiTUI(baselevel)
    tui.display_base()
