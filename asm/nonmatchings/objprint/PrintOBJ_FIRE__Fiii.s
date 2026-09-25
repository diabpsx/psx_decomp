.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_FIRE__Fiii, 0x1B8

glabel PrintOBJ_FIRE__Fiii
    /* 6DDD0 8007DDD0 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 6DDD4 8007DDD4 2000A4AF */  sw         $a0, 0x20($sp)
    /* 6DDD8 8007DDD8 21200000 */  addu       $a0, $zero, $zero
    /* 6DDDC 8007DDDC 6400BFAF */  sw         $ra, 0x64($sp)
    /* 6DDE0 8007DDE0 6000BEAF */  sw         $fp, 0x60($sp)
    /* 6DDE4 8007DDE4 5C00B7AF */  sw         $s7, 0x5C($sp)
    /* 6DDE8 8007DDE8 5800B6AF */  sw         $s6, 0x58($sp)
    /* 6DDEC 8007DDEC 5400B5AF */  sw         $s5, 0x54($sp)
    /* 6DDF0 8007DDF0 5000B4AF */  sw         $s4, 0x50($sp)
    /* 6DDF4 8007DDF4 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 6DDF8 8007DDF8 4800B2AF */  sw         $s2, 0x48($sp)
    /* 6DDFC 8007DDFC 4400B1AF */  sw         $s1, 0x44($sp)
    /* 6DE00 8007DE00 4000B0AF */  sw         $s0, 0x40($sp)
    /* 6DE04 8007DE04 2800A5AF */  sw         $a1, 0x28($sp)
    /* 6DE08 8007DE08 044F020C */  jal        GM_UseTexData__Fi
    /* 6DE0C 8007DE0C 3000A6AF */   sw        $a2, 0x30($sp)
    /* 6DE10 8007DE10 3E10020C */  jal        VID_GetTick__Fv
    /* 6DE14 8007DE14 3800A2AF */   sw        $v0, 0x38($sp)
    /* 6DE18 8007DE18 1380163C */  lui        $s6, %hi(D_8012FD20)
    /* 6DE1C 8007DE1C 20FDD626 */  addiu      $s6, $s6, %lo(D_8012FD20)
    /* 6DE20 8007DE20 21B80000 */  addu       $s7, $zero, $zero
    /* 6DE24 8007DE24 C414838F */  lw         $v1, %gp_rel(MissDat + 0x1C)($gp)
    /* 6DE28 8007DE28 0400D426 */  addiu      $s4, $s6, 0x4
    /* 6DE2C 8007DE2C 3E10020C */  jal        VID_GetTick__Fv
    /* 6DE30 8007DE30 23F04300 */   subu      $fp, $v0, $v1
    /* 6DE34 8007DE34 C41482AF */  sw         $v0, %gp_rel(MissDat + 0x1C)($gp)
  .L8007DE38:
    /* 6DE38 8007DE38 1000E22A */  slti       $v0, $s7, 0x10
    /* 6DE3C 8007DE3C 44004010 */  beqz       $v0, .L8007DF50
    /* 6DE40 8007DE40 D9000524 */   addiu     $a1, $zero, 0xD9
    /* 6DE44 8007DE44 0000D596 */  lhu        $s5, 0x0($s6)
    /* 6DE48 8007DE48 FEFF9396 */  lhu        $s3, -0x2($s4)
    /* 6DE4C 8007DE4C 00009296 */  lhu        $s2, 0x0($s4)
    /* 6DE50 8007DE50 3800A48F */  lw         $a0, 0x38($sp)
    /* 6DE54 8007DE54 3000A88F */  lw         $t0, 0x30($sp)
    /* 6DE58 8007DE58 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6DE5C 8007DE5C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6DE60 8007DE60 01000225 */  addiu      $v0, $t0, 0x1
    /* 6DE64 8007DE64 2000A88F */  lw         $t0, 0x20($sp)
    /* 6DE68 8007DE68 028A1300 */  srl        $s1, $s3, 8
    /* 6DE6C 8007DE6C 2130A802 */  addu       $a2, $s5, $t0
    /* 6DE70 8007DE70 2800A88F */  lw         $t0, 0x28($sp)
    /* 6DE74 8007DE74 FFFF3032 */  andi       $s0, $s1, 0xFFFF
    /* 6DE78 8007DE78 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6DE7C 8007DE7C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6DE80 8007DE80 23381001 */   subu      $a3, $t0, $s0
    /* 6DE84 8007DE84 10000824 */  addiu      $t0, $zero, 0x10
    /* 6DE88 8007DE88 23801001 */  subu       $s0, $t0, $s0
    /* 6DE8C 8007DE8C C0181000 */  sll        $v1, $s0, 3
    /* 6DE90 8007DE90 040043A0 */  sb         $v1, 0x4($v0)
    /* 6DE94 8007DE94 80181000 */  sll        $v1, $s0, 2
    /* 6DE98 8007DE98 21187000 */  addu       $v1, $v1, $s0
    /* 6DE9C 8007DE9C 050043A0 */  sb         $v1, 0x5($v0)
    /* 6DEA0 8007DEA0 07004390 */  lbu        $v1, 0x7($v0)
    /* 6DEA4 8007DEA4 23881101 */  subu       $s1, $t0, $s1
    /* 6DEA8 8007DEA8 060051A0 */  sb         $s1, 0x6($v0)
    /* 6DEAC 8007DEAC 02006334 */  ori        $v1, $v1, 0x2
    /* 6DEB0 8007DEB0 FE006330 */  andi       $v1, $v1, 0xFE
    /* 6DEB4 8007DEB4 070043A0 */  sb         $v1, 0x7($v0)
    /* 6DEB8 8007DEB8 16004394 */  lhu        $v1, 0x16($v0)
    /* 6DEBC 8007DEBC 1280043C */  lui        $a0, %hi(PauseMode)
    /* 6DEC0 8007DEC0 A4B78490 */  lbu        $a0, %lo(PauseMode)($a0)
    /* 6DEC4 8007DEC4 20006334 */  ori        $v1, $v1, 0x20
    /* 6DEC8 8007DEC8 1A008014 */  bnez       $a0, .L8007DF34
    /* 6DECC 8007DECC 160043A4 */   sh        $v1, 0x16($v0)
    /* 6DED0 8007DED0 CC14828F */  lw         $v0, %gp_rel(MissDat + 0x24)($gp)
    /* 6DED4 8007DED4 00000000 */  nop
    /* 6DED8 8007DED8 16004010 */  beqz       $v0, .L8007DF34
    /* 6DEDC 8007DEDC 18005E02 */   mult      $s2, $fp
    /* 6DEE0 8007DEE0 12400000 */  mflo       $t0
    /* 6DEE4 8007DEE4 21986802 */  addu       $s3, $s3, $t0
    /* 6DEE8 8007DEE8 FFFF6232 */  andi       $v0, $s3, 0xFFFF
    /* 6DEEC 8007DEEC 02120200 */  srl        $v0, $v0, 8
    /* 6DEF0 8007DEF0 1100422C */  sltiu      $v0, $v0, 0x11
    /* 6DEF4 8007DEF4 0F004014 */  bnez       $v0, .L8007DF34
    /* 6DEF8 8007DEF8 10005226 */   addiu     $s2, $s2, 0x10
    /* 6DEFC 8007DEFC 3D83000C */  jal        GU_GetRnd
    /* 6DF00 8007DF00 21980000 */   addu      $s3, $zero, $zero
    /* 6DF04 8007DF04 CCCC033C */  lui        $v1, (0xCCCCCCCD >> 16)
    /* 6DF08 8007DF08 CDCC6334 */  ori        $v1, $v1, (0xCCCCCCCD & 0xFFFF)
    /* 6DF0C 8007DF0C 19004300 */  multu      $v0, $v1
    /* 6DF10 8007DF10 10400000 */  mfhi       $t0
    /* 6DF14 8007DF14 82200800 */  srl        $a0, $t0, 2
    /* 6DF18 8007DF18 80180400 */  sll        $v1, $a0, 2
    /* 6DF1C 8007DF1C 21186400 */  addu       $v1, $v1, $a0
    /* 6DF20 8007DF20 23104300 */  subu       $v0, $v0, $v1
    /* 6DF24 8007DF24 3D83000C */  jal        GU_GetRnd
    /* 6DF28 8007DF28 02005524 */   addiu     $s5, $v0, 0x2
    /* 6DF2C 8007DF2C 7F004230 */  andi       $v0, $v0, 0x7F
    /* 6DF30 8007DF30 20005224 */  addiu      $s2, $v0, 0x20
  .L8007DF34:
    /* 6DF34 8007DF34 0000D5A6 */  sh         $s5, 0x0($s6)
    /* 6DF38 8007DF38 FEFF93A6 */  sh         $s3, -0x2($s4)
    /* 6DF3C 8007DF3C 000092A6 */  sh         $s2, 0x0($s4)
    /* 6DF40 8007DF40 06009426 */  addiu      $s4, $s4, 0x6
    /* 6DF44 8007DF44 0600D626 */  addiu      $s6, $s6, 0x6
    /* 6DF48 8007DF48 8EF70108 */  j          .L8007DE38
    /* 6DF4C 8007DF4C 0100F726 */   addiu     $s7, $s7, 0x1
  .L8007DF50:
    /* 6DF50 8007DF50 CC1480AF */  sw         $zero, %gp_rel(MissDat + 0x24)($gp)
    /* 6DF54 8007DF54 6400BF8F */  lw         $ra, 0x64($sp)
    /* 6DF58 8007DF58 6000BE8F */  lw         $fp, 0x60($sp)
    /* 6DF5C 8007DF5C 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 6DF60 8007DF60 5800B68F */  lw         $s6, 0x58($sp)
    /* 6DF64 8007DF64 5400B58F */  lw         $s5, 0x54($sp)
    /* 6DF68 8007DF68 5000B48F */  lw         $s4, 0x50($sp)
    /* 6DF6C 8007DF6C 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 6DF70 8007DF70 4800B28F */  lw         $s2, 0x48($sp)
    /* 6DF74 8007DF74 4400B18F */  lw         $s1, 0x44($sp)
    /* 6DF78 8007DF78 4000B08F */  lw         $s0, 0x40($sp)
    /* 6DF7C 8007DF7C 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 6DF80 8007DF80 0800E003 */  jr         $ra
    /* 6DF84 8007DF84 00000000 */   nop
endlabel PrintOBJ_FIRE__Fiii
