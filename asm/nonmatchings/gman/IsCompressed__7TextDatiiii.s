.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsCompressed__7TextDatiiii, 0x4C

glabel IsCompressed__7TextDatiiii
    /* 825E0 800925E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 825E4 800925E4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 825E8 800925E8 21808000 */  addu       $s0, $a0, $zero
    /* 825EC 800925EC 3000A28F */  lw         $v0, 0x30($sp)
    /* 825F0 800925F0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 825F4 800925F4 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 825F8 800925F8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 825FC 800925FC 21200002 */  addu       $a0, $s0, $zero
    /* 82600 80092600 DB54020C */  jal        GetFr__7TextDati_8009536c
    /* 82604 80092604 21284000 */   addu      $a1, $v0, $zero
    /* 82608 80092608 0400428C */  lw         $v0, 0x4($v0)
    /* 8260C 8009260C 0004033C */  lui        $v1, (0x4000000 >> 16)
    /* 82610 80092610 24104300 */  and        $v0, $v0, $v1
    /* 82614 80092614 0100422C */  sltiu      $v0, $v0, 0x1
    /* 82618 80092618 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8261C 8009261C 1800B08F */  lw         $s0, 0x18($sp)
    /* 82620 80092620 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 82624 80092624 0800E003 */  jr         $ra
    /* 82628 80092628 00000000 */   nop
endlabel IsCompressed__7TextDatiiii
