.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching addsystemtask, 0x110

glabel addsystemtask
    /* 1F7D4 8002F7D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F7D8 8002F7D8 FFFF0824 */  addiu      $t0, $zero, -0x1
    /* 1F7DC 8002F7DC A01D878F */  lw         $a3, %gp_rel(D_8011C520)($gp)
    /* 1F7E0 8002F7E0 21180000 */  addu       $v1, $zero, $zero
    /* 1F7E4 8002F7E4 FFFF0A24 */  addiu      $t2, $zero, -0x1
    /* 1F7E8 8002F7E8 21480000 */  addu       $t1, $zero, $zero
    /* 1F7EC 8002F7EC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1F7F0 8002F7F0 0100E224 */  addiu      $v0, $a3, 0x1
    /* 1F7F4 8002F7F4 A01D82AF */  sw         $v0, %gp_rel(D_8011C520)($gp)
  .L8002F7F8:
    /* 1F7F8 8002F7F8 1380013C */  lui        $at, %hi(D_80134F40)
    /* 1F7FC 8002F7FC 21082900 */  addu       $at, $at, $t1
    /* 1F800 8002F800 404F228C */  lw         $v0, %lo(D_80134F40)($at)
    /* 1F804 8002F804 00000000 */  nop
    /* 1F808 8002F808 09004410 */  beq        $v0, $a0, .L8002F830
    /* 1F80C 8002F80C 00000000 */   nop
    /* 1F810 8002F810 08004014 */  bnez       $v0, .L8002F834
    /* 1F814 8002F814 00000000 */   nop
    /* 1F818 8002F818 06000A15 */  bne        $t0, $t2, .L8002F834
    /* 1F81C 8002F81C 00000000 */   nop
    /* 1F820 8002F820 0300E010 */  beqz       $a3, .L8002F830
    /* 1F824 8002F824 00000000 */   nop
    /* 1F828 8002F828 0DBE0008 */  j          .L8002F834
    /* 1F82C 8002F82C FFFFE724 */   addiu     $a3, $a3, -0x1
  .L8002F830:
    /* 1F830 8002F830 21406000 */  addu       $t0, $v1, $zero
  .L8002F834:
    /* 1F834 8002F834 01006324 */  addiu      $v1, $v1, 0x1
    /* 1F838 8002F838 10006228 */  slti       $v0, $v1, 0x10
    /* 1F83C 8002F83C EEFF4014 */  bnez       $v0, .L8002F7F8
    /* 1F840 8002F840 10002925 */   addiu     $t1, $t1, 0x10
    /* 1F844 8002F844 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1F848 8002F848 13000211 */  beq        $t0, $v0, .L8002F898
    /* 1F84C 8002F84C 00000000 */   nop
    /* 1F850 8002F850 1280033C */  lui        $v1, %hi(libticks)
    /* 1F854 8002F854 7CC5638C */  lw         $v1, %lo(libticks)($v1)
    /* 1F858 8002F858 00110800 */  sll        $v0, $t0, 4
    /* 1F85C 8002F85C 1380013C */  lui        $at, %hi(D_80134F40)
    /* 1F860 8002F860 21082200 */  addu       $at, $at, $v0
    /* 1F864 8002F864 404F24AC */  sw         $a0, %lo(D_80134F40)($at)
    /* 1F868 8002F868 1380013C */  lui        $at, %hi(D_80134F44)
    /* 1F86C 8002F86C 21082200 */  addu       $at, $at, $v0
    /* 1F870 8002F870 444F25AC */  sw         $a1, %lo(D_80134F44)($at)
    /* 1F874 8002F874 1380013C */  lui        $at, %hi(D_80134F4C)
    /* 1F878 8002F878 21082200 */  addu       $at, $at, $v0
    /* 1F87C 8002F87C 4C4F20AC */  sw         $zero, %lo(D_80134F4C)($at)
    /* 1F880 8002F880 21186600 */  addu       $v1, $v1, $a2
    /* 1F884 8002F884 1380013C */  lui        $at, %hi(D_80134F48)
    /* 1F888 8002F888 21082200 */  addu       $at, $at, $v0
    /* 1F88C 8002F88C 484F23AC */  sw         $v1, %lo(D_80134F48)($at)
    /* 1F890 8002F890 31BE0008 */  j          .L8002F8C4
    /* 1F894 8002F894 00000000 */   nop
  .L8002F898:
    /* 1F898 8002F898 1180023C */  lui        $v0, %hi(D_8010FEEC)
    /* 1F89C 8002F89C ECFE4224 */  addiu      $v0, $v0, %lo(D_8010FEEC)
    /* 1F8A0 8002F8A0 1280013C */  lui        $at, %hi(abortfile)
    /* 1F8A4 8002F8A4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1F8A8 8002F8A8 5A000224 */  addiu      $v0, $zero, 0x5A
    /* 1F8AC 8002F8AC 1180043C */  lui        $a0, %hi(D_8010FEFC)
    /* 1F8B0 8002F8B0 FCFE8424 */  addiu      $a0, $a0, %lo(D_8010FEFC)
    /* 1F8B4 8002F8B4 1280013C */  lui        $at, %hi(abortline)
    /* 1F8B8 8002F8B8 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1F8BC 8002F8BC 0F95000C */  jal        abortmessage
    /* 1F8C0 8002F8C0 00000000 */   nop
  .L8002F8C4:
    /* 1F8C4 8002F8C4 A01D828F */  lw         $v0, %gp_rel(D_8011C520)($gp)
    /* 1F8C8 8002F8C8 00000000 */  nop
    /* 1F8CC 8002F8CC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1F8D0 8002F8D0 A01D82AF */  sw         $v0, %gp_rel(D_8011C520)($gp)
    /* 1F8D4 8002F8D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1F8D8 8002F8D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F8DC 8002F8DC 0800E003 */  jr         $ra
    /* 1F8E0 8002F8E0 00000000 */   nop
endlabel addsystemtask
