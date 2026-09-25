.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearPanel__Fv, 0x30

glabel ClearPanel__Fv
    /* 21F20 80031F20 1280033C */  lui        $v1, %hi(sel_data)
    /* 21F24 80031F24 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 21F28 80031F28 00000000 */  nop
    /* 21F2C 80031F2C 80100300 */  sll        $v0, $v1, 2
    /* 21F30 80031F30 1280013C */  lui        $at, %hi(D_8011C764)
    /* 21F34 80031F34 21082200 */  addu       $at, $at, $v0
    /* 21F38 80031F38 64C720AC */  sw         $zero, %lo(D_8011C764)($at)
    /* 21F3C 80031F3C 1280013C */  lui        $at, %hi(_pinfoflag)
    /* 21F40 80031F40 21082300 */  addu       $at, $at, $v1
    /* 21F44 80031F44 B8B620A0 */  sb         $zero, %lo(_pinfoflag)($at)
    /* 21F48 80031F48 0800E003 */  jr         $ra
    /* 21F4C 80031F4C 00000000 */   nop
endlabel ClearPanel__Fv
