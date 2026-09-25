.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getcycle, 0x2C

glabel getcycle
    /* 1FBAC 8002FBAC 801F023C */  lui        $v0, (0x1F801110 >> 16)
    /* 1FBB0 8002FBB0 10114284 */  lh         $v0, (0x1F801110 & 0xFFFF)($v0)
    /* 1FBB4 8002FBB4 801F033C */  lui        $v1, (0x1F801070 >> 16)
    /* 1FBB8 8002FBB8 7010638C */  lw         $v1, (0x1F801070 & 0xFFFF)($v1)
    /* 1FBBC 8002FBBC 1280013C */  lui        $at, %hi(getcycleticks + 0x1)
    /* 1FBC0 8002FBC0 A1CA2288 */  lwl        $v0, %lo(getcycleticks + 0x1)($at)
    /* 1FBC4 8002FBC4 20006330 */  andi       $v1, $v1, 0x20
    /* 1FBC8 8002FBC8 C01A0300 */  sll        $v1, $v1, 11
    /* 1FBCC 8002FBCC 21104300 */  addu       $v0, $v0, $v1
    /* 1FBD0 8002FBD0 0800E003 */  jr         $ra
    /* 1FBD4 8002FBD4 00000000 */   nop
endlabel getcycle
