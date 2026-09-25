.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_Init__Fv, 0x12C

glabel STR_Init__Fv
    /* 88B74 80098B74 4006828F */  lw         $v0, %gp_rel(D_8011ADC0)($gp)
    /* 88B78 80098B78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 88B7C 80098B7C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 88B80 80098B80 42004014 */  bnez       $v0, .L80098C8C
    /* 88B84 80098B84 1000B0AF */   sw        $s0, 0x10($sp)
    /* 88B88 80098B88 584B000C */  jal        GetVideoMode
    /* 88B8C 80098B8C 00000000 */   nop
    /* 88B90 80098B90 21184000 */  addu       $v1, $v0, $zero
    /* 88B94 80098B94 05006010 */  beqz       $v1, .L80098BAC
    /* 88B98 80098B98 01000224 */   addiu     $v0, $zero, 0x1
    /* 88B9C 80098B9C 04006210 */  beq        $v1, $v0, .L80098BB0
    /* 88BA0 80098BA0 32000224 */   addiu     $v0, $zero, 0x32
    /* 88BA4 80098BA4 ED620208 */  j          .L80098BB4
    /* 88BA8 80098BA8 00000000 */   nop
  .L80098BAC:
    /* 88BAC 80098BAC 3C000224 */  addiu      $v0, $zero, 0x3C
  .L80098BB0:
    /* 88BB0 80098BB0 440682AF */  sw         $v0, %gp_rel(D_8011ADC4)($gp)
  .L80098BB4:
    /* 88BB4 80098BB4 CF62020C */  jal        STR_AllocBuffer__Fv
    /* 88BB8 80098BB8 00000000 */   nop
    /* 88BBC 80098BBC 0C80053C */  lui        $a1, %hi(STR_Buffer)
    /* 88BC0 80098BC0 E89CA524 */  addiu      $a1, $a1, %lo(STR_Buffer)
    /* 88BC4 80098BC4 680680AF */  sw         $zero, %gp_rel(Time)($gp)
    /* 88BC8 80098BC8 21200000 */  addu       $a0, $zero, $zero
    /* 88BCC 80098BCC 00900634 */  ori        $a2, $zero, 0x9000
    /* 88BD0 80098BD0 21180000 */  addu       $v1, $zero, $zero
  .L80098BD4:
    /* 88BD4 80098BD4 0C80013C */  lui        $at, %hi(SFXTab + 0x68)
    /* 88BD8 80098BD8 21082300 */  addu       $at, $at, $v1
    /* 88BDC 80098BDC 489C25AC */  sw         $a1, %lo(SFXTab + 0x68)($at)
    /* 88BE0 80098BE0 2128A600 */  addu       $a1, $a1, $a2
    /* 88BE4 80098BE4 0C80013C */  lui        $at, %hi(SFXTab)
    /* 88BE8 80098BE8 21082300 */  addu       $at, $at, $v1
    /* 88BEC 80098BEC E09B20A0 */  sb         $zero, %lo(SFXTab)($at)
    /* 88BF0 80098BF0 0C80013C */  lui        $at, %hi(SFXTab + 0x40)
    /* 88BF4 80098BF4 21082300 */  addu       $at, $at, $v1
    /* 88BF8 80098BF8 209C20AC */  sw         $zero, %lo(SFXTab + 0x40)($at)
    /* 88BFC 80098BFC 0C80013C */  lui        $at, %hi(SFXTab + 0x10)
    /* 88C00 80098C00 21082300 */  addu       $at, $at, $v1
    /* 88C04 80098C04 F09B24AC */  sw         $a0, %lo(SFXTab + 0x10)($at)
    /* 88C08 80098C08 01008424 */  addiu      $a0, $a0, 0x1
    /* 88C0C 80098C0C 02008228 */  slti       $v0, $a0, 0x2
    /* 88C10 80098C10 F0FF4014 */  bnez       $v0, .L80098BD4
    /* 88C14 80098C14 84006324 */   addiu     $v1, $v1, 0x84
    /* 88C18 80098C18 21200000 */  addu       $a0, $zero, $zero
    /* 88C1C 80098C1C 0A80053C */  lui        $a1, %hi(STR_SystemTask__FP4TASK)
    /* 88C20 80098C20 0C8BA524 */  addiu      $a1, $a1, %lo(STR_SystemTask__FP4TASK)
    /* 88C24 80098C24 00080624 */  addiu      $a2, $zero, 0x800
    /* 88C28 80098C28 0480000C */  jal        TSK_AddTask
    /* 88C2C 80098C2C 21380000 */   addu      $a3, $zero, $zero
    /* 88C30 80098C30 21804000 */  addu       $s0, $v0, $zero
    /* 88C34 80098C34 05000016 */  bnez       $s0, .L80098C4C
    /* 88C38 80098C38 21200000 */   addu      $a0, $zero, $zero
    /* 88C3C 80098C3C 1180053C */  lui        $a1, %hi(D_801108B4)
    /* 88C40 80098C40 B408A524 */  addiu      $a1, $a1, %lo(D_801108B4)
    /* 88C44 80098C44 A583000C */  jal        DBG_Error
    /* 88C48 80098C48 FF010624 */   addiu     $a2, $zero, 0x1FF
  .L80098C4C:
    /* 88C4C 80098C4C 4382000C */  jal        TSK_MakeTaskImmortal
    /* 88C50 80098C50 21200002 */   addu      $a0, $s0, $zero
    /* 88C54 80098C54 B162020C */  jal        InitCDWaitIcon__Fv
    /* 88C58 80098C58 00000000 */   nop
    /* 88C5C 80098C5C E6000224 */  addiu      $v0, $zero, 0xE6
    /* 88C60 80098C60 1280013C */  lui        $at, %hi(sglMasterVolume)
    /* 88C64 80098C64 9CBB22AC */  sw         $v0, %lo(sglMasterVolume)($at)
    /* 88C68 80098C68 FF1F0224 */  addiu      $v0, $zero, 0x1FFF
    /* 88C6C 80098C6C 1280013C */  lui        $at, %hi(sglMusicVolume)
    /* 88C70 80098C70 A0BB22AC */  sw         $v0, %lo(sglMusicVolume)($at)
    /* 88C74 80098C74 1280013C */  lui        $at, %hi(sglSoundVolume)
    /* 88C78 80098C78 A4BB22AC */  sw         $v0, %lo(sglSoundVolume)($at)
    /* 88C7C 80098C7C 1280013C */  lui        $at, %hi(sglSpeechVolume)
    /* 88C80 80098C80 A8BB22AC */  sw         $v0, %lo(sglSpeechVolume)($at)
    /* 88C84 80098C84 01000224 */  addiu      $v0, $zero, 0x1
    /* 88C88 80098C88 400682AF */  sw         $v0, %gp_rel(D_8011ADC0)($gp)
  .L80098C8C:
    /* 88C8C 80098C8C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 88C90 80098C90 1000B08F */  lw         $s0, 0x10($sp)
    /* 88C94 80098C94 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 88C98 80098C98 0800E003 */  jr         $ra
    /* 88C9C 80098C9C 00000000 */   nop
endlabel STR_Init__Fv
