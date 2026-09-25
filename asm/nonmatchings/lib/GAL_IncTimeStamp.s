.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_IncTimeStamp, 0x20

glabel GAL_IncTimeStamp
    /* 127B0 800227B0 1280023C */  lui        $v0, %hi(D_8011C9D8)
    /* 127B4 800227B4 D8C9428C */  lw         $v0, %lo(D_8011C9D8)($v0)
    /* 127B8 800227B8 00000000 */  nop
    /* 127BC 800227BC 01004224 */  addiu      $v0, $v0, 0x1
    /* 127C0 800227C0 1280013C */  lui        $at, %hi(D_8011C9D8)
    /* 127C4 800227C4 D8C922AC */  sw         $v0, %lo(D_8011C9D8)($at)
    /* 127C8 800227C8 0800E003 */  jr         $ra
    /* 127CC 800227CC 00000000 */   nop
endlabel GAL_IncTimeStamp
