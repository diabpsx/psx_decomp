# Climax LNKOPT.MIP -- link option words read by STARTUP/SYSINIT/MLIST (data only; retail SLD run
# line 24 @8010DBD8; its line 35 is the zero-size end record at __last_orgend).  OPT_RamSize is the
# retail MAP's second name for the OPT_LinkerOpts word.  LNK_OrgAddress / LNK_StackSize are the
# retail link's own option symbols; the RAM size and the free-memory size (RAM top - stack - first
# free byte) are computed by the link as well (tools/link_symbols.py).
	.rdata

	.globl	OPT_LinkerOpts
	.globl	OPT_RamSize
OPT_LinkerOpts:
OPT_RamSize:
	.word	__lnk_ram_size
	.globl	OPT_StackSize
OPT_StackSize:
	.word	LNK_StackSize
	.globl	OPT_OrgAddress
OPT_OrgAddress:
	.word	LNK_OrgAddress
	.globl	OPT_FreeMemStart
OPT_FreeMemStart:
	.word	FirstFreeByte
	.globl	OPT_FreeMemSize
OPT_FreeMemSize:
	.word	__lnk_free_mem_size
	.globl	OPT_FileSystem
OPT_FileSystem:
	.word	1
	.globl	OPT_DevKit
OPT_DevKit:
	.word	1
	.globl	OPT_NoQuests
OPT_NoQuests:
	.word	0
