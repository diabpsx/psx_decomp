.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getstreamblocka, 0x90

glabel getstreamblocka
    /* 1F488 8002F488 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1F48C 8002F48C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F490 8002F490 07004010 */  beqz       $v0, .L8002F4B0
    /* 1F494 8002F494 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1F498 8002F498 7400428C */  lw         $v0, 0x74($v0)
    /* 1F49C 8002F49C 00000000 */  nop
    /* 1F4A0 8002F4A0 10004014 */  bnez       $v0, .L8002F4E4
    /* 1F4A4 8002F4A4 00000000 */   nop
    /* 1F4A8 8002F4A8 03008014 */  bnez       $a0, .L8002F4B8
    /* 1F4AC 8002F4AC 00000000 */   nop
  .L8002F4B0:
    /* 1F4B0 8002F4B0 42BD0008 */  j          .L8002F508
    /* 1F4B4 8002F4B4 21100000 */   addu      $v0, $zero, $zero
  .L8002F4B8:
    /* 1F4B8 8002F4B8 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1F4BC 8002F4BC F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1F4C0 8002F4C0 1280013C */  lui        $at, %hi(abortfile)
    /* 1F4C4 8002F4C4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1F4C8 8002F4C8 530D0224 */  addiu      $v0, $zero, 0xD53
    /* 1F4CC 8002F4CC 1180043C */  lui        $a0, %hi(D_8010FE64)
    /* 1F4D0 8002F4D0 64FE8424 */  addiu      $a0, $a0, %lo(D_8010FE64)
    /* 1F4D4 8002F4D4 1280013C */  lui        $at, %hi(abortline)
    /* 1F4D8 8002F4D8 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1F4DC 8002F4DC 0F95000C */  jal        abortmessage
    /* 1F4E0 8002F4E0 00000000 */   nop
  .L8002F4E4:
    /* 1F4E4 8002F4E4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1F4E8 8002F4E8 00000000 */  nop
    /* 1F4EC 8002F4EC 7400828C */  lw         $v0, 0x74($a0)
    /* 1F4F0 8002F4F0 7400838C */  lw         $v1, 0x74($a0)
    /* 1F4F4 8002F4F4 00000000 */  nop
    /* 1F4F8 8002F4F8 9800638C */  lw         $v1, 0x98($v1)
    /* 1F4FC 8002F4FC 00000000 */  nop
    /* 1F500 8002F500 740083AC */  sw         $v1, 0x74($a0)
    /* 1F504 8002F504 980040AC */  sw         $zero, 0x98($v0)
  .L8002F508:
    /* 1F508 8002F508 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1F50C 8002F50C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F510 8002F510 0800E003 */  jr         $ra
    /* 1F514 8002F514 00000000 */   nop
endlabel getstreamblocka
