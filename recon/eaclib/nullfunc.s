# EA EACLIB NULLFUNC.ASM -- one return-zero body with coequal API exports.
# Retail SLD names D:\LIB\PSX\NULLFUNC.ASM at 0x80010000, lines 115-116.
	.text
	.set noat
	.set noreorder
	.globl alertbox
	.globl bitline
	.globl detectcpu
	.globl fclose
	.globl findfirst
	.globl findnext
	.globl fopen
	.globl fprintf
	.globl hideprint
	.globl initinversetable
	.globl interpretsub
	.globl nullfunction
	.globl nullfunctionz
	.globl nullwindow
	.globl openmainwindow
	.globl printattribute
	.globl printbyte
	.globl printbytexy
	.globl printchar
	.globl printcharxy
	.globl printclear
	.globl printscroll
	.globl purgekey
	.globl scancode
	.globl scrollline
	.globl setbitline
	.globl showprint
	.globl transbitline
alertbox:
bitline:
detectcpu:
fclose:
findfirst:
findnext:
fopen:
fprintf:
hideprint:
initinversetable:
interpretsub:
nullfunction:
nullfunctionz:
nullwindow:
openmainwindow:
printattribute:
printbyte:
printbytexy:
printchar:
printcharxy:
printclear:
printscroll:
purgekey:
scancode:
scrollline:
setbitline:
showprint:
transbitline:
	jr $31
	 addiu $2,$0,0
