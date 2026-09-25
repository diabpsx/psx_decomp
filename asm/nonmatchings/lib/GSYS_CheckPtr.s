.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSYS_CheckPtr, 0x34

glabel GSYS_CheckPtr
    /* 11234 80021234 1280023C */  lui        $v0, %hi(GSYS_MemStart)
    /* 11238 80021238 CCAA428C */  lw         $v0, %lo(GSYS_MemStart)($v0)
    /* 1123C 8002123C 1280013C */  lui        $at, %hi(LastPtr)
    /* 11240 80021240 74CA24AC */  sw         $a0, %lo(LastPtr)($at)
    /* 11244 80021244 2B108200 */  sltu       $v0, $a0, $v0
    /* 11248 80021248 05004014 */  bnez       $v0, .L80021260
    /* 1124C 8002124C 21100000 */   addu      $v0, $zero, $zero
    /* 11250 80021250 1280023C */  lui        $v0, %hi(GSYS_MemEnd)
    /* 11254 80021254 D0AA428C */  lw         $v0, %lo(GSYS_MemEnd)($v0)
    /* 11258 80021258 00000000 */  nop
    /* 1125C 8002125C 2B108200 */  sltu       $v0, $a0, $v0
  .L80021260:
    /* 11260 80021260 0800E003 */  jr         $ra
    /* 11264 80021264 00000000 */   nop
endlabel GSYS_CheckPtr
