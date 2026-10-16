# Climax LNKOPT.MIP -- link option words read by STARTUP/SYSINIT/MLIST (data only; retail SLD run
# line 24 @8010DBD8; its line 35 is the zero-size end record at __last_orgend).  OPT_RamSize is the
# retail MAP's second name for the OPT_LinkerOpts word.  LNK_OrgAddress / LNK_StackSize are the
# retail link's own option symbols (LNK_RamSize = 2 megabytes, LNK_FileSys / LNK_DevKit / LNK_NoQuests);
# the RAM size and the free-memory size (RAM top - stack - first free byte) are link-time expressions
# over them, which PSYLINK evaluates; the GNU lane assembles them with the same values as `--defsym`s
# (tools/link_symbols.py).
	.rdata

	.globl	OPT_LinkerOpts
	.globl	OPT_RamSize
OPT_LinkerOpts:
OPT_RamSize:
	.word	LNK_RamSize*1048576
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
	.word	(LNK_RamSize*1048576+0x80000000)-LNK_StackSize-FirstFreeByte
	.globl	OPT_FileSystem
OPT_FileSystem:
	.word	LNK_FileSys
	.globl	OPT_DevKit
OPT_DevKit:
	.word	LNK_DevKit
	.globl	OPT_NoQuests
OPT_NoQuests:
	.word	LNK_NoQuests
