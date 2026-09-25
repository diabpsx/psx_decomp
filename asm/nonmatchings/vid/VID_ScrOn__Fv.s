.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_ScrOn__Fv, 0x3C

glabel VID_ScrOn__Fv
    /* 74058 80084058 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7405C 8008405C 01000224 */  addiu      $v0, $zero, 0x1
    /* 74060 80084060 1000BFAF */  sw         $ra, 0x10($sp)
    /* 74064 80084064 1280013C */  lui        $at, %hi(D_8011CAF8)
    /* 74068 80084068 F8CA22A0 */  sb         $v0, %lo(D_8011CAF8)($at)
    /* 7406C 8008406C 1280013C */  lui        $at, %hi(D_8011CB68)
    /* 74070 80084070 68CB22A0 */  sb         $v0, %lo(D_8011CB68)($at)
    /* 74074 80084074 1748000C */  jal        VSync
    /* 74078 80084078 21200000 */   addu      $a0, $zero, $zero
    /* 7407C 8008407C 784E000C */  jal        SetDispMask
    /* 74080 80084080 01000424 */   addiu     $a0, $zero, 0x1
    /* 74084 80084084 1000BF8F */  lw         $ra, 0x10($sp)
    /* 74088 80084088 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7408C 8008408C 0800E003 */  jr         $ra
    /* 74090 80084090 00000000 */   nop
endlabel VID_ScrOn__Fv
