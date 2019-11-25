#!/usr/bin/env python3
from jinja2 import Template
import yaml, sys
if len(sys.argv) < 3:
    print(f"usage: {sys.argv[0]} <j2 file> <yml file>")
    sys.exit(1)
print(Template(open(sys.argv[1],"r").read()).render(yaml.load(open(sys.argv[2],"r"), Loader=yaml.FullLoader)))
