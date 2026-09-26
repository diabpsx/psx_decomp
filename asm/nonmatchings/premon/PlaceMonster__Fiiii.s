.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaceMonster__Fiiii, 0x8C

glabel PlaceMonster__Fiiii
    /* 25D08 8015F900 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 25D0C 8015F904 2000B2AF */  sw         $s2, 0x20($sp)
    /* 25D10 8015F908 21908000 */  addu       $s2, $a0, $zero
    /* 25D14 8015F90C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 25D18 8015F910 2198A000 */  addu       $s3, $a1, $zero
    /* 25D1C 8015F914 1800B0AF */  sw         $s0, 0x18($sp)
    /* 25D20 8015F918 2180C000 */  addu       $s0, $a2, $zero
    /* 25D24 8015F91C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 25D28 8015F920 2188E000 */  addu       $s1, $a3, $zero
    /* 25D2C 8015F924 C0181100 */  sll        $v1, $s1, 3
    /* 25D30 8015F928 C0101000 */  sll        $v0, $s0, 3
    /* 25D34 8015F92C 23105000 */  subu       $v0, $v0, $s0
    /* 25D38 8015F930 C0110200 */  sll        $v0, $v0, 7
    /* 25D3C 8015F934 21186200 */  addu       $v1, $v1, $v0
    /* 25D40 8015F938 01004226 */  addiu      $v0, $s2, 0x1
    /* 25D44 8015F93C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 25D48 8015F940 0E80013C */  lui        $at, %hi(dung_map)
    /* 25D4C 8015F944 21082300 */  addu       $at, $at, $v1
    /* 25D50 8015F948 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 25D54 8015F94C C9F6000C */  jal        ENG_random__Fl
    /* 25D58 8015F950 08000424 */   addiu     $a0, $zero, 0x8
    /* 25D5C 8015F954 21204002 */  addu       $a0, $s2, $zero
    /* 25D60 8015F958 21284000 */  addu       $a1, $v0, $zero
    /* 25D64 8015F95C 21306002 */  addu       $a2, $s3, $zero
    /* 25D68 8015F960 21380002 */  addu       $a3, $s0, $zero
    /* 25D6C 8015F964 13FE010C */  jal        InitMonster__Fiiiii
    /* 25D70 8015F968 1000B1AF */   sw        $s1, 0x10($sp)
    /* 25D74 8015F96C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 25D78 8015F970 2400B38F */  lw         $s3, 0x24($sp)
    /* 25D7C 8015F974 2000B28F */  lw         $s2, 0x20($sp)
    /* 25D80 8015F978 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 25D84 8015F97C 1800B08F */  lw         $s0, 0x18($sp)
    /* 25D88 8015F980 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 25D8C 8015F984 0800E003 */  jr         $ra
    /* 25D90 8015F988 00000000 */   nop
endlabel PlaceMonster__Fiiii
