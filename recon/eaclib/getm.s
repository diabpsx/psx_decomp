# EACPSXZ GETM.ASM -- unaligned byte-field readers.
# The NFS4 EACLIB reconstruction identifies the original hand-written MIPS
# module; both exported Diablo bodies are byte-identical.
	.text
	.set noat
	.set noreorder

	.globl getm
getm:
	lbu	$9,0($4)
	addiu	$8,$5,-3
	bltz	$8,.Lgetm_lt3
	 sll	$2,$9,8
	lbu	$10,1($4)
	beqz	$8,.Lgetm_three
	 or	$2,$2,$10
	lbu	$11,2($4)
	lbu	$12,3($4)
	sll	$2,$2,16
	sll	$11,$11,8
	or	$11,$11,$12
	jr	$31
	 or	$2,$2,$11
.Lgetm_three:
	lbu	$11,2($4)
	sll	$2,$2,8
	jr	$31
	 or	$2,$2,$11
.Lgetm_lt3:
	lbu	$10,1($4)
	addiu	$8,$5,-2
	bltz	$8,.Lgetm_one
	 nop
	jr	$31
	 or	$2,$2,$10
.Lgetm_one:
	jr	$31
	 or	$2,$0,$9

	.globl geti
geti:
	lwl	$8,3($4)
	lwr	$8,0($4)
	addiu	$9,$0,32
	sll	$5,$5,3
	subu	$5,$9,$5
	sllv	$8,$8,$5
	jr	$31
	 srlv	$2,$8,$5

	.set at
	.set reorder
