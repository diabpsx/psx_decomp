.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartFadein__FiiUc, 0x15C

glabel M_StartFadein__FiiUc
    /* 129F8 8014C5F0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 129FC 8014C5F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12A00 8014C5F8 21808000 */  addu       $s0, $a0, $zero
    /* 12A04 8014C5FC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 12A08 8014C600 2190A000 */  addu       $s2, $a1, $zero
    /* 12A0C 8014C604 40101000 */  sll        $v0, $s0, 1
    /* 12A10 8014C608 21105000 */  addu       $v0, $v0, $s0
    /* 12A14 8014C60C 80100200 */  sll        $v0, $v0, 2
    /* 12A18 8014C610 21105000 */  addu       $v0, $v0, $s0
    /* 12A1C 8014C614 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 12A20 8014C618 C0980200 */  sll        $s3, $v0, 3
    /* 12A24 8014C61C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12A28 8014C620 2188C000 */  addu       $s1, $a2, $zero
    /* 12A2C 8014C624 21304002 */  addu       $a2, $s2, $zero
    /* 12A30 8014C628 2000BFAF */  sw         $ra, 0x20($sp)
    /* 12A34 8014C62C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 12A38 8014C630 21083300 */  addu       $at, $at, $s3
    /* 12A3C 8014C634 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 12A40 8014C638 05000724 */  addiu      $a3, $zero, 0x5
    /* 12A44 8014C63C 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 12A48 8014C640 0E00A524 */   addiu     $a1, $a1, 0xE
    /* 12A4C 8014C644 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12A50 8014C648 21083300 */  addu       $at, $at, $s3
    /* 12A54 8014C64C C8532390 */  lbu        $v1, %lo(monster + 0x34)($at)
    /* 12A58 8014C650 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12A5C 8014C654 21083300 */  addu       $at, $at, $s3
    /* 12A60 8014C658 C9532590 */  lbu        $a1, %lo(monster + 0x35)($at)
    /* 12A64 8014C65C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12A68 8014C660 21083300 */  addu       $at, $at, $s3
    /* 12A6C 8014C664 C8532690 */  lbu        $a2, %lo(monster + 0x34)($at)
    /* 12A70 8014C668 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12A74 8014C66C 21083300 */  addu       $at, $at, $s3
    /* 12A78 8014C670 C9532790 */  lbu        $a3, %lo(monster + 0x35)($at)
    /* 12A7C 8014C674 08000224 */  addiu      $v0, $zero, 0x8
    /* 12A80 8014C678 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 12A84 8014C67C 21083300 */  addu       $at, $at, $s3
    /* 12A88 8014C680 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 12A8C 8014C684 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 12A90 8014C688 21083300 */  addu       $at, $at, $s3
    /* 12A94 8014C68C CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 12A98 8014C690 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 12A9C 8014C694 21083300 */  addu       $at, $at, $s3
    /* 12AA0 8014C698 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 12AA4 8014C69C 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 12AA8 8014C6A0 21083300 */  addu       $at, $at, $s3
    /* 12AAC 8014C6A4 CA5323A0 */  sb         $v1, %lo(monster + 0x36)($at)
    /* 12AB0 8014C6A8 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 12AB4 8014C6AC 21083300 */  addu       $at, $at, $s3
    /* 12AB8 8014C6B0 CB5325A0 */  sb         $a1, %lo(monster + 0x37)($at)
    /* 12ABC 8014C6B4 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 12AC0 8014C6B8 21083300 */  addu       $at, $at, $s3
    /* 12AC4 8014C6BC CC5326A0 */  sb         $a2, %lo(monster + 0x38)($at)
    /* 12AC8 8014C6C0 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 12ACC 8014C6C4 21083300 */  addu       $at, $at, $s3
    /* 12AD0 8014C6C8 CD5327A0 */  sb         $a3, %lo(monster + 0x39)($at)
    /* 12AD4 8014C6CC D5FC010C */  jal        M_CheckEFlag__Fi
    /* 12AD8 8014C6D0 21200002 */   addu      $a0, $s0, $zero
    /* 12ADC 8014C6D4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 12AE0 8014C6D8 21083300 */  addu       $at, $at, $s3
    /* 12AE4 8014C6DC C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 12AE8 8014C6E0 FF003132 */  andi       $s1, $s1, 0xFF
    /* 12AEC 8014C6E4 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 12AF0 8014C6E8 21083300 */  addu       $at, $at, $s3
    /* 12AF4 8014C6EC D05332A0 */  sb         $s2, %lo(monster + 0x3C)($at)
    /* 12AF8 8014C6F0 FEFF4230 */  andi       $v0, $v0, 0xFFFE
    /* 12AFC 8014C6F4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 12B00 8014C6F8 21083300 */  addu       $at, $at, $s3
    /* 12B04 8014C6FC C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 12B08 8014C700 0A002012 */  beqz       $s1, .L8014C72C
    /* 12B0C 8014C704 02004234 */   ori       $v0, $v0, 0x2
    /* 12B10 8014C708 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 12B14 8014C70C 21083300 */  addu       $at, $at, $s3
    /* 12B18 8014C710 D4532390 */  lbu        $v1, %lo(monster + 0x40)($at)
    /* 12B1C 8014C714 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 12B20 8014C718 21083300 */  addu       $at, $at, $s3
    /* 12B24 8014C71C C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 12B28 8014C720 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 12B2C 8014C724 21083300 */  addu       $at, $at, $s3
    /* 12B30 8014C728 D55323A0 */  sb         $v1, %lo(monster + 0x41)($at)
  .L8014C72C:
    /* 12B34 8014C72C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 12B38 8014C730 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 12B3C 8014C734 1800B28F */  lw         $s2, 0x18($sp)
    /* 12B40 8014C738 1400B18F */  lw         $s1, 0x14($sp)
    /* 12B44 8014C73C 1000B08F */  lw         $s0, 0x10($sp)
    /* 12B48 8014C740 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 12B4C 8014C744 0800E003 */  jr         $ra
    /* 12B50 8014C748 00000000 */   nop
endlabel M_StartFadein__FiiUc
