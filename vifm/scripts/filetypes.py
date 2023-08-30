import os
import sys
import yaml

scriptdir = os.path.dirname(os.path.realpath(__file__))
sys.path.append(scriptdir)

FILETYPES = {}
with open(os.path.join(scriptdir, 'filetypes.yml'), 'r') as fh:
    FILETYPES = yaml.load(fh, yaml.loader.FullLoader)
