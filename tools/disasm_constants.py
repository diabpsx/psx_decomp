"""Classify spimdisasm pseudo-labels for fixed literals in Diablo's oracles.

The loaded game images begin at 0x80010000. Synthetic KSEG0 anchors below
that address represent fixed low-RAM constants (including cached-pointer
field offsets), not relocatable symbols in a game image.
"""


def literal_dlabel_value(digits, addend=0):
    address = int(digits, 16)
    literal = len(digits) < 8 or not (0x80010000 <= address < 0xA0000000)
    return (address + addend) & 0xFFFFFFFF if literal else None
