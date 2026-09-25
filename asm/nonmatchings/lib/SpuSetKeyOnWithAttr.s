.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuSetKeyOnWithAttr, 0x30

glabel SpuSetKeyOnWithAttr
    /* 8CCC 80018CCC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8CD0 80018CD0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8CD4 80018CD4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8CD8 80018CD8 3765000C */  jal        SpuSetVoiceAttr
    /* 8CDC 80018CDC 21808000 */   addu      $s0, $a0, $zero
    /* 8CE0 80018CE0 0000058E */  lw         $a1, 0x0($s0)
    /* 8CE4 80018CE4 C362000C */  jal        SpuSetKey
    /* 8CE8 80018CE8 01000424 */   addiu     $a0, $zero, 0x1
    /* 8CEC 80018CEC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8CF0 80018CF0 1000B08F */  lw         $s0, 0x10($sp)
    /* 8CF4 80018CF4 0800E003 */  jr         $ra
    /* 8CF8 80018CF8 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SpuSetKeyOnWithAttr
