# Climax ABLOCK.MIP -- block-sprite helpers that park position/colour in GTE data registers.
# Retail SLD: lines 115-204 @80010DEC-80010EAB.
	.text
	.set noat
	.set noreorder

# @80010DEC  ABLOCK.MIP lines 115-119
	.globl	ABL_SetBlockRGBXY
ABL_SetBlockRGBXY:
	mtc2	$4,$12
	mtc2	$5,$16
	mtc2	$6,$13
	jr	$31
	 mtc2	$7,$14

# @80010E00  ABLOCK.MIP lines 143-204
	.globl	ABL_PrintPart
ABL_PrintPart:
	mfc2	$1,$16
	mfc2	$7,$14
	lh	$10,4($4)
	lh	$11,6($4)
	addu	$8,$1,$10
	mfc2	$1,$13
	nop
	subu	$9,$1,$11
	beqz	$7,.L80010E40
	 addiu	$1,$0,60
	lbu	$10,15($5)
	nop
	andi	$10,$10,0x2
	bne	$0,$10,.L80010E40
	 nop
	ori	$1,$1,0x2
.L80010E40:
	sb	$1,7($6)
	lw	$1,0($5)
	nop
	sw	$1,12($6)
	lw	$1,4($5)
	nop
	sw	$1,24($6)
	lh	$10,8($5)
	lh	$11,10($5)
	sh	$10,36($6)
	sh	$11,48($6)
	lbu	$1,12($5)
	lbu	$10,13($5)
	add	$1,$8,$1
	add	$10,$9,$10
	sh	$8,8($6)
	sh	$9,10($6)
	sh	$1,20($6)
	sh	$9,22($6)
	sh	$8,32($6)
	sh	$10,34($6)
	sh	$1,44($6)
	sh	$10,46($6)
	addiu	$1,$0,12
	sb	$1,3($6)
	jr	$31
	 nop

	.set at
	.set reorder
