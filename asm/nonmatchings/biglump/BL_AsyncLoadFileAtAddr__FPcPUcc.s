.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_AsyncLoadFileAtAddr__FPcPUcc, 0x11C

glabel BL_AsyncLoadFileAtAddr__FPcPUcc
    /* 78084 80088084 F1038293 */  lbu        $v0, %gp_rel(NoQuedAsyncs)($gp)
    /* 78088 80088088 F2038393 */  lbu        $v1, %gp_rel(CurrAsync)($gp)
    /* 7808C 8008808C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 78090 80088090 1800B2AF */  sw         $s2, 0x18($sp)
    /* 78094 80088094 21908000 */  addu       $s2, $a0, $zero
    /* 78098 80088098 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7809C 8008809C 2198A000 */  addu       $s3, $a1, $zero
    /* 780A0 800880A0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 780A4 800880A4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 780A8 800880A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 780AC 800880AC 01004224 */  addiu      $v0, $v0, 0x1
    /* 780B0 800880B0 F10382A3 */  sb         $v0, %gp_rel(NoQuedAsyncs)($gp)
    /* 780B4 800880B4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 780B8 800880B8 08006210 */  beq        $v1, $v0, .L800880DC
    /* 780BC 800880BC 2188C000 */   addu      $s1, $a2, $zero
    /* 780C0 800880C0 21804000 */  addu       $s0, $v0, $zero
  .L800880C4:
    /* 780C4 800880C4 EE80000C */  jal        TSK_Sleep
    /* 780C8 800880C8 01000424 */   addiu     $a0, $zero, 0x1
    /* 780CC 800880CC F2038293 */  lbu        $v0, %gp_rel(CurrAsync)($gp)
    /* 780D0 800880D0 00000000 */  nop
    /* 780D4 800880D4 FBFF5014 */  bne        $v0, $s0, .L800880C4
    /* 780D8 800880D8 00000000 */   nop
  .L800880DC:
    /* 780DC 800880DC 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 780E0 800880E0 00000000 */   nop
    /* 780E4 800880E4 01004238 */  xori       $v0, $v0, 0x1
    /* 780E8 800880E8 04004010 */  beqz       $v0, .L800880FC
    /* 780EC 800880EC 21204002 */   addu      $a0, $s2, $zero
    /* 780F0 800880F0 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 780F4 800880F4 00000000 */   nop
    /* 780F8 800880F8 21204002 */  addu       $a0, $s2, $zero
  .L800880FC:
    /* 780FC 800880FC 00161100 */  sll        $v0, $s1, 24
    /* 78100 80088100 038E0200 */  sra        $s1, $v0, 24
    /* 78104 80088104 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 78108 80088108 21282002 */   addu      $a1, $s1, $zero
    /* 7810C 8008810C 21804000 */  addu       $s0, $v0, $zero
    /* 78110 80088110 1B000012 */  beqz       $s0, .L80088180
    /* 78114 80088114 21100000 */   addu      $v0, $zero, $zero
    /* 78118 80088118 1000028E */  lw         $v0, 0x10($s0)
    /* 7811C 8008811C 00000000 */  nop
    /* 78120 80088120 17004010 */  beqz       $v0, .L80088180
    /* 78124 80088124 21100000 */   addu      $v0, $zero, $zero
    /* 78128 80088128 F0038293 */  lbu        $v0, %gp_rel(FileLoaded)($gp)
    /* 7812C 8008812C 00000000 */  nop
    /* 78130 80088130 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 78134 80088134 F00382A3 */  sb         $v0, %gp_rel(FileLoaded)($gp)
    /* 78138 80088138 F0038293 */  lbu        $v0, %gp_rel(FileLoaded)($gp)
    /* 7813C 8008813C 01000224 */  addiu      $v0, $zero, 0x1
    /* 78140 80088140 0B80043C */  lui        $a0, %hi(STREAM_BIN)
    /* 78144 80088144 B4798424 */  addiu      $a0, $a0, %lo(STREAM_BIN)
    /* 78148 80088148 03002216 */  bne        $s1, $v0, .L80088158
    /* 7814C 8008814C 00000000 */   nop
    /* 78150 80088150 1180043C */  lui        $a0, %hi(D_80110340)
    /* 78154 80088154 40038424 */  addiu      $a0, $a0, %lo(D_80110340)
  .L80088158:
    /* 78158 80088158 698F000C */  jal        setasyncfile
    /* 7815C 8008815C 00000000 */   nop
    /* 78160 80088160 21286002 */  addu       $a1, $s3, $zero
    /* 78164 80088164 0880073C */  lui        $a3, %hi(BL_AsyncLoadCallBack__Fi)
    /* 78168 80088168 6C7EE724 */  addiu      $a3, $a3, %lo(BL_AsyncLoadCallBack__Fi)
    /* 7816C 8008816C 0C00048E */  lw         $a0, 0xC($s0)
    /* 78170 80088170 1000068E */  lw         $a2, 0x10($s0)
    /* 78174 80088174 E28F000C */  jal        asyncloadsegmentcallback
    /* 78178 80088178 04008424 */   addiu     $a0, $a0, 0x4
    /* 7817C 8008817C 01000224 */  addiu      $v0, $zero, 0x1
  .L80088180:
    /* 78180 80088180 2000BF8F */  lw         $ra, 0x20($sp)
    /* 78184 80088184 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 78188 80088188 1800B28F */  lw         $s2, 0x18($sp)
    /* 7818C 8008818C 1400B18F */  lw         $s1, 0x14($sp)
    /* 78190 80088190 1000B08F */  lw         $s0, 0x10($sp)
    /* 78194 80088194 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 78198 80088198 0800E003 */  jr         $ra
    /* 7819C 8008819C 00000000 */   nop
endlabel BL_AsyncLoadFileAtAddr__FPcPUcc
