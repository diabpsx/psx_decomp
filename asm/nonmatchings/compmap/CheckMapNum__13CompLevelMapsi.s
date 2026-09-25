.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckMapNum__13CompLevelMapsi, 0x34

glabel CheckMapNum__13CompLevelMapsi
    /* 72120 80082120 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 72124 80082124 1600A52C */  sltiu      $a1, $a1, 0x16
    /* 72128 80082128 0600A014 */  bnez       $a1, .L80082144
    /* 7212C 8008212C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 72130 80082130 21200000 */  addu       $a0, $zero, $zero
    /* 72134 80082134 1280053C */  lui        $a1, %hi(D_80118E44)
    /* 72138 80082138 448EA524 */  addiu      $a1, $a1, %lo(D_80118E44)
    /* 7213C 8008213C A583000C */  jal        DBG_Error
    /* 72140 80082140 81000624 */   addiu     $a2, $zero, 0x81
  .L80082144:
    /* 72144 80082144 1000BF8F */  lw         $ra, 0x10($sp)
    /* 72148 80082148 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7214C 8008214C 0800E003 */  jr         $ra
    /* 72150 80082150 00000000 */   nop
endlabel CheckMapNum__13CompLevelMapsi
