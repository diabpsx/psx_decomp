.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeDrawChrClass__Fv, 0x38

glabel FeDrawChrClass__Fv
    /* 13BC 8013AFB4 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 13C0 8013AFB8 2800A427 */  addiu      $a0, $sp, 0x28
    /* 13C4 8013AFBC 7000BFAF */  sw         $ra, 0x70($sp)
    /* 13C8 8013AFC0 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 13CC 8013AFC4 6800B6AF */  sw         $s6, 0x68($sp)
    /* 13D0 8013AFC8 6400B5AF */  sw         $s5, 0x64($sp)
    /* 13D4 8013AFCC 6000B4AF */  sw         $s4, 0x60($sp)
    /* 13D8 8013AFD0 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 13DC 8013AFD4 5800B2AF */  sw         $s2, 0x58($sp)
    /* 13E0 8013AFD8 5400B1AF */  sw         $s1, 0x54($sp)
    /* 13E4 8013AFDC AFF2040C */  jal        __6Dialog_8013cabc
    /* 13E8 8013AFE0 5000B0AF */   sw        $s0, 0x50($sp)
    /* 13EC 8013AFE4 F80B838F */  lw         $v1, %gp_rel(FePlayerNo)($gp)
    /* 13F0 8013AFE8 C00B8297 */  lhu        $v0, %gp_rel(D_8011B340)($gp)
endlabel FeDrawChrClass__Fv
