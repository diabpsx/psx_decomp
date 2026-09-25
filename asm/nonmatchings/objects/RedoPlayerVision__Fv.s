.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RedoPlayerVision__Fv, 0xA4

glabel RedoPlayerVision__Fv
    /* 45C20 80055C20 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 45C24 80055C24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 45C28 80055C28 21880000 */  addu       $s1, $zero, $zero
    /* 45C2C 80055C2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 45C30 80055C30 21800000 */  addu       $s0, $zero, $zero
    /* 45C34 80055C34 1800BFAF */  sw         $ra, 0x18($sp)
  .L80055C38:
    /* 45C38 80055C38 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 45C3C 80055C3C 21083000 */  addu       $at, $at, $s0
    /* 45C40 80055C40 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 45C44 80055C44 00000000 */  nop
    /* 45C48 80055C48 14004010 */  beqz       $v0, .L80055C9C
    /* 45C4C 80055C4C 00000000 */   nop
    /* 45C50 80055C50 1280033C */  lui        $v1, %hi(currlevel)
    /* 45C54 80055C54 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 45C58 80055C58 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 45C5C 80055C5C 21083000 */  addu       $at, $at, $s0
    /* 45C60 80055C60 5CA5228C */  lw         $v0, %lo(plr + 0x24)($at)
    /* 45C64 80055C64 00000000 */  nop
    /* 45C68 80055C68 0C006214 */  bne        $v1, $v0, .L80055C9C
    /* 45C6C 80055C6C 00000000 */   nop
    /* 45C70 80055C70 0E80013C */  lui        $at, %hi(plr + 0x5C)
    /* 45C74 80055C74 21083000 */  addu       $at, $at, $s0
    /* 45C78 80055C78 94A52480 */  lb         $a0, %lo(plr + 0x5C)($at)
    /* 45C7C 80055C7C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 45C80 80055C80 21083000 */  addu       $at, $at, $s0
    /* 45C84 80055C84 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* 45C88 80055C88 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 45C8C 80055C8C 21083000 */  addu       $at, $at, $s0
    /* 45C90 80055C90 6AA52684 */  lh         $a2, %lo(plr + 0x32)($at)
    /* 45C94 80055C94 B435010C */  jal        ChangeVisionXY__Fiii
    /* 45C98 80055C98 00000000 */   nop
  .L80055C9C:
    /* 45C9C 80055C9C 01003126 */  addiu      $s1, $s1, 0x1
    /* 45CA0 80055CA0 0200222A */  slti       $v0, $s1, 0x2
    /* 45CA4 80055CA4 E4FF4014 */  bnez       $v0, .L80055C38
    /* 45CA8 80055CA8 E8191026 */   addiu     $s0, $s0, 0x19E8
    /* 45CAC 80055CAC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 45CB0 80055CB0 1400B18F */  lw         $s1, 0x14($sp)
    /* 45CB4 80055CB4 1000B08F */  lw         $s0, 0x10($sp)
    /* 45CB8 80055CB8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 45CBC 80055CBC 0800E003 */  jr         $ra
    /* 45CC0 80055CC0 00000000 */   nop
endlabel RedoPlayerVision__Fv
