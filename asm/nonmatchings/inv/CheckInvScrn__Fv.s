.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckInvScrn__Fv, 0x78

glabel CheckInvScrn__Fv
    /* 23EA8 8015DAA0 1280043C */  lui        $a0, %hi(myplr)
    /* 23EAC 8015DAA4 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 23EB0 8015DAA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 23EB4 8015DAAC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 23EB8 8015DAB0 80100400 */  sll        $v0, $a0, 2
    /* 23EBC 8015DAB4 1280013C */  lui        $at, %hi(_pcurs)
    /* 23EC0 8015DAB8 21082200 */  addu       $at, $at, $v0
    /* 23EC4 8015DABC 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 23EC8 8015DAC0 00000000 */  nop
    /* 23ECC 8015DAC4 0C004228 */  slti       $v0, $v0, 0xC
    /* 23ED0 8015DAC8 09004014 */  bnez       $v0, .L8015DAF0
    /* 23ED4 8015DACC 00000000 */   nop
    /* 23ED8 8015DAD0 1280053C */  lui        $a1, %hi(MouseX)
    /* 23EDC 8015DAD4 E4B7A58C */  lw         $a1, %lo(MouseX)($a1)
    /* 23EE0 8015DAD8 1280063C */  lui        $a2, %hi(MouseY)
    /* 23EE4 8015DADC E8B7C68C */  lw         $a2, %lo(MouseY)($a2)
    /* 23EE8 8015DAE0 9C6B050C */  jal        CheckInvPaste__Fiii
    /* 23EEC 8015DAE4 00000000 */   nop
    /* 23EF0 8015DAE8 C2760508 */  j          .L8015DB08
    /* 23EF4 8015DAEC 00000000 */   nop
  .L8015DAF0:
    /* 23EF8 8015DAF0 1280053C */  lui        $a1, %hi(MouseX)
    /* 23EFC 8015DAF4 E4B7A58C */  lw         $a1, %lo(MouseX)($a1)
    /* 23F00 8015DAF8 1280063C */  lui        $a2, %hi(MouseY)
    /* 23F04 8015DAFC E8B7C68C */  lw         $a2, %lo(MouseY)($a2)
    /* 23F08 8015DB00 FE72050C */  jal        CheckInvCut__Fiii
    /* 23F0C 8015DB04 00000000 */   nop
  .L8015DB08:
    /* 23F10 8015DB08 1000BF8F */  lw         $ra, 0x10($sp)
    /* 23F14 8015DB0C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 23F18 8015DB10 0800E003 */  jr         $ra
    /* 23F1C 8015DB14 00000000 */   nop
endlabel CheckInvScrn__Fv
