.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetUpAction__7GamePadPFi_vT1, 0x3C

glabel SetUpAction__7GamePadPFi_vT1
    /* 68B3C 80078B3C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 68B40 80078B40 1000B0AF */  sw         $s0, 0x10($sp)
    /* 68B44 80078B44 21808000 */  addu       $s0, $a0, $zero
    /* 68B48 80078B48 1400B1AF */  sw         $s1, 0x14($sp)
    /* 68B4C 80078B4C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 68B50 80078B50 B8E2010C */  jal        GetActionButton__7GamePadPFi_v
    /* 68B54 80078B54 2188C000 */   addu      $s1, $a2, $zero
    /* 68B58 80078B58 500002AE */  sw         $v0, 0x50($s0)
    /* 68B5C 80078B5C 540011AE */  sw         $s1, 0x54($s0)
    /* 68B60 80078B60 1800BF8F */  lw         $ra, 0x18($sp)
    /* 68B64 80078B64 1400B18F */  lw         $s1, 0x14($sp)
    /* 68B68 80078B68 1000B08F */  lw         $s0, 0x10($sp)
    /* 68B6C 80078B6C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 68B70 80078B70 0800E003 */  jr         $ra
    /* 68B74 80078B74 00000000 */   nop
endlabel SetUpAction__7GamePadPFi_vT1
