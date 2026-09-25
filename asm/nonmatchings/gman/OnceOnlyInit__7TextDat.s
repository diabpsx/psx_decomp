.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OnceOnlyInit__7TextDat, 0x20

glabel OnceOnlyInit__7TextDat
    /* 81E88 80091E88 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 81E8C 80091E8C 500082AC */  sw         $v0, 0x50($a0)
    /* 81E90 80091E90 540082AC */  sw         $v0, 0x54($a0)
    /* 81E94 80091E94 580082AC */  sw         $v0, 0x58($a0)
    /* 81E98 80091E98 5C0082AC */  sw         $v0, 0x5C($a0)
    /* 81E9C 80091E9C 01000224 */  addiu      $v0, $zero, 0x1
    /* 81EA0 80091EA0 0800E003 */  jr         $ra
    /* 81EA4 80091EA4 000082AC */   sw        $v0, 0x0($a0)
endlabel OnceOnlyInit__7TextDat
