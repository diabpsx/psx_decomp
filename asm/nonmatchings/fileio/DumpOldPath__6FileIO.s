.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpOldPath__6FileIO, 0x64

glabel DumpOldPath__6FileIO
    /* 75CB8 80085CB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 75CBC 80085CBC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75CC0 80085CC0 21808000 */  addu       $s0, $a0, $zero
    /* 75CC4 80085CC4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 75CC8 80085CC8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 75CCC 80085CCC 0800048E */  lw         $a0, 0x8($s0)
    /* 75CD0 80085CD0 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 75CD4 80085CD4 0B009110 */  beq        $a0, $s1, .L80085D04
    /* 75CD8 80085CD8 00000000 */   nop
    /* 75CDC 80085CDC 1886000C */  jal        GAL_Free
    /* 75CE0 80085CE0 00000000 */   nop
    /* 75CE4 80085CE4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 75CE8 80085CE8 05004014 */  bnez       $v0, .L80085D00
    /* 75CEC 80085CEC 21200000 */   addu      $a0, $zero, $zero
    /* 75CF0 80085CF0 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75CF4 80085CF4 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75CF8 80085CF8 A583000C */  jal        DBG_Error
    /* 75CFC 80085CFC B8000624 */   addiu     $a2, $zero, 0xB8
  .L80085D00:
    /* 75D00 80085D00 080011AE */  sw         $s1, 0x8($s0)
  .L80085D04:
    /* 75D04 80085D04 1800BF8F */  lw         $ra, 0x18($sp)
    /* 75D08 80085D08 1400B18F */  lw         $s1, 0x14($sp)
    /* 75D0C 80085D0C 1000B08F */  lw         $s0, 0x10($sp)
    /* 75D10 80085D10 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 75D14 80085D14 0800E003 */  jr         $ra
    /* 75D18 80085D18 00000000 */   nop
endlabel DumpOldPath__6FileIO
