.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoEnding__Fi, 0xA8

glabel DoEnding__Fi
    /* 14F24 8014EB1C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14F28 8014EB20 40100400 */  sll        $v0, $a0, 1
    /* 14F2C 8014EB24 21104400 */  addu       $v0, $v0, $a0
    /* 14F30 8014EB28 80100200 */  sll        $v0, $v0, 2
    /* 14F34 8014EB2C 21104400 */  addu       $v0, $v0, $a0
    /* 14F38 8014EB30 00110200 */  sll        $v0, $v0, 4
    /* 14F3C 8014EB34 23104400 */  subu       $v0, $v0, $a0
    /* 14F40 8014EB38 80100200 */  sll        $v0, $v0, 2
    /* 14F44 8014EB3C 21104400 */  addu       $v0, $v0, $a0
    /* 14F48 8014EB40 C0100200 */  sll        $v0, $v0, 3
    /* 14F4C 8014EB44 1000BFAF */  sw         $ra, 0x10($sp)
    /* 14F50 8014EB48 1280013C */  lui        $at, %hi(myplr)
    /* 14F54 8014EB4C 08BA24AC */  sw         $a0, %lo(myplr)($at)
    /* 14F58 8014EB50 1280013C */  lui        $at, %hi(user_start)
    /* 14F5C 8014EB54 E4B420AC */  sw         $zero, %lo(user_start)($at)
    /* 14F60 8014EB58 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 14F64 8014EB5C 21082200 */  addu       $at, $at, $v0
    /* 14F68 8014EB60 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 14F6C 8014EB64 00000000 */  nop
    /* 14F70 8014EB68 05006014 */  bnez       $v1, .L8014EB80
    /* 14F74 8014EB6C 02000224 */   addiu     $v0, $zero, 0x2
    /* 14F78 8014EB70 1280043C */  lui        $a0, %hi(D_8011A2DC)
    /* 14F7C 8014EB74 DCA28424 */  addiu      $a0, $a0, %lo(D_8011A2DC)
    /* 14F80 8014EB78 E63A0508 */  j          .L8014EB98
    /* 14F84 8014EB7C 00000000 */   nop
  .L8014EB80:
    /* 14F88 8014EB80 1280043C */  lui        $a0, %hi(D_8011A2FC)
    /* 14F8C 8014EB84 FCA28424 */  addiu      $a0, $a0, %lo(D_8011A2FC)
    /* 14F90 8014EB88 03006214 */  bne        $v1, $v0, .L8014EB98
    /* 14F94 8014EB8C 00000000 */   nop
    /* 14F98 8014EB90 1280043C */  lui        $a0, %hi(D_8011A2EC)
    /* 14F9C 8014EB94 ECA28424 */  addiu      $a0, $a0, %lo(D_8011A2EC)
  .L8014EB98:
    /* 14FA0 8014EB98 4AB4020C */  jal        play_movie
    /* 14FA4 8014EB9C 00000000 */   nop
    /* 14FA8 8014EBA0 94DF010C */  jal        music_stop__Fv
    /* 14FAC 8014EBA4 00000000 */   nop
    /* 14FB0 8014EBA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 14FB4 8014EBAC 1280013C */  lui        $at, %hi(user_start)
    /* 14FB8 8014EBB0 E4B422AC */  sw         $v0, %lo(user_start)($at)
    /* 14FBC 8014EBB4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 14FC0 8014EBB8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 14FC4 8014EBBC 0800E003 */  jr         $ra
    /* 14FC8 8014EBC0 00000000 */   nop
endlabel DoEnding__Fi
