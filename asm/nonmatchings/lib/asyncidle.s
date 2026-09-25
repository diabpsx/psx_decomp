.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncidle, 0x34

glabel asyncidle
    /* 1433C 8002433C 1380023C */  lui        $v0, %hi(D_8013504C)
    /* 14340 80024340 4C50428C */  lw         $v0, %lo(D_8013504C)($v0)
    /* 14344 80024344 00000000 */  nop
    /* 14348 80024348 06004010 */  beqz       $v0, .L80024364
    /* 1434C 8002434C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 14350 80024350 1380033C */  lui        $v1, %hi(D_80135050)
    /* 14354 80024354 5050638C */  lw         $v1, %lo(D_80135050)($v1)
    /* 14358 80024358 00000000 */  nop
    /* 1435C 8002435C 02006214 */  bne        $v1, $v0, .L80024368
    /* 14360 80024360 21100000 */   addu      $v0, $zero, $zero
  .L80024364:
    /* 14364 80024364 01000224 */  addiu      $v0, $zero, 0x1
  .L80024368:
    /* 14368 80024368 0800E003 */  jr         $ra
    /* 1436C 8002436C 00000000 */   nop
endlabel asyncidle
