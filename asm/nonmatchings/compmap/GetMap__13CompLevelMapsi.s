.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMap__13CompLevelMapsi, 0x7C

glabel GetMap__13CompLevelMapsi
    /* 71788 80081788 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7178C 8008178C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71790 80081790 21808000 */  addu       $s0, $a0, $zero
    /* 71794 80081794 1800BFAF */  sw         $ra, 0x18($sp)
    /* 71798 80081798 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7179C 8008179C 6C01028E */  lw         $v0, 0x16C($s0)
    /* 717A0 800817A0 00000000 */  nop
    /* 717A4 800817A4 06004010 */  beqz       $v0, .L800817C0
    /* 717A8 800817A8 2188A000 */   addu      $s1, $a1, $zero
    /* 717AC 800817AC 21200000 */  addu       $a0, $zero, $zero
    /* 717B0 800817B0 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 717B4 800817B4 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 717B8 800817B8 A583000C */  jal        DBG_Error
    /* 717BC 800817BC 66000624 */   addiu     $a2, $zero, 0x66
  .L800817C0:
    /* 717C0 800817C0 21200002 */  addu       $a0, $s0, $zero
    /* 717C4 800817C4 7F06020C */  jal        MakeSureMapXDecomped__13CompLevelMapsi
    /* 717C8 800817C8 21282002 */   addu      $a1, $s1, $zero
    /* 717CC 800817CC 00211100 */  sll        $a0, $s1, 4
    /* 717D0 800817D0 04008424 */  addiu      $a0, $a0, 0x4
    /* 717D4 800817D4 21200402 */  addu       $a0, $s0, $a0
    /* 717D8 800817D8 01000224 */  addiu      $v0, $zero, 0x1
    /* 717DC 800817DC 6C0102AE */  sw         $v0, 0x16C($s0)
    /* 717E0 800817E0 1E07020C */  jal        GetMap__4AMap
    /* 717E4 800817E4 640111AE */   sw        $s1, 0x164($s0)
    /* 717E8 800817E8 680102AE */  sw         $v0, 0x168($s0)
    /* 717EC 800817EC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 717F0 800817F0 1400B18F */  lw         $s1, 0x14($sp)
    /* 717F4 800817F4 1000B08F */  lw         $s0, 0x10($sp)
    /* 717F8 800817F8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 717FC 800817FC 0800E003 */  jr         $ra
    /* 71800 80081800 00000000 */   nop
endlabel GetMap__13CompLevelMapsi
