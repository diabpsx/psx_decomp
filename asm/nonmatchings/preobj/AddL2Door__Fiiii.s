.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL2Door__Fiiii, 0x14C

glabel AddL2Door__Fiiii
    /* 1C738 80156330 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1C73C 80156334 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1C740 80156338 21908000 */  addu       $s2, $a0, $zero
    /* 1C744 8015633C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C748 80156340 2180A000 */  addu       $s0, $a1, $zero
    /* 1C74C 80156344 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1C750 80156348 40101200 */  sll        $v0, $s2, 1
    /* 1C754 8015634C 21105200 */  addu       $v0, $v0, $s2
    /* 1C758 80156350 80100200 */  sll        $v0, $v0, 2
    /* 1C75C 80156354 23105200 */  subu       $v0, $v0, $s2
    /* 1C760 80156358 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1C764 8015635C 80980200 */  sll        $s3, $v0, 2
    /* 1C768 80156360 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1C76C 80156364 01001424 */  addiu      $s4, $zero, 0x1
    /* 1C770 80156368 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 1C774 8015636C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 1C778 80156370 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 1C77C 80156374 21083300 */  addu       $at, $at, $s3
    /* 1C780 80156378 778C34A0 */  sb         $s4, %lo(object + 0x2B)($at)
    /* 1C784 8015637C 1800E214 */  bne        $a3, $v0, .L801563E0
    /* 1C788 80156380 2188C000 */   addu      $s1, $a2, $zero
    /* 1C78C 80156384 21200002 */  addu       $a0, $s0, $zero
    /* 1C790 80156388 21282002 */  addu       $a1, $s1, $zero
    /* 1C794 8015638C D555010C */  jal        ObjSetMicro__Fiii
    /* 1C798 80156390 1A020624 */   addiu     $a2, $zero, 0x21A
    /* 1C79C 80156394 F0FF0226 */  addiu      $v0, $s0, -0x10
    /* 1C7A0 80156398 43100200 */  sra        $v0, $v0, 1
    /* 1C7A4 8015639C 0E80043C */  lui        $a0, %hi(dungeon)
    /* 1C7A8 801563A0 C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 1C7AC 801563A4 40180200 */  sll        $v1, $v0, 1
    /* 1C7B0 801563A8 21186200 */  addu       $v1, $v1, $v0
    /* 1C7B4 801563AC 40190300 */  sll        $v1, $v1, 5
    /* 1C7B8 801563B0 21186400 */  addu       $v1, $v1, $a0
    /* 1C7BC 801563B4 F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 1C7C0 801563B8 43100200 */  sra        $v0, $v0, 1
    /* 1C7C4 801563BC 40100200 */  sll        $v0, $v0, 1
    /* 1C7C8 801563C0 21104300 */  addu       $v0, $v0, $v1
    /* 1C7CC 801563C4 96000324 */  addiu      $v1, $zero, 0x96
    /* 1C7D0 801563C8 000043A4 */  sh         $v1, 0x0($v0)
    /* 1C7D4 801563CC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1C7D8 801563D0 21083300 */  addu       $at, $at, $s3
    /* 1C7DC 801563D4 6D8C34A0 */  sb         $s4, %lo(object + 0x21)($at)
    /* 1C7E0 801563D8 0F590508 */  j          .L8015643C
    /* 1C7E4 801563DC 40101200 */   sll       $v0, $s2, 1
  .L801563E0:
    /* 1C7E8 801563E0 21200002 */  addu       $a0, $s0, $zero
    /* 1C7EC 801563E4 21282002 */  addu       $a1, $s1, $zero
    /* 1C7F0 801563E8 D555010C */  jal        ObjSetMicro__Fiii
    /* 1C7F4 801563EC 1C020624 */   addiu     $a2, $zero, 0x21C
    /* 1C7F8 801563F0 F0FF0226 */  addiu      $v0, $s0, -0x10
    /* 1C7FC 801563F4 43100200 */  sra        $v0, $v0, 1
    /* 1C800 801563F8 0E80043C */  lui        $a0, %hi(dungeon)
    /* 1C804 801563FC C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 1C808 80156400 40180200 */  sll        $v1, $v0, 1
    /* 1C80C 80156404 21186200 */  addu       $v1, $v1, $v0
    /* 1C810 80156408 40190300 */  sll        $v1, $v1, 5
    /* 1C814 8015640C 21186400 */  addu       $v1, $v1, $a0
    /* 1C818 80156410 F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 1C81C 80156414 43100200 */  sra        $v0, $v0, 1
    /* 1C820 80156418 40100200 */  sll        $v0, $v0, 1
    /* 1C824 8015641C 21104300 */  addu       $v0, $v0, $v1
    /* 1C828 80156420 97000324 */  addiu      $v1, $zero, 0x97
    /* 1C82C 80156424 000043A4 */  sh         $v1, 0x0($v0)
    /* 1C830 80156428 02000224 */  addiu      $v0, $zero, 0x2
    /* 1C834 8015642C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1C838 80156430 21083300 */  addu       $at, $at, $s3
    /* 1C83C 80156434 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 1C840 80156438 40101200 */  sll        $v0, $s2, 1
  .L8015643C:
    /* 1C844 8015643C 21105200 */  addu       $v0, $v0, $s2
    /* 1C848 80156440 80100200 */  sll        $v0, $v0, 2
    /* 1C84C 80156444 23105200 */  subu       $v0, $v0, $s2
    /* 1C850 80156448 80100200 */  sll        $v0, $v0, 2
    /* 1C854 8015644C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1C858 80156450 21082200 */  addu       $at, $at, $v0
    /* 1C85C 80156454 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 1C860 80156458 2400BF8F */  lw         $ra, 0x24($sp)
    /* 1C864 8015645C 2000B48F */  lw         $s4, 0x20($sp)
    /* 1C868 80156460 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1C86C 80156464 1800B28F */  lw         $s2, 0x18($sp)
    /* 1C870 80156468 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C874 8015646C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C878 80156470 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1C87C 80156474 0800E003 */  jr         $ra
    /* 1C880 80156478 00000000 */   nop
endlabel AddL2Door__Fiiii
