.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3CreateBlock__Fiiii, 0x280

glabel DRLG_L3CreateBlock__Fiiii
    /* F744 8014933C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* F748 80149340 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* F74C 80149344 21A88000 */  addu       $s5, $a0, $zero
    /* F750 80149348 3400B7AF */  sw         $s7, 0x34($sp)
    /* F754 8014934C 21B8A000 */  addu       $s7, $a1, $zero
    /* F758 80149350 2800B4AF */  sw         $s4, 0x28($sp)
    /* F75C 80149354 21A0C000 */  addu       $s4, $a2, $zero
    /* F760 80149358 2000B2AF */  sw         $s2, 0x20($sp)
    /* F764 8014935C 21900000 */  addu       $s2, $zero, $zero
    /* F768 80149360 2400B3AF */  sw         $s3, 0x24($sp)
    /* F76C 80149364 21980000 */  addu       $s3, $zero, $zero
    /* F770 80149368 3000B6AF */  sw         $s6, 0x30($sp)
    /* F774 8014936C 21B00000 */  addu       $s6, $zero, $zero
    /* F778 80149370 3800BEAF */  sw         $fp, 0x38($sp)
    /* F77C 80149374 21F00000 */  addu       $fp, $zero, $zero
    /* F780 80149378 02000424 */  addiu      $a0, $zero, 0x2
    /* F784 8014937C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* F788 80149380 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* F78C 80149384 1800B0AF */  sw         $s0, 0x18($sp)
    /* F790 80149388 C9F6000C */  jal        ENG_random__Fl
    /* F794 8014938C 1000A7AF */   sw        $a3, 0x10($sp)
    /* F798 80149390 02000424 */  addiu      $a0, $zero, 0x2
    /* F79C 80149394 C9F6000C */  jal        ENG_random__Fl
    /* F7A0 80149398 03005124 */   addiu     $s1, $v0, 0x3
    /* F7A4 8014939C 1000A38F */  lw         $v1, 0x10($sp)
    /* F7A8 801493A0 00000000 */  nop
    /* F7AC 801493A4 12006014 */  bnez       $v1, .L801493F0
    /* F7B0 801493A8 03005024 */   addiu     $s0, $v0, 0x3
    /* F7B4 801493AC FFFFFE26 */  addiu      $fp, $s7, -0x1
    /* F7B8 801493B0 2A103402 */  slt        $v0, $s1, $s4
    /* F7BC 801493B4 04004010 */  beqz       $v0, .L801493C8
    /* F7C0 801493B8 2398D003 */   subu      $s3, $fp, $s0
    /* F7C4 801493BC C9F6000C */  jal        ENG_random__Fl
    /* F7C8 801493C0 21202002 */   addu      $a0, $s1, $zero
    /* F7CC 801493C4 21905500 */  addu       $s2, $v0, $s5
  .L801493C8:
    /* F7D0 801493C8 02003416 */  bne        $s1, $s4, .L801493D4
    /* F7D4 801493CC 2A109102 */   slt       $v0, $s4, $s1
    /* F7D8 801493D0 2190A002 */  addu       $s2, $s5, $zero
  .L801493D4:
    /* F7DC 801493D4 05004010 */  beqz       $v0, .L801493EC
    /* F7E0 801493D8 21B05102 */   addu      $s6, $s2, $s1
    /* F7E4 801493DC C9F6000C */  jal        ENG_random__Fl
    /* F7E8 801493E0 21202002 */   addu      $a0, $s1, $zero
    /* F7EC 801493E4 2390A202 */  subu       $s2, $s5, $v0
    /* F7F0 801493E8 21B05102 */  addu       $s6, $s2, $s1
  .L801493EC:
    /* F7F4 801493EC 1000A38F */  lw         $v1, 0x10($sp)
  .L801493F0:
    /* F7F8 801493F0 03000224 */  addiu      $v0, $zero, 0x3
    /* F7FC 801493F4 13006214 */  bne        $v1, $v0, .L80149444
    /* F800 801493F8 02000224 */   addiu     $v0, $zero, 0x2
    /* F804 801493FC FFFFB626 */  addiu      $s6, $s5, -0x1
    /* F808 80149400 2A101402 */  slt        $v0, $s0, $s4
    /* F80C 80149404 04004010 */  beqz       $v0, .L80149418
    /* F810 80149408 2390D102 */   subu      $s2, $s6, $s1
    /* F814 8014940C C9F6000C */  jal        ENG_random__Fl
    /* F818 80149410 21200002 */   addu      $a0, $s0, $zero
    /* F81C 80149414 21985700 */  addu       $s3, $v0, $s7
  .L80149418:
    /* F820 80149418 02001416 */  bne        $s0, $s4, .L80149424
    /* F824 8014941C 2A109002 */   slt       $v0, $s4, $s0
    /* F828 80149420 2198E002 */  addu       $s3, $s7, $zero
  .L80149424:
    /* F82C 80149424 05004010 */  beqz       $v0, .L8014943C
    /* F830 80149428 21F07002 */   addu      $fp, $s3, $s0
    /* F834 8014942C C9F6000C */  jal        ENG_random__Fl
    /* F838 80149430 21200002 */   addu      $a0, $s0, $zero
    /* F83C 80149434 2398E202 */  subu       $s3, $s7, $v0
    /* F840 80149438 21F07002 */  addu       $fp, $s3, $s0
  .L8014943C:
    /* F844 8014943C 1000A38F */  lw         $v1, 0x10($sp)
    /* F848 80149440 02000224 */  addiu      $v0, $zero, 0x2
  .L80149444:
    /* F84C 80149444 10006214 */  bne        $v1, $v0, .L80149488
    /* F850 80149448 2A103402 */   slt       $v0, $s1, $s4
    /* F854 8014944C 0100F326 */  addiu      $s3, $s7, 0x1
    /* F858 80149450 04004010 */  beqz       $v0, .L80149464
    /* F85C 80149454 21F07002 */   addu      $fp, $s3, $s0
    /* F860 80149458 C9F6000C */  jal        ENG_random__Fl
    /* F864 8014945C 21202002 */   addu      $a0, $s1, $zero
    /* F868 80149460 21905500 */  addu       $s2, $v0, $s5
  .L80149464:
    /* F86C 80149464 02003416 */  bne        $s1, $s4, .L80149470
    /* F870 80149468 2A109102 */   slt       $v0, $s4, $s1
    /* F874 8014946C 2190A002 */  addu       $s2, $s5, $zero
  .L80149470:
    /* F878 80149470 05004010 */  beqz       $v0, .L80149488
    /* F87C 80149474 21B05102 */   addu      $s6, $s2, $s1
    /* F880 80149478 C9F6000C */  jal        ENG_random__Fl
    /* F884 8014947C 21202002 */   addu      $a0, $s1, $zero
    /* F888 80149480 2390A202 */  subu       $s2, $s5, $v0
    /* F88C 80149484 21B05102 */  addu       $s6, $s2, $s1
  .L80149488:
    /* F890 80149488 1000A38F */  lw         $v1, 0x10($sp)
    /* F894 8014948C 01000224 */  addiu      $v0, $zero, 0x1
    /* F898 80149490 10006214 */  bne        $v1, $v0, .L801494D4
    /* F89C 80149494 2A101402 */   slt       $v0, $s0, $s4
    /* F8A0 80149498 0100B226 */  addiu      $s2, $s5, 0x1
    /* F8A4 8014949C 04004010 */  beqz       $v0, .L801494B0
    /* F8A8 801494A0 21B05102 */   addu      $s6, $s2, $s1
    /* F8AC 801494A4 C9F6000C */  jal        ENG_random__Fl
    /* F8B0 801494A8 21200002 */   addu      $a0, $s0, $zero
    /* F8B4 801494AC 21985700 */  addu       $s3, $v0, $s7
  .L801494B0:
    /* F8B8 801494B0 02001416 */  bne        $s0, $s4, .L801494BC
    /* F8BC 801494B4 2A109002 */   slt       $v0, $s4, $s0
    /* F8C0 801494B8 2198E002 */  addu       $s3, $s7, $zero
  .L801494BC:
    /* F8C4 801494BC 05004010 */  beqz       $v0, .L801494D4
    /* F8C8 801494C0 21F07002 */   addu      $fp, $s3, $s0
    /* F8CC 801494C4 C9F6000C */  jal        ENG_random__Fl
    /* F8D0 801494C8 21200002 */   addu      $a0, $s0, $zero
    /* F8D4 801494CC 2398E202 */  subu       $s3, $s7, $v0
    /* F8D8 801494D0 21F07002 */  addu       $fp, $s3, $s0
  .L801494D4:
    /* F8DC 801494D4 21204002 */  addu       $a0, $s2, $zero
    /* F8E0 801494D8 21286002 */  addu       $a1, $s3, $zero
    /* F8E4 801494DC 2130C002 */  addu       $a2, $s6, $zero
    /* F8E8 801494E0 3B24050C */  jal        DRLG_L3FillRoom__Fiiii
    /* F8EC 801494E4 2138C003 */   addu      $a3, $fp, $zero
    /* F8F0 801494E8 21A04000 */  addu       $s4, $v0, $zero
    /* F8F4 801494EC 01000224 */  addiu      $v0, $zero, 0x1
    /* F8F8 801494F0 25008216 */  bne        $s4, $v0, .L80149588
    /* F8FC 801494F4 00000000 */   nop
    /* F900 801494F8 C9F6000C */  jal        ENG_random__Fl
    /* F904 801494FC 04000424 */   addiu     $a0, $zero, 0x4
    /* F908 80149500 21004010 */  beqz       $v0, .L80149588
    /* F90C 80149504 02000224 */   addiu     $v0, $zero, 0x2
    /* F910 80149508 1000A38F */  lw         $v1, 0x10($sp)
    /* F914 8014950C 00000000 */  nop
    /* F918 80149510 06006210 */  beq        $v1, $v0, .L8014952C
    /* F91C 80149514 21204002 */   addu      $a0, $s2, $zero
    /* F920 80149518 21286002 */  addu       $a1, $s3, $zero
    /* F924 8014951C 21300002 */  addu       $a2, $s0, $zero
    /* F928 80149520 CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* F92C 80149524 21380000 */   addu      $a3, $zero, $zero
    /* F930 80149528 1000A38F */  lw         $v1, 0x10($sp)
  .L8014952C:
    /* F934 8014952C 03000224 */  addiu      $v0, $zero, 0x3
    /* F938 80149530 05006210 */  beq        $v1, $v0, .L80149548
    /* F93C 80149534 2120C002 */   addu      $a0, $s6, $zero
    /* F940 80149538 21286002 */  addu       $a1, $s3, $zero
    /* F944 8014953C 21302002 */  addu       $a2, $s1, $zero
    /* F948 80149540 CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* F94C 80149544 01000724 */   addiu     $a3, $zero, 0x1
  .L80149548:
    /* F950 80149548 1000A38F */  lw         $v1, 0x10($sp)
    /* F954 8014954C 00000000 */  nop
    /* F958 80149550 06006010 */  beqz       $v1, .L8014956C
    /* F95C 80149554 21204002 */   addu      $a0, $s2, $zero
    /* F960 80149558 2128C003 */  addu       $a1, $fp, $zero
    /* F964 8014955C 21300002 */  addu       $a2, $s0, $zero
    /* F968 80149560 CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* F96C 80149564 02000724 */   addiu     $a3, $zero, 0x2
    /* F970 80149568 1000A38F */  lw         $v1, 0x10($sp)
  .L8014956C:
    /* F974 8014956C 00000000 */  nop
    /* F978 80149570 05007410 */  beq        $v1, $s4, .L80149588
    /* F97C 80149574 21204002 */   addu      $a0, $s2, $zero
    /* F980 80149578 21286002 */  addu       $a1, $s3, $zero
    /* F984 8014957C 21302002 */  addu       $a2, $s1, $zero
    /* F988 80149580 CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* F98C 80149584 03000724 */   addiu     $a3, $zero, 0x3
  .L80149588:
    /* F990 80149588 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* F994 8014958C 3800BE8F */  lw         $fp, 0x38($sp)
    /* F998 80149590 3400B78F */  lw         $s7, 0x34($sp)
    /* F99C 80149594 3000B68F */  lw         $s6, 0x30($sp)
    /* F9A0 80149598 2C00B58F */  lw         $s5, 0x2C($sp)
    /* F9A4 8014959C 2800B48F */  lw         $s4, 0x28($sp)
    /* F9A8 801495A0 2400B38F */  lw         $s3, 0x24($sp)
    /* F9AC 801495A4 2000B28F */  lw         $s2, 0x20($sp)
    /* F9B0 801495A8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* F9B4 801495AC 1800B08F */  lw         $s0, 0x18($sp)
    /* F9B8 801495B0 4000BD27 */  addiu      $sp, $sp, 0x40
    /* F9BC 801495B4 0800E003 */  jr         $ra
    /* F9C0 801495B8 00000000 */   nop
endlabel DRLG_L3CreateBlock__Fiiii
