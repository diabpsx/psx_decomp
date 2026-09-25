.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPrimBuffer__FP11PRIM_BUFFERii, 0xDC

glabel InitPrimBuffer__FP11PRIM_BUFFERii
    /* 73910 80083910 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 73914 80083914 1000B0AF */  sw         $s0, 0x10($sp)
    /* 73918 80083918 21808000 */  addu       $s0, $a0, $zero
    /* 7391C 8008391C 80100500 */  sll        $v0, $a1, 2
    /* 73920 80083920 21104500 */  addu       $v0, $v0, $a1
    /* 73924 80083924 2000B4AF */  sw         $s4, 0x20($sp)
    /* 73928 80083928 C0A00200 */  sll        $s4, $v0, 3
    /* 7392C 8008392C 21208002 */  addu       $a0, $s4, $zero
    /* 73930 80083930 1400B1AF */  sw         $s1, 0x14($sp)
    /* 73934 80083934 2188C000 */  addu       $s1, $a2, $zero
    /* 73938 80083938 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7393C 8008393C 1180133C */  lui        $s3, %hi(D_8010FFD4)
    /* 73940 80083940 D4FF7326 */  addiu      $s3, $s3, %lo(D_8010FFD4)
    /* 73944 80083944 911E8593 */  lbu        $a1, %gp_rel(D_8011C611)($gp)
    /* 73948 80083948 21306002 */  addu       $a2, $s3, $zero
    /* 7394C 8008394C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 73950 80083950 7785000C */  jal        GAL_Alloc
    /* 73954 80083954 1800B2AF */   sw        $s2, 0x18($sp)
    /* 73958 80083958 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 7395C 8008395C 19005210 */  beq        $v0, $s2, .L800839C4
    /* 73960 80083960 180002AE */   sw        $v0, 0x18($s0)
    /* 73964 80083964 DD85000C */  jal        GAL_Lock
    /* 73968 80083968 21204000 */   addu      $a0, $v0, $zero
    /* 7396C 8008396C 15004010 */  beqz       $v0, .L800839C4
    /* 73970 80083970 000002AE */   sw        $v0, 0x0($s0)
    /* 73974 80083974 80201100 */  sll        $a0, $s1, 2
    /* 73978 80083978 911E8593 */  lbu        $a1, %gp_rel(D_8011C611)($gp)
    /* 7397C 8008397C 7785000C */  jal        GAL_Alloc
    /* 73980 80083980 21306002 */   addu      $a2, $s3, $zero
    /* 73984 80083984 0F005210 */  beq        $v0, $s2, .L800839C4
    /* 73988 80083988 140002AE */   sw        $v0, 0x14($s0)
    /* 7398C 8008398C DD85000C */  jal        GAL_Lock
    /* 73990 80083990 21204000 */   addu      $a0, $v0, $zero
    /* 73994 80083994 0B004010 */  beqz       $v0, .L800839C4
    /* 73998 80083998 080002AE */   sw        $v0, 0x8($s0)
    /* 7399C 8008399C 0800048E */  lw         $a0, 0x8($s0)
    /* 739A0 800839A0 100011AE */  sw         $s1, 0x10($s0)
    /* 739A4 800839A4 1000058E */  lw         $a1, 0x10($s0)
    /* 739A8 800839A8 0000028E */  lw         $v0, 0x0($s0)
    /* 739AC 800839AC 0C0000A2 */  sb         $zero, 0xC($s0)
    /* 739B0 800839B0 21105400 */  addu       $v0, $v0, $s4
    /* 739B4 800839B4 A74F000C */  jal        ClearOTag
    /* 739B8 800839B8 040002AE */   sw        $v0, 0x4($s0)
    /* 739BC 800839BC 720E0208 */  j          .L800839C8
    /* 739C0 800839C0 01000224 */   addiu     $v0, $zero, 0x1
  .L800839C4:
    /* 739C4 800839C4 21100000 */  addu       $v0, $zero, $zero
  .L800839C8:
    /* 739C8 800839C8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 739CC 800839CC 2000B48F */  lw         $s4, 0x20($sp)
    /* 739D0 800839D0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 739D4 800839D4 1800B28F */  lw         $s2, 0x18($sp)
    /* 739D8 800839D8 1400B18F */  lw         $s1, 0x14($sp)
    /* 739DC 800839DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 739E0 800839E0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 739E4 800839E4 0800E003 */  jr         $ra
    /* 739E8 800839E8 00000000 */   nop
endlabel InitPrimBuffer__FP11PRIM_BUFFERii
