"""Generate unchanged shared-data scaffold fragments around PRIMPOOL's 20 bytes.

The original scaffold is retained. Only label boundaries are introduced;
no source-owned bytes are emitted by this generator.
"""
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def split(source):
    start = source.index('nonmatching ThisOt\n')
    finish = source.index('enddlabel AddrToAvoid', start) + len('enddlabel AddrToAvoid')
    selected = source[start:finish]
    for address in ('8011AAB4', '8011AAB8', '8011AABC', '8011AAC0', '8011AAC4', '8011AAC8'):
        if selected.count(address) != 1:
            raise ValueError('ambiguous PRIMPOOL boundary ' + address)
    tail = '    /* 10AAC8 8011AAC8 00000000 */ .word 0x00000000'
    if tail not in selected:
        raise ValueError('unexpected successor word')
    prefix = source[:start].rstrip() + '\n'
    suffix = ('.include "macro.inc"\n.section .sdata, "wa"\n\n'
              'dlabel D_8011AAC8\n' + tail + '\nenddlabel D_8011AAC8\n' + source[finish:])
    return prefix, suffix


def main():
    source = (ROOT/'asm/data/sdata.sdata.s').read_text()
    before, after = split(source)
    for name, text in [('sdata_before_primpool', before), ('sdata_after_primpool', after)]:
        (ROOT/'asm/data'/(name+'.sdata.s')).write_text(text)


if __name__ == '__main__':
    main()
