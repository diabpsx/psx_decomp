.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_MakeTaskImmortal, 0x14

glabel TSK_MakeTaskImmortal
    /* 1090C 8002090C 1000828C */  lw         $v0, 0x10($a0)
    /* 10910 80020910 FBFF0324 */  addiu      $v1, $zero, -0x5
    /* 10914 80020914 24104300 */  and        $v0, $v0, $v1
    /* 10918 80020918 0800E003 */  jr         $ra
    /* 1091C 8002091C 100082AC */   sw        $v0, 0x10($a0)
endlabel TSK_MakeTaskImmortal
