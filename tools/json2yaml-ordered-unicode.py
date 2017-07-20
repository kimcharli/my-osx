import sys
import yaml
import json
from collections import OrderedDict

#class UnsortableList(list):
#    def sort(self, *args, **kwargs):
#        pass
#
#class UnsortableOrderedDict(OrderedDict):
#    def items(self, *args, **kwargs):
#        return UnsortableList(OrderedDict.items(self, *args, **kwargs))
#
#yaml.add_representer(UnsortableOrderedDict, yaml.representer.SafeRepresenter.represent_dict)

# http://www.yaml.org/refcard.html
# http://pyyaml.org/wiki/PyYAML
# http://www.yaml.org/spec/


def order_rep(dumper, data):
    return dumper.represent_mapping(u'tag:yaml.org,2002:map', data.items(), flow_style=False)
yaml.add_representer(OrderedDict, order_rep)

def unicode_representer(dumper, uni):
    node = yaml.ScalarNode(tag=u'tag:yaml.org,2002:str', value=uni)
    return node
yaml.add_representer(unicode, unicode_representer)

j = json.loads(" ".join([line for line in sys.stdin]), object_pairs_hook=OrderedDict)
print yaml.dump(j, default_flow_style=False)



