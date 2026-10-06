# Climax OVERINFO.MIP -- overlay load addresses and sizes (data only; retail SLD run line 27 @8010DBAC).
# The four overlays (FRONTEND, PREGAME, GAME, FMV) all load at the overlay buffer 0x80139BF8, i.e. the
# PSYLINK group origin of each overlay group; the memory-card slot is empty and points at the end of
# the image (__last_orgend = 0x80163E24). Sizes are the overlay file sizes (the SYM also carries
# PSYLINK __<group>_size records; which spelling the original used cannot be told from the bytes).
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
	.word	__last_orgend
	.globl	OVR_FmvAddress
OVR_FmvAddress:
	.word	_fmv_text_org
	.globl	OVR_FrontEndSize
OVR_FrontEndSize:
	.word	0x00023234
	.globl	OVR_PregameSize
OVR_PregameSize:
	.word	0x00029DCC
	.globl	OVR_GameSize
OVR_GameSize:
	.word	0x0002A228
	.globl	OVR_MemCardSize
OVR_MemCardSize:
	.word	0
	.globl	OVR_FmvSize
OVR_FmvSize:
	.word	0x0001EC70
