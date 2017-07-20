import json, sys, yaml
print yaml.safe_dump(json.loads(" ".join([line for line in sys.stdin])))




