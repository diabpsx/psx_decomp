.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checkcrcblock, 0x84

glabel checkcrcblock
    /* 19590 80029590 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 19594 80029594 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19598 80029598 21808000 */  addu       $s0, $a0, $zero
    /* 1959C 8002959C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 195A0 800295A0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 195A4 800295A4 E9AD000C */  jal        getblockadr
    /* 195A8 800295A8 1400B1AF */   sw        $s1, 0x14($sp)
    /* 195AC 800295AC 21200002 */  addu       $a0, $s0, $zero
    /* 195B0 800295B0 EFAD000C */  jal        getblocklen
    /* 195B4 800295B4 21904000 */   addu      $s2, $v0, $zero
    /* 195B8 800295B8 01001124 */  addiu      $s1, $zero, 0x1
    /* 195BC 800295BC 21200002 */  addu       $a0, $s0, $zero
    /* 195C0 800295C0 45A5000C */  jal        iscrcblock
    /* 195C4 800295C4 21804000 */   addu      $s0, $v0, $zero
    /* 195C8 800295C8 0A004010 */  beqz       $v0, .L800295F4
    /* 195CC 800295CC 21205002 */   addu      $a0, $s2, $s0
    /* 195D0 800295D0 FCFF8424 */  addiu      $a0, $a0, -0x4
    /* 195D4 800295D4 D3B2000C */  jal        geti
    /* 195D8 800295D8 04000524 */   addiu     $a1, $zero, 0x4
    /* 195DC 800295DC 21204002 */  addu       $a0, $s2, $zero
    /* 195E0 800295E0 F4FF0526 */  addiu      $a1, $s0, -0xC
    /* 195E4 800295E4 EDA5000C */  jal        crc16
    /* 195E8 800295E8 21804000 */   addu      $s0, $v0, $zero
    /* 195EC 800295EC 26800202 */  xor        $s0, $s0, $v0
    /* 195F0 800295F0 0100112E */  sltiu      $s1, $s0, 0x1
  .L800295F4:
    /* 195F4 800295F4 21102002 */  addu       $v0, $s1, $zero
    /* 195F8 800295F8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 195FC 800295FC 1800B28F */  lw         $s2, 0x18($sp)
    /* 19600 80029600 1400B18F */  lw         $s1, 0x14($sp)
    /* 19604 80029604 1000B08F */  lw         $s0, 0x10($sp)
    /* 19608 80029608 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1960C 8002960C 0800E003 */  jr         $ra
    /* 19610 80029610 00000000 */   nop
endlabel checkcrcblock
