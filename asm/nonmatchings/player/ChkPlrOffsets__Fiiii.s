.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChkPlrOffsets__Fiiii, 0xB0

glabel ChkPlrOffsets__Fiiii
    /* 52568 80062568 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5256C 8006256C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 52570 80062570 2190A000 */  addu       $s2, $a1, $zero
    /* 52574 80062574 0E80023C */  lui        $v0, %hi(plr)
    /* 52578 80062578 38A5428C */  lw         $v0, %lo(plr)($v0)
    /* 5257C 8006257C 08000324 */  addiu      $v1, $zero, 0x8
    /* 52580 80062580 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 52584 80062584 1400B1AF */  sw         $s1, 0x14($sp)
    /* 52588 80062588 1B004310 */  beq        $v0, $v1, .L800625F8
    /* 5258C 8006258C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 52590 80062590 0E80023C */  lui        $v0, %hi(plr + 0x19E8)
    /* 52594 80062594 20BF428C */  lw         $v0, %lo(plr + 0x19E8)($v0)
    /* 52598 80062598 00000000 */  nop
    /* 5259C 8006259C 16004310 */  beq        $v0, $v1, .L800625F8
    /* 525A0 800625A0 23189200 */   subu      $v1, $a0, $s2
    /* 525A4 800625A4 21109200 */  addu       $v0, $a0, $s2
    /* 525A8 800625A8 43100200 */  sra        $v0, $v0, 1
    /* 525AC 800625AC 80900200 */  sll        $s2, $v0, 2
    /* 525B0 800625B0 2310C700 */  subu       $v0, $a2, $a3
    /* 525B4 800625B4 23886200 */  subu       $s1, $v1, $v0
    /* 525B8 800625B8 2110C700 */  addu       $v0, $a2, $a3
    /* 525BC 800625BC 43100200 */  sra        $v0, $v0, 1
    /* 525C0 800625C0 80800200 */  sll        $s0, $v0, 2
    /* 525C4 800625C4 6D41000C */  jal        abs
    /* 525C8 800625C8 80201100 */   sll       $a0, $s1, 2
    /* 525CC 800625CC 21884000 */  addu       $s1, $v0, $zero
    /* 525D0 800625D0 6D41000C */  jal        abs
    /* 525D4 800625D4 23205002 */   subu      $a0, $s2, $s0
    /* 525D8 800625D8 21804000 */  addu       $s0, $v0, $zero
    /* 525DC 800625DC 3D01222A */  slti       $v0, $s1, 0x13D
    /* 525E0 800625E0 03004010 */  beqz       $v0, .L800625F0
    /* 525E4 800625E4 DD00022A */   slti      $v0, $s0, 0xDD
    /* 525E8 800625E8 04004014 */  bnez       $v0, .L800625FC
    /* 525EC 800625EC 01000224 */   addiu     $v0, $zero, 0x1
  .L800625F0:
    /* 525F0 800625F0 7F890108 */  j          .L800625FC
    /* 525F4 800625F4 21100000 */   addu      $v0, $zero, $zero
  .L800625F8:
    /* 525F8 800625F8 01000224 */  addiu      $v0, $zero, 0x1
  .L800625FC:
    /* 525FC 800625FC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 52600 80062600 1800B28F */  lw         $s2, 0x18($sp)
    /* 52604 80062604 1400B18F */  lw         $s1, 0x14($sp)
    /* 52608 80062608 1000B08F */  lw         $s0, 0x10($sp)
    /* 5260C 8006260C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 52610 80062610 0800E003 */  jr         $ra
    /* 52614 80062614 00000000 */   nop
endlabel ChkPlrOffsets__Fiiii
