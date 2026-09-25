.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitData__7TextDat, 0x30

glabel InitData__7TextDat
    /* 83A54 80093A54 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 83A58 80093A58 6C0082AC */  sw         $v0, 0x6C($a0)
    /* 83A5C 80093A5C 100082AC */  sw         $v0, 0x10($a0)
    /* 83A60 80093A60 140082AC */  sw         $v0, 0x14($a0)
    /* 83A64 80093A64 180082AC */  sw         $v0, 0x18($a0)
    /* 83A68 80093A68 1C0082AC */  sw         $v0, 0x1C($a0)
    /* 83A6C 80093A6C 4C0082AC */  sw         $v0, 0x4C($a0)
    /* 83A70 80093A70 200082AC */  sw         $v0, 0x20($a0)
    /* 83A74 80093A74 0C0080AC */  sw         $zero, 0xC($a0)
    /* 83A78 80093A78 440080AC */  sw         $zero, 0x44($a0)
    /* 83A7C 80093A7C 0800E003 */  jr         $ra
    /* 83A80 80093A80 400080AC */   sw        $zero, 0x40($a0)
endlabel InitData__7TextDat
