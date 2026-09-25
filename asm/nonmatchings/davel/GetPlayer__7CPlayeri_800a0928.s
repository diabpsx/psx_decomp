.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPlayer__7CPlayeri_800a0928, 0x50

glabel GetPlayer__7CPlayeri_800a0928
    /* 90928 800A0928 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9092C 800A092C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 90930 800A0930 21808000 */  addu       $s0, $a0, $zero
    /* 90934 800A0934 0200022E */  sltiu      $v0, $s0, 0x2
    /* 90938 800A0938 06004014 */  bnez       $v0, .L800A0954
    /* 9093C 800A093C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 90940 800A0940 21200000 */  addu       $a0, $zero, $zero
    /* 90944 800A0944 1180053C */  lui        $a1, %hi(D_80110BEC)
    /* 90948 800A0948 EC0BA524 */  addiu      $a1, $a1, %lo(D_80110BEC)
    /* 9094C 800A094C A583000C */  jal        DBG_Error
    /* 90950 800A0950 41000624 */   addiu     $a2, $zero, 0x41
  .L800A0954:
    /* 90954 800A0954 80101000 */  sll        $v0, $s0, 2
    /* 90958 800A0958 1280013C */  lui        $at, %hi(_7CPlayer_PActiveArray)
    /* 9095C 800A095C 21082200 */  addu       $at, $at, $v0
    /* 90960 800A0960 50AD228C */  lw         $v0, %lo(_7CPlayer_PActiveArray)($at)
    /* 90964 800A0964 1400BF8F */  lw         $ra, 0x14($sp)
    /* 90968 800A0968 1000B08F */  lw         $s0, 0x10($sp)
    /* 9096C 800A096C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90970 800A0970 0800E003 */  jr         $ra
    /* 90974 800A0974 00000000 */   nop
endlabel GetPlayer__7CPlayeri_800a0928
