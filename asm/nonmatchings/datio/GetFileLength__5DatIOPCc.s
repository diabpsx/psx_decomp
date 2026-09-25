.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFileLength__5DatIOPCc, 0xB4

glabel GetFileLength__5DatIOPCc
    /* 768D8 800868D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 768DC 800868DC 2120A000 */  addu       $a0, $a1, $zero
    /* 768E0 800868E0 21280000 */  addu       $a1, $zero, $zero
    /* 768E4 800868E4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 768E8 800868E8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 768EC 800868EC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 768F0 800868F0 0E8D000C */  jal        DDXopen
    /* 768F4 800868F4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 768F8 800868F8 21804000 */  addu       $s0, $v0, $zero
    /* 768FC 800868FC FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 76900 80086900 07001216 */  bne        $s0, $s2, .L80086920
    /* 76904 80086904 21200002 */   addu      $a0, $s0, $zero
    /* 76908 80086908 21200000 */  addu       $a0, $zero, $zero
    /* 7690C 8008690C 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76910 80086910 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76914 80086914 A583000C */  jal        DBG_Error
    /* 76918 80086918 86000624 */   addiu     $a2, $zero, 0x86
    /* 7691C 8008691C 21200002 */  addu       $a0, $s0, $zero
  .L80086920:
    /* 76920 80086920 21280000 */  addu       $a1, $zero, $zero
    /* 76924 80086924 978D000C */  jal        DDXlseek
    /* 76928 80086928 02000624 */   addiu     $a2, $zero, 0x2
    /* 7692C 8008692C 21884000 */  addu       $s1, $v0, $zero
    /* 76930 80086930 05003216 */  bne        $s1, $s2, .L80086948
    /* 76934 80086934 21200000 */   addu      $a0, $zero, $zero
    /* 76938 80086938 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 7693C 8008693C AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76940 80086940 A583000C */  jal        DBG_Error
    /* 76944 80086944 89000624 */   addiu     $a2, $zero, 0x89
  .L80086948:
    /* 76948 80086948 358D000C */  jal        DDXclose
    /* 7694C 8008694C 21200002 */   addu      $a0, $s0, $zero
    /* 76950 80086950 07005214 */  bne        $v0, $s2, .L80086970
    /* 76954 80086954 21102002 */   addu      $v0, $s1, $zero
    /* 76958 80086958 21200000 */  addu       $a0, $zero, $zero
    /* 7695C 8008695C 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76960 80086960 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76964 80086964 A583000C */  jal        DBG_Error
    /* 76968 80086968 8C000624 */   addiu     $a2, $zero, 0x8C
    /* 7696C 8008696C 21102002 */  addu       $v0, $s1, $zero
  .L80086970:
    /* 76970 80086970 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 76974 80086974 1800B28F */  lw         $s2, 0x18($sp)
    /* 76978 80086978 1400B18F */  lw         $s1, 0x14($sp)
    /* 7697C 8008697C 1000B08F */  lw         $s0, 0x10($sp)
    /* 76980 80086980 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 76984 80086984 0800E003 */  jr         $ra
    /* 76988 80086988 00000000 */   nop
endlabel GetFileLength__5DatIOPCc
