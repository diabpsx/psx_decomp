# EACPSXZ BLKMOV.ASM -- hand-tuned overlapping block move (blockmove).
# Transcribed from the retail body (SLD: D:\LIB\PSX\BLKMOV.ASM line 66 @8002C7C4).
# The forward-path test `or` sits in the first branch delay slot and is also the
# re-entry point of the backward-overlap check; the trapping `add` forms are original.
	.text
	.set noat
	.set noreorder
	.globl blockmove
blockmove:
	slt	$1,$4,$5
	bnez	$1,.Lbm_back
.Lbm_fwd:
	 or	$2,$4,$5
	andi	$2,$2,3
	bnez	$2,.Lbm_fu
	 nop
	addiu	$6,$6,-64
	bltz	$6,.Lbm_f16prep
	 nop
.Lbm_f64:
	lw	$8,0($4)
	lw	$9,4($4)
	lw	$10,8($4)
	lw	$11,12($4)
	lw	$12,16($4)
	lw	$13,20($4)
	lw	$14,24($4)
	lw	$15,28($4)
	sw	$8,0($5)
	sw	$9,4($5)
	sw	$10,8($5)
	sw	$11,12($5)
	sw	$12,16($5)
	sw	$13,20($5)
	sw	$14,24($5)
	sw	$15,28($5)
	lw	$8,32($4)
	lw	$9,36($4)
	lw	$10,40($4)
	lw	$11,44($4)
	lw	$12,48($4)
	lw	$13,52($4)
	lw	$14,56($4)
	lw	$15,60($4)
	sw	$8,32($5)
	sw	$9,36($5)
	sw	$10,40($5)
	sw	$11,44($5)
	sw	$12,48($5)
	sw	$13,52($5)
	sw	$14,56($5)
	sw	$15,60($5)
	addiu	$6,$6,-64
	addiu	$4,$4,64
	bgez	$6,.Lbm_f64
	 addiu	$5,$5,64
.Lbm_f16prep:
	addiu	$6,$6,48
	bltz	$6,.Lbm_f4prep
	 nop
.Lbm_f16:
	lw	$8,0($4)
	lw	$9,4($4)
	lw	$10,8($4)
	lw	$11,12($4)
	sw	$8,0($5)
	sw	$9,4($5)
	sw	$10,8($5)
	sw	$11,12($5)
	addiu	$6,$6,-16
	addiu	$4,$4,16
	bgez	$6,.Lbm_f16
	 addiu	$5,$5,16
.Lbm_f4prep:
	addiu	$6,$6,12
	bltz	$6,.Lbm_f1prep
	 nop
.Lbm_f4:
	lw	$8,0($4)
	addiu	$6,$6,-4
	sw	$8,0($5)
	addiu	$4,$4,4
	bgez	$6,.Lbm_f4
	 addiu	$5,$5,4
.Lbm_f1prep:
	addiu	$6,$6,3
	bltz	$6,.Lbm_fdone
	 nop
.Lbm_f1:
	lb	$8,0($4)
	addiu	$6,$6,-1
	sb	$8,0($5)
	addiu	$4,$4,1
	bgez	$6,.Lbm_f1
	 addiu	$5,$5,1
.Lbm_fdone:
	jr	$31
	 nop
.Lbm_fu:
	addiu	$6,$6,-16
	bltz	$6,.Lbm_fu4prep
	 nop
.Lbm_fu16:
	lwl	$8,3($4)
	lwr	$8,0($4)
	lwl	$9,7($4)
	lwr	$9,4($4)
	lwl	$10,11($4)
	lwr	$10,8($4)
	lwl	$11,15($4)
	lwr	$11,12($4)
	swl	$8,3($5)
	swr	$8,0($5)
	swl	$9,7($5)
	swr	$9,4($5)
	swl	$10,11($5)
	swr	$10,8($5)
	swl	$11,15($5)
	swr	$11,12($5)
	addiu	$6,$6,-16
	addiu	$4,$4,16
	bgez	$6,.Lbm_fu16
	 addiu	$5,$5,16
.Lbm_fu4prep:
	addiu	$6,$6,12
	bltz	$6,.Lbm_fu1prep
	 nop
.Lbm_fu4:
	lwl	$8,3($4)
	lwr	$8,0($4)
	addiu	$6,$6,-4
	swl	$8,3($5)
	swr	$8,0($5)
	addiu	$4,$4,4
	bgez	$6,.Lbm_fu4
	 addiu	$5,$5,4
.Lbm_fu1prep:
	addiu	$6,$6,3
	bltz	$6,.Lbm_fudone
	 nop
.Lbm_fu1:
	lb	$8,0($4)
	addiu	$6,$6,-1
	sb	$8,0($5)
	addiu	$4,$4,1
	bgez	$6,.Lbm_fu1
	 addiu	$5,$5,1
.Lbm_fudone:
	jr	$31
	 nop
.Lbm_back:
	add	$7,$4,$6
	slt	$1,$5,$7
	beqz	$1,.Lbm_fwd
	 nop
	add	$4,$4,$6
	add	$5,$5,$6
	or	$2,$4,$5
	andi	$2,$2,3
	bnez	$2,.Lbm_bu
	 nop
	addiu	$6,$6,-16
	bltz	$6,.Lbm_b4prep
	 nop
.Lbm_b16:
	lw	$8,-16($4)
	lw	$9,-12($4)
	lw	$10,-8($4)
	lw	$11,-4($4)
	sw	$8,-16($5)
	sw	$9,-12($5)
	sw	$10,-8($5)
	sw	$11,-4($5)
	addiu	$4,$4,-16
	addiu	$6,$6,-16
	bgez	$6,.Lbm_b16
	 addiu	$5,$5,-16
.Lbm_b4prep:
	addiu	$6,$6,12
	bltz	$6,.Lbm_b1prep
	 nop
	j	.Lbm_b4
	 nop
.Lbm_bu:
	addiu	$6,$6,-16
	bltz	$6,.Lbm_bu4prep
	 nop
.Lbm_bu16:
	lwl	$8,-13($4)
	lwr	$8,-16($4)
	lwl	$9,-9($4)
	lwr	$9,-12($4)
	lwl	$10,-5($4)
	lwr	$10,-8($4)
	lwl	$11,-1($4)
	lwr	$11,-4($4)
	swl	$8,-13($5)
	swr	$8,-16($5)
	swl	$9,-9($5)
	swr	$9,-12($5)
	swl	$10,-5($5)
	swr	$10,-8($5)
	swl	$11,-1($5)
	swr	$11,-4($5)
	addiu	$6,$6,-16
	addiu	$4,$4,-16
	bgez	$6,.Lbm_bu16
	 addiu	$5,$5,-16
.Lbm_bu4prep:
	addiu	$6,$6,12
	bltz	$6,.Lbm_b1prep
	 nop
.Lbm_b4:
	lwl	$8,-1($4)
	lwr	$8,-4($4)
	addiu	$6,$6,-4
	swl	$8,-1($5)
	swr	$8,-4($5)
	addiu	$4,$4,-4
	bgez	$6,.Lbm_b4
	 addiu	$5,$5,-4
.Lbm_b1prep:
	addiu	$6,$6,3
	bltz	$6,.Lbm_bdone
	 nop
.Lbm_b1:
	lb	$8,-1($4)
	addiu	$6,$6,-1
	sb	$8,-1($5)
	addiu	$4,$4,-1
	bgez	$6,.Lbm_b1
	 addiu	$5,$5,-1
.Lbm_bdone:
	jr	$31
	 nop
	.set at
	.set reorder
