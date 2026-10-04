# Climax CRUNCH.MIP -- crunch/decrunch (a backward LZ-style bit-stream packer, as read from the
# code) with its private helpers and state words.
# Retail SLD: lines 34-758 @800105D4-80010DBF.  The helpers take their arguments in fixed
# registers (t0-t3, t8, t9, a1-a3, v0, v1, k0) and are reached only from this file; the
# work words and length/offset tables after func_80010A7C live inside .text.
	.text
	.set noat
	.set noreorder

# @800105D4  CRUNCH.MIP lines 34-114
	.globl	crunch
crunch:
	sw	$31,-4($29)
	addiu	$29,$29,-4
	addu	$8,$4,$0
	addu	$9,$4,$0
	addu	$9,$9,$6
	addu	$10,$5,$0
	sw	$5,-4($29)
	addiu	$29,$29,-4
	la	$6,.L80010AC0
	nop
	sw	$7,0($6)
	la	$6,.L80010AB8
	nop
	sw	$8,0($6)
	la	$6,.L80010ABC
	nop
	sw	$9,0($6)
	addiu	$2,$0,1
	addu	$7,$0,$0
	addu	$25,$0,$0
.L80010630:
	jal	func_800106D4
	 nop
	beqz	$24,.L80010658
	 nop
	addiu	$6,$0,264
	addi	$25,$25,1
	bne	$25,$6,.L80010658
	 nop
	jal	func_8001097C
	 nop
.L80010658:
	slt	$1,$8,$9
	bnez	$1,.L80010630
	 nop
	jal	func_8001097C
	 nop
	jal	func_80010A7C
	 nop
	sw	$7,0($10)
	addi	$10,$10,4
	la	$6,.L80010AB8
	nop
	lw	$8,0($6)
	la	$6,.L80010ABC
	nop
	lw	$9,0($6)
	nop
	subu	$9,$9,$8
	sw	$9,0($10)
	addi	$10,$10,4
	lw	$5,0($29)
	nop
	addiu	$29,$29,4
	subu	$10,$10,$5
	addu	$2,$10,$0
	lw	$31,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop

# @800106D4  CRUNCH.MIP lines 118-349
func_800106D4:
	sw	$31,-4($29)
	addiu	$29,$29,-4
	addu	$11,$8,$0
	la	$6,.L80010AC0
	nop
	lw	$24,0($6)
	nop
	addu	$11,$11,$24
	slt	$1,$11,$9
	bnez	$1,.L80010708
	 nop
	addu	$11,$9,$0
.L80010708:
	addiu	$5,$0,1
	addu	$13,$8,$0
	addi	$13,$13,1
.L80010714:
	lb	$3,0($8)
	nop
	andi	$3,$3,0xff
	lb	$24,1($8)
	nop
	andi	$24,$24,0xff
	addu	$4,$24,$0
.L80010730:
	lb	$24,0($13)
	nop
	addi	$13,$13,1
	andi	$24,$24,0xff
	bne	$3,$24,.L8001075C
	 nop
	lb	$24,0($13)
	nop
	andi	$24,$24,0xff
	beq	$4,$24,.L80010770
	 nop
.L8001075C:
	slt	$1,$13,$11
	bnez	$1,.L80010730
	 nop
	j	.L80010880
	 nop
.L80010770:
	addiu	$13,$13,-1
	addu	$12,$8,$0
.L80010778:
	lb	$3,0($12)
	nop
	andi	$3,$3,0xff
	addi	$12,$12,1
	lb	$24,0($13)
	nop
	andi	$24,$24,0xff
	addi	$13,$13,1
	bne	$3,$24,.L800107AC
	 nop
	slt	$1,$13,$11
	bnez	$1,.L80010778
	 nop
.L800107AC:
	addu	$3,$12,$0
	subu	$3,$3,$8
	addi	$3,$3,-1
	slt	$1,$5,$3
	beqz	$1,.L80010874
	 nop
	addu	$4,$13,$0
	subu	$4,$4,$8
	subu	$4,$4,$3
	addi	$4,$4,-1
	addiu	$24,$0,4
	nop
	slt	$1,$24,$3
	beqz	$1,.L8001080C
	 nop
	addiu	$24,$0,6
	addiu	$6,$0,257
	nop
	slt	$1,$3,$6
	bnez	$1,.L80010804
	 nop
	addiu	$3,$0,256
.L80010804:
	j	.L80010818
	 nop
.L8001080C:
	addu	$24,$3,$0
	addi	$24,$24,-2
	sll	$24,$24,1
.L80010818:
	la	$14,.L80010ACA
	sw	$25,-4($29)
	addiu	$29,$29,-4
	addu	$25,$14,$24
	lh	$6,0($25)
	nop
	andi	$6,$6,0xffff
	lw	$25,0($29)
	nop
	addiu	$29,$29,4
	slt	$1,$4,$6
	beqz	$1,.L80010874
	 nop
	addu	$5,$3,$0
	la	$6,.L80010AC4
	nop
	sw	$4,0($6)
	la	$6,.L80010AC8
	nop
	sb	$24,0($6)
.L80010874:
	slt	$1,$13,$11
	bnez	$1,.L80010714
	 nop
.L80010880:
	addiu	$6,$0,1
	nop
	beq	$5,$6,.L8001094C
	 nop
	jal	func_8001097C
	 nop
	la	$6,.L80010AC8
	nop
	lb	$24,0($6)
	nop
	andi	$24,$24,0xff
	la	$6,.L80010AC4
	nop
	lw	$3,0($6)
	add	$14,$14,$24
	lh	$6,8($14)
	nop
	andi	$6,$6,0xffff
	jal	func_80010A2C
	 nop
	lh	$6,16($14)
	nop
	andi	$6,$6,0xffff
	beqz	$6,.L800108FC
	 nop
	addu	$3,$5,$0
	addi	$3,$3,-1
	jal	func_80010A2C
	 nop
.L800108FC:
	lh	$6,24($14)
	nop
	andi	$6,$6,0xffff
	lh	$3,32($14)
	nop
	andi	$3,$3,0xffff
	jal	func_80010A2C
	 nop
	lh	$6,40($14)
	nop
	andi	$6,$6,0xffff
	addi	$6,$6,1
	sh	$6,40($14)
	add	$8,$8,$5
	addu	$24,$0,$0
	lw	$31,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop
.L8001094C:
	lb	$3,0($8)
	addi	$8,$8,1
	andi	$3,$3,0xff
	addiu	$6,$0,8
	jal	func_80010A2C
	 nop
	addiu	$24,$0,1
	lw	$31,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop

# @8001097C  CRUNCH.MIP lines 352-404
func_8001097C:
	sw	$31,-4($29)
	addiu	$29,$29,-4
	beqz	$25,.L800109D0
	 nop
	addu	$3,$25,$0
	addu	$25,$0,$0
	addiu	$6,$0,9
	slt	$1,$3,$6
	beqz	$1,.L800109E4
	 nop
	la	$6,.L80010AFA
	nop
	lh	$24,0($6)
	nop
	addi	$24,$24,1
	sh	$24,0($6)
	addi	$3,$3,-1
	addiu	$6,$0,5
	jal	func_80010A2C
	 nop
.L800109D0:
	lw	$31,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop
.L800109E4:
	la	$6,.L80010AFA+2
	nop
	lh	$24,0($6)
	nop
	addi	$24,$24,1
	sh	$24,0($6)
	addi	$3,$3,-9
	addiu	$24,$0,1792
	or	$3,$3,$24
	addiu	$6,$0,11
	jal	func_80010A2C
	 nop
	lw	$31,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop

# @80010A2C  CRUNCH.MIP lines 410-433
func_80010A2C:
	sw	$4,-4($29)
	addiu	$29,$29,-4
.L80010A34:
	slti	$4,$2,0
	sll	$2,$2,1
	srl	$1,$3,1
	sll	$3,$3,31
	or	$3,$3,$1
	bgez	$3,.L80010A54
	 nop
	ori	$2,$2,0x1
.L80010A54:
	bnez	$4,.L80010A88
	 nop
	addi	$6,$6,-1
	bnez	$6,.L80010A34
	 nop
	lw	$4,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop

# @80010A7C  CRUNCH.MIP lines 437-471
func_80010A7C:
	sw	$4,-4($29)
	addiu	$29,$29,-4
	addiu	$6,$0,1
.L80010A88:
	sw	$2,0($10)
	addi	$10,$10,4
	xor	$7,$7,$2
	addiu	$2,$0,1
	addi	$6,$6,-1
	bnez	$6,.L80010A34
	 nop
	lw	$4,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop
# work words (SLD lines 458-461), one per line
.L80010AB8:
	.word	0
.L80010ABC:
	.word	0
.L80010AC0:
	.word	0
.L80010AC4:
	.word	0
# line 462: index of the selected match class (func_800106D4 stores its low byte)
.L80010AC8:
	.half	0
# lines 465-470: six 4-entry halfword tables, indexed by the class offset 0/2/4/6
.L80010ACA:
	.half	0x100,0x200,0x400,0x1000
	.half	8,9,10,12
	.half	0,0,0,8
	.half	2,3,3,3
	.half	1,4,5,6
	.half	0,0,0,0
# line 471: two halfword counters (func_8001097C bumps the first for runs < 9, else the
# second, addressed as .L80010AFA+2); line 473: one more halfword
.L80010AFA:
	.half	0,0
	.half	0

# @80010B00  CRUNCH.MIP lines 485-693
	.globl	decrunch
decrunch:
	sw	$31,-4($29)
	addiu	$29,$29,-4
	addu	$9,$4,$0
	addu	$8,$5,$0
	addu	$8,$8,$6
	addi	$8,$8,-4
	lw	$10,0($8)
	nop
	addu	$10,$10,$9
	addi	$8,$8,-4
	lw	$5,0($8)
	nop
	addi	$8,$8,-4
	lw	$24,0($8)
	nop
	addi	$8,$8,-4
	lw	$26,0($8)
	nop
	xor	$5,$5,$24
.L80010B4C:
	sll	$6,$24,31
	srl	$24,$24,1
	bgez	$6,.L80010B6C
	 nop
	beqz	$24,.L80010B74
	 nop
	j	.L80010C60
	 nop
.L80010B6C:
	bnez	$24,.L80010B84
	 nop
.L80010B74:
	jal	func_80010D14
	 nop
	bltz	$6,.L80010C60
	 nop
.L80010B84:
	addiu	$25,$0,8
	addiu	$3,$0,1
	sll	$6,$24,31
	srl	$24,$24,1
	bgez	$6,.L80010BAC
	 nop
	beqz	$24,.L80010BB4
	 nop
	j	.L80010CB4
	 nop
.L80010BAC:
	bnez	$24,.L80010BC4
	 nop
.L80010BB4:
	jal	func_80010D14
	 nop
	bltz	$6,.L80010CB4
	 nop
.L80010BC4:
	addiu	$25,$0,3
	addu	$4,$0,$0
.L80010BCC:
	jal	func_80010D48
	 nop
	addu	$3,$2,$0
	addu	$3,$3,$4
	addi	$3,$3,1
.L80010BE0:
	addiu	$25,$0,8
.L80010BE4:
	sll	$6,$24,31
	srl	$24,$24,1
	bltz	$6,.L80010C04
	 nop
	beqz	$24,.L80010C14
	 nop
	j	.L80010C1C
	 nop
.L80010C04:
	beqz	$24,.L80010C14
	 nop
	j	.L80010C1C
	 nop
.L80010C14:
	jal	func_80010D14
	 nop
.L80010C1C:
	slt	$6,$6,$0
	sll	$2,$2,1
	or	$2,$2,$6
	addi	$25,$25,-1
	bnez	$25,.L80010BE4
	 nop
	addi	$10,$10,-1
	sb	$2,0($10)
	addi	$3,$3,-1
	bnez	$3,.L80010BE0
	 nop
	j	.L80010CE4
	 nop
.L80010C50:
	addiu	$25,$0,8
	addiu	$4,$0,8
	j	.L80010BCC
	 nop
.L80010C60:
	addiu	$25,$0,2
	jal	func_80010D48
	 nop
	slti	$1,$2,2
	bnez	$1,.L80010CA0
	 nop
	addiu	$1,$0,3
	beq	$2,$1,.L80010C50
	 nop
	addiu	$25,$0,8
	jal	func_80010D48
	 nop
	addu	$3,$2,$0
	addiu	$25,$0,12
	j	.L80010CB4
	 nop
.L80010CA0:
	addiu	$25,$0,9
	nop
	add	$25,$25,$2
	addi	$2,$2,2
	addu	$3,$2,$0
.L80010CB4:
	jal	func_80010D48
	 nop
	addu	$6,$10,$2
	addi	$3,$3,1
.L80010CC4:
	addi	$6,$6,-1
	addi	$10,$10,-1
	lb	$25,0($6)
	nop
	sb	$25,0($10)
	addi	$3,$3,-1
	bnez	$3,.L80010CC4
	 nop
.L80010CE4:
	slt	$1,$9,$10
	bnez	$1,.L80010B4C
	 nop
	addu	$2,$0,$0
	beqz	$5,.L80010D00
	 nop
	addiu	$2,$0,-1
.L80010D00:
	lw	$31,0($29)
	nop
	addiu	$29,$29,4
	jr	$31
	 nop

# @80010D14  CRUNCH.MIP lines 700-711
func_80010D14:
	addu	$24,$26,$0
	addi	$8,$8,-4
	lw	$26,0($8)
	nop
	xor	$5,$5,$24
	srl	$1,$24,1
	sll	$6,$24,31
	or	$6,$6,$1
	srl	$24,$24,1
	lui	$1,0x8000
	or	$24,$24,$1
	jr	$31
	 nop

# @80010D48  CRUNCH.MIP lines 718-758
func_80010D48:
	addu	$2,$0,$0
.L80010D4C:
	sll	$6,$24,31
	srl	$24,$24,1
	bgez	$6,.L80010D6C
	 nop
	beqz	$24,.L80010D74
	 nop
	j	.L80010DA0
	 nop
.L80010D6C:
	bnez	$24,.L80010DA0
	 nop
.L80010D74:
	addu	$24,$26,$0
	addi	$8,$8,-4
	lw	$26,0($8)
	nop
	xor	$5,$5,$24
	srl	$1,$24,1
	sll	$6,$24,31
	or	$6,$6,$1
	srl	$24,$24,1
	lui	$1,0x8000
	or	$24,$24,$1
.L80010DA0:
	slt	$6,$6,$0
	sll	$2,$2,1
	or	$2,$2,$6
	addi	$25,$25,-1
	bnez	$25,.L80010D4C
	 nop
	jr	$31
	 nop

	.set at
	.set reorder
