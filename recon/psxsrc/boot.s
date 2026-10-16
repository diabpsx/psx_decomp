# BOOT -- Diablo PSX (Climax 1998): the boot word.  Retail links a four-byte .boot_text section (group boot_text,
# 0x80010008, MAP symbol Wankpot) holding the entry address, right after NULLFUNC.ASM's return-zero body.
	.section .boot_text,"a",@progbits
	.globl Wankpot
Wankpot:
	.word __SN_ENTRY_POINT
