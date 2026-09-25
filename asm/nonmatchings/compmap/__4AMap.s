.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __4AMap, 0x34

glabel __4AMap
    /* 721A8 800821A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 721AC 800821AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 721B0 800821B0 21808000 */  addu       $s0, $a0, $zero
    /* 721B4 800821B4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 721B8 800821B8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 721BC 800821BC AA06020C */  jal        Init__4AMap
    /* 721C0 800821C0 040002AE */   sw        $v0, 0x4($s0)
    /* 721C4 800821C4 21100002 */  addu       $v0, $s0, $zero
    /* 721C8 800821C8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 721CC 800821CC 1000B08F */  lw         $s0, 0x10($sp)
    /* 721D0 800821D0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 721D4 800821D4 0800E003 */  jr         $ra
    /* 721D8 800821D8 00000000 */   nop
endlabel __4AMap
