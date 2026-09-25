.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching inmem__Fs, 0x88

glabel inmem__Fs
    /* 9D7F4 800AD7F4 4C0B828F */  lw         $v0, %gp_rel(D_8011B2CC)($gp)
    /* 9D7F8 800AD7F8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9D7FC 800AD7FC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 9D800 800AD800 480B908F */  lw         $s0, %gp_rel(D_8011B2C8)($gp)
    /* 9D804 800AD804 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 9D808 800AD808 21888000 */  addu       $s1, $a0, $zero
    /* 9D80C 800AD80C 06004014 */  bnez       $v0, .L800AD828
    /* 9D810 800AD810 2000BFAF */   sw        $ra, 0x20($sp)
    /* 9D814 800AD814 21200000 */  addu       $a0, $zero, $zero
    /* 9D818 800AD818 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D81C 800AD81C E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D820 800AD820 A583000C */  jal        DBG_Error
    /* 9D824 800AD824 53010624 */   addiu     $a2, $zero, 0x153
  .L800AD828:
    /* 9D828 800AD828 4C0B848F */  lw         $a0, %gp_rel(D_8011B2CC)($gp)
    /* 9D82C 800AD82C 00000000 */  nop
    /* 9D830 800AD830 0B008018 */  blez       $a0, .L800AD860
    /* 9D834 800AD834 21180000 */   addu      $v1, $zero, $zero
    /* 9D838 800AD838 00141100 */  sll        $v0, $s1, 16
    /* 9D83C 800AD83C 032C0200 */  sra        $a1, $v0, 16
  .L800AD840:
    /* 9D840 800AD840 00000286 */  lh         $v0, 0x0($s0)
    /* 9D844 800AD844 00000000 */  nop
    /* 9D848 800AD848 06004510 */  beq        $v0, $a1, .L800AD864
    /* 9D84C 800AD84C 01006224 */   addiu     $v0, $v1, 0x1
    /* 9D850 800AD850 01006324 */  addiu      $v1, $v1, 0x1
    /* 9D854 800AD854 2A106400 */  slt        $v0, $v1, $a0
    /* 9D858 800AD858 F9FF4014 */  bnez       $v0, .L800AD840
    /* 9D85C 800AD85C 04001026 */   addiu     $s0, $s0, 0x4
  .L800AD860:
    /* 9D860 800AD860 21100000 */  addu       $v0, $zero, $zero
  .L800AD864:
    /* 9D864 800AD864 2000BF8F */  lw         $ra, 0x20($sp)
    /* 9D868 800AD868 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 9D86C 800AD86C 1800B08F */  lw         $s0, 0x18($sp)
    /* 9D870 800AD870 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9D874 800AD874 0800E003 */  jr         $ra
    /* 9D878 800AD878 00000000 */   nop
endlabel inmem__Fs
