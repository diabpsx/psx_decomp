.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PCwrite, 0xC0

glabel PCwrite
    /* 1184 80011184 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1188 80011188 2000B4AF */  sw         $s4, 0x20($sp)
    /* 118C 8001118C 21A08000 */  addu       $s4, $a0, $zero
    /* 1190 80011190 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1194 80011194 2198A000 */  addu       $s3, $a1, $zero
    /* 1198 80011198 1000B0AF */  sw         $s0, 0x10($sp)
    /* 119C 8001119C 2180C000 */  addu       $s0, $a2, $zero
    /* 11A0 800111A0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 11A4 800111A4 21900000 */  addu       $s2, $zero, $zero
    /* 11A8 800111A8 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 11AC 800111AC 2800B6AF */  sw         $s6, 0x28($sp)
    /* 11B0 800111B0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 11B4 800111B4 17000012 */  beqz       $s0, .L80011214
    /* 11B8 800111B8 1400B1AF */   sw        $s1, 0x14($sp)
    /* 11BC 800111BC 00801634 */  ori        $s6, $zero, 0x8000
    /* 11C0 800111C0 FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 11C4 800111C4 2B10D002 */  sltu       $v0, $s6, $s0
  .L800111C8:
    /* 11C8 800111C8 02004010 */  beqz       $v0, .L800111D4
    /* 11CC 800111CC 21880002 */   addu      $s1, $s0, $zero
    /* 11D0 800111D0 00801134 */  ori        $s1, $zero, 0x8000
  .L800111D4:
    /* 11D4 800111D4 21200000 */  addu       $a0, $zero, $zero
    /* 11D8 800111D8 21288002 */  addu       $a1, $s4, $zero
    /* 11DC 800111DC 21302002 */  addu       $a2, $s1, $zero
    /* 11E0 800111E0 9144000C */  jal        _SN_write
    /* 11E4 800111E4 21386002 */   addu      $a3, $s3, $zero
    /* 11E8 800111E8 03005514 */  bne        $v0, $s5, .L800111F8
    /* 11EC 800111EC 21904202 */   addu      $s2, $s2, $v0
    /* 11F0 800111F0 86440008 */  j          .L80011218
    /* 11F4 800111F4 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L800111F8:
    /* 11F8 800111F8 21986202 */  addu       $s3, $s3, $v0
    /* 11FC 800111FC 23800202 */  subu       $s0, $s0, $v0
    /* 1200 80011200 2A105100 */  slt        $v0, $v0, $s1
    /* 1204 80011204 03004014 */  bnez       $v0, .L80011214
    /* 1208 80011208 00000000 */   nop
    /* 120C 8001120C EEFF0016 */  bnez       $s0, .L800111C8
    /* 1210 80011210 2B10D002 */   sltu      $v0, $s6, $s0
  .L80011214:
    /* 1214 80011214 21104002 */  addu       $v0, $s2, $zero
  .L80011218:
    /* 1218 80011218 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 121C 8001121C 2800B68F */  lw         $s6, 0x28($sp)
    /* 1220 80011220 2400B58F */  lw         $s5, 0x24($sp)
    /* 1224 80011224 2000B48F */  lw         $s4, 0x20($sp)
    /* 1228 80011228 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 122C 8001122C 1800B28F */  lw         $s2, 0x18($sp)
    /* 1230 80011230 1400B18F */  lw         $s1, 0x14($sp)
    /* 1234 80011234 1000B08F */  lw         $s0, 0x10($sp)
    /* 1238 80011238 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 123C 8001123C 0800E003 */  jr         $ra
    /* 1240 80011240 00000000 */   nop
endlabel PCwrite
