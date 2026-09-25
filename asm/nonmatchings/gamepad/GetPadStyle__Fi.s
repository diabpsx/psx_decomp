.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPadStyle__Fi, 0x24

glabel GetPadStyle__Fi
    /* 6B07C 8007B07C 1380023C */  lui        $v0, %hi(D_8012FB68)
    /* 6B080 8007B080 68FB4224 */  addiu      $v0, $v0, %lo(D_8012FB68)
    /* 6B084 8007B084 03008010 */  beqz       $a0, .L8007B094
    /* 6B088 8007B088 00000000 */   nop
    /* 6B08C 8007B08C 1380023C */  lui        $v0, %hi(D_8012FC48)
    /* 6B090 8007B090 48FC4224 */  addiu      $v0, $v0, %lo(D_8012FC48)
  .L8007B094:
    /* 6B094 8007B094 4E004280 */  lb         $v0, 0x4E($v0)
    /* 6B098 8007B098 0800E003 */  jr         $ra
    /* 6B09C 8007B09C 00000000 */   nop
endlabel GetPadStyle__Fi
