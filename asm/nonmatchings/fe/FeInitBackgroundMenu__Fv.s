.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitBackgroundMenu__Fv, 0x4C

glabel FeInitBackgroundMenu__Fv
    /* 22D8 8013BED0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22DC 8013BED4 0D80043C */  lui        $a0, %hi(FeBackgroundMenuTable)
    /* 22E0 8013BED8 10DA8424 */  addiu      $a0, $a0, %lo(FeBackgroundMenuTable)
    /* 22E4 8013BEDC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 22E8 8013BEE0 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 22EC 8013BEE4 04000524 */   addiu     $a1, $zero, 0x4
    /* 22F0 8013BEE8 08000224 */  addiu      $v0, $zero, 0x8
    /* 22F4 8013BEEC E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 22F8 8013BEF0 20000224 */  addiu      $v0, $zero, 0x20
    /* 22FC 8013BEF4 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 2300 8013BEF8 40010224 */  addiu      $v0, $zero, 0x140
    /* 2304 8013BEFC EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 2308 8013BF00 80000224 */  addiu      $v0, $zero, 0x80
    /* 230C 8013BF04 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 2310 8013BF08 280C80AF */  sw         $zero, %gp_rel(BookMenu)($gp)
    /* 2314 8013BF0C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2318 8013BF10 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 231C 8013BF14 0800E003 */  jr         $ra
    /* 2320 8013BF18 00000000 */   nop
endlabel FeInitBackgroundMenu__Fv
