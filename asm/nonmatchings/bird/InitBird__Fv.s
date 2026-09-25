.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitBird__Fv, 0xD4

glabel InitBird__Fv
    /* 9C764 800AC764 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9C768 800AC768 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9C76C 800AC76C 0D80113C */  lui        $s1, %hi(BirdList)
    /* 9C770 800AC770 74D33126 */  addiu      $s1, $s1, %lo(BirdList)
    /* 9C774 800AC774 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9C778 800AC778 21980000 */  addu       $s3, $zero, $zero
    /* 9C77C 800AC77C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9C780 800AC780 21900000 */  addu       $s2, $zero, $zero
    /* 9C784 800AC784 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C788 800AC788 14003026 */  addiu      $s0, $s1, 0x14
    /* 9C78C 800AC78C 2000BFAF */  sw         $ra, 0x20($sp)
  .L800AC790:
    /* 9C790 800AC790 C9F6000C */  jal        ENG_random__Fl
    /* 9C794 800AC794 07000424 */   addiu     $a0, $zero, 0x7
    /* 9C798 800AC798 21202002 */  addu       $a0, $s1, $zero
    /* 9C79C 800AC79C F8FF02A2 */  sb         $v0, -0x8($s0)
    /* 9C7A0 800AC7A0 FDFF00A2 */  sb         $zero, -0x3($s0)
    /* 9C7A4 800AC7A4 FCFF00A2 */  sb         $zero, -0x4($s0)
    /* 9C7A8 800AC7A8 FFFF00A2 */  sb         $zero, -0x1($s0)
    /* 9C7AC 800AC7AC 1280013C */  lui        $at, %hi(D_8011B2A0)
    /* 9C7B0 800AC7B0 21083200 */  addu       $at, $at, $s2
    /* 9C7B4 800AC7B4 A0B22290 */  lbu        $v0, %lo(D_8011B2A0)($at)
    /* 9C7B8 800AC7B8 04007326 */  addiu      $s3, $s3, 0x4
    /* 9C7BC 800AC7BC 00160200 */  sll        $v0, $v0, 24
    /* 9C7C0 800AC7C0 43150200 */  sra        $v0, $v0, 21
    /* 9C7C4 800AC7C4 F0FF02A6 */  sh         $v0, -0x10($s0)
    /* 9C7C8 800AC7C8 1280013C */  lui        $at, %hi(D_8011B2A1)
    /* 9C7CC 800AC7CC 21083200 */  addu       $at, $at, $s2
    /* 9C7D0 800AC7D0 A1B22690 */  lbu        $a2, %lo(D_8011B2A1)($at)
    /* 9C7D4 800AC7D4 02005226 */  addiu      $s2, $s2, 0x2
    /* 9C7D8 800AC7D8 F0FF0586 */  lh         $a1, -0x10($s0)
    /* 9C7DC 800AC7DC 00360600 */  sll        $a2, $a2, 24
    /* 9C7E0 800AC7E0 43350600 */  sra        $a2, $a2, 21
    /* 9C7E4 800AC7E4 25AE020C */  jal        BirdWorld__FP10BIRDSTRUCTii
    /* 9C7E8 800AC7E8 F2FF06A6 */   sh        $a2, -0xE($s0)
    /* 9C7EC 800AC7EC 94AF020C */  jal        BIRD_StartPerch__FP10BIRDSTRUCT
    /* 9C7F0 800AC7F0 21202002 */   addu      $a0, $s1, $zero
    /* 9C7F4 800AC7F4 63B1020C */  jal        PlaceFlock__FP10BIRDSTRUCT
    /* 9C7F8 800AC7F8 21202002 */   addu      $a0, $s1, $zero
    /* 9C7FC 800AC7FC 01000224 */  addiu      $v0, $zero, 0x1
    /* 9C800 800AC800 000002A2 */  sb         $v0, 0x0($s0)
    /* 9C804 800AC804 60001026 */  addiu      $s0, $s0, 0x60
    /* 9C808 800AC808 000020AE */  sw         $zero, 0x0($s1)
    /* 9C80C 800AC80C 1000622A */  slti       $v0, $s3, 0x10
    /* 9C810 800AC810 DFFF4014 */  bnez       $v0, .L800AC790
    /* 9C814 800AC814 60003126 */   addiu     $s1, $s1, 0x60
    /* 9C818 800AC818 2000BF8F */  lw         $ra, 0x20($sp)
    /* 9C81C 800AC81C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9C820 800AC820 1800B28F */  lw         $s2, 0x18($sp)
    /* 9C824 800AC824 1400B18F */  lw         $s1, 0x14($sp)
    /* 9C828 800AC828 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C82C 800AC82C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9C830 800AC830 0800E003 */  jr         $ra
    /* 9C834 800AC834 00000000 */   nop
endlabel InitBird__Fv
