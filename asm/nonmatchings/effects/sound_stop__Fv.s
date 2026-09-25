.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sound_stop__Fv, 0x98

glabel sound_stop__Fv
    /* 2D830 8003D830 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2D834 8003D834 01000424 */  addiu      $a0, $zero, 0x1
    /* 2D838 8003D838 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 2D83C 8003D83C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2D840 8003D840 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2D844 8003D844 45DF010C */  jal        snd_update__FUc
    /* 2D848 8003D848 1000B0AF */   sw        $s0, 0x10($sp)
    /* 2D84C 8003D84C D7F3000C */  jal        stream_stop__Fv
    /* 2D850 8003D850 21900000 */   addu      $s2, $zero, $zero
    /* 2D854 8003D854 58F4000C */  jal        sfx_stop__Fv
    /* 2D858 8003D858 00000000 */   nop
  .L8003D85C:
    /* 2D85C 8003D85C 1280023C */  lui        $v0, %hi(nummtypes)
    /* 2D860 8003D860 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 2D864 8003D864 00000000 */  nop
    /* 2D868 8003D868 2A104202 */  slt        $v0, $s2, $v0
    /* 2D86C 8003D86C 0F004010 */  beqz       $v0, .L8003D8AC
    /* 2D870 8003D870 21880000 */   addu      $s1, $zero, $zero
  .L8003D874:
    /* 2D874 8003D874 0400222A */  slti       $v0, $s1, 0x4
    /* 2D878 8003D878 0A004010 */  beqz       $v0, .L8003D8A4
    /* 2D87C 8003D87C 21800000 */   addu      $s0, $zero, $zero
  .L8003D880:
    /* 2D880 8003D880 0200022A */  slti       $v0, $s0, 0x2
    /* 2D884 8003D884 05004010 */  beqz       $v0, .L8003D89C
    /* 2D888 8003D888 00000000 */   nop
    /* 2D88C 8003D88C 47DF010C */  jal        snd_stop_snd__FP4TSnd
    /* 2D890 8003D890 21200000 */   addu      $a0, $zero, $zero
    /* 2D894 8003D894 20F60008 */  j          .L8003D880
    /* 2D898 8003D898 01001026 */   addiu     $s0, $s0, 0x1
  .L8003D89C:
    /* 2D89C 8003D89C 1DF60008 */  j          .L8003D874
    /* 2D8A0 8003D8A0 01003126 */   addiu     $s1, $s1, 0x1
  .L8003D8A4:
    /* 2D8A4 8003D8A4 17F60008 */  j          .L8003D85C
    /* 2D8A8 8003D8A8 01005226 */   addiu     $s2, $s2, 0x1
  .L8003D8AC:
    /* 2D8AC 8003D8AC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 2D8B0 8003D8B0 1800B28F */  lw         $s2, 0x18($sp)
    /* 2D8B4 8003D8B4 1400B18F */  lw         $s1, 0x14($sp)
    /* 2D8B8 8003D8B8 1000B08F */  lw         $s0, 0x10($sp)
    /* 2D8BC 8003D8BC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2D8C0 8003D8C0 0800E003 */  jr         $ra
    /* 2D8C4 8003D8C4 00000000 */   nop
endlabel sound_stop__Fv
