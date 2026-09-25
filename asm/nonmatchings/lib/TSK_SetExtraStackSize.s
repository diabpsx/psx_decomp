.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetExtraStackSize, 0x28

glabel TSK_SetExtraStackSize
    /* 10B5C 80020B5C 1280023C */  lui        $v0, %hi(D_8011C9C8)
    /* 10B60 80020B60 C8C9428C */  lw         $v0, %lo(D_8011C9C8)($v0)
    /* 10B64 80020B64 02008104 */  bgez       $a0, .L80020B70
    /* 10B68 80020B68 80180200 */   sll       $v1, $v0, 2
    /* 10B6C 80020B6C 03008424 */  addiu      $a0, $a0, 0x3
  .L80020B70:
    /* 10B70 80020B70 83100400 */  sra        $v0, $a0, 2
    /* 10B74 80020B74 1280013C */  lui        $at, %hi(D_8011C9C8)
    /* 10B78 80020B78 C8C922AC */  sw         $v0, %lo(D_8011C9C8)($at)
    /* 10B7C 80020B7C 0800E003 */  jr         $ra
    /* 10B80 80020B80 21106000 */   addu      $v0, $v1, $zero
endlabel TSK_SetExtraStackSize
