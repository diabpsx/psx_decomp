.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitBook2Menu__Fv, 0x50

glabel FeInitBook2Menu__Fv
    /* 2374 8013BF6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2378 8013BF70 0D80043C */  lui        $a0, %hi(FeBook2MenuTable)
    /* 237C 8013BF74 E8DA8424 */  addiu      $a0, $a0, %lo(FeBook2MenuTable)
    /* 2380 8013BF78 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2384 8013BF7C 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 2388 8013BF80 06000524 */   addiu     $a1, $zero, 0x6
    /* 238C 8013BF84 08000224 */  addiu      $v0, $zero, 0x8
    /* 2390 8013BF88 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 2394 8013BF8C 20000224 */  addiu      $v0, $zero, 0x20
    /* 2398 8013BF90 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 239C 8013BF94 40010224 */  addiu      $v0, $zero, 0x140
    /* 23A0 8013BF98 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 23A4 8013BF9C 80000224 */  addiu      $v0, $zero, 0x80
    /* 23A8 8013BFA0 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 23AC 8013BFA4 02000224 */  addiu      $v0, $zero, 0x2
    /* 23B0 8013BFA8 280C82AF */  sw         $v0, %gp_rel(BookMenu)($gp)
    /* 23B4 8013BFAC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 23B8 8013BFB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 23BC 8013BFB4 0800E003 */  jr         $ra
    /* 23C0 8013BFB8 00000000 */   nop
endlabel FeInitBook2Menu__Fv
