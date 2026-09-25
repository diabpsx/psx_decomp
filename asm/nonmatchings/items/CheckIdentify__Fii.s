.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckIdentify__Fii, 0xFC

glabel CheckIdentify__Fii
    /* 35D20 80045D20 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 35D24 80045D24 1800B2AF */  sw         $s2, 0x18($sp)
    /* 35D28 80045D28 21908000 */  addu       $s2, $a0, $zero
    /* 35D2C 80045D2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 35D30 80045D30 2180A000 */  addu       $s0, $a1, $zero
    /* 35D34 80045D34 40101200 */  sll        $v0, $s2, 1
    /* 35D38 80045D38 21105200 */  addu       $v0, $v0, $s2
    /* 35D3C 80045D3C 80100200 */  sll        $v0, $v0, 2
    /* 35D40 80045D40 21105200 */  addu       $v0, $v0, $s2
    /* 35D44 80045D44 00110200 */  sll        $v0, $v0, 4
    /* 35D48 80045D48 23105200 */  subu       $v0, $v0, $s2
    /* 35D4C 80045D4C 80100200 */  sll        $v0, $v0, 2
    /* 35D50 80045D50 21105200 */  addu       $v0, $v0, $s2
    /* 35D54 80045D54 1400B1AF */  sw         $s1, 0x14($sp)
    /* 35D58 80045D58 C0880200 */  sll        $s1, $v0, 3
    /* 35D5C 80045D5C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 35D60 80045D60 0E80133C */  lui        $s3, %hi(plr)
    /* 35D64 80045D64 38A57326 */  addiu      $s3, $s3, %lo(plr)
    /* 35D68 80045D68 21103302 */  addu       $v0, $s1, $s3
    /* 35D6C 80045D6C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 35D70 80045D70 30004584 */  lh         $a1, 0x30($v0)
    /* 35D74 80045D74 32004684 */  lh         $a2, 0x32($v0)
    /* 35D78 80045D78 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 35D7C 80045D7C 3D000424 */   addiu     $a0, $zero, 0x3D
    /* 35D80 80045D80 0700022A */  slti       $v0, $s0, 0x7
    /* 35D84 80045D84 08004010 */  beqz       $v0, .L80045DA8
    /* 35D88 80045D88 B0016326 */   addiu     $v1, $s3, 0x1B0
    /* 35D8C 80045D8C 21182302 */  addu       $v1, $s1, $v1
    /* 35D90 80045D90 C0101000 */  sll        $v0, $s0, 3
    /* 35D94 80045D94 23105000 */  subu       $v0, $v0, $s0
    /* 35D98 80045D98 80100200 */  sll        $v0, $v0, 2
    /* 35D9C 80045D9C 23105000 */  subu       $v0, $v0, $s0
    /* 35DA0 80045DA0 72170108 */  j          .L80045DC8
    /* 35DA4 80045DA4 80100200 */   sll       $v0, $v0, 2
  .L80045DA8:
    /* 35DA8 80045DA8 A4046326 */  addiu      $v1, $s3, 0x4A4
    /* 35DAC 80045DAC 21182302 */  addu       $v1, $s1, $v1
    /* 35DB0 80045DB0 C0101000 */  sll        $v0, $s0, 3
    /* 35DB4 80045DB4 23105000 */  subu       $v0, $v0, $s0
    /* 35DB8 80045DB8 80100200 */  sll        $v0, $v0, 2
    /* 35DBC 80045DBC 23105000 */  subu       $v0, $v0, $s0
    /* 35DC0 80045DC0 80100200 */  sll        $v0, $v0, 2
    /* 35DC4 80045DC4 0CFD4224 */  addiu      $v0, $v0, -0x2F4
  .L80045DC8:
    /* 35DC8 80045DC8 21186200 */  addu       $v1, $v1, $v0
    /* 35DCC 80045DCC 21204002 */  addu       $a0, $s2, $zero
    /* 35DD0 80045DD0 01000524 */  addiu      $a1, $zero, 0x1
    /* 35DD4 80045DD4 01000224 */  addiu      $v0, $zero, 0x1
    /* 35DD8 80045DD8 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 35DDC 80045DDC 690062A0 */   sb        $v0, 0x69($v1)
    /* 35DE0 80045DE0 1280023C */  lui        $v0, %hi(myplr)
    /* 35DE4 80045DE4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 35DE8 80045DE8 00000000 */  nop
    /* 35DEC 80045DEC 03004216 */  bne        $s2, $v0, .L80045DFC
    /* 35DF0 80045DF0 00000000 */   nop
    /* 35DF4 80045DF4 01DE000C */  jal        NewCursor__Fi
    /* 35DF8 80045DF8 01000424 */   addiu     $a0, $zero, 0x1
  .L80045DFC:
    /* 35DFC 80045DFC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 35E00 80045E00 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 35E04 80045E04 1800B28F */  lw         $s2, 0x18($sp)
    /* 35E08 80045E08 1400B18F */  lw         $s1, 0x14($sp)
    /* 35E0C 80045E0C 1000B08F */  lw         $s0, 0x10($sp)
    /* 35E10 80045E10 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 35E14 80045E14 0800E003 */  jr         $ra
    /* 35E18 80045E18 00000000 */   nop
endlabel CheckIdentify__Fii
