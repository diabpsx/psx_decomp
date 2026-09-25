.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFileInfo__7TextDati, 0x50

glabel GetFileInfo__7TextDati
    /* 84140 80094140 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 84144 80094144 1000B0AF */  sw         $s0, 0x10($sp)
    /* 84148 80094148 21808000 */  addu       $s0, $a0, $zero
    /* 8414C 8009414C 7401022E */  sltiu      $v0, $s0, 0x174
    /* 84150 80094150 06004014 */  bnez       $v0, .L8009416C
    /* 84154 80094154 1400BFAF */   sw        $ra, 0x14($sp)
    /* 84158 80094158 21200000 */  addu       $a0, $zero, $zero
    /* 8415C 8009415C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84160 80094160 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84164 80094164 A583000C */  jal        DBG_Error
    /* 84168 80094168 F7050624 */   addiu     $a2, $zero, 0x5F7
  .L8009416C:
    /* 8416C 8009416C 80101000 */  sll        $v0, $s0, 2
    /* 84170 80094170 0B80013C */  lui        $at, %hi(TX_DatTab)
    /* 84174 80094174 21082200 */  addu       $at, $at, $v0
    /* 84178 80094178 042D228C */  lw         $v0, %lo(TX_DatTab)($at)
    /* 8417C 8009417C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 84180 80094180 1000B08F */  lw         $s0, 0x10($sp)
    /* 84184 80094184 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 84188 80094188 0800E003 */  jr         $ra
    /* 8418C 8009418C 00000000 */   nop
endlabel GetFileInfo__7TextDati
