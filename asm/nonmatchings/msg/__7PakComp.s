.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __7PakComp, 0x38

glabel __7PakComp
    /* 429E4 800529E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 429E8 800529E8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 429EC 800529EC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 429F0 800529F0 A44A010C */  jal        __9CompClass
    /* 429F4 800529F4 21808000 */   addu      $s0, $a0, $zero
    /* 429F8 800529F8 1180023C */  lui        $v0, %hi(D_80116820)
    /* 429FC 800529FC 20684224 */  addiu      $v0, $v0, %lo(D_80116820)
    /* 42A00 80052A00 000002AE */  sw         $v0, 0x0($s0)
    /* 42A04 80052A04 21100002 */  addu       $v0, $s0, $zero
    /* 42A08 80052A08 1400BF8F */  lw         $ra, 0x14($sp)
    /* 42A0C 80052A0C 1000B08F */  lw         $s0, 0x10($sp)
    /* 42A10 80052A10 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42A14 80052A14 0800E003 */  jr         $ra
    /* 42A18 80052A18 00000000 */   nop
endlabel __7PakComp
