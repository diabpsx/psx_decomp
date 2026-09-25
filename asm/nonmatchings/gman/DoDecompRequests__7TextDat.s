.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoDecompRequests__7TextDat, 0x124

glabel DoDecompRequests__7TextDat
    /* 83F44 80093F44 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 83F48 80093F48 1000B0AF */  sw         $s0, 0x10($sp)
    /* 83F4C 80093F4C 21808000 */  addu       $s0, $a0, $zero
    /* 83F50 80093F50 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 83F54 80093F54 1800B2AF */  sw         $s2, 0x18($sp)
    /* 83F58 80093F58 1400B1AF */  sw         $s1, 0x14($sp)
    /* 83F5C 80093F5C 6000028E */  lw         $v0, 0x60($s0)
    /* 83F60 80093F60 00000000 */  nop
    /* 83F64 80093F64 03004014 */  bnez       $v0, .L80093F74
    /* 83F68 80093F68 01000224 */   addiu     $v0, $zero, 0x1
    /* 83F6C 80093F6C DE4F0208 */  j          .L80093F78
    /* 83F70 80093F70 600002AE */   sw        $v0, 0x60($s0)
  .L80093F74:
    /* 83F74 80093F74 600000AE */  sw         $zero, 0x60($s0)
  .L80093F78:
    /* 83F78 80093F78 6C00048E */  lw         $a0, 0x6C($s0)
    /* 83F7C 80093F7C DD85000C */  jal        GAL_Lock
    /* 83F80 80093F80 00000000 */   nop
    /* 83F84 80093F84 21884000 */  addu       $s1, $v0, $zero
    /* 83F88 80093F88 05002016 */  bnez       $s1, .L80093FA0
    /* 83F8C 80093F8C 21200000 */   addu      $a0, $zero, $zero
    /* 83F90 80093F90 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83F94 80093F94 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83F98 80093F98 A583000C */  jal        DBG_Error
    /* 83F9C 80093F9C A0050624 */   addiu     $a2, $zero, 0x5A0
  .L80093FA0:
    /* 83FA0 80093FA0 6000038E */  lw         $v1, 0x60($s0)
    /* 83FA4 80093FA4 21900000 */  addu       $s2, $zero, $zero
    /* 83FA8 80093FA8 80100300 */  sll        $v0, $v1, 2
    /* 83FAC 80093FAC 21104300 */  addu       $v0, $v0, $v1
    /* 83FB0 80093FB0 40110200 */  sll        $v0, $v0, 5
    /* 83FB4 80093FB4 21882202 */  addu       $s1, $s1, $v0
  .L80093FB8:
    /* 83FB8 80093FB8 6000028E */  lw         $v0, 0x60($s0)
    /* 83FBC 80093FBC 00000000 */  nop
    /* 83FC0 80093FC0 80100200 */  sll        $v0, $v0, 2
    /* 83FC4 80093FC4 21105000 */  addu       $v0, $v0, $s0
    /* 83FC8 80093FC8 6400428C */  lw         $v0, 0x64($v0)
    /* 83FCC 80093FCC 00000000 */  nop
    /* 83FD0 80093FD0 2A104202 */  slt        $v0, $s2, $v0
    /* 83FD4 80093FD4 0E004010 */  beqz       $v0, .L80094010
    /* 83FD8 80093FD8 00000000 */   nop
    /* 83FDC 80093FDC 0000248E */  lw         $a0, 0x0($s1)
    /* 83FE0 80093FE0 1886000C */  jal        GAL_Free
    /* 83FE4 80093FE4 00000000 */   nop
    /* 83FE8 80093FE8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 83FEC 80093FEC 05004014 */  bnez       $v0, .L80094004
    /* 83FF0 80093FF0 21200000 */   addu      $a0, $zero, $zero
    /* 83FF4 80093FF4 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83FF8 80093FF8 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83FFC 80093FFC A583000C */  jal        DBG_Error
    /* 84000 80094000 AC050624 */   addiu     $a2, $zero, 0x5AC
  .L80094004:
    /* 84004 80094004 04003126 */  addiu      $s1, $s1, 0x4
    /* 84008 80094008 EE4F0208 */  j          .L80093FB8
    /* 8400C 8009400C 01005226 */   addiu     $s2, $s2, 0x1
  .L80094010:
    /* 84010 80094010 6000028E */  lw         $v0, 0x60($s0)
    /* 84014 80094014 00000000 */  nop
    /* 84018 80094018 80100200 */  sll        $v0, $v0, 2
    /* 8401C 8009401C 21105000 */  addu       $v0, $v0, $s0
    /* 84020 80094020 640040AC */  sw         $zero, 0x64($v0)
    /* 84024 80094024 6C00048E */  lw         $a0, 0x6C($s0)
    /* 84028 80094028 F785000C */  jal        GAL_Unlock
    /* 8402C 8009402C 00000000 */   nop
    /* 84030 80094030 FF004230 */  andi       $v0, $v0, 0xFF
    /* 84034 80094034 05004014 */  bnez       $v0, .L8009404C
    /* 84038 80094038 21200000 */   addu      $a0, $zero, $zero
    /* 8403C 8009403C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84040 80094040 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84044 80094044 A583000C */  jal        DBG_Error
    /* 84048 80094048 B2050624 */   addiu     $a2, $zero, 0x5B2
  .L8009404C:
    /* 8404C 8009404C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 84050 80094050 1800B28F */  lw         $s2, 0x18($sp)
    /* 84054 80094054 1400B18F */  lw         $s1, 0x14($sp)
    /* 84058 80094058 1000B08F */  lw         $s0, 0x10($sp)
    /* 8405C 8009405C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 84060 80094060 0800E003 */  jr         $ra
    /* 84064 80094064 00000000 */   nop
endlabel DoDecompRequests__7TextDat
