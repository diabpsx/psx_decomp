.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AC3C, 0x34

glabel func_8013AC3C
    /* 1044 8013AC3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1048 8013AC40 1000B0AF */  sw         $s0, 0x10($sp)
    /* 104C 8013AC44 21808000 */  addu       $s0, $a0, $zero
    /* 1050 8013AC48 03000016 */  bnez       $s0, .L8013AC58
    /* 1054 8013AC4C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1058 8013AC50 9F48000C */  jal        ResetCallback
    /* 105C 8013AC54 00000000 */   nop
  .L8013AC58:
    /* 1060 8013AC58 BFEB040C */  jal        func_8013AEFC
    /* 1064 8013AC5C 21200002 */   addu      $a0, $s0, $zero
    /* 1068 8013AC60 1400BF8F */  lw         $ra, 0x14($sp)
    /* 106C 8013AC64 1000B08F */  lw         $s0, 0x10($sp)
    /* 1070 8013AC68 0800E003 */  jr         $ra
    /* 1074 8013AC6C 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel func_8013AC3C
