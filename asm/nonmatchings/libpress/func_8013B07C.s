.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013B07C, 0x8C

glabel func_8013B07C
    /* 1484 8013B07C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1488 8013B080 1400B1AF */  sw         $s1, 0x14($sp)
    /* 148C 8013B084 21888000 */  addu       $s1, $a0, $zero
    /* 1490 8013B088 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1494 8013B08C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1498 8013B090 67EC040C */  jal        func_8013B19C
    /* 149C 8013B094 2180A000 */   addu      $s0, $a1, $zero
    /* 14A0 8013B098 1480033C */  lui        $v1, %hi(D_80139DF4)
    /* 14A4 8013B09C F49D638C */  lw         $v1, %lo(D_80139DF4)($v1)
    /* 14A8 8013B0A0 00000000 */  nop
    /* 14AC 8013B0A4 0000628C */  lw         $v0, 0x0($v1)
    /* 14B0 8013B0A8 42811000 */  srl        $s0, $s0, 5
    /* 14B4 8013B0AC 88004234 */  ori        $v0, $v0, 0x88
    /* 14B8 8013B0B0 000062AC */  sw         $v0, 0x0($v1)
    /* 14BC 8013B0B4 1480023C */  lui        $v0, %hi(D_80139DD0)
    /* 14C0 8013B0B8 D09D428C */  lw         $v0, %lo(D_80139DD0)($v0)
    /* 14C4 8013B0BC 00841000 */  sll        $s0, $s0, 16
    /* 14C8 8013B0C0 000040AC */  sw         $zero, 0x0($v0)
    /* 14CC 8013B0C4 1480023C */  lui        $v0, %hi(D_80139DC8)
    /* 14D0 8013B0C8 C89D428C */  lw         $v0, %lo(D_80139DC8)($v0)
    /* 14D4 8013B0CC 20001036 */  ori        $s0, $s0, 0x20
    /* 14D8 8013B0D0 000051AC */  sw         $s1, 0x0($v0)
    /* 14DC 8013B0D4 1480023C */  lui        $v0, %hi(D_80139DCC)
    /* 14E0 8013B0D8 CC9D428C */  lw         $v0, %lo(D_80139DCC)($v0)
    /* 14E4 8013B0DC 0001033C */  lui        $v1, (0x1000200 >> 16)
    /* 14E8 8013B0E0 000050AC */  sw         $s0, 0x0($v0)
    /* 14EC 8013B0E4 1480023C */  lui        $v0, %hi(D_80139DD0)
    /* 14F0 8013B0E8 D09D428C */  lw         $v0, %lo(D_80139DD0)($v0)
    /* 14F4 8013B0EC 00026334 */  ori        $v1, $v1, (0x1000200 & 0xFFFF)
    /* 14F8 8013B0F0 000043AC */  sw         $v1, 0x0($v0)
    /* 14FC 8013B0F4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1500 8013B0F8 1400B18F */  lw         $s1, 0x14($sp)
    /* 1504 8013B0FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 1508 8013B100 0800E003 */  jr         $ra
    /* 150C 8013B104 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel func_8013B07C
