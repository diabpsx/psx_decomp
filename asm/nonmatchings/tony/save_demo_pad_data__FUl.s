.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching save_demo_pad_data__FUl, 0x60

glabel save_demo_pad_data__FUl
    /* 8B8D0 8009B8D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B8D4 8009B8D4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B8D8 8009B8D8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8B8DC 8009B8DC 1D11020C */  jal        SYSI_GetFs__Fv
    /* 8B8E0 8009B8E0 21808000 */   addu      $s0, $a0, $zero
    /* 8B8E4 8009B8E4 21204000 */  addu       $a0, $v0, $zero
    /* 8B8E8 8009B8E8 0A00022E */  sltiu      $v0, $s0, 0xA
    /* 8B8EC 8009B8EC 03004014 */  bnez       $v0, .L8009B8FC
    /* 8B8F0 8009B8F0 30000226 */   addiu     $v0, $s0, 0x30
    /* 8B8F4 8009B8F4 07001026 */  addiu      $s0, $s0, 0x7
    /* 8B8F8 8009B8F8 30000226 */  addiu      $v0, $s0, 0x30
  .L8009B8FC:
    /* 8B8FC 8009B8FC 1180013C */  lui        $at, %hi(D_80110B2B)
    /* 8B900 8009B900 2B0B22A0 */  sb         $v0, %lo(D_80110B2B)($at)
    /* 8B904 8009B904 1180053C */  lui        $a1, %hi(D_80110B24)
    /* 8B908 8009B908 240BA524 */  addiu      $a1, $a1, %lo(D_80110B24)
    /* 8B90C 8009B90C 0B80063C */  lui        $a2, %hi(demo_buffer)
    /* 8B910 8009B910 547FC624 */  addiu      $a2, $a2, %lo(demo_buffer)
    /* 8B914 8009B914 1E18020C */  jal        Save__6FileIOPCcPUci
    /* 8B918 8009B918 84030724 */   addiu     $a3, $zero, 0x384
    /* 8B91C 8009B91C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8B920 8009B920 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B924 8009B924 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B928 8009B928 0800E003 */  jr         $ra
    /* 8B92C 8009B92C 00000000 */   nop
endlabel save_demo_pad_data__FUl
