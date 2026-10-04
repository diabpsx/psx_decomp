# Climax BOOT.MIP -- the four-byte .boot_text word Wankpot = &__SN_ENTRY_POINT (80010F20).
# Ownership at 0x80010000-0x8001000F (rom/DIABPSX.MAP + retail SLD + raw image):
#   80010000-80010007  section `code`, group (default): D:\LIB\PSX\NULLFUNC.ASM lines 115-116
#                      (jr ra / addiu v0,zero,0 = alertbox), not BOOT.MIP.
#   80010008-8001000B  .boot_text, group boot_text: this file (Wankpot, word 0x80010F20).
#   8001000C-          .text: GTE.MIP (GTE_SetTransXYZ, recon/psxsrc/gte.s).  BOOT.MIP's only SLD
#                      record, line 34 @8001000C, carries no code: ASMPSX emits a line record at
#                      a section switch / an empty section, placed at that section's end, which
#                      here is the start of .text (measured with ASMPSX 2.34 + PSYLINK).
	.section .boot_text,"ax",@progbits

	.globl	Wankpot
Wankpot:
	.word	__SN_ENTRY_POINT
