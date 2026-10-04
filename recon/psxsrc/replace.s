# Climax REPLACE.MIP -- hand-written replacements for setjmp/longjmp and C string routines.
# Retail SLD: lines 84-370 @80010334-800105D3.
	.text
	.set noat
	.set noreorder

# @80010334  REPLACE.MIP lines 84-97
	.globl	longjmp
longjmp:
	lw	$31,0($4)
	lw	$29,4($4)
	lw	$30,8($4)
	lw	$16,12($4)
	lw	$17,16($4)
	lw	$18,20($4)
	lw	$19,24($4)
	lw	$20,28($4)
	lw	$21,32($4)
	lw	$22,36($4)
	lw	$23,40($4)
	lw	$28,44($4)
	jr	$31
	 addu	$2,$5,$0

# @8001036C  REPLACE.MIP lines 105-118
	.globl	setjmp
setjmp:
	sw	$31,0($4)
	sw	$29,4($4)
	sw	$30,8($4)
	sw	$16,12($4)
	sw	$17,16($4)
	sw	$18,20($4)
	sw	$19,24($4)
	sw	$20,28($4)
	sw	$21,32($4)
	sw	$22,36($4)
	sw	$23,40($4)
	sw	$28,44($4)
	jr	$31
	 addu	$2,$0,$0

# @800103A4  REPLACE.MIP lines 125-135
	.globl	memset
memset:
	beqz	$6,.L800103C0
	 addiu	$2,$6,-1
	addiu	$3,$0,-1
.L800103B0:
	sb	$5,0($4)
	addiu	$2,$2,-1
	bne	$2,$3,.L800103B0
	 addiu	$4,$4,1
.L800103C0:
	jr	$31
	 nop

# @800103C8  REPLACE.MIP lines 142-156
	.globl	strcpy
strcpy:
	addu	$7,$4,$0
.L800103CC:
	lb	$6,0($5)
	nop
	beq	$0,$6,.L800103E8
	 sb	$6,0($4)
	addiu	$5,$5,1
	j	.L800103CC
	 addiu	$4,$4,1
.L800103E8:
	jr	$31
	 addu	$2,$7,$0

# @800103F0  REPLACE.MIP lines 163-173
	.globl	strcat
strcat:
	addu	$3,$31,$0
	addu	$8,$4,$0
	bgezal	$0,.Lstrlen2	# bal strlen2 (local alias: GNU as would relocate a branch to the global)
	 addu	$9,$5,$0
	addu	$5,$9,$0
	addu	$4,$2,$8
	j	strcpy
	 addu	$31,$3,$0

# @80010410  REPLACE.MIP lines 180-202
	.globl	strrchr
strrchr:
	addu	$3,$31,$0
	addu	$7,$5,$0
	bgezal	$0,.Lstrlen2	# bal strlen2 (local alias: GNU as would relocate a branch to the global)
	 addu	$8,$4,$0
	addu	$2,$2,$8
.L80010424:
	lb	$5,0($2)
	nop
	beq	$5,$7,.L80010444
	 addiu	$2,$2,-1
	bne	$2,$8,.L80010424
	 nop
	jr	$3
	 addu	$2,$0,$0
.L80010444:
	jr	$3
	 addiu	$2,$2,1

# @8001044C  REPLACE.MIP lines 209-226
	.globl	strchr
strchr:
	lb	$6,0($4)
	nop
	beq	$0,$6,.L80010474
	 nop
	beq	$6,$5,.L8001046C
	 nop
	j	strchr
	 addiu	$4,$4,1
.L8001046C:
	jr	$31
	 addu	$2,$4,$0
.L80010474:
	beq	$4,$6,.L8001046C
	 nop
	jr	$31
	 addu	$2,$0,$0

# @80010484  REPLACE.MIP lines 233-355
	.globl	strlen2
strlen2:
.Lstrlen2:
	addu	$2,$0,$0
.L80010488:
	lb	$6,0($4)
	nop
	beq	$0,$6,.L800104A0
	 addiu	$4,$4,1
	j	.L80010488
	 addiu	$2,$2,1
.L800104A0:
	jr	$31
	 nop

# @800104A8  REPLACE.MIP lines 254-355: an unlabeled block copy (dest a0, source a1, count a2;
# returns dest; word path when both pointers are aligned, lwl/lwr or swl/swr otherwise).
# No MAP/SYM name and no reference anywhere in the image or overlays; the oracle keeps it
# inside strlen2's range, so it carries only .L labels here.
	addu	$8,$4,$0
	beq	$0,$6,.L80010514
	 nop
	addiu	$1,$0,-4
	and	$2,$6,$1
	beq	$0,$2,.L800104FC
	 andi	$2,$6,0x3
	subu	$6,$6,$2
	addu	$3,$2,$0
	andi	$2,$5,0x3
	beq	$0,$2,.L80010520
	 andi	$2,$4,0x3
	beq	$0,$2,.L80010558
.L800104DC:
	 lwr	$2,0($5)
	lwl	$2,3($5)
	addiu	$5,$5,4
	swr	$2,0($4)
	swl	$2,3($4)
	addiu	$6,$6,-4
	bne	$0,$6,.L800104DC
	 addiu	$4,$4,4
.L800104FC:
	lb	$2,0($5)
	addiu	$5,$5,1
	sb	$2,0($4)
	addiu	$3,$3,-1
	bne	$0,$3,.L800104FC
	 addiu	$4,$4,1
.L80010514:
	addu	$2,$8,$0
	jr	$31
	 nop
.L80010520:
	andi	$2,$4,0x3
	beq	$0,$2,.L8001058C
	 nop
.L8001052C:
	lw	$2,0($5)
	addiu	$5,$5,4
	swr	$2,0($4)
	swl	$2,3($4)
	addiu	$6,$6,-4
	bne	$0,$6,.L8001052C
	 addiu	$4,$4,4
	beq	$0,$3,.L800104FC
	 addu	$2,$8,$0
	jr	$31
	 nop
.L80010558:
	andi	$2,$5,0x3
	beq	$0,$2,.L8001058C
.L80010560:
	 lwr	$2,0($5)
	lwl	$2,3($5)
	addiu	$5,$5,4
	addiu	$6,$6,-4
	sw	$2,0($4)
	bne	$0,$6,.L80010560
	 addiu	$4,$4,4
	beq	$0,$3,.L800104FC
	 addu	$2,$8,$0
	jr	$31
	 nop
.L8001058C:
	lw	$2,0($5)
	addiu	$5,$5,4
	sw	$2,0($4)
	addiu	$6,$6,-4
	bne	$0,$6,.L8001058C
	 addi	$5,$5,4
	beq	$0,$2,.L800104FC
	 addu	$2,$8,$0
	jr	$31
	 nop

# @800105B4  REPLACE.MIP lines 362-370
	.globl	abs
abs:
	lui	$9,0x8000
	and	$9,$4,$9
	beqz	$9,.L800105CC
	 sub	$8,$0,$4
	jr	$31
	 addu	$2,$8,$0
.L800105CC:
	jr	$31
	 addu	$2,$4,$0

	.set at
	.set reorder
