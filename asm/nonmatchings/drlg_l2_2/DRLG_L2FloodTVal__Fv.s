.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2FloodTVal__Fv, 0xF8

glabel DRLG_L2FloodTVal__Fv
    /* D078 80146C70 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* D07C 80146C74 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* D080 80146C78 10001524 */  addiu      $s5, $zero, 0x10
    /* D084 80146C7C 2800B4AF */  sw         $s4, 0x28($sp)
    /* D088 80146C80 21A00000 */  addu       $s4, $zero, $zero
    /* D08C 80146C84 3000B6AF */  sw         $s6, 0x30($sp)
    /* D090 80146C88 0E80163C */  lui        $s6, %hi(dungeon)
    /* D094 80146C8C C440D626 */  addiu      $s6, $s6, %lo(dungeon)
    /* D098 80146C90 3400BFAF */  sw         $ra, 0x34($sp)
    /* D09C 80146C94 2400B3AF */  sw         $s3, 0x24($sp)
    /* D0A0 80146C98 2000B2AF */  sw         $s2, 0x20($sp)
    /* D0A4 80146C9C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* D0A8 80146CA0 1800B0AF */  sw         $s0, 0x18($sp)
  .L80146CA4:
    /* D0AC 80146CA4 10001324 */  addiu      $s3, $zero, 0x10
    /* D0B0 80146CA8 21800000 */  addu       $s0, $zero, $zero
    /* D0B4 80146CAC 2190C002 */  addu       $s2, $s6, $zero
    /* D0B8 80146CB0 C0101500 */  sll        $v0, $s5, 3
    /* D0BC 80146CB4 00385124 */  addiu      $s1, $v0, 0x3800
  .L80146CB8:
    /* D0C0 80146CB8 40101400 */  sll        $v0, $s4, 1
    /* D0C4 80146CBC 21105200 */  addu       $v0, $v0, $s2
    /* D0C8 80146CC0 00004394 */  lhu        $v1, 0x0($v0)
    /* D0CC 80146CC4 03000224 */  addiu      $v0, $zero, 0x3
    /* D0D0 80146CC8 12006214 */  bne        $v1, $v0, .L80146D14
    /* D0D4 80146CCC 00000000 */   nop
    /* D0D8 80146CD0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D0DC 80146CD4 21083100 */  addu       $at, $at, $s1
    /* D0E0 80146CD8 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* D0E4 80146CDC 00000000 */  nop
    /* D0E8 80146CE0 0C004014 */  bnez       $v0, .L80146D14
    /* D0EC 80146CE4 21200002 */   addu      $a0, $s0, $zero
    /* D0F0 80146CE8 21288002 */  addu       $a1, $s4, $zero
    /* D0F4 80146CEC 21306002 */  addu       $a2, $s3, $zero
    /* D0F8 80146CF0 2138A002 */  addu       $a3, $s5, $zero
    /* D0FC 80146CF4 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* D100 80146CF8 1000A0AF */   sw        $zero, 0x10($sp)
    /* D104 80146CFC 1280023C */  lui        $v0, %hi(TransVal)
    /* D108 80146D00 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* D10C 80146D04 00000000 */  nop
    /* D110 80146D08 01004224 */  addiu      $v0, $v0, 0x1
    /* D114 80146D0C 1280013C */  lui        $at, %hi(TransVal)
    /* D118 80146D10 48C122A0 */  sb         $v0, %lo(TransVal)($at)
  .L80146D14:
    /* D11C 80146D14 00073126 */  addiu      $s1, $s1, 0x700
    /* D120 80146D18 02007326 */  addiu      $s3, $s3, 0x2
    /* D124 80146D1C 01001026 */  addiu      $s0, $s0, 0x1
    /* D128 80146D20 2800022A */  slti       $v0, $s0, 0x28
    /* D12C 80146D24 E4FF4014 */  bnez       $v0, .L80146CB8
    /* D130 80146D28 60005226 */   addiu     $s2, $s2, 0x60
    /* D134 80146D2C 01009426 */  addiu      $s4, $s4, 0x1
    /* D138 80146D30 2800822A */  slti       $v0, $s4, 0x28
    /* D13C 80146D34 DBFF4014 */  bnez       $v0, .L80146CA4
    /* D140 80146D38 0200B526 */   addiu     $s5, $s5, 0x2
    /* D144 80146D3C 3400BF8F */  lw         $ra, 0x34($sp)
    /* D148 80146D40 3000B68F */  lw         $s6, 0x30($sp)
    /* D14C 80146D44 2C00B58F */  lw         $s5, 0x2C($sp)
    /* D150 80146D48 2800B48F */  lw         $s4, 0x28($sp)
    /* D154 80146D4C 2400B38F */  lw         $s3, 0x24($sp)
    /* D158 80146D50 2000B28F */  lw         $s2, 0x20($sp)
    /* D15C 80146D54 1C00B18F */  lw         $s1, 0x1C($sp)
    /* D160 80146D58 1800B08F */  lw         $s0, 0x18($sp)
    /* D164 80146D5C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* D168 80146D60 0800E003 */  jr         $ra
    /* D16C 80146D64 00000000 */   nop
endlabel DRLG_L2FloodTVal__Fv
