.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initasync, 0xA8

glabel initasync
    /* 13900 80023900 1380023C */  lui        $v0, %hi(D_8013504C)
    /* 13904 80023904 4C50428C */  lw         $v0, %lo(D_8013504C)($v0)
    /* 13908 80023908 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1390C 8002390C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13910 80023910 21808000 */  addu       $s0, $a0, $zero
    /* 13914 80023914 1800B2AF */  sw         $s2, 0x18($sp)
    /* 13918 80023918 2190A000 */  addu       $s2, $a1, $zero
    /* 1391C 8002391C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 13920 80023920 2188C000 */  addu       $s1, $a2, $zero
    /* 13924 80023924 0E004010 */  beqz       $v0, .L80023960
    /* 13928 80023928 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 1392C 8002392C 1180043C */  lui        $a0, %hi(D_8010E95C)
    /* 13930 80023930 5CE98424 */  addiu      $a0, $a0, %lo(D_8010E95C)
    /* 13934 80023934 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 13938 80023938 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 1393C 8002393C 1280013C */  lui        $at, %hi(abortfile)
    /* 13940 80023940 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 13944 80023944 0C020224 */  addiu      $v0, $zero, 0x20C
    /* 13948 80023948 1280013C */  lui        $at, %hi(abortline)
    /* 1394C 8002394C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 13950 80023950 0F95000C */  jal        abortmessage
    /* 13954 80023954 00000000 */   nop
    /* 13958 80023958 638E0008 */  j          .L8002398C
    /* 1395C 8002395C 00000000 */   nop
  .L80023960:
    /* 13960 80023960 E08D000C */  jal        asyncstructsize
    /* 13964 80023964 21200002 */   addu      $a0, $s0, $zero
    /* 13968 80023968 1280043C */  lui        $a0, %hi(D_8011C3A8)
    /* 1396C 8002396C A8C38424 */  addiu      $a0, $a0, %lo(D_8011C3A8)
    /* 13970 80023970 21284000 */  addu       $a1, $v0, $zero
    /* 13974 80023974 74A9000C */  jal        reservememadr
    /* 13978 80023978 21302002 */   addu      $a2, $s1, $zero
    /* 1397C 8002397C 21204000 */  addu       $a0, $v0, $zero
    /* 13980 80023980 21280002 */  addu       $a1, $s0, $zero
    /* 13984 80023984 E68D000C */  jal        initasyncstruct
    /* 13988 80023988 21304002 */   addu      $a2, $s2, $zero
  .L8002398C:
    /* 1398C 8002398C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 13990 80023990 1800B28F */  lw         $s2, 0x18($sp)
    /* 13994 80023994 1400B18F */  lw         $s1, 0x14($sp)
    /* 13998 80023998 1000B08F */  lw         $s0, 0x10($sp)
    /* 1399C 8002399C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 139A0 800239A0 0800E003 */  jr         $ra
    /* 139A4 800239A4 00000000 */   nop
endlabel initasync
