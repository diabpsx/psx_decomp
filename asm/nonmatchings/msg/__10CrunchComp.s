.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __10CrunchComp, 0x38

glabel __10CrunchComp
    /* 429AC 800529AC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 429B0 800529B0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 429B4 800529B4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 429B8 800529B8 A44A010C */  jal        __9CompClass
    /* 429BC 800529BC 21808000 */   addu      $s0, $a0, $zero
    /* 429C0 800529C0 1180023C */  lui        $v0, %hi(D_80116808)
    /* 429C4 800529C4 08684224 */  addiu      $v0, $v0, %lo(D_80116808)
    /* 429C8 800529C8 000002AE */  sw         $v0, 0x0($s0)
    /* 429CC 800529CC 21100002 */  addu       $v0, $s0, $zero
    /* 429D0 800529D0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 429D4 800529D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 429D8 800529D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 429DC 800529DC 0800E003 */  jr         $ra
    /* 429E0 800529E0 00000000 */   nop
endlabel __10CrunchComp
