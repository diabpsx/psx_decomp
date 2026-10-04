# Climax GP.MIP -- save, reload and set the global pointer register.
# Retail SLD: data line 8 @800B2D00, text lines 13-28 @80010DC0-80010DEB.
	.data

# @800B2D00  GP.MIP line 8
.L800B2D00:
	.word	0x00000000

	.text
	.set noat
	.set noreorder

# @80010DC0  GP.MIP lines 13-15
	.globl	SaveGP
SaveGP:
	lui	$24,%hi(.L800B2D00)
	addiu	$24,$24,%lo(.L800B2D00)
	jr	$31
	 sw	$28,0($24)

# @80010DD0  GP.MIP lines 18-21
	.globl	ReloadGP
ReloadGP:
	add	$2,$28,$0
	lui	$24,%hi(.L800B2D00)
	addiu	$24,$24,%lo(.L800B2D00)
	jr	$31
	 lw	$28,0($24)

# @80010DE4  GP.MIP lines 27-28
	.globl	SetGP
SetGP:
	jr	$31
	 add	$28,$4,$0

	.set at
	.set reorder
