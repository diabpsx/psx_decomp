.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetErrorText, 0x30

glabel GAL_GetErrorText
    /* 12668 80022668 0A00822C */  sltiu      $v0, $a0, 0xA
    /* 1266C 8002266C 06004010 */  beqz       $v0, .L80022688
    /* 12670 80022670 80100400 */   sll       $v0, $a0, 2
    /* 12674 80022674 0B80013C */  lui        $at, %hi(GalErrors)
    /* 12678 80022678 21082200 */  addu       $at, $at, $v0
    /* 1267C 8002267C 9C63228C */  lw         $v0, %lo(GalErrors)($at)
    /* 12680 80022680 A4890008 */  j          .L80022690
    /* 12684 80022684 00000000 */   nop
  .L80022688:
    /* 12688 80022688 1180023C */  lui        $v0, %hi(D_8010E8FC)
    /* 1268C 8002268C FCE84224 */  addiu      $v0, $v0, %lo(D_8010E8FC)
  .L80022690:
    /* 12690 80022690 0800E003 */  jr         $ra
    /* 12694 80022694 00000000 */   nop
endlabel GAL_GetErrorText
