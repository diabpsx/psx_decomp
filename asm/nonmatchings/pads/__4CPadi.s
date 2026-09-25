.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __4CPadi, 0x34

glabel __4CPadi
    /* 79C2C 80089C2C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 79C30 80089C30 1000B0AF */  sw         $s0, 0x10($sp)
    /* 79C34 80089C34 21808000 */  addu       $s0, $a0, $zero
    /* 79C38 80089C38 1400BFAF */  sw         $ra, 0x14($sp)
    /* 79C3C 80089C3C 060005A6 */  sh         $a1, 0x6($s0)
    /* 79C40 80089C40 B426020C */  jal        Flush__4CPad
    /* 79C44 80089C44 000000A2 */   sb        $zero, 0x0($s0)
    /* 79C48 80089C48 21100002 */  addu       $v0, $s0, $zero
    /* 79C4C 80089C4C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 79C50 80089C50 1000B08F */  lw         $s0, 0x10($sp)
    /* 79C54 80089C54 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79C58 80089C58 0800E003 */  jr         $ra
    /* 79C5C 80089C5C 00000000 */   nop
endlabel __4CPadi
