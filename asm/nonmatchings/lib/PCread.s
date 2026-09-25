.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PCread, 0xC0

glabel PCread
    /* 10AC 800110AC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 10B0 800110B0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 10B4 800110B4 21A08000 */  addu       $s4, $a0, $zero
    /* 10B8 800110B8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 10BC 800110BC 2198A000 */  addu       $s3, $a1, $zero
    /* 10C0 800110C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 10C4 800110C4 2180C000 */  addu       $s0, $a2, $zero
    /* 10C8 800110C8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 10CC 800110CC 21900000 */  addu       $s2, $zero, $zero
    /* 10D0 800110D0 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 10D4 800110D4 2800B6AF */  sw         $s6, 0x28($sp)
    /* 10D8 800110D8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 10DC 800110DC 17000012 */  beqz       $s0, .L8001113C
    /* 10E0 800110E0 1400B1AF */   sw        $s1, 0x14($sp)
    /* 10E4 800110E4 00801634 */  ori        $s6, $zero, 0x8000
    /* 10E8 800110E8 FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 10EC 800110EC 2B10D002 */  sltu       $v0, $s6, $s0
  .L800110F0:
    /* 10F0 800110F0 02004010 */  beqz       $v0, .L800110FC
    /* 10F4 800110F4 21880002 */   addu      $s1, $s0, $zero
    /* 10F8 800110F8 00801134 */  ori        $s1, $zero, 0x8000
  .L800110FC:
    /* 10FC 800110FC 21200000 */  addu       $a0, $zero, $zero
    /* 1100 80011100 21288002 */  addu       $a1, $s4, $zero
    /* 1104 80011104 21302002 */  addu       $a2, $s1, $zero
    /* 1108 80011108 5B44000C */  jal        _SN_read
    /* 110C 8001110C 21386002 */   addu      $a3, $s3, $zero
    /* 1110 80011110 03005514 */  bne        $v0, $s5, .L80011120
    /* 1114 80011114 21904202 */   addu      $s2, $s2, $v0
    /* 1118 80011118 50440008 */  j          .L80011140
    /* 111C 8001111C FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80011120:
    /* 1120 80011120 21986202 */  addu       $s3, $s3, $v0
    /* 1124 80011124 23800202 */  subu       $s0, $s0, $v0
    /* 1128 80011128 2A105100 */  slt        $v0, $v0, $s1
    /* 112C 8001112C 03004014 */  bnez       $v0, .L8001113C
    /* 1130 80011130 00000000 */   nop
    /* 1134 80011134 EEFF0016 */  bnez       $s0, .L800110F0
    /* 1138 80011138 2B10D002 */   sltu      $v0, $s6, $s0
  .L8001113C:
    /* 113C 8001113C 21104002 */  addu       $v0, $s2, $zero
  .L80011140:
    /* 1140 80011140 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 1144 80011144 2800B68F */  lw         $s6, 0x28($sp)
    /* 1148 80011148 2400B58F */  lw         $s5, 0x24($sp)
    /* 114C 8001114C 2000B48F */  lw         $s4, 0x20($sp)
    /* 1150 80011150 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1154 80011154 1800B28F */  lw         $s2, 0x18($sp)
    /* 1158 80011158 1400B18F */  lw         $s1, 0x14($sp)
    /* 115C 8001115C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1160 80011160 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1164 80011164 0800E003 */  jr         $ra
    /* 1168 80011168 00000000 */   nop
endlabel PCread
