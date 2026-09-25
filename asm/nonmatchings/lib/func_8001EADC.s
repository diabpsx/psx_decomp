.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001EADC, 0x18

glabel func_8001EADC
    /* EADC 8001EADC 1280033C */  lui        $v1, %hi(D_8011C964)
    /* EAE0 8001EAE0 64C9638C */  lw         $v1, %lo(D_8011C964)($v1)
    /* EAE4 8001EAE4 1280013C */  lui        $at, %hi(D_8011C964)
    /* EAE8 8001EAE8 64C924AC */  sw         $a0, %lo(D_8011C964)($at)
    /* EAEC 8001EAEC 0800E003 */  jr         $ra
    /* EAF0 8001EAF0 21106000 */   addu      $v0, $v1, $zero
endlabel func_8001EADC
