# EACPSXZ BLKFILL.ASM -- hand-tuned byte fill/clear.
# NFS4 identifies the original hand-written module. Diablo differs only in the
# byte-tail loop, where the store occupies the branch delay slot before n--.
	.text
	.set noat
	.set noreorder
	.globl blockclear
blockclear:
	addiu	$6,$0,0
	.globl blockfill
blockfill:
	slti	$1,$5,4
	bnez	$1,.Lbf_small
	 andi	$6,$6,255
	sll	$10,$6,8
	or	$6,$6,$10
	sll	$10,$6,16
	or	$6,$6,$10
	swr	$6,0($4)
	addiu	$8,$0,4
	andi	$9,$4,3
	subu	$8,$8,$9
	addu	$4,$4,$8
	subu	$5,$5,$8
	addiu	$5,$5,-128
	bltz	$5,.Lbf_16prep
	 nop
.Lbf_128:
	sw	$6,0($4)
	sw	$6,4($4)
	sw	$6,8($4)
	sw	$6,12($4)
	sw	$6,16($4)
	sw	$6,20($4)
	sw	$6,24($4)
	sw	$6,28($4)
	sw	$6,32($4)
	sw	$6,36($4)
	sw	$6,40($4)
	sw	$6,44($4)
	sw	$6,48($4)
	sw	$6,52($4)
	sw	$6,56($4)
	sw	$6,60($4)
	sw	$6,64($4)
	sw	$6,68($4)
	sw	$6,72($4)
	sw	$6,76($4)
	sw	$6,80($4)
	sw	$6,84($4)
	sw	$6,88($4)
	sw	$6,92($4)
	sw	$6,96($4)
	sw	$6,100($4)
	sw	$6,104($4)
	sw	$6,108($4)
	sw	$6,112($4)
	sw	$6,116($4)
	sw	$6,120($4)
	sw	$6,124($4)
	addiu	$5,$5,-128
	bgez	$5,.Lbf_128
	 addiu	$4,$4,128
.Lbf_16prep:
	addiu	$5,$5,112
	bltz	$5,.Lbf_4prep
	 nop
.Lbf_16:
	sw	$6,0($4)
	sw	$6,4($4)
	sw	$6,8($4)
	sw	$6,12($4)
	addiu	$5,$5,-16
	bgez	$5,.Lbf_16
	 addiu	$4,$4,16
.Lbf_4prep:
	addiu	$5,$5,12
	bltz	$5,.Lbf_tail
	 nop
.Lbf_4:
	sw	$6,0($4)
	addiu	$5,$5,-4
	bgez	$5,.Lbf_4
	 addiu	$4,$4,4
.Lbf_tail:
	addu	$4,$4,$5
	swl	$6,3($4)
	jr	$31
	 nop
.Lbf_small:
	addiu	$5,$5,-1
	bltz	$5,.Lbf_done
.Lbf_byte:
	 sb	$6,0($4)
	addiu	$5,$5,-1
	bgez	$5,.Lbf_byte
	 addiu	$4,$4,1
.Lbf_done:
	jr	$31
	 nop
	.set at
	.set reorder
