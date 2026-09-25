.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching load_demo_pad_data__FUl, 0x60

glabel load_demo_pad_data__FUl
    /* 8B870 8009B870 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B874 8009B874 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B878 8009B878 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8B87C 8009B87C 1D11020C */  jal        SYSI_GetFs__Fv
    /* 8B880 8009B880 21808000 */   addu      $s0, $a0, $zero
    /* 8B884 8009B884 21204000 */  addu       $a0, $v0, $zero
    /* 8B888 8009B888 0A00022E */  sltiu      $v0, $s0, 0xA
    /* 8B88C 8009B88C 03004014 */  bnez       $v0, .L8009B89C
    /* 8B890 8009B890 30000226 */   addiu     $v0, $s0, 0x30
    /* 8B894 8009B894 07001026 */  addiu      $s0, $s0, 0x7
    /* 8B898 8009B898 30000226 */  addiu      $v0, $s0, 0x30
  .L8009B89C:
    /* 8B89C 8009B89C 1180013C */  lui        $at, %hi(D_80110B2B)
    /* 8B8A0 8009B8A0 2B0B22A0 */  sb         $v0, %lo(D_80110B2B)($at)
    /* 8B8A4 8009B8A4 1180053C */  lui        $a1, %hi(D_80110B24)
    /* 8B8A8 8009B8A8 240BA524 */  addiu      $a1, $a1, %lo(D_80110B24)
    /* 8B8AC 8009B8AC 0B80063C */  lui        $a2, %hi(demo_buffer)
    /* 8B8B0 8009B8B0 547FC624 */  addiu      $a2, $a2, %lo(demo_buffer)
    /* 8B8B4 8009B8B4 FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 8B8B8 8009B8B8 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 8B8BC 8009B8BC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8B8C0 8009B8C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B8C4 8009B8C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B8C8 8009B8C8 0800E003 */  jr         $ra
    /* 8B8CC 8009B8CC 00000000 */   nop
endlabel load_demo_pad_data__FUl
