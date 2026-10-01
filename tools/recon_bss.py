"""Explicit zero-fill placement of unchanged conventional source sections."""
import re


def placements(registry, sources, start, end):
    if not isinstance(registry, dict):
        raise ValueError('source BSS registry must be an owner mapping')
    result = []
    for owner, sections in registry.items():
        if owner not in sources or not re.fullmatch(r'\w+', owner) or not isinstance(sections, dict) or not sections:
            raise ValueError('BSS owner must be a selected conventional source TU')
        for section, row in sections.items():
            if section not in ('.sbss', '.bss') or not isinstance(row, dict):
                raise ValueError('only complete BSS sections may be placed here')
            value, size = row.get('va'), row.get('size')
            if not isinstance(value, str) or not re.fullmatch(r'0x[0-9a-fA-F]+', value):
                raise ValueError('BSS address must be explicit hexadecimal')
            address = int(value, 16)
            if type(size) is not int or size <= 0 or address % 4 or not start <= address < address + size <= end:
                raise ValueError('source BSS is outside the runtime zero-fill region')
            symbols = row.get('symbols', {})
            if not isinstance(symbols, dict) or any(not re.fullmatch(r'\w+', name) or type(offset) is not int
                                                   or not 0 <= offset < size for name, offset in symbols.items()):
                raise ValueError('invalid source BSS symbol offsets')
            result.append((address, size, owner, section))
    result.sort()
    if any(a + n > b for (a, n, _, _), (b, _, _, _) in zip(result, result[1:])):
        raise ValueError('overlapping conventional source BSS')
    return result


def validate_object(elf, sections):
    for name, row in sections.items():
        if name not in ('.bss', '.sbss') or elf.names.count(name) != 1:
            raise ValueError('missing or ambiguous source BSS section')
        section = elf.sections[elf.names.index(name)]
        if type(row.get('size')) is not int or row['size'] <= 0 or section[1] != 8 or section[2] & 3 != 3 or section[5] != row['size']:
            raise ValueError('source BSS must be exact-sized allocated NOBITS storage')
        for symbol, offset in row.get('symbols', {}).items():
            values = [value for table in elf.symbols.values() for nm, value, size, info, other, index in table
                      if nm == symbol and index == elf.names.index(name)]
            if values != [offset]:
                raise ValueError('source BSS symbol offset differs: ' + symbol)
