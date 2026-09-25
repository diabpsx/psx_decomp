.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPartJump__Fiiiii, 0x154

glabel StartPartJump__Fiiiii
    /* 8F440 8009F440 7009828F */  lw         $v0, %gp_rel(D_8011B0F0)($gp)
    /* 8F444 8009F444 7409838F */  lw         $v1, %gp_rel(D_8011B0F4)($gp)
    /* 8F448 8009F448 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8F44C 8009F44C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8F450 8009F450 2190A000 */  addu       $s2, $a1, $zero
    /* 8F454 8009F454 2000B4AF */  sw         $s4, 0x20($sp)
    /* 8F458 8009F458 2400BFAF */  sw         $ra, 0x24($sp)
    /* 8F45C 8009F45C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8F460 8009F460 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8F464 8009F464 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8F468 8009F468 25104300 */  or         $v0, $v0, $v1
    /* 8F46C 8009F46C 3800A38F */  lw         $v1, 0x38($sp)
    /* 8F470 8009F470 3F004014 */  bnez       $v0, .L8009F570
    /* 8F474 8009F474 21A0C000 */   addu      $s4, $a2, $zero
    /* 8F478 8009F478 21880000 */  addu       $s1, $zero, $zero
    /* 8F47C 8009F47C 0D80133C */  lui        $s3, %hi(D_800CC6BC)
    /* 8F480 8009F480 BCC67326 */  addiu      $s3, $s3, %lo(D_800CC6BC)
    /* 8F484 8009F484 21800000 */  addu       $s0, $zero, $zero
    /* 8F488 8009F488 01000224 */  addiu      $v0, $zero, 0x1
    /* 8F48C 8009F48C 700982AF */  sw         $v0, %gp_rel(D_8011B0F0)($gp)
    /* 8F490 8009F490 780987AF */  sw         $a3, %gp_rel(D_8011B0F8)($gp)
    /* 8F494 8009F494 581F83AF */  sw         $v1, %gp_rel(D_8011C6D8)($gp)
    /* 8F498 8009F498 5C1F84AF */  sw         $a0, %gp_rel(D_8011C6DC)($gp)
  .L8009F49C:
    /* 8F49C 8009F49C 6400023C */  lui        $v0, (0x640000 >> 16)
    /* 8F4A0 8009F4A0 1280013C */  lui        $at, %hi(D_8011CE00)
    /* 8F4A4 8009F4A4 21083000 */  addu       $at, $at, $s0
    /* 8F4A8 8009F4A8 00CE22AC */  sw         $v0, %lo(D_8011CE00)($at)
    /* 8F4AC 8009F4AC 64000224 */  addiu      $v0, $zero, 0x64
    /* 8F4B0 8009F4B0 1280013C */  lui        $at, %hi(D_8011CE04)
    /* 8F4B4 8009F4B4 21083000 */  addu       $at, $at, $s0
    /* 8F4B8 8009F4B8 04CE22AC */  sw         $v0, %lo(D_8011CE04)($at)
    /* 8F4BC 8009F4BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 8F4C0 8009F4C0 1280013C */  lui        $at, %hi(D_8011CE0C)
    /* 8F4C4 8009F4C4 21083000 */  addu       $at, $at, $s0
    /* 8F4C8 8009F4C8 0CCE22AC */  sw         $v0, %lo(D_8011CE0C)($at)
    /* 8F4CC 8009F4CC 3D83000C */  jal        GU_GetRnd
    /* 8F4D0 8009F4D0 00000000 */   nop
    /* 8F4D4 8009F4D4 07004230 */  andi       $v0, $v0, 0x7
    /* 8F4D8 8009F4D8 80100200 */  sll        $v0, $v0, 2
    /* 8F4DC 8009F4DC 21105300 */  addu       $v0, $v0, $s3
    /* 8F4E0 8009F4E0 0000428C */  lw         $v0, 0x0($v0)
    /* 8F4E4 8009F4E4 00000000 */  nop
    /* 8F4E8 8009F4E8 21105200 */  addu       $v0, $v0, $s2
    /* 8F4EC 8009F4EC 23100200 */  negu       $v0, $v0
    /* 8F4F0 8009F4F0 1280013C */  lui        $at, %hi(D_8011CE10)
    /* 8F4F4 8009F4F4 21083000 */  addu       $at, $at, $s0
    /* 8F4F8 8009F4F8 10CE22AC */  sw         $v0, %lo(D_8011CE10)($at)
    /* 8F4FC 8009F4FC 3D83000C */  jal        GU_GetRnd
    /* 8F500 8009F500 00000000 */   nop
    /* 8F504 8009F504 07004230 */  andi       $v0, $v0, 0x7
    /* 8F508 8009F508 80100200 */  sll        $v0, $v0, 2
    /* 8F50C 8009F50C 21105300 */  addu       $v0, $v0, $s3
    /* 8F510 8009F510 07002332 */  andi       $v1, $s1, 0x7
    /* 8F514 8009F514 0000428C */  lw         $v0, 0x0($v0)
    /* 8F518 8009F518 1280013C */  lui        $at, %hi(D_8011CE08)
    /* 8F51C 8009F51C 21083000 */  addu       $at, $at, $s0
    /* 8F520 8009F520 08CE23AC */  sw         $v1, %lo(D_8011CE08)($at)
    /* 8F524 8009F524 21105200 */  addu       $v0, $v0, $s2
    /* 8F528 8009F528 1280013C */  lui        $at, %hi(D_8011CE14)
    /* 8F52C 8009F52C 21083000 */  addu       $at, $at, $s0
    /* 8F530 8009F530 14CE22AC */  sw         $v0, %lo(D_8011CE14)($at)
    /* 8F534 8009F534 3D83000C */  jal        GU_GetRnd
    /* 8F538 8009F538 01003126 */   addiu     $s1, $s1, 0x1
    /* 8F53C 8009F53C 3F004230 */  andi       $v0, $v0, 0x3F
    /* 8F540 8009F540 00130200 */  sll        $v0, $v0, 12
    /* 8F544 8009F544 FEFF033C */  lui        $v1, (0xFFFE0000 >> 16)
    /* 8F548 8009F548 21104300 */  addu       $v0, $v0, $v1
    /* 8F54C 8009F54C 1280013C */  lui        $at, %hi(D_8011CE18)
    /* 8F550 8009F550 21083000 */  addu       $at, $at, $s0
    /* 8F554 8009F554 18CE22AC */  sw         $v0, %lo(D_8011CE18)($at)
    /* 8F558 8009F558 1280013C */  lui        $at, %hi(D_8011CE1C)
    /* 8F55C 8009F55C 21083000 */  addu       $at, $at, $s0
    /* 8F560 8009F560 1CCE34AC */  sw         $s4, %lo(D_8011CE1C)($at)
    /* 8F564 8009F564 1000222A */  slti       $v0, $s1, 0x10
    /* 8F568 8009F568 CCFF4014 */  bnez       $v0, .L8009F49C
    /* 8F56C 8009F56C 24001026 */   addiu     $s0, $s0, 0x24
  .L8009F570:
    /* 8F570 8009F570 2400BF8F */  lw         $ra, 0x24($sp)
    /* 8F574 8009F574 2000B48F */  lw         $s4, 0x20($sp)
    /* 8F578 8009F578 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 8F57C 8009F57C 1800B28F */  lw         $s2, 0x18($sp)
    /* 8F580 8009F580 1400B18F */  lw         $s1, 0x14($sp)
    /* 8F584 8009F584 1000B08F */  lw         $s0, 0x10($sp)
    /* 8F588 8009F588 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8F58C 8009F58C 0800E003 */  jr         $ra
    /* 8F590 8009F590 00000000 */   nop
endlabel StartPartJump__Fiiiii
