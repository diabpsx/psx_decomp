.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AS_CallBack0__Fi, 0x6C

glabel AS_CallBack0__Fi
    /* 8A9B4 8009A9B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8A9B8 8009A9B8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8A9BC 8009A9BC 0C80113C */  lui        $s1, %hi(SFXTab + 0xD)
    /* 8A9C0 8009A9C0 ED9B3126 */  addiu      $s1, $s1, %lo(SFXTab + 0xD)
    /* 8A9C4 8009A9C4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8A9C8 8009A9C8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8A9CC 8009A9CC 00002292 */  lbu        $v0, 0x0($s1)
    /* 8A9D0 8009A9D0 00000000 */  nop
    /* 8A9D4 8009A9D4 0C004014 */  bnez       $v0, .L8009AA08
    /* 8A9D8 8009A9D8 21808000 */   addu      $s0, $a0, $zero
    /* 8A9DC 8009A9DC 7443000C */  jal        ReloadGP
    /* 8A9E0 8009A9E0 00000000 */   nop
    /* 8A9E4 8009A9E4 01000324 */  addiu      $v1, $zero, 0x1
    /* 8A9E8 8009A9E8 000023A2 */  sb         $v1, 0x0($s1)
    /* 8A9EC 8009A9EC 21200002 */  addu       $a0, $s0, $zero
    /* 8A9F0 8009A9F0 9A90000C */  jal        cancelasyncload
    /* 8A9F4 8009A9F4 21804000 */   addu      $s0, $v0, $zero
    /* 8A9F8 8009A9F8 53BE000C */  jal        systemtask
    /* 8A9FC 8009A9FC 21200000 */   addu      $a0, $zero, $zero
    /* 8AA00 8009AA00 7943000C */  jal        SetGP
    /* 8AA04 8009AA04 21200002 */   addu      $a0, $s0, $zero
  .L8009AA08:
    /* 8AA08 8009AA08 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8AA0C 8009AA0C 1400B18F */  lw         $s1, 0x14($sp)
    /* 8AA10 8009AA10 1000B08F */  lw         $s0, 0x10($sp)
    /* 8AA14 8009AA14 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8AA18 8009AA18 0800E003 */  jr         $ra
    /* 8AA1C 8009AA1C 00000000 */   nop
endlabel AS_CallBack0__Fi
