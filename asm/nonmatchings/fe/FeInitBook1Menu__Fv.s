.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitBook1Menu__Fv, 0x50

glabel FeInitBook1Menu__Fv
    /* 2324 8013BF1C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2328 8013BF20 0D80043C */  lui        $a0, %hi(FeBook1MenuTable)
    /* 232C 8013BF24 70DA8424 */  addiu      $a0, $a0, %lo(FeBook1MenuTable)
    /* 2330 8013BF28 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2334 8013BF2C 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 2338 8013BF30 05000524 */   addiu     $a1, $zero, 0x5
    /* 233C 8013BF34 08000224 */  addiu      $v0, $zero, 0x8
    /* 2340 8013BF38 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 2344 8013BF3C 20000224 */  addiu      $v0, $zero, 0x20
    /* 2348 8013BF40 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 234C 8013BF44 40010224 */  addiu      $v0, $zero, 0x140
    /* 2350 8013BF48 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 2354 8013BF4C 80000224 */  addiu      $v0, $zero, 0x80
    /* 2358 8013BF50 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 235C 8013BF54 01000224 */  addiu      $v0, $zero, 0x1
    /* 2360 8013BF58 280C82AF */  sw         $v0, %gp_rel(BookMenu)($gp)
    /* 2364 8013BF5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2368 8013BF60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 236C 8013BF64 0800E003 */  jr         $ra
    /* 2370 8013BF68 00000000 */   nop
endlabel FeInitBook1Menu__Fv
