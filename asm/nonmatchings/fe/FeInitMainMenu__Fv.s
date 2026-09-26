.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitMainMenu__Fv, 0x7C

glabel FeInitMainMenu__Fv
    /* FAC 8013ABA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FB0 8013ABA8 1280033C */  lui        $v1, %hi(MemCardActive)
    /* FB4 8013ABAC 60B1638C */  lw         $v1, %lo(MemCardActive)($v1)
    /* FB8 8013ABB0 05000224 */  addiu      $v0, $zero, 0x5
    /* FBC 8013ABB4 1280013C */  lui        $at, %hi(cardondelay)
    /* FC0 8013ABB8 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* FC4 8013ABBC 01000224 */  addiu      $v0, $zero, 0x1
    /* FC8 8013ABC0 1000BFAF */  sw         $ra, 0x10($sp)
    /* FCC 8013ABC4 1280013C */  lui        $at, %hi(AlertTxt)
    /* FD0 8013ABC8 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
    /* FD4 8013ABCC 03006214 */  bne        $v1, $v0, .L8013ABDC
    /* FD8 8013ABD0 00000000 */   nop
    /* FDC 8013ABD4 5695020C */  jal        MemcardOFF__Fv
    /* FE0 8013ABD8 00000000 */   nop
  .L8013ABDC:
    /* FE4 8013ABDC 0D80043C */  lui        $a0, %hi(FeMainMenuTable)
    /* FE8 8013ABE0 08D88424 */  addiu      $a0, $a0, %lo(FeMainMenuTable)
    /* FEC 8013ABE4 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* FF0 8013ABE8 05000524 */   addiu     $a1, $zero, 0x5
    /* FF4 8013ABEC 08000224 */  addiu      $v0, $zero, 0x8
    /* FF8 8013ABF0 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* FFC 8013ABF4 20000224 */  addiu      $v0, $zero, 0x20
    /* 1000 8013ABF8 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 1004 8013ABFC 40010224 */  addiu      $v0, $zero, 0x140
    /* 1008 8013AC00 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 100C 8013AC04 80000224 */  addiu      $v0, $zero, 0x80
    /* 1010 8013AC08 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 1014 8013AC0C B80B80AF */  sw         $zero, %gp_rel(JustQuitQText)($gp)
    /* 1018 8013AC10 1000BF8F */  lw         $ra, 0x10($sp)
    /* 101C 8013AC14 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1020 8013AC18 0800E003 */  jr         $ra
    /* 1024 8013AC1C 00000000 */   nop
endlabel FeInitMainMenu__Fv
