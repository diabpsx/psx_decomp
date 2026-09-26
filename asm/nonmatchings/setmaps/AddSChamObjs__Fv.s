.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSChamObjs__Fv, 0x7C

glabel AddSChamObjs__Fv
    /* 1B8C4 801554BC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B8C8 801554C0 25000424 */  addiu      $a0, $zero, 0x25
    /* 1B8CC 801554C4 1E000524 */  addiu      $a1, $zero, 0x1E
    /* 1B8D0 801554C8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1B8D4 801554CC B654050C */  jal        ObjIndex__Fii
    /* 1B8D8 801554D0 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1B8DC 801554D4 21204000 */  addu       $a0, $v0, $zero
    /* 1B8E0 801554D8 11000524 */  addiu      $a1, $zero, 0x11
    /* 1B8E4 801554DC 21300000 */  addu       $a2, $zero, $zero
    /* 1B8E8 801554E0 15000724 */  addiu      $a3, $zero, 0x15
    /* 1B8EC 801554E4 05001024 */  addiu      $s0, $zero, 0x5
    /* 1B8F0 801554E8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1B8F4 801554EC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B8F8 801554F0 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B8FC 801554F4 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B900 801554F8 25000424 */  addiu      $a0, $zero, 0x25
    /* 1B904 801554FC B654050C */  jal        ObjIndex__Fii
    /* 1B908 80155500 2E000524 */   addiu     $a1, $zero, 0x2E
    /* 1B90C 80155504 21204000 */  addu       $a0, $v0, $zero
    /* 1B910 80155508 0D000524 */  addiu      $a1, $zero, 0xD
    /* 1B914 8015550C 21300000 */  addu       $a2, $zero, $zero
    /* 1B918 80155510 10000724 */  addiu      $a3, $zero, 0x10
    /* 1B91C 80155514 02000224 */  addiu      $v0, $zero, 0x2
    /* 1B920 80155518 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B924 8015551C 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B928 80155520 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B92C 80155524 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1B930 80155528 1800B08F */  lw         $s0, 0x18($sp)
    /* 1B934 8015552C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1B938 80155530 0800E003 */  jr         $ra
    /* 1B93C 80155534 00000000 */   nop
endlabel AddSChamObjs__Fv
