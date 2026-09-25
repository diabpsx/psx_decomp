.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_Fr_, 0xA8

glabel _spu_Fr_
    /* 6CD8 80016CD8 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 6CDC 80016CDC 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6CE0 80016CE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6CE4 80016CE4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6CE8 80016CE8 21888000 */  addu       $s1, $a0, $zero
    /* 6CEC 80016CEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6CF0 80016CF0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6CF4 80016CF4 A60145A4 */  sh         $a1, 0x1A6($v0)
    /* 6CF8 80016CF8 AD5C000C */  jal        _spu_Fw1ts
    /* 6CFC 80016CFC 2180C000 */   addu      $s0, $a2, $zero
    /* 6D00 80016D00 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 6D04 80016D04 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 6D08 80016D08 00000000 */  nop
    /* 6D0C 80016D0C AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 6D10 80016D10 00000000 */  nop
    /* 6D14 80016D14 30004234 */  ori        $v0, $v0, 0x30
    /* 6D18 80016D18 AA0162A4 */  sh         $v0, 0x1AA($v1)
    /* 6D1C 80016D1C AD5C000C */  jal        _spu_Fw1ts
    /* 6D20 80016D20 00841000 */   sll       $s0, $s0, 16
    /* 6D24 80016D24 A35C000C */  jal        func_8001728C
    /* 6D28 80016D28 00000000 */   nop
    /* 6D2C 80016D2C 0001043C */  lui        $a0, (0x1000200 >> 16)
    /* 6D30 80016D30 00028434 */  ori        $a0, $a0, (0x1000200 & 0xFFFF)
    /* 6D34 80016D34 0B80023C */  lui        $v0, %hi(D_800B5A50)
    /* 6D38 80016D38 505A428C */  lw         $v0, %lo(D_800B5A50)($v0)
    /* 6D3C 80016D3C 00000000 */  nop
    /* 6D40 80016D40 000051AC */  sw         $s1, 0x0($v0)
    /* 6D44 80016D44 0B80023C */  lui        $v0, %hi(D_800B5A54)
    /* 6D48 80016D48 545A428C */  lw         $v0, %lo(D_800B5A54)($v0)
    /* 6D4C 80016D4C 10001036 */  ori        $s0, $s0, 0x10
    /* 6D50 80016D50 000050AC */  sw         $s0, 0x0($v0)
    /* 6D54 80016D54 0B80033C */  lui        $v1, %hi(D_800B5A58)
    /* 6D58 80016D58 585A638C */  lw         $v1, %lo(D_800B5A58)($v1)
    /* 6D5C 80016D5C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6D60 80016D60 0B80013C */  lui        $at, %hi(D_800B5A9C)
    /* 6D64 80016D64 9C5A22AC */  sw         $v0, %lo(D_800B5A9C)($at)
    /* 6D68 80016D68 000064AC */  sw         $a0, 0x0($v1)
    /* 6D6C 80016D6C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6D70 80016D70 1400B18F */  lw         $s1, 0x14($sp)
    /* 6D74 80016D74 1000B08F */  lw         $s0, 0x10($sp)
    /* 6D78 80016D78 0800E003 */  jr         $ra
    /* 6D7C 80016D7C 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel _spu_Fr_
