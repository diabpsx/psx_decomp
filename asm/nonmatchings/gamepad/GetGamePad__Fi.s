.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetGamePad__Fi, 0x20

glabel GetGamePad__Fi
    /* 6AD2C 8007AD2C 1380023C */  lui        $v0, %hi(D_8012FB68)
    /* 6AD30 8007AD30 68FB4224 */  addiu      $v0, $v0, %lo(D_8012FB68)
    /* 6AD34 8007AD34 03008010 */  beqz       $a0, .L8007AD44
    /* 6AD38 8007AD38 00000000 */   nop
    /* 6AD3C 8007AD3C 1380023C */  lui        $v0, %hi(D_8012FC48)
    /* 6AD40 8007AD40 48FC4224 */  addiu      $v0, $v0, %lo(D_8012FC48)
  .L8007AD44:
    /* 6AD44 8007AD44 0800E003 */  jr         $ra
    /* 6AD48 8007AD48 00000000 */   nop
endlabel GetGamePad__Fi
