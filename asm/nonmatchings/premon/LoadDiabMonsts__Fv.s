.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadDiabMonsts__Fv, 0x110

glabel LoadDiabMonsts__Fv
    /* 269A4 8016059C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 269A8 801605A0 1280043C */  lui        $a0, %hi(D_80119CA4)
    /* 269AC 801605A4 A49C8424 */  addiu      $a0, $a0, %lo(D_80119CA4)
    /* 269B0 801605A8 21280000 */  addu       $a1, $zero, $zero
    /* 269B4 801605AC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 269B8 801605B0 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 269BC 801605B4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 269C0 801605B8 21804000 */  addu       $s0, $v0, $zero
    /* 269C4 801605BC 21200002 */  addu       $a0, $s0, $zero
    /* 269C8 801605C0 1280053C */  lui        $a1, %hi(diabquad1x)
    /* 269CC 801605C4 7CBFA58C */  lw         $a1, %lo(diabquad1x)($a1)
    /* 269D0 801605C8 1280063C */  lui        $a2, %hi(diabquad1y)
    /* 269D4 801605CC 8CBFC68C */  lw         $a2, %lo(diabquad1y)($a2)
    /* 269D8 801605D0 40280500 */  sll        $a1, $a1, 1
    /* 269DC 801605D4 2883050C */  jal        SetMapMonsters__FPUcii
    /* 269E0 801605D8 40300600 */   sll       $a2, $a2, 1
    /* 269E4 801605DC F7F6000C */  jal        mem_free_dbg__FPv
    /* 269E8 801605E0 21200002 */   addu      $a0, $s0, $zero
    /* 269EC 801605E4 1280043C */  lui        $a0, %hi(D_80119CB0)
    /* 269F0 801605E8 B09C8424 */  addiu      $a0, $a0, %lo(D_80119CB0)
    /* 269F4 801605EC A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 269F8 801605F0 21280000 */   addu      $a1, $zero, $zero
    /* 269FC 801605F4 21804000 */  addu       $s0, $v0, $zero
    /* 26A00 801605F8 21200002 */  addu       $a0, $s0, $zero
    /* 26A04 801605FC 1280053C */  lui        $a1, %hi(diabquad2x)
    /* 26A08 80160600 80BFA58C */  lw         $a1, %lo(diabquad2x)($a1)
    /* 26A0C 80160604 1280063C */  lui        $a2, %hi(diabquad2y)
    /* 26A10 80160608 90BFC68C */  lw         $a2, %lo(diabquad2y)($a2)
    /* 26A14 8016060C 40280500 */  sll        $a1, $a1, 1
    /* 26A18 80160610 2883050C */  jal        SetMapMonsters__FPUcii
    /* 26A1C 80160614 40300600 */   sll       $a2, $a2, 1
    /* 26A20 80160618 F7F6000C */  jal        mem_free_dbg__FPv
    /* 26A24 8016061C 21200002 */   addu      $a0, $s0, $zero
    /* 26A28 80160620 1280043C */  lui        $a0, %hi(D_80119CBC)
    /* 26A2C 80160624 BC9C8424 */  addiu      $a0, $a0, %lo(D_80119CBC)
    /* 26A30 80160628 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 26A34 8016062C 21280000 */   addu      $a1, $zero, $zero
    /* 26A38 80160630 21804000 */  addu       $s0, $v0, $zero
    /* 26A3C 80160634 21200002 */  addu       $a0, $s0, $zero
    /* 26A40 80160638 1280053C */  lui        $a1, %hi(diabquad3x)
    /* 26A44 8016063C 84BFA58C */  lw         $a1, %lo(diabquad3x)($a1)
    /* 26A48 80160640 1280063C */  lui        $a2, %hi(diabquad3y)
    /* 26A4C 80160644 94BFC68C */  lw         $a2, %lo(diabquad3y)($a2)
    /* 26A50 80160648 40280500 */  sll        $a1, $a1, 1
    /* 26A54 8016064C 2883050C */  jal        SetMapMonsters__FPUcii
    /* 26A58 80160650 40300600 */   sll       $a2, $a2, 1
    /* 26A5C 80160654 F7F6000C */  jal        mem_free_dbg__FPv
    /* 26A60 80160658 21200002 */   addu      $a0, $s0, $zero
    /* 26A64 8016065C 1280043C */  lui        $a0, %hi(D_80119CC8)
    /* 26A68 80160660 C89C8424 */  addiu      $a0, $a0, %lo(D_80119CC8)
    /* 26A6C 80160664 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 26A70 80160668 21280000 */   addu      $a1, $zero, $zero
    /* 26A74 8016066C 21804000 */  addu       $s0, $v0, $zero
    /* 26A78 80160670 21200002 */  addu       $a0, $s0, $zero
    /* 26A7C 80160674 1280053C */  lui        $a1, %hi(diabquad4x)
    /* 26A80 80160678 88BFA58C */  lw         $a1, %lo(diabquad4x)($a1)
    /* 26A84 8016067C 1280063C */  lui        $a2, %hi(diabquad4y)
    /* 26A88 80160680 98BFC68C */  lw         $a2, %lo(diabquad4y)($a2)
    /* 26A8C 80160684 40280500 */  sll        $a1, $a1, 1
    /* 26A90 80160688 2883050C */  jal        SetMapMonsters__FPUcii
    /* 26A94 8016068C 40300600 */   sll       $a2, $a2, 1
    /* 26A98 80160690 F7F6000C */  jal        mem_free_dbg__FPv
    /* 26A9C 80160694 21200002 */   addu      $a0, $s0, $zero
    /* 26AA0 80160698 1400BF8F */  lw         $ra, 0x14($sp)
    /* 26AA4 8016069C 1000B08F */  lw         $s0, 0x10($sp)
    /* 26AA8 801606A0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 26AAC 801606A4 0800E003 */  jr         $ra
    /* 26AB0 801606A8 00000000 */   nop
endlabel LoadDiabMonsts__Fv
