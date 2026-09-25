.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GO_DoGameOver__Fv, 0x48

glabel GO_DoGameOver__Fv
    /* 72204 80082204 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 72208 80082208 1000BFAF */  sw         $ra, 0x10($sp)
    /* 7220C 8008220C 1280013C */  lui        $at, %hi(automapflag)
    /* 72210 80082210 7BC320A0 */  sb         $zero, %lo(automapflag)($at)
    /* 72214 80082214 7708020C */  jal        IS_GameOver__Fv
    /* 72218 80082218 00000000 */   nop
    /* 7221C 8008221C 01004238 */  xori       $v0, $v0, 0x1
    /* 72220 80082220 06004010 */  beqz       $v0, .L8008223C
    /* 72224 80082224 01800434 */   ori       $a0, $zero, 0x8001
    /* 72228 80082228 0880053C */  lui        $a1, %hi(GameOverTask__FP4TASK)
    /* 7222C 8008222C 4C22A524 */  addiu      $a1, $a1, %lo(GameOverTask__FP4TASK)
    /* 72230 80082230 00080624 */  addiu      $a2, $zero, 0x800
    /* 72234 80082234 0480000C */  jal        TSK_AddTask
    /* 72238 80082238 21380000 */   addu      $a3, $zero, $zero
  .L8008223C:
    /* 7223C 8008223C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 72240 80082240 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 72244 80082244 0800E003 */  jr         $ra
    /* 72248 80082248 00000000 */   nop
endlabel GO_DoGameOver__Fv
