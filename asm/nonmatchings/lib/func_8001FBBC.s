.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001FBBC, 0x20

glabel func_8001FBBC
    /* FBBC 8001FBBC 1280013C */  lui        $at, %hi(D_8011C94C)
    /* FBC0 8001FBC0 4CC924AC */  sw         $a0, %lo(D_8011C94C)($at)
    /* FBC4 8001FBC4 50C926AC */  sw         $a2, %lo(D_8011C950)($at)
    /* FBC8 8001FBC8 1280013C */  lui        $at, %hi(D_8011C95C)
    /* FBCC 8001FBCC 5CC925AC */  sw         $a1, %lo(D_8011C95C)($at)
    /* FBD0 8001FBD0 60C927AC */  sw         $a3, %lo(D_8011C960)($at)
    /* FBD4 8001FBD4 0800E003 */  jr         $ra
    /* FBD8 8001FBD8 01000224 */   addiu     $v0, $zero, 0x1
endlabel func_8001FBBC
