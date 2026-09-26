.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPortals__Fv, 0x60

glabel InitPortals__Fv
    /* 24B84 8015E77C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 24B88 8015E780 1000B0AF */  sw         $s0, 0x10($sp)
    /* 24B8C 8015E784 21800000 */  addu       $s0, $zero, $zero
    /* 24B90 8015E788 1400B1AF */  sw         $s1, 0x14($sp)
    /* 24B94 8015E78C 21880000 */  addu       $s1, $zero, $zero
    /* 24B98 8015E790 1800BFAF */  sw         $ra, 0x18($sp)
  .L8015E794:
    /* 24B9C 8015E794 BC3C010C */  jal        delta_portal_inited__Fi
    /* 24BA0 8015E798 21200002 */   addu      $a0, $s0, $zero
    /* 24BA4 8015E79C FF004230 */  andi       $v0, $v0, 0xFF
    /* 24BA8 8015E7A0 04004010 */  beqz       $v0, .L8015E7B4
    /* 24BAC 8015E7A4 00000000 */   nop
    /* 24BB0 8015E7A8 0E80013C */  lui        $at, %hi(portal + 0x8)
    /* 24BB4 8015E7AC 21083100 */  addu       $at, $at, $s1
    /* 24BB8 8015E7B0 F43B20A0 */  sb         $zero, %lo(portal + 0x8)($at)
  .L8015E7B4:
    /* 24BBC 8015E7B4 01001026 */  addiu      $s0, $s0, 0x1
    /* 24BC0 8015E7B8 0400022A */  slti       $v0, $s0, 0x4
    /* 24BC4 8015E7BC F5FF4014 */  bnez       $v0, .L8015E794
    /* 24BC8 8015E7C0 0C003126 */   addiu     $s1, $s1, 0xC
    /* 24BCC 8015E7C4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 24BD0 8015E7C8 1400B18F */  lw         $s1, 0x14($sp)
    /* 24BD4 8015E7CC 1000B08F */  lw         $s0, 0x10($sp)
    /* 24BD8 8015E7D0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 24BDC 8015E7D4 0800E003 */  jr         $ra
    /* 24BE0 8015E7D8 00000000 */   nop
endlabel InitPortals__Fv
