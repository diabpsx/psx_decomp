.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ToggleOptions__Fv, 0x1A8

glabel ToggleOptions__Fv
    /* 9A9CC 800AA9CC 1280023C */  lui        $v0, %hi(deathflag)
    /* 9A9D0 800AA9D0 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 9A9D4 800AA9D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9A9D8 800AA9D8 05004014 */  bnez       $v0, .L800AA9F0
    /* 9A9DC 800AA9DC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 9A9E0 800AA9E0 7708020C */  jal        IS_GameOver__Fv
    /* 9A9E4 800AA9E4 00000000 */   nop
    /* 9A9E8 800AA9E8 5E004014 */  bnez       $v0, .L800AAB64
    /* 9A9EC 800AA9EC 00000000 */   nop
  .L800AA9F0:
    /* 9A9F0 800AA9F0 C80A828F */  lw         $v0, %gp_rel(optionsflag)($gp)
    /* 9A9F4 800AA9F4 00000000 */  nop
    /* 9A9F8 800AA9F8 23004014 */  bnez       $v0, .L800AAA88
    /* 9A9FC 800AA9FC 01000224 */   addiu     $v0, $zero, 0x1
    /* 9AA00 800AAA00 1280013C */  lui        $at, %hi(msgholdflag)
    /* 9AA04 800AAA04 69B822A0 */  sb         $v0, %lo(msgholdflag)($at)
    /* 9AA08 800AAA08 1280013C */  lui        $at, %hi(PauseMode)
    /* 9AA0C 800AAA0C A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 9AA10 800AAA10 01000224 */  addiu      $v0, $zero, 0x1
    /* 9AA14 800AAA14 C80A82AF */  sw         $v0, %gp_rel(optionsflag)($gp)
    /* 9AA18 800AAA18 05000224 */  addiu      $v0, $zero, 0x5
    /* 9AA1C 800AAA1C 1280013C */  lui        $at, %hi(saveflag)
    /* 9AA20 800AAA20 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 9AA24 800AAA24 1280013C */  lui        $at, %hi(loadflag)
    /* 9AA28 800AAA28 7CB120AC */  sw         $zero, %lo(loadflag)($at)
    /* 9AA2C 800AAA2C 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9AA30 800AAA30 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
    /* 9AA34 800AAA34 1280013C */  lui        $at, %hi(StatusTxt)
    /* 9AA38 800AAA38 5CB420AC */  sw         $zero, %lo(StatusTxt)($at)
    /* 9AA3C 800AAA3C 1280013C */  lui        $at, %hi(cardondelay)
    /* 9AA40 800AAA40 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 9AA44 800AAA44 1280013C */  lui        $at, %hi(card_active + 0x4)
    /* 9AA48 800AAA48 04B220AC */  sw         $zero, %lo(card_active + 0x4)($at)
    /* 9AA4C 800AAA4C 1280013C */  lui        $at, %hi(card_active)
    /* 9AA50 800AAA50 00B220AC */  sw         $zero, %lo(card_active)($at)
    /* 9AA54 800AAA54 1280013C */  lui        $at, %hi(MemCardActive)
    /* 9AA58 800AAA58 60B120AC */  sw         $zero, %lo(MemCardActive)($at)
    /* 9AA5C 800AAA5C EEF3000C */  jal        stream_pause__Fv
    /* 9AA60 800AAA60 00000000 */   nop
    /* 9AA64 800AAA64 21200000 */  addu       $a0, $zero, $zero
    /* 9AA68 800AAA68 0B80053C */  lui        $a1, %hi(DrawOptions__FP4TASK)
    /* 9AA6C 800AAA6C D0A2A524 */  addiu      $a1, $a1, %lo(DrawOptions__FP4TASK)
    /* 9AA70 800AAA70 00400624 */  addiu      $a2, $zero, 0x4000
    /* 9AA74 800AAA74 0480000C */  jal        TSK_AddTask
    /* 9AA78 800AAA78 21380000 */   addu      $a3, $zero, $zero
    /* 9AA7C 800AAA7C E40A82AF */  sw         $v0, %gp_rel(DrawOptionsTask)($gp)
    /* 9AA80 800AAA80 D9AA0208 */  j          .L800AAB64
    /* 9AA84 800AAA84 00000000 */   nop
  .L800AAA88:
    /* 9AA88 800AAA88 1280023C */  lui        $v0, %hi(ctrlflag)
    /* 9AA8C 800AAA8C 20B04290 */  lbu        $v0, %lo(ctrlflag)($v0)
    /* 9AA90 800AAA90 1280013C */  lui        $at, %hi(msgholdflag)
    /* 9AA94 800AAA94 69B820A0 */  sb         $zero, %lo(msgholdflag)($at)
    /* 9AA98 800AAA98 0A004010 */  beqz       $v0, .L800AAAC4
    /* 9AA9C 800AAA9C 00000000 */   nop
    /* 9AAA0 800AAAA0 F171020C */  jal        RemoveCtrlScreen__Fv
    /* 9AAA4 800AAAA4 00000000 */   nop
    /* 9AAA8 800AAAA8 01004238 */  xori       $v0, $v0, 0x1
    /* 9AAAC 800AAAAC 05004010 */  beqz       $v0, .L800AAAC4
    /* 9AAB0 800AAAB0 00000000 */   nop
    /* 9AAB4 800AAAB4 C6F5000C */  jal        PlaySFX__Fi
    /* 9AAB8 800AAAB8 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 9AABC 800AAABC D9AA0208 */  j          .L800AAB64
    /* 9AAC0 800AAAC0 00000000 */   nop
  .L800AAAC4:
    /* 9AAC4 800AAAC4 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 9AAC8 800AAAC8 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 9AACC 800AAACC 00000000 */  nop
    /* 9AAD0 800AAAD0 03004010 */  beqz       $v0, .L800AAAE0
    /* 9AAD4 800AAAD4 00000000 */   nop
    /* 9AAD8 800AAAD8 5695020C */  jal        MemcardOFF__Fv
    /* 9AADC 800AAADC 00000000 */   nop
  .L800AAAE0:
    /* 9AAE0 800AAAE0 1280023C */  lui        $v0, %hi(MemcardOverlay)
    /* 9AAE4 800AAAE4 64B1428C */  lw         $v0, %lo(MemcardOverlay)($v0)
    /* 9AAE8 800AAAE8 00000000 */  nop
    /* 9AAEC 800AAAEC 12004010 */  beqz       $v0, .L800AAB38
    /* 9AAF0 800AAAF0 00000000 */   nop
    /* 9AAF4 800AAAF4 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9AAF8 800AAAF8 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9AAFC 800AAAFC 1280013C */  lui        $at, %hi(MemcardOverlay)
    /* 9AB00 800AAB00 64B120AC */  sw         $zero, %lo(MemcardOverlay)($at)
    /* 9AB04 800AAB04 03004014 */  bnez       $v0, .L800AAB14
    /* 9AB08 800AAB08 00000000 */   nop
    /* 9AB0C 800AAB0C 1D55020C */  jal        OVR_LoadGame__Fv
    /* 9AB10 800AAB10 00000000 */   nop
  .L800AAB14:
    /* 9AB14 800AAB14 1280023C */  lui        $v0, %hi(sghMusic)
    /* 9AB18 800AAB18 B4BB428C */  lw         $v0, %lo(sghMusic)($v0)
    /* 9AB1C 800AAB1C 00000000 */  nop
    /* 9AB20 800AAB20 05004014 */  bnez       $v0, .L800AAB38
    /* 9AB24 800AAB24 00000000 */   nop
    /* 9AB28 800AAB28 1280043C */  lui        $a0, %hi(sgnMusicTrack)
    /* 9AB2C 800AAB2C ACBB848C */  lw         $a0, %lo(sgnMusicTrack)($a0)
    /* 9AB30 800AAB30 B4DF010C */  jal        music_start__Fi
    /* 9AB34 800AAB34 00000000 */   nop
  .L800AAB38:
    /* 9AB38 800AAB38 1280013C */  lui        $at, %hi(PauseMode)
    /* 9AB3C 800AAB3C A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 9AB40 800AAB40 C80A80AF */  sw         $zero, %gp_rel(optionsflag)($gp)
    /* 9AB44 800AAB44 07F4000C */  jal        stream_resume__Fv
    /* 9AB48 800AAB48 00000000 */   nop
    /* 9AB4C 800AAB4C 1280023C */  lui        $v0, %hi(sbookflag)
    /* 9AB50 800AAB50 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 9AB54 800AAB54 00000000 */  nop
    /* 9AB58 800AAB58 02004014 */  bnez       $v0, .L800AAB64
    /* 9AB5C 800AAB5C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 9AB60 800AAB60 D00A82AF */  sw         $v0, %gp_rel(options_pad)($gp)
  .L800AAB64:
    /* 9AB64 800AAB64 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9AB68 800AAB68 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9AB6C 800AAB6C 0800E003 */  jr         $ra
    /* 9AB70 800AAB70 00000000 */   nop
endlabel ToggleOptions__Fv
