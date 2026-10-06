# Climax LNKOPT.MIP -- link-time option words read by STARTUP/SYSINIT/MLIST (data only; retail SLD run
# line 24 @8010DBD8; its line 35 is the zero-size end record at __last_orgend). OPT_RamSize is the
# retail MAP's second name for the OPT_LinkerOpts word.
	.rdata

	.globl	OPT_LinkerOpts
	.globl	OPT_RamSize
OPT_LinkerOpts:
OPT_RamSize:
	.word	0x00200000
	.globl	OPT_StackSize
OPT_StackSize:
	.word	0x00001800
	.globl	OPT_OrgAddress
OPT_OrgAddress:
	.word	LNK_OrgAddress
	.globl	OPT_FreeMemStart
OPT_FreeMemStart:
	.word	FirstFreeByte
	.globl	OPT_FreeMemSize
OPT_FreeMemSize:
	.word	0x0009A9E0
	.globl	OPT_FileSystem
OPT_FileSystem:
	.word	1
	.globl	OPT_DevKit
OPT_DevKit:
	.word	1
	.globl	OPT_NoQuests
OPT_NoQuests:
	.word	0
