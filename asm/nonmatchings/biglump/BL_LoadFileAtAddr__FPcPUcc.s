.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_LoadFileAtAddr__FPcPUcc, 0x168

glabel BL_LoadFileAtAddr__FPcPUcc
    /* 77CB4 80087CB4 E803828F */  lw         $v0, %gp_rel(LFileTab)($gp)
    /* 77CB8 80087CB8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 77CBC 80087CBC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 77CC0 80087CC0 21908000 */  addu       $s2, $a0, $zero
    /* 77CC4 80087CC4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 77CC8 80087CC8 2198A000 */  addu       $s3, $a1, $zero
    /* 77CCC 80087CCC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 77CD0 80087CD0 2180C000 */  addu       $s0, $a2, $zero
    /* 77CD4 80087CD4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 77CD8 80087CD8 21A00002 */  addu       $s4, $s0, $zero
    /* 77CDC 80087CDC 2400BFAF */  sw         $ra, 0x24($sp)
    /* 77CE0 80087CE0 09004014 */  bnez       $v0, .L80087D08
    /* 77CE4 80087CE4 1400B1AF */   sw        $s1, 0x14($sp)
    /* 77CE8 80087CE8 01A4000C */  jal        fileexists
    /* 77CEC 80087CEC 00000000 */   nop
    /* 77CF0 80087CF0 25004010 */  beqz       $v0, .L80087D88
    /* 77CF4 80087CF4 21204002 */   addu      $a0, $s2, $zero
    /* 77CF8 80087CF8 68A6000C */  jal        loadfileatadr
    /* 77CFC 80087CFC 21286002 */   addu      $a1, $s3, $zero
    /* 77D00 80087D00 7E1F0208 */  j          .L80087DF8
    /* 77D04 80087D04 01000224 */   addiu     $v0, $zero, 0x1
  .L80087D08:
    /* 77D08 80087D08 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 77D0C 80087D0C 00000000 */   nop
    /* 77D10 80087D10 01004238 */  xori       $v0, $v0, 0x1
    /* 77D14 80087D14 04004010 */  beqz       $v0, .L80087D28
    /* 77D18 80087D18 21204002 */   addu      $a0, $s2, $zero
    /* 77D1C 80087D1C 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 77D20 80087D20 00000000 */   nop
    /* 77D24 80087D24 21204002 */  addu       $a0, $s2, $zero
  .L80087D28:
    /* 77D28 80087D28 00161000 */  sll        $v0, $s0, 24
    /* 77D2C 80087D2C 038E0200 */  sra        $s1, $v0, 24
    /* 77D30 80087D30 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 77D34 80087D34 21282002 */   addu      $a1, $s1, $zero
    /* 77D38 80087D38 21804000 */  addu       $s0, $v0, $zero
    /* 77D3C 80087D3C 08000016 */  bnez       $s0, .L80087D60
    /* 77D40 80087D40 0100253A */   xori      $a1, $s1, 0x1
    /* 77D44 80087D44 2B280500 */  sltu       $a1, $zero, $a1
    /* 77D48 80087D48 21A0A000 */  addu       $s4, $a1, $zero
    /* 77D4C 80087D4C 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 77D50 80087D50 21204002 */   addu      $a0, $s2, $zero
    /* 77D54 80087D54 21804000 */  addu       $s0, $v0, $zero
    /* 77D58 80087D58 27000012 */  beqz       $s0, .L80087DF8
    /* 77D5C 80087D5C 21100000 */   addu      $v0, $zero, $zero
  .L80087D60:
    /* 77D60 80087D60 0B006016 */  bnez       $s3, .L80087D90
    /* 77D64 80087D64 00161400 */   sll       $v0, $s4, 24
    /* 77D68 80087D68 1180023C */  lui        $v0, %hi(D_80110364)
    /* 77D6C 80087D6C 64034224 */  addiu      $v0, $v0, %lo(D_80110364)
    /* 77D70 80087D70 05004010 */  beqz       $v0, .L80087D88
    /* 77D74 80087D74 21200000 */   addu      $a0, $zero, $zero
    /* 77D78 80087D78 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77D7C 80087D7C 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77D80 80087D80 A583000C */  jal        DBG_Error
    /* 77D84 80087D84 1A020624 */   addiu     $a2, $zero, 0x21A
  .L80087D88:
    /* 77D88 80087D88 7E1F0208 */  j          .L80087DF8
    /* 77D8C 80087D8C 21100000 */   addu      $v0, $zero, $zero
  .L80087D90:
    /* 77D90 80087D90 03160200 */  sra        $v0, $v0, 24
    /* 77D94 80087D94 01000324 */  addiu      $v1, $zero, 0x1
    /* 77D98 80087D98 0B80043C */  lui        $a0, %hi(STREAM_BIN)
    /* 77D9C 80087D9C B4798424 */  addiu      $a0, $a0, %lo(STREAM_BIN)
    /* 77DA0 80087DA0 03004314 */  bne        $v0, $v1, .L80087DB0
    /* 77DA4 80087DA4 00000000 */   nop
    /* 77DA8 80087DA8 1180043C */  lui        $a0, %hi(D_80110340)
    /* 77DAC 80087DAC 40038424 */  addiu      $a0, $a0, %lo(D_80110340)
  .L80087DB0:
    /* 77DB0 80087DB0 698F000C */  jal        setasyncfile
    /* 77DB4 80087DB4 00000000 */   nop
    /* 77DB8 80087DB8 21286002 */  addu       $a1, $s3, $zero
    /* 77DBC 80087DBC 0C00048E */  lw         $a0, 0xC($s0)
    /* 77DC0 80087DC0 1000068E */  lw         $a2, 0x10($s0)
    /* 77DC4 80087DC4 3690000C */  jal        asyncloadsegment
    /* 77DC8 80087DC8 04008424 */   addiu     $a0, $a0, 0x4
    /* 77DCC 80087DCC 21804000 */  addu       $s0, $v0, $zero
  .L80087DD0:
    /* 77DD0 80087DD0 53BE000C */  jal        systemtask
    /* 77DD4 80087DD4 21200000 */   addu      $a0, $zero, $zero
    /* 77DD8 80087DD8 DB93000C */  jal        getasyncreadstatus
    /* 77DDC 80087DDC 21200002 */   addu      $a0, $s0, $zero
    /* 77DE0 80087DE0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 77DE4 80087DE4 FAFF4010 */  beqz       $v0, .L80087DD0
    /* 77DE8 80087DE8 00000000 */   nop
    /* 77DEC 80087DEC 9A90000C */  jal        cancelasyncload
    /* 77DF0 80087DF0 21200002 */   addu      $a0, $s0, $zero
    /* 77DF4 80087DF4 01000224 */  addiu      $v0, $zero, 0x1
  .L80087DF8:
    /* 77DF8 80087DF8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 77DFC 80087DFC 2000B48F */  lw         $s4, 0x20($sp)
    /* 77E00 80087E00 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 77E04 80087E04 1800B28F */  lw         $s2, 0x18($sp)
    /* 77E08 80087E08 1400B18F */  lw         $s1, 0x14($sp)
    /* 77E0C 80087E0C 1000B08F */  lw         $s0, 0x10($sp)
    /* 77E10 80087E10 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 77E14 80087E14 0800E003 */  jr         $ra
    /* 77E18 80087E18 00000000 */   nop
endlabel BL_LoadFileAtAddr__FPcPUcc
