.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RunFunc__7GamePadi, 0xEC

glabel RunFunc__7GamePadi
    /* 68B78 80078B78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 68B7C 80078B7C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 68B80 80078B80 21808000 */  addu       $s0, $a0, $zero
    /* 68B84 80078B84 1280023C */  lui        $v0, %hi(FeFlag)
    /* 68B88 80078B88 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 68B8C 80078B8C 2120A000 */  addu       $a0, $a1, $zero
    /* 68B90 80078B90 2F004014 */  bnez       $v0, .L80078C50
    /* 68B94 80078B94 1400BFAF */   sw        $ra, 0x14($sp)
    /* 68B98 80078B98 0000028E */  lw         $v0, 0x0($s0)
    /* 68B9C 80078B9C 00000000 */  nop
    /* 68BA0 80078BA0 1C01428C */  lw         $v0, 0x11C($v0)
    /* 68BA4 80078BA4 00000000 */  nop
    /* 68BA8 80078BA8 83110200 */  sra        $v0, $v0, 6
    /* 68BAC 80078BAC 28004010 */  beqz       $v0, .L80078C50
    /* 68BB0 80078BB0 00000000 */   nop
    /* 68BB4 80078BB4 CA71020C */  jal        get_key_pad__Fi
    /* 68BB8 80078BB8 00000000 */   nop
    /* 68BBC 80078BBC D0000392 */  lbu        $v1, 0xD0($s0)
    /* 68BC0 80078BC0 00000000 */  nop
    /* 68BC4 80078BC4 19006010 */  beqz       $v1, .L80078C2C
    /* 68BC8 80078BC8 00000000 */   nop
    /* 68BCC 80078BCC 80100200 */  sll        $v0, $v0, 2
    /* 68BD0 80078BD0 21105000 */  addu       $v0, $v0, $s0
    /* 68BD4 80078BD4 9800458C */  lw         $a1, 0x98($v0)
    /* 68BD8 80078BD8 00000000 */  nop
    /* 68BDC 80078BDC 1C00A010 */  beqz       $a1, .L80078C50
    /* 68BE0 80078BE0 00000000 */   nop
    /* 68BE4 80078BE4 1280023C */  lui        $v0, %hi(leveltype)
    /* 68BE8 80078BE8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 68BEC 80078BEC 00000000 */  nop
    /* 68BF0 80078BF0 09004014 */  bnez       $v0, .L80078C18
    /* 68BF4 80078BF4 00000000 */   nop
    /* 68BF8 80078BF8 0A80023C */  lui        $v0, %hi(pad_func_AutoMap__Fi)
    /* 68BFC 80078BFC 5C254224 */  addiu      $v0, $v0, %lo(pad_func_AutoMap__Fi)
    /* 68C00 80078C00 0500A214 */  bne        $a1, $v0, .L80078C18
    /* 68C04 80078C04 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 68C08 80078C08 4C148383 */  lb         $v1, %gp_rel(D_8011BBCC)($gp)
    /* 68C0C 80078C0C 00000000 */  nop
    /* 68C10 80078C10 0F006214 */  bne        $v1, $v0, .L80078C50
    /* 68C14 80078C14 00000000 */   nop
  .L80078C18:
    /* 68C18 80078C18 4C000482 */  lb         $a0, 0x4C($s0)
    /* 68C1C 80078C1C 09F8A000 */  jalr       $a1
    /* 68C20 80078C20 00000000 */   nop
    /* 68C24 80078C24 14E30108 */  j          .L80078C50
    /* 68C28 80078C28 00000000 */   nop
  .L80078C2C:
    /* 68C2C 80078C2C 80100200 */  sll        $v0, $v0, 2
    /* 68C30 80078C30 21105000 */  addu       $v0, $v0, $s0
    /* 68C34 80078C34 6000428C */  lw         $v0, 0x60($v0)
    /* 68C38 80078C38 00000000 */  nop
    /* 68C3C 80078C3C 04004010 */  beqz       $v0, .L80078C50
    /* 68C40 80078C40 00000000 */   nop
    /* 68C44 80078C44 4C000482 */  lb         $a0, 0x4C($s0)
    /* 68C48 80078C48 09F84000 */  jalr       $v0
    /* 68C4C 80078C4C 00000000 */   nop
  .L80078C50:
    /* 68C50 80078C50 1400BF8F */  lw         $ra, 0x14($sp)
    /* 68C54 80078C54 1000B08F */  lw         $s0, 0x10($sp)
    /* 68C58 80078C58 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 68C5C 80078C5C 0800E003 */  jr         $ra
    /* 68C60 80078C60 00000000 */   nop
endlabel RunFunc__7GamePadi
