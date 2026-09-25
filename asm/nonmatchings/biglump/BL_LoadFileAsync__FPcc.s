.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_LoadFileAsync__FPcc, 0x1B4

glabel BL_LoadFileAsync__FPcc
    /* 77ED0 80087ED0 F1038293 */  lbu        $v0, %gp_rel(NoQuedAsyncs)($gp)
    /* 77ED4 80087ED4 F2038393 */  lbu        $v1, %gp_rel(CurrAsync)($gp)
    /* 77ED8 80087ED8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 77EDC 80087EDC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 77EE0 80087EE0 21988000 */  addu       $s3, $a0, $zero
    /* 77EE4 80087EE4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 77EE8 80087EE8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 77EEC 80087EEC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 77EF0 80087EF0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 77EF4 80087EF4 01004224 */  addiu      $v0, $v0, 0x1
    /* 77EF8 80087EF8 F10382A3 */  sb         $v0, %gp_rel(NoQuedAsyncs)($gp)
    /* 77EFC 80087EFC FF004230 */  andi       $v0, $v0, 0xFF
    /* 77F00 80087F00 08006210 */  beq        $v1, $v0, .L80087F24
    /* 77F04 80087F04 2188A000 */   addu      $s1, $a1, $zero
    /* 77F08 80087F08 21804000 */  addu       $s0, $v0, $zero
  .L80087F0C:
    /* 77F0C 80087F0C EE80000C */  jal        TSK_Sleep
    /* 77F10 80087F10 01000424 */   addiu     $a0, $zero, 0x1
    /* 77F14 80087F14 F2038293 */  lbu        $v0, %gp_rel(CurrAsync)($gp)
    /* 77F18 80087F18 00000000 */  nop
    /* 77F1C 80087F1C FBFF5014 */  bne        $v0, $s0, .L80087F0C
    /* 77F20 80087F20 00000000 */   nop
  .L80087F24:
    /* 77F24 80087F24 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 77F28 80087F28 00000000 */   nop
    /* 77F2C 80087F2C 01004238 */  xori       $v0, $v0, 0x1
    /* 77F30 80087F30 04004010 */  beqz       $v0, .L80087F44
    /* 77F34 80087F34 21206002 */   addu      $a0, $s3, $zero
    /* 77F38 80087F38 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 77F3C 80087F3C 00000000 */   nop
    /* 77F40 80087F40 21206002 */  addu       $a0, $s3, $zero
  .L80087F44:
    /* 77F44 80087F44 00161100 */  sll        $v0, $s1, 24
    /* 77F48 80087F48 038E0200 */  sra        $s1, $v0, 24
    /* 77F4C 80087F4C 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 77F50 80087F50 21282002 */   addu      $a1, $s1, $zero
    /* 77F54 80087F54 21904000 */  addu       $s2, $v0, $zero
    /* 77F58 80087F58 03004016 */  bnez       $s2, .L80087F68
    /* 77F5C 80087F5C 21206002 */   addu      $a0, $s3, $zero
    /* 77F60 80087F60 19200208 */  j          .L80088064
    /* 77F64 80087F64 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80087F68:
    /* 77F68 80087F68 F0038293 */  lbu        $v0, %gp_rel(FileLoaded)($gp)
    /* 77F6C 80087F6C 21282002 */  addu       $a1, $s1, $zero
    /* 77F70 80087F70 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 77F74 80087F74 F00382A3 */  sb         $v0, %gp_rel(FileLoaded)($gp)
    /* 77F78 80087F78 F0038293 */  lbu        $v0, %gp_rel(FileLoaded)($gp)
    /* 77F7C 80087F7C 0D1F020C */  jal        BL_FileLength__FPcc
    /* 77F80 80087F80 00000000 */   nop
    /* 77F84 80087F84 21804000 */  addu       $s0, $v0, $zero
    /* 77F88 80087F88 07000016 */  bnez       $s0, .L80087FA8
    /* 77F8C 80087F8C 21200002 */   addu      $a0, $s0, $zero
    /* 77F90 80087F90 21200000 */  addu       $a0, $zero, $zero
    /* 77F94 80087F94 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77F98 80087F98 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77F9C 80087F9C A583000C */  jal        DBG_Error
    /* 77FA0 80087FA0 A4020624 */   addiu     $a2, $zero, 0x2A4
    /* 77FA4 80087FA4 21200002 */  addu       $a0, $s0, $zero
  .L80087FA8:
    /* 77FA8 80087FA8 01000524 */  addiu      $a1, $zero, 0x1
    /* 77FAC 80087FAC 7785000C */  jal        GAL_Alloc
    /* 77FB0 80087FB0 21300000 */   addu      $a2, $zero, $zero
    /* 77FB4 80087FB4 21804000 */  addu       $s0, $v0, $zero
    /* 77FB8 80087FB8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 77FBC 80087FBC 05000216 */  bne        $s0, $v0, .L80087FD4
    /* 77FC0 80087FC0 21200000 */   addu      $a0, $zero, $zero
    /* 77FC4 80087FC4 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77FC8 80087FC8 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77FCC 80087FCC A583000C */  jal        DBG_Error
    /* 77FD0 80087FD0 A7020624 */   addiu     $a2, $zero, 0x2A7
  .L80087FD4:
    /* 77FD4 80087FD4 DD85000C */  jal        GAL_Lock
    /* 77FD8 80087FD8 21200002 */   addu      $a0, $s0, $zero
    /* 77FDC 80087FDC 06000016 */  bnez       $s0, .L80087FF8
    /* 77FE0 80087FE0 21984000 */   addu      $s3, $v0, $zero
    /* 77FE4 80087FE4 21200000 */  addu       $a0, $zero, $zero
    /* 77FE8 80087FE8 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77FEC 80087FEC 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77FF0 80087FF0 A583000C */  jal        DBG_Error
    /* 77FF4 80087FF4 AA020624 */   addiu     $a2, $zero, 0x2AA
  .L80087FF8:
    /* 77FF8 80087FF8 01000224 */  addiu      $v0, $zero, 0x1
    /* 77FFC 80087FFC 0B80043C */  lui        $a0, %hi(STREAM_BIN)
    /* 78000 80088000 B4798424 */  addiu      $a0, $a0, %lo(STREAM_BIN)
    /* 78004 80088004 03002216 */  bne        $s1, $v0, .L80088014
    /* 78008 80088008 00000000 */   nop
    /* 7800C 8008800C 1180043C */  lui        $a0, %hi(D_80110340)
    /* 78010 80088010 40038424 */  addiu      $a0, $a0, %lo(D_80110340)
  .L80088014:
    /* 78014 80088014 698F000C */  jal        setasyncfile
    /* 78018 80088018 00000000 */   nop
    /* 7801C 8008801C 21286002 */  addu       $a1, $s3, $zero
    /* 78020 80088020 0880073C */  lui        $a3, %hi(BL_AsyncLoadCallBack__Fi)
    /* 78024 80088024 6C7EE724 */  addiu      $a3, $a3, %lo(BL_AsyncLoadCallBack__Fi)
    /* 78028 80088028 0C00448E */  lw         $a0, 0xC($s2)
    /* 7802C 8008802C 1000468E */  lw         $a2, 0x10($s2)
    /* 78030 80088030 E28F000C */  jal        asyncloadsegmentcallback
    /* 78034 80088034 04008424 */   addiu     $a0, $a0, 0x4
    /* 78038 80088038 F785000C */  jal        GAL_Unlock
    /* 7803C 8008803C 21200002 */   addu      $a0, $s0, $zero
    /* 78040 80088040 FF004230 */  andi       $v0, $v0, 0xFF
    /* 78044 80088044 07004014 */  bnez       $v0, .L80088064
    /* 78048 80088048 21100002 */   addu      $v0, $s0, $zero
    /* 7804C 8008804C 21200000 */  addu       $a0, $zero, $zero
    /* 78050 80088050 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 78054 80088054 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 78058 80088058 A583000C */  jal        DBG_Error
    /* 7805C 8008805C B9020624 */   addiu     $a2, $zero, 0x2B9
    /* 78060 80088060 21100002 */  addu       $v0, $s0, $zero
  .L80088064:
    /* 78064 80088064 2000BF8F */  lw         $ra, 0x20($sp)
    /* 78068 80088068 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7806C 8008806C 1800B28F */  lw         $s2, 0x18($sp)
    /* 78070 80088070 1400B18F */  lw         $s1, 0x14($sp)
    /* 78074 80088074 1000B08F */  lw         $s0, 0x10($sp)
    /* 78078 80088078 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 7807C 8008807C 0800E003 */  jr         $ra
    /* 78080 80088080 00000000 */   nop
endlabel BL_LoadFileAsync__FPcc
