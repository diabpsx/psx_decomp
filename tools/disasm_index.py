"""Section-aware coordinates for GNU objdump symbols and disassembly labels."""
import re


def symbol_coordinates(text):
    result = {}
    for line in text.splitlines():
        fields = line.split()
        if len(fields) < 4 or not re.fullmatch(r'[0-9a-fA-F]{8}', fields[0]):
            continue
        section = fields[-3]
        if section.startswith('*'):
            continue  # undefined, absolute, file and common symbols are not code coordinates
        result[fields[-1]] = (section, fields[0].lower())
    return result


def label_coordinates(text):
    result, section = {}, None
    for line in text.splitlines():
        header = re.match(r'^Disassembly of section (.+):$', line)
        if header:
            section = header[1]
            continue
        label = re.match(r'^([0-9a-fA-F]{8}) <(.+)>:', line)
        if label and section is not None:
            result.setdefault((section, label[1].lower()), label[2])
    return result


def resolve_label(name, symbols, labels):
    coordinate = symbols.get(name)
    if coordinate is None:
        alias = re.match(r'^(.*)_[0-9a-f]{8}$', name)
        if alias:
            coordinate = symbols.get(alias[1])
    return labels.get(coordinate, name), coordinate[0] if coordinate else None
