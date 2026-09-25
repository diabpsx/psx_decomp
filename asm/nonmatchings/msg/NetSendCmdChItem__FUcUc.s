.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdChItem__FUcUc, 0xA4

glabel NetSendCmdChItem__FUcUc
    /* 3FCF4 8004FCF4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3FCF8 8004FCF8 1280033C */  lui        $v1, %hi(myplr)
    /* 3FCFC 8004FCFC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 3FD00 8004FD00 30000224 */  addiu      $v0, $zero, 0x30
    /* 3FD04 8004FD04 2000BFAF */  sw         $ra, 0x20($sp)
    /* 3FD08 8004FD08 1000A2A3 */  sb         $v0, 0x10($sp)
    /* 3FD0C 8004FD0C 1100A5A3 */  sb         $a1, 0x11($sp)
    /* 3FD10 8004FD10 40100300 */  sll        $v0, $v1, 1
    /* 3FD14 8004FD14 21104300 */  addu       $v0, $v0, $v1
    /* 3FD18 8004FD18 80100200 */  sll        $v0, $v0, 2
    /* 3FD1C 8004FD1C 21104300 */  addu       $v0, $v0, $v1
    /* 3FD20 8004FD20 00110200 */  sll        $v0, $v0, 4
    /* 3FD24 8004FD24 23104300 */  subu       $v0, $v0, $v1
    /* 3FD28 8004FD28 80100200 */  sll        $v0, $v0, 2
    /* 3FD2C 8004FD2C 21104300 */  addu       $v0, $v0, $v1
    /* 3FD30 8004FD30 C0100200 */  sll        $v0, $v0, 3
    /* 3FD34 8004FD34 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 3FD38 8004FD38 21082200 */  addu       $at, $at, $v0
    /* 3FD3C 8004FD3C 76BE2394 */  lhu        $v1, %lo(plr + 0x193E)($at)
    /* 3FD40 8004FD40 00000000 */  nop
    /* 3FD44 8004FD44 1200A3A7 */  sh         $v1, 0x12($sp)
    /* 3FD48 8004FD48 0E80013C */  lui        $at, %hi(plr + 0x1934)
    /* 3FD4C 8004FD4C 21082200 */  addu       $at, $at, $v0
    /* 3FD50 8004FD50 6CBE2394 */  lhu        $v1, %lo(plr + 0x1934)($at)
    /* 3FD54 8004FD54 00000000 */  nop
    /* 3FD58 8004FD58 1400A3A7 */  sh         $v1, 0x14($sp)
    /* 3FD5C 8004FD5C 0E80013C */  lui        $at, %hi(plr + 0x1920)
    /* 3FD60 8004FD60 21082200 */  addu       $at, $at, $v0
    /* 3FD64 8004FD64 58BE238C */  lw         $v1, %lo(plr + 0x1920)($at)
    /* 3FD68 8004FD68 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3FD6C 8004FD6C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 3FD70 8004FD70 0E80013C */  lui        $at, %hi(plr + 0x1979)
    /* 3FD74 8004FD74 21082200 */  addu       $at, $at, $v0
    /* 3FD78 8004FD78 B1BE2290 */  lbu        $v0, %lo(plr + 0x1979)($at)
    /* 3FD7C 8004FD7C 10000524 */  addiu      $a1, $zero, 0x10
    /* 3FD80 8004FD80 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FD84 8004FD84 1C00A2A3 */   sb        $v0, 0x1C($sp)
    /* 3FD88 8004FD88 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3FD8C 8004FD8C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 3FD90 8004FD90 0800E003 */  jr         $ra
    /* 3FD94 8004FD94 00000000 */   nop
endlabel NetSendCmdChItem__FUcUc
