.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdPItem__FUcUcUcUc, 0x11C

glabel NetSendCmdPItem__FUcUcUcUc
    /* 3FBD8 8004FBD8 1280033C */  lui        $v1, %hi(myplr)
    /* 3FBDC 8004FBDC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 3FBE0 8004FBE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3FBE4 8004FBE4 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3FBE8 8004FBE8 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3FBEC 8004FBEC 1100A6A3 */  sb         $a2, 0x11($sp)
    /* 3FBF0 8004FBF0 1200A7A3 */  sb         $a3, 0x12($sp)
    /* 3FBF4 8004FBF4 40100300 */  sll        $v0, $v1, 1
    /* 3FBF8 8004FBF8 21104300 */  addu       $v0, $v0, $v1
    /* 3FBFC 8004FBFC 80100200 */  sll        $v0, $v0, 2
    /* 3FC00 8004FC00 21104300 */  addu       $v0, $v0, $v1
    /* 3FC04 8004FC04 00110200 */  sll        $v0, $v0, 4
    /* 3FC08 8004FC08 23104300 */  subu       $v0, $v0, $v1
    /* 3FC0C 8004FC0C 80100200 */  sll        $v0, $v0, 2
    /* 3FC10 8004FC10 21104300 */  addu       $v0, $v0, $v1
    /* 3FC14 8004FC14 C0100200 */  sll        $v0, $v0, 3
    /* 3FC18 8004FC18 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 3FC1C 8004FC1C 21082200 */  addu       $at, $at, $v0
    /* 3FC20 8004FC20 76BE2394 */  lhu        $v1, %lo(plr + 0x193E)($at)
    /* 3FC24 8004FC24 00000000 */  nop
    /* 3FC28 8004FC28 1A00A3A7 */  sh         $v1, 0x1A($sp)
    /* 3FC2C 8004FC2C 0E80013C */  lui        $at, %hi(plr + 0x1934)
    /* 3FC30 8004FC30 21082200 */  addu       $at, $at, $v0
    /* 3FC34 8004FC34 6CBE2394 */  lhu        $v1, %lo(plr + 0x1934)($at)
    /* 3FC38 8004FC38 00000000 */  nop
    /* 3FC3C 8004FC3C 1C00A3A7 */  sh         $v1, 0x1C($sp)
    /* 3FC40 8004FC40 0E80013C */  lui        $at, %hi(plr + 0x1920)
    /* 3FC44 8004FC44 21082200 */  addu       $at, $at, $v0
    /* 3FC48 8004FC48 58BE238C */  lw         $v1, %lo(plr + 0x1920)($at)
    /* 3FC4C 8004FC4C 00000000 */  nop
    /* 3FC50 8004FC50 2000A3AF */  sw         $v1, 0x20($sp)
    /* 3FC54 8004FC54 0E80013C */  lui        $at, %hi(plr + 0x1979)
    /* 3FC58 8004FC58 21082200 */  addu       $at, $at, $v0
    /* 3FC5C 8004FC5C B1BE2390 */  lbu        $v1, %lo(plr + 0x1979)($at)
    /* 3FC60 8004FC60 00000000 */  nop
    /* 3FC64 8004FC64 1300A3A3 */  sb         $v1, 0x13($sp)
    /* 3FC68 8004FC68 0E80013C */  lui        $at, %hi(plr + 0x194E)
    /* 3FC6C 8004FC6C 21082200 */  addu       $at, $at, $v0
    /* 3FC70 8004FC70 86BE2394 */  lhu        $v1, %lo(plr + 0x194E)($at)
    /* 3FC74 8004FC74 00000000 */  nop
    /* 3FC78 8004FC78 1400A3A3 */  sb         $v1, 0x14($sp)
    /* 3FC7C 8004FC7C 0E80013C */  lui        $at, %hi(plr + 0x1950)
    /* 3FC80 8004FC80 21082200 */  addu       $at, $at, $v0
    /* 3FC84 8004FC84 88BE2394 */  lhu        $v1, %lo(plr + 0x1950)($at)
    /* 3FC88 8004FC88 00000000 */  nop
    /* 3FC8C 8004FC8C 1500A3A3 */  sb         $v1, 0x15($sp)
    /* 3FC90 8004FC90 0E80013C */  lui        $at, %hi(plr + 0x1959)
    /* 3FC94 8004FC94 21082200 */  addu       $at, $at, $v0
    /* 3FC98 8004FC98 91BE2390 */  lbu        $v1, %lo(plr + 0x1959)($at)
    /* 3FC9C 8004FC9C 00000000 */  nop
    /* 3FCA0 8004FCA0 1600A3A3 */  sb         $v1, 0x16($sp)
    /* 3FCA4 8004FCA4 0E80013C */  lui        $at, %hi(plr + 0x195B)
    /* 3FCA8 8004FCA8 21082200 */  addu       $at, $at, $v0
    /* 3FCAC 8004FCAC 93BE2390 */  lbu        $v1, %lo(plr + 0x195B)($at)
    /* 3FCB0 8004FCB0 00000000 */  nop
    /* 3FCB4 8004FCB4 1700A3A3 */  sb         $v1, 0x17($sp)
    /* 3FCB8 8004FCB8 0E80013C */  lui        $at, %hi(plr + 0x1924)
    /* 3FCBC 8004FCBC 21082200 */  addu       $at, $at, $v0
    /* 3FCC0 8004FCC0 5CBE238C */  lw         $v1, %lo(plr + 0x1924)($at)
    /* 3FCC4 8004FCC4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3FCC8 8004FCC8 1800A3A7 */  sh         $v1, 0x18($sp)
    /* 3FCCC 8004FCCC 0E80013C */  lui        $at, %hi(plr + 0x1975)
    /* 3FCD0 8004FCD0 21082200 */  addu       $at, $at, $v0
    /* 3FCD4 8004FCD4 ADBE2280 */  lb         $v0, %lo(plr + 0x1975)($at)
    /* 3FCD8 8004FCD8 18000524 */  addiu      $a1, $zero, 0x18
    /* 3FCDC 8004FCDC E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FCE0 8004FCE0 2400A2AF */   sw        $v0, 0x24($sp)
    /* 3FCE4 8004FCE4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3FCE8 8004FCE8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3FCEC 8004FCEC 0800E003 */  jr         $ra
    /* 3FCF0 8004FCF0 00000000 */   nop
endlabel NetSendCmdPItem__FUcUcUcUc
