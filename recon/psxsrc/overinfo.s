# Climax OVERINFO.MIP -- overlay load addresses and sizes (data only; retail SLD run line 27 @8010DBAC).
# Every word is a PSYLINK group symbol: the overlays (FRONTEND, PREGAME, GAME, FMV) all load at the
# overlay buffer that follows the main image's bss, the empty MEMCARD group sits after `.last`, and
# the sizes are the groups' `_size` records.  The link computes them (tools/link_symbols.py).
	.rdata

	.globl	OVR_LoadAddress
OVR_LoadAddress:
	.word	_frontend_text_org
	.globl	OVR_FrontEndAddress
OVR_FrontEndAddress:
	.word	_frontend_text_org
	.globl	OVR_PregameAddress
OVR_PregameAddress:
	.word	_pregame_text_org
	.globl	OVR_GameAddress
OVR_GameAddress:
	.word	_game_text_org
	.globl	OVR_MemCardAddress
OVR_MemCardAddress:
	.word	_memcard_text_org
	.globl	OVR_FmvAddress
OVR_FmvAddress:
	.word	_fmv_text_org
	.globl	OVR_FrontEndSize
OVR_FrontEndSize:
	.word	_frontend_text_size
	.globl	OVR_PregameSize
OVR_PregameSize:
	.word	_pregame_text_size
	.globl	OVR_GameSize
OVR_GameSize:
	.word	_game_text_size
	.globl	OVR_MemCardSize
OVR_MemCardSize:
	.word	_memcard_text_size
	.globl	OVR_FmvSize
OVR_FmvSize:
	.word	_fmv_text_size
