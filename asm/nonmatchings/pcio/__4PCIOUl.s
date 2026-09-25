.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __4PCIOUl, 0x68

glabel __4PCIOUl
    /* 760B4 800860B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 760B8 800860B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 760BC 800860BC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 760C0 800860C0 1F16020C */  jal        __6FileIOUl
    /* 760C4 800860C4 21808000 */   addu      $s0, $a0, $zero
    /* 760C8 800860C8 1180023C */  lui        $v0, %hi(_vt_4PCIO)
    /* 760CC 800860CC 60014224 */  addiu      $v0, $v0, %lo(_vt_4PCIO)
    /* 760D0 800860D0 2844000C */  jal        PCinit
    /* 760D4 800860D4 100002AE */   sw        $v0, 0x10($s0)
    /* 760D8 800860D8 0B004010 */  beqz       $v0, .L80086108
    /* 760DC 800860DC 21100002 */   addu      $v0, $s0, $zero
    /* 760E0 800860E0 1180023C */  lui        $v0, %hi(D_80110130)
    /* 760E4 800860E4 30014224 */  addiu      $v0, $v0, %lo(D_80110130)
    /* 760E8 800860E8 07004014 */  bnez       $v0, .L80086108
    /* 760EC 800860EC 21100002 */   addu      $v0, $s0, $zero
    /* 760F0 800860F0 21200000 */  addu       $a0, $zero, $zero
    /* 760F4 800860F4 1180053C */  lui        $a1, %hi(D_80110144)
    /* 760F8 800860F8 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 760FC 800860FC A583000C */  jal        DBG_Error
    /* 76100 80086100 41000624 */   addiu     $a2, $zero, 0x41
    /* 76104 80086104 21100002 */  addu       $v0, $s0, $zero
  .L80086108:
    /* 76108 80086108 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7610C 8008610C 1000B08F */  lw         $s0, 0x10($sp)
    /* 76110 80086110 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 76114 80086114 0800E003 */  jr         $ra
    /* 76118 80086118 00000000 */   nop
endlabel __4PCIOUl
