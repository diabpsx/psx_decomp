.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Flash2__Fi, 0x1DC

glabel MI_Flash2__Fi
    /* C4B4 801460AC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* C4B8 801460B0 2800B2AF */  sw         $s2, 0x28($sp)
    /* C4BC 801460B4 21908000 */  addu       $s2, $a0, $zero
    /* C4C0 801460B8 80101200 */  sll        $v0, $s2, 2
    /* C4C4 801460BC 21105200 */  addu       $v0, $v0, $s2
    /* C4C8 801460C0 80100200 */  sll        $v0, $v0, 2
    /* C4CC 801460C4 23105200 */  subu       $v0, $v0, $s2
    /* C4D0 801460C8 80100200 */  sll        $v0, $v0, 2
    /* C4D4 801460CC 1080033C */  lui        $v1, %hi(missile)
    /* C4D8 801460D0 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* C4DC 801460D4 2400B1AF */  sw         $s1, 0x24($sp)
    /* C4E0 801460D8 21884300 */  addu       $s1, $v0, $v1
    /* C4E4 801460DC 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* C4E8 801460E0 2000B0AF */  sw         $s0, 0x20($sp)
    /* C4EC 801460E4 1A002296 */  lhu        $v0, 0x1A($s1)
    /* C4F0 801460E8 00000000 */  nop
    /* C4F4 801460EC 11004014 */  bnez       $v0, .L80146134
    /* C4F8 801460F0 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C4FC 801460F4 2E002386 */  lh         $v1, 0x2E($s1)
    /* C500 801460F8 00000000 */  nop
    /* C504 801460FC 0D006210 */  beq        $v1, $v0, .L80146134
    /* C508 80146100 40100300 */   sll       $v0, $v1, 1
    /* C50C 80146104 21104300 */  addu       $v0, $v0, $v1
    /* C510 80146108 80100200 */  sll        $v0, $v0, 2
    /* C514 8014610C 21104300 */  addu       $v0, $v0, $v1
    /* C518 80146110 00110200 */  sll        $v0, $v0, 4
    /* C51C 80146114 23104300 */  subu       $v0, $v0, $v1
    /* C520 80146118 80100200 */  sll        $v0, $v0, 2
    /* C524 8014611C 21104300 */  addu       $v0, $v0, $v1
    /* C528 80146120 C0100200 */  sll        $v0, $v0, 3
    /* C52C 80146124 01000324 */  addiu      $v1, $zero, 0x1
    /* C530 80146128 0E80013C */  lui        $at, %hi(plr + 0xD3)
    /* C534 8014612C 21082200 */  addu       $at, $at, $v0
    /* C538 80146130 0BA623A0 */  sb         $v1, %lo(plr + 0xD3)($at)
  .L80146134:
    /* C53C 80146134 21204002 */  addu       $a0, $s2, $zero
    /* C540 80146138 18002296 */  lhu        $v0, 0x18($s1)
    /* C544 8014613C 31002382 */  lb         $v1, 0x31($s1)
    /* C548 80146140 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* C54C 80146144 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* C550 80146148 180022A6 */  sh         $v0, 0x18($s1)
    /* C554 8014614C 1000A3AF */  sw         $v1, 0x10($sp)
    /* C558 80146150 32002282 */  lb         $v0, 0x32($s1)
    /* C55C 80146154 01001024 */  addiu      $s0, $zero, 0x1
    /* C560 80146158 1800B0AF */  sw         $s0, 0x18($sp)
    /* C564 8014615C 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C568 80146160 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* C56C 80146164 1400A2AF */  sw         $v0, 0x14($sp)
    /* C570 80146168 1000258E */  lw         $a1, 0x10($s1)
    /* C574 8014616C 01000724 */  addiu      $a3, $zero, 0x1
    /* C578 80146170 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C57C 80146174 2130A000 */   addu      $a2, $a1, $zero
    /* C580 80146178 31002282 */  lb         $v0, 0x31($s1)
    /* C584 8014617C 00000000 */  nop
    /* C588 80146180 1000A2AF */  sw         $v0, 0x10($sp)
    /* C58C 80146184 32002282 */  lb         $v0, 0x32($s1)
    /* C590 80146188 21204002 */  addu       $a0, $s2, $zero
    /* C594 8014618C 1800B0AF */  sw         $s0, 0x18($sp)
    /* C598 80146190 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C59C 80146194 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* C5A0 80146198 1400A2AF */  sw         $v0, 0x14($sp)
    /* C5A4 8014619C 1000258E */  lw         $a1, 0x10($s1)
    /* C5A8 801461A0 01000724 */  addiu      $a3, $zero, 0x1
    /* C5AC 801461A4 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C5B0 801461A8 2130A000 */   addu      $a2, $a1, $zero
    /* C5B4 801461AC 31002282 */  lb         $v0, 0x31($s1)
    /* C5B8 801461B0 00000000 */  nop
    /* C5BC 801461B4 01004224 */  addiu      $v0, $v0, 0x1
    /* C5C0 801461B8 1000A2AF */  sw         $v0, 0x10($sp)
    /* C5C4 801461BC 32002282 */  lb         $v0, 0x32($s1)
    /* C5C8 801461C0 21204002 */  addu       $a0, $s2, $zero
    /* C5CC 801461C4 1800B0AF */  sw         $s0, 0x18($sp)
    /* C5D0 801461C8 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C5D4 801461CC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* C5D8 801461D0 1400A2AF */  sw         $v0, 0x14($sp)
    /* C5DC 801461D4 1000258E */  lw         $a1, 0x10($s1)
    /* C5E0 801461D8 01000724 */  addiu      $a3, $zero, 0x1
    /* C5E4 801461DC 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C5E8 801461E0 2130A000 */   addu      $a2, $a1, $zero
    /* C5EC 801461E4 18002296 */  lhu        $v0, 0x18($s1)
    /* C5F0 801461E8 00000000 */  nop
    /* C5F4 801461EC 1D004014 */  bnez       $v0, .L80146264
    /* C5F8 801461F0 01000224 */   addiu     $v0, $zero, 0x1
    /* C5FC 801461F4 380022A2 */  sb         $v0, 0x38($s1)
    /* C600 801461F8 D51A8293 */  lbu        $v0, %gp_rel(fadetor)($gp)
    /* C604 801461FC D61A8393 */  lbu        $v1, %gp_rel(fadetog)($gp)
    /* C608 80146200 D71A8493 */  lbu        $a0, %gp_rel(fadetob)($gp)
    /* C60C 80146204 1A002596 */  lhu        $a1, 0x1A($s1)
    /* C610 80146208 1280013C */  lui        $at, %hi(restore_r)
    /* C614 8014620C F8B822AC */  sw         $v0, %lo(restore_r)($at)
    /* C618 80146210 1280013C */  lui        $at, %hi(restore_g)
    /* C61C 80146214 FCB823AC */  sw         $v1, %lo(restore_g)($at)
    /* C620 80146218 1280013C */  lui        $at, %hi(restore_b)
    /* C624 8014621C 00B924AC */  sw         $a0, %lo(restore_b)($at)
    /* C628 80146220 1000A014 */  bnez       $a1, .L80146264
    /* C62C 80146224 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C630 80146228 2E002386 */  lh         $v1, 0x2E($s1)
    /* C634 8014622C 00000000 */  nop
    /* C638 80146230 0C006210 */  beq        $v1, $v0, .L80146264
    /* C63C 80146234 40100300 */   sll       $v0, $v1, 1
    /* C640 80146238 21104300 */  addu       $v0, $v0, $v1
    /* C644 8014623C 80100200 */  sll        $v0, $v0, 2
    /* C648 80146240 21104300 */  addu       $v0, $v0, $v1
    /* C64C 80146244 00110200 */  sll        $v0, $v0, 4
    /* C650 80146248 23104300 */  subu       $v0, $v0, $v1
    /* C654 8014624C 80100200 */  sll        $v0, $v0, 2
    /* C658 80146250 21104300 */  addu       $v0, $v0, $v1
    /* C65C 80146254 C0100200 */  sll        $v0, $v0, 3
    /* C660 80146258 0E80013C */  lui        $at, %hi(plr + 0xD3)
    /* C664 8014625C 21082200 */  addu       $at, $at, $v0
    /* C668 80146260 0BA620A0 */  sb         $zero, %lo(plr + 0xD3)($at)
  .L80146264:
    /* C66C 80146264 D1EA040C */  jal        PutMissile__Fi
    /* C670 80146268 21204002 */   addu      $a0, $s2, $zero
    /* C674 8014626C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* C678 80146270 2800B28F */  lw         $s2, 0x28($sp)
    /* C67C 80146274 2400B18F */  lw         $s1, 0x24($sp)
    /* C680 80146278 2000B08F */  lw         $s0, 0x20($sp)
    /* C684 8014627C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* C688 80146280 0800E003 */  jr         $ra
    /* C68C 80146284 00000000 */   nop
endlabel MI_Flash2__Fi
