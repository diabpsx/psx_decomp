.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddPlrMonstExper__Filc, 0x84

glabel AddPlrMonstExper__Filc
    /* 508A0 800608A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 508A4 800608A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 508A8 800608A8 21408000 */  addu       $t0, $a0, $zero
    /* 508AC 800608AC 2138C000 */  addu       $a3, $a2, $zero
    /* 508B0 800608B0 21180000 */  addu       $v1, $zero, $zero
    /* 508B4 800608B4 21200000 */  addu       $a0, $zero, $zero
    /* 508B8 800608B8 00360600 */  sll        $a2, $a2, 24
    /* 508BC 800608BC 03360600 */  sra        $a2, $a2, 24
  .L800608C0:
    /* 508C0 800608C0 07108600 */  srav       $v0, $a2, $a0
    /* 508C4 800608C4 01004230 */  andi       $v0, $v0, 0x1
    /* 508C8 800608C8 02004010 */  beqz       $v0, .L800608D4
    /* 508CC 800608CC 00000000 */   nop
    /* 508D0 800608D0 01006324 */  addiu      $v1, $v1, 0x1
  .L800608D4:
    /* 508D4 800608D4 01008424 */  addiu      $a0, $a0, 0x1
    /* 508D8 800608D8 02008228 */  slti       $v0, $a0, 0x2
    /* 508DC 800608DC F8FF4014 */  bnez       $v0, .L800608C0
    /* 508E0 800608E0 00000000 */   nop
    /* 508E4 800608E4 0B006010 */  beqz       $v1, .L80060914
    /* 508E8 800608E8 00160700 */   sll       $v0, $a3, 24
    /* 508EC 800608EC 8812848F */  lw         $a0, %gp_rel(myplr)($gp)
    /* 508F0 800608F0 03160200 */  sra        $v0, $v0, 24
    /* 508F4 800608F4 1A00A300 */  div        $zero, $a1, $v1
    /* 508F8 800608F8 12300000 */  mflo       $a2
    /* 508FC 800608FC 07108200 */  srav       $v0, $v0, $a0
    /* 50900 80060900 01004230 */  andi       $v0, $v0, 0x1
    /* 50904 80060904 03004010 */  beqz       $v0, .L80060914
    /* 50908 80060908 00000000 */   nop
    /* 5090C 8006090C AF9B010C */  jal        AddPlrExperience__Fiil
    /* 50910 80060910 21280001 */   addu      $a1, $t0, $zero
  .L80060914:
    /* 50914 80060914 1000BF8F */  lw         $ra, 0x10($sp)
    /* 50918 80060918 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5091C 8006091C 0800E003 */  jr         $ra
    /* 50920 80060920 00000000 */   nop
endlabel AddPlrMonstExper__Filc
