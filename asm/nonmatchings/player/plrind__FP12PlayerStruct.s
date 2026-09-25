.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching plrind__FP12PlayerStruct, 0x14

glabel plrind__FP12PlayerStruct
    /* 4FDE0 8005FDE0 0E80023C */  lui        $v0, %hi(plr)
    /* 4FDE4 8005FDE4 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 4FDE8 8005FDE8 26108200 */  xor        $v0, $a0, $v0
    /* 4FDEC 8005FDEC 0800E003 */  jr         $ra
    /* 4FDF0 8005FDF0 2B100200 */   sltu      $v0, $zero, $v0
endlabel plrind__FP12PlayerStruct
