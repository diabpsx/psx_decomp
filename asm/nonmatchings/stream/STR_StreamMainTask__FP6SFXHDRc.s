.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_StreamMainTask__FP6SFXHDRc, 0x12C

glabel STR_StreamMainTask__FP6SFXHDRc
    /* 8A06C 8009A06C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8A070 8009A070 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8A074 8009A074 21908000 */  addu       $s2, $a0, $zero
    /* 8A078 8009A078 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8A07C 8009A07C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8A080 8009A080 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8A084 8009A084 0C004292 */  lbu        $v0, 0xC($s2)
    /* 8A088 8009A088 00000000 */  nop
    /* 8A08C 8009A08C 10004014 */  bnez       $v0, .L8009A0D0
    /* 8A090 8009A090 74005026 */   addiu     $s0, $s2, 0x74
    /* 8A094 8009A094 1280023C */  lui        $v0, %hi(FeFlag)
    /* 8A098 8009A098 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 8A09C 8009A09C 00000000 */  nop
    /* 8A0A0 8009A0A0 0C004014 */  bnez       $v0, .L8009A0D4
    /* 8A0A4 8009A0A4 21200002 */   addu      $a0, $s0, $zero
  .L8009A0A8:
    /* 8A0A8 8009A0A8 F06E020C */  jal        GLUE_HasGameStarted__Fv
    /* 8A0AC 8009A0AC 00000000 */   nop
    /* 8A0B0 8009A0B0 01004238 */  xori       $v0, $v0, 0x1
    /* 8A0B4 8009A0B4 05004010 */  beqz       $v0, .L8009A0CC
    /* 8A0B8 8009A0B8 00000000 */   nop
    /* 8A0BC 8009A0BC EE80000C */  jal        TSK_Sleep
    /* 8A0C0 8009A0C0 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A0C4 8009A0C4 2A680208 */  j          .L8009A0A8
    /* 8A0C8 8009A0C8 00000000 */   nop
  .L8009A0CC:
    /* 8A0CC 8009A0CC 74005026 */  addiu      $s0, $s2, 0x74
  .L8009A0D0:
    /* 8A0D0 8009A0D0 21200002 */  addu       $a0, $s0, $zero
  .L8009A0D4:
    /* 8A0D4 8009A0D4 6820020C */  jal        BL_OpenStreamFile__FPcc
    /* 8A0D8 8009A0D8 21280000 */   addu      $a1, $zero, $zero
    /* 8A0DC 8009A0DC 21884000 */  addu       $s1, $v0, $zero
    /* 8A0E0 8009A0E0 20002012 */  beqz       $s1, .L8009A164
    /* 8A0E4 8009A0E4 00000000 */   nop
    /* 8A0E8 8009A0E8 1000228E */  lw         $v0, 0x10($s1)
    /* 8A0EC 8009A0EC 00000000 */  nop
    /* 8A0F0 8009A0F0 640042AE */  sw         $v0, 0x64($s2)
    /* 8A0F4 8009A0F4 1000238E */  lw         $v1, 0x10($s1)
    /* 8A0F8 8009A0F8 808E0234 */  ori        $v0, $zero, 0x8E80
    /* 8A0FC 8009A0FC 2A104300 */  slt        $v0, $v0, $v1
    /* 8A100 8009A100 05004014 */  bnez       $v0, .L8009A118
    /* 8A104 8009A104 00800434 */   ori       $a0, $zero, 0x8000
    /* 8A108 8009A108 0A80053C */  lui        $a1, %hi(STR_AsyncWeeTASK__FP4TASK)
    /* 8A10C 8009A10C AC99A524 */  addiu      $a1, $a1, %lo(STR_AsyncWeeTASK__FP4TASK)
    /* 8A110 8009A110 49680208 */  j          .L8009A124
    /* 8A114 8009A114 00080624 */   addiu     $a2, $zero, 0x800
  .L8009A118:
    /* 8A118 8009A118 0A80053C */  lui        $a1, %hi(STR_AsyncTASK__FP4TASK)
    /* 8A11C 8009A11C 849CA524 */  addiu      $a1, $a1, %lo(STR_AsyncTASK__FP4TASK)
    /* 8A120 8009A120 00080624 */  addiu      $a2, $zero, 0x800
  .L8009A124:
    /* 8A124 8009A124 0480000C */  jal        TSK_AddTask
    /* 8A128 8009A128 10000724 */   addiu     $a3, $zero, 0x10
    /* 8A12C 8009A12C 21804000 */  addu       $s0, $v0, $zero
    /* 8A130 8009A130 05000016 */  bnez       $s0, .L8009A148
    /* 8A134 8009A134 21200000 */   addu      $a0, $zero, $zero
    /* 8A138 8009A138 1180053C */  lui        $a1, %hi(D_801108B4)
    /* 8A13C 8009A13C B408A524 */  addiu      $a1, $a1, %lo(D_801108B4)
    /* 8A140 8009A140 A583000C */  jal        DBG_Error
    /* 8A144 8009A144 DC050624 */   addiu     $a2, $zero, 0x5DC
  .L8009A148:
    /* 8A148 8009A148 4382000C */  jal        TSK_MakeTaskImmortal
    /* 8A14C 8009A14C 21200002 */   addu      $a0, $s0, $zero
    /* 8A150 8009A150 1C00028E */  lw         $v0, 0x1C($s0)
    /* 8A154 8009A154 00000000 */  nop
    /* 8A158 8009A158 000051AC */  sw         $s1, 0x0($v0)
    /* 8A15C 8009A15C 5F680208 */  j          .L8009A17C
    /* 8A160 8009A160 040052AC */   sw        $s2, 0x4($v0)
  .L8009A164:
    /* 8A164 8009A164 1180043C */  lui        $a0, %hi(D_80110938)
    /* 8A168 8009A168 38098424 */  addiu      $a0, $a0, %lo(D_80110938)
    /* 8A16C 8009A16C 9367000C */  jal        printf
    /* 8A170 8009A170 21280002 */   addu      $a1, $s0, $zero
    /* 8A174 8009A174 C764020C */  jal        STR_CloseStream__FP6SFXHDR
    /* 8A178 8009A178 21204002 */   addu      $a0, $s2, $zero
  .L8009A17C:
    /* 8A17C 8009A17C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8A180 8009A180 1800B28F */  lw         $s2, 0x18($sp)
    /* 8A184 8009A184 1400B18F */  lw         $s1, 0x14($sp)
    /* 8A188 8009A188 1000B08F */  lw         $s0, 0x10($sp)
    /* 8A18C 8009A18C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8A190 8009A190 0800E003 */  jr         $ra
    /* 8A194 8009A194 00000000 */   nop
endlabel STR_StreamMainTask__FP6SFXHDRc
