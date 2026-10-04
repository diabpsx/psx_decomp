# EACPSXZ PRINT.ASM -- debug print gate and positional print entry.
# Retail SLD names D:\LIB\PSX\PRINT.ASM (data line 17, print 165-174,
# printxy 180-208); transcribed verbatim from the oracle.
	.sdata
	.globl debugprint
debugprint:
	.word	3

	.text
	.set noat
	.set noreorder
	.globl print
print:
	lw	$8,debugprint
	nop
	slti	$1,$8,2
	bnez	$1,.Lprint_off
	 nop
	j	printf
	 nop
.Lprint_off:
	jr	$31
	 nop

	.globl printxy
printxy:
	addiu	$29,$29,-48
	addu	$4,$6,$0
	addu	$5,$7,$0
	lw	$6,64($29)
	lw	$7,68($29)
	lw	$8,72($29)
	lw	$9,76($29)
	lw	$10,80($29)
	lw	$11,84($29)
	lw	$12,88($29)
	lw	$13,92($29)
	lw	$14,96($29)
	sw	$8,16($29)
	sw	$9,20($29)
	sw	$10,24($29)
	sw	$11,28($29)
	sw	$12,32($29)
	sw	$13,36($29)
	sw	$14,40($29)
	sw	$31,44($29)
	jal	print
	 nop
	lw	$31,44($29)
	addiu	$29,$29,48
	jr	$31
	 nop

	.set at
	.set reorder
