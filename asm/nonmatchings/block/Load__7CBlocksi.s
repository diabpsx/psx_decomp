.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Load__7CBlocksi, 0xB8

glabel Load__7CBlocksi
    /* 7DB64 8008DB64 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7DB68 8008DB68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7DB6C 8008DB6C 21808000 */  addu       $s0, $a0, $zero
    /* 7DB70 8008DB70 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7DB74 8008DB74 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7DB78 8008DB78 4000028E */  lw         $v0, 0x40($s0)
    /* 7DB7C 8008DB7C 00000000 */  nop
    /* 7DB80 8008DB80 20004014 */  bnez       $v0, .L8008DC04
    /* 7DB84 8008DB84 2188A000 */   addu      $s1, $a1, $zero
    /* 7DB88 8008DB88 1D11020C */  jal        SYSI_GetFs__Fv
    /* 7DB8C 8008DB8C 00000000 */   nop
    /* 7DB90 8008DB90 21200002 */  addu       $a0, $s0, $zero
    /* 7DB94 8008DB94 80101100 */  sll        $v0, $s1, 2
    /* 7DB98 8008DB98 0B80013C */  lui        $at, %hi(TX_DatTab)
    /* 7DB9C 8008DB9C 21082200 */  addu       $at, $at, $v0
    /* 7DBA0 8008DBA0 042D258C */  lw         $a1, %lo(TX_DatTab)($at)
    /* 7DBA4 8008DBA4 7F47020C */  jal        SetFileInfo__7TextDatPC13CTextFileInfoi
    /* 7DBA8 8008DBA8 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 7DBAC 8008DBAC 21200002 */  addu       $a0, $s0, $zero
    /* 7DBB0 8008DBB0 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 7DBB4 8008DBB4 01000624 */  addiu      $a2, $zero, 0x1
    /* 7DBB8 8008DBB8 CC47020C */  jal        Use__7TextDatlbi
    /* 7DBBC 8008DBBC 21380000 */   addu      $a3, $zero, $zero
    /* 7DBC0 8008DBC0 2000038E */  lw         $v1, 0x20($s0)
    /* 7DBC4 8008DBC4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 7DBC8 8008DBC8 06006214 */  bne        $v1, $v0, .L8008DBE4
    /* 7DBCC 8008DBCC 00000000 */   nop
    /* 7DBD0 8008DBD0 21200000 */  addu       $a0, $zero, $zero
    /* 7DBD4 8008DBD4 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DBD8 8008DBD8 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DBDC 8008DBDC A583000C */  jal        DBG_Error
    /* 7DBE0 8008DBE0 77020624 */   addiu     $a2, $zero, 0x277
  .L8008DBE4:
    /* 7DBE4 8008DBE4 3C00028E */  lw         $v0, 0x3C($s0)
    /* 7DBE8 8008DBE8 00000000 */  nop
    /* 7DBEC 8008DBEC 0000428C */  lw         $v0, 0x0($v0)
    /* 7DBF0 8008DBF0 21200002 */  addu       $a0, $s0, $zero
    /* 7DBF4 8008DBF4 5C37020C */  jal        MakeGt4Table__7CBlocks
    /* 7DBF8 8008DBF8 AC0002AE */   sw        $v0, 0xAC($s0)
    /* 7DBFC 8008DBFC 0737020C */  jal        MakeRectTable__7CBlocks
    /* 7DC00 8008DC00 21200002 */   addu      $a0, $s0, $zero
  .L8008DC04:
    /* 7DC04 8008DC04 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7DC08 8008DC08 1400B18F */  lw         $s1, 0x14($sp)
    /* 7DC0C 8008DC0C 1000B08F */  lw         $s0, 0x10($sp)
    /* 7DC10 8008DC10 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7DC14 8008DC14 0800E003 */  jr         $ra
    /* 7DC18 8008DC18 00000000 */   nop
endlabel Load__7CBlocksi
