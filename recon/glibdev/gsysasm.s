# GSYSASM.ASM -- Climax GLIB: the FirstFreeByte word, sole member of the retail link's `last` group
# (rom/DIABPSX.MAP: .last = 4 bytes at 0x80163E20, placed after the largest LUMP overlay; no image file
# contains it, so the word exists only in RAM and in the link symbols). GSYS.C/EACLIB reach it as an extern.
	.section .last
	.globl FirstFreeByte
	.globl hahha
FirstFreeByte:
hahha:
	.word 0
