.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClipRect__FRC4RECTR4RECT, 0x114

glabel ClipRect__FRC4RECTR4RECT
    /* 73EB4 80083EB4 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 73EB8 80083EB8 6400B1AF */  sw         $s1, 0x64($sp)
    /* 73EBC 80083EBC 21888000 */  addu       $s1, $a0, $zero
    /* 73EC0 80083EC0 6000B0AF */  sw         $s0, 0x60($sp)
    /* 73EC4 80083EC4 6800BFAF */  sw         $ra, 0x68($sp)
    /* 73EC8 80083EC8 F20F020C */  jal        IsColiding__FRC4RECTT0
    /* 73ECC 80083ECC 2180A000 */   addu      $s0, $a1, $zero
    /* 73ED0 80083ED0 33004010 */  beqz       $v0, .L80083FA0
    /* 73ED4 80083ED4 21100000 */   addu      $v0, $zero, $zero
    /* 73ED8 80083ED8 00000286 */  lh         $v0, 0x0($s0)
    /* 73EDC 80083EDC 00002986 */  lh         $t1, 0x0($s1)
    /* 73EE0 80083EE0 21184000 */  addu       $v1, $v0, $zero
    /* 73EE4 80083EE4 2A104900 */  slt        $v0, $v0, $t1
    /* 73EE8 80083EE8 06004010 */  beqz       $v0, .L80083F04
    /* 73EEC 80083EEC 21302001 */   addu      $a2, $t1, $zero
    /* 73EF0 80083EF0 04000296 */  lhu        $v0, 0x4($s0)
    /* 73EF4 80083EF4 2318C300 */  subu       $v1, $a2, $v1
    /* 73EF8 80083EF8 000006A6 */  sh         $a2, 0x0($s0)
    /* 73EFC 80083EFC 23104300 */  subu       $v0, $v0, $v1
    /* 73F00 80083F00 040002A6 */  sh         $v0, 0x4($s0)
  .L80083F04:
    /* 73F04 80083F04 02000286 */  lh         $v0, 0x2($s0)
    /* 73F08 80083F08 02002A86 */  lh         $t2, 0x2($s1)
    /* 73F0C 80083F0C 21184000 */  addu       $v1, $v0, $zero
    /* 73F10 80083F10 2A104A00 */  slt        $v0, $v0, $t2
    /* 73F14 80083F14 06004010 */  beqz       $v0, .L80083F30
    /* 73F18 80083F18 21404001 */   addu      $t0, $t2, $zero
    /* 73F1C 80083F1C 06000296 */  lhu        $v0, 0x6($s0)
    /* 73F20 80083F20 23180301 */  subu       $v1, $t0, $v1
    /* 73F24 80083F24 020008A6 */  sh         $t0, 0x2($s0)
    /* 73F28 80083F28 23104300 */  subu       $v0, $v0, $v1
    /* 73F2C 80083F2C 060002A6 */  sh         $v0, 0x6($s0)
  .L80083F30:
    /* 73F30 80083F30 00000286 */  lh         $v0, 0x0($s0)
    /* 73F34 80083F34 04000486 */  lh         $a0, 0x4($s0)
    /* 73F38 80083F38 04002386 */  lh         $v1, 0x4($s1)
    /* 73F3C 80083F3C 21384000 */  addu       $a3, $v0, $zero
    /* 73F40 80083F40 21288000 */  addu       $a1, $a0, $zero
    /* 73F44 80083F44 21104400 */  addu       $v0, $v0, $a0
    /* 73F48 80083F48 21206000 */  addu       $a0, $v1, $zero
    /* 73F4C 80083F4C 21182301 */  addu       $v1, $t1, $v1
    /* 73F50 80083F50 2A186200 */  slt        $v1, $v1, $v0
    /* 73F54 80083F54 03006010 */  beqz       $v1, .L80083F64
    /* 73F58 80083F58 2110C400 */   addu      $v0, $a2, $a0
    /* 73F5C 80083F5C 23104700 */  subu       $v0, $v0, $a3
    /* 73F60 80083F60 040002A6 */  sh         $v0, 0x4($s0)
  .L80083F64:
    /* 73F64 80083F64 02000286 */  lh         $v0, 0x2($s0)
    /* 73F68 80083F68 06000486 */  lh         $a0, 0x6($s0)
    /* 73F6C 80083F6C 06002386 */  lh         $v1, 0x6($s1)
    /* 73F70 80083F70 21304000 */  addu       $a2, $v0, $zero
    /* 73F74 80083F74 21288000 */  addu       $a1, $a0, $zero
    /* 73F78 80083F78 21104400 */  addu       $v0, $v0, $a0
    /* 73F7C 80083F7C 21206000 */  addu       $a0, $v1, $zero
    /* 73F80 80083F80 21184301 */  addu       $v1, $t2, $v1
    /* 73F84 80083F84 2A186200 */  slt        $v1, $v1, $v0
    /* 73F88 80083F88 03006010 */  beqz       $v1, .L80083F98
    /* 73F8C 80083F8C 21100401 */   addu      $v0, $t0, $a0
    /* 73F90 80083F90 23104600 */  subu       $v0, $v0, $a2
    /* 73F94 80083F94 060002A6 */  sh         $v0, 0x6($s0)
  .L80083F98:
    /* 73F98 80083F98 EC0F0208 */  j          .L80083FB0
    /* 73F9C 80083F9C 01000224 */   addiu     $v0, $zero, 0x1
  .L80083FA0:
    /* 73FA0 80083FA0 040000A6 */  sh         $zero, 0x4($s0)
    /* 73FA4 80083FA4 060000A6 */  sh         $zero, 0x6($s0)
    /* 73FA8 80083FA8 000000A6 */  sh         $zero, 0x0($s0)
    /* 73FAC 80083FAC 020000A6 */  sh         $zero, 0x2($s0)
  .L80083FB0:
    /* 73FB0 80083FB0 6800BF8F */  lw         $ra, 0x68($sp)
    /* 73FB4 80083FB4 6400B18F */  lw         $s1, 0x64($sp)
    /* 73FB8 80083FB8 6000B08F */  lw         $s0, 0x60($sp)
    /* 73FBC 80083FBC 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 73FC0 80083FC0 0800E003 */  jr         $ra
    /* 73FC4 80083FC4 00000000 */   nop
endlabel ClipRect__FRC4RECTR4RECT
