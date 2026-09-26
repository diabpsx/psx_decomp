.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitLoadMemcardSelect__Fv, 0x80

glabel FeInitLoadMemcardSelect__Fv
    /* 1FF8 8013BBF0 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 1FFC 8013BBF4 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 2000 8013BBF8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2004 8013BBFC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2008 8013BC00 1280013C */  lui        $at, %hi(fileinfoflag)
    /* 200C 8013BC04 28B420AC */  sw         $zero, %lo(fileinfoflag)($at)
    /* 2010 8013BC08 05004014 */  bnez       $v0, .L8013BC20
    /* 2014 8013BC0C 01000224 */   addiu     $v0, $zero, 0x1
    /* 2018 8013BC10 05000224 */  addiu      $v0, $zero, 0x5
    /* 201C 8013BC14 1280013C */  lui        $at, %hi(cardondelay)
    /* 2020 8013BC18 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 2024 8013BC1C 01000224 */  addiu      $v0, $zero, 0x1
  .L8013BC20:
    /* 2028 8013BC20 1280013C */  lui        $at, %hi(card_active + 0x4)
    /* 202C 8013BC24 04B222AC */  sw         $v0, %lo(card_active + 0x4)($at)
    /* 2030 8013BC28 1280013C */  lui        $at, %hi(card_active)
    /* 2034 8013BC2C 00B222AC */  sw         $v0, %lo(card_active)($at)
    /* 2038 8013BC30 08000224 */  addiu      $v0, $zero, 0x8
    /* 203C 8013BC34 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 2040 8013BC38 20000224 */  addiu      $v0, $zero, 0x20
    /* 2044 8013BC3C E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 2048 8013BC40 40010224 */  addiu      $v0, $zero, 0x140
    /* 204C 8013BC44 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 2050 8013BC48 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 2054 8013BC4C 0D80043C */  lui        $a0, %hi(FeMemcardMenuTable)
    /* 2058 8013BC50 68D98424 */  addiu      $a0, $a0, %lo(FeMemcardMenuTable)
    /* 205C 8013BC54 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 2060 8013BC58 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 2064 8013BC5C 03000524 */   addiu     $a1, $zero, 0x3
    /* 2068 8013BC60 1000BF8F */  lw         $ra, 0x10($sp)
    /* 206C 8013BC64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2070 8013BC68 0800E003 */  jr         $ra
    /* 2074 8013BC6C 00000000 */   nop
endlabel FeInitLoadMemcardSelect__Fv
