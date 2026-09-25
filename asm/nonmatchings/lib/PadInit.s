.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PadInit, 0x4C

glabel PadInit
    /* 1A5C 80011A5C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A60 80011A60 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1A64 80011A64 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A68 80011A68 1380013C */  lui        $at, %hi(PadIdentifier)
    /* 1A6C 80011A6C 205224AC */  sw         $a0, %lo(PadIdentifier)($at)
    /* 1A70 80011A70 1380013C */  lui        $at, %hi(D_8012FF80)
    /* 1A74 80011A74 9F48000C */  jal        ResetCallback
    /* 1A78 80011A78 80FF22AC */   sw        $v0, %lo(D_8012FF80)($at)
    /* 1A7C 80011A7C 0020043C */  lui        $a0, (0x20000001 >> 16)
    /* 1A80 80011A80 1380053C */  lui        $a1, %hi(D_8012FF80)
    /* 1A84 80011A84 80FFA524 */  addiu      $a1, $a1, %lo(D_8012FF80)
    /* 1A88 80011A88 CA46000C */  jal        PAD_init
    /* 1A8C 80011A8C 01008434 */   ori       $a0, $a0, (0x20000001 & 0xFFFF)
    /* 1A90 80011A90 9346000C */  jal        ChangeClearPAD
    /* 1A94 80011A94 21200000 */   addu      $a0, $zero, $zero
    /* 1A98 80011A98 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A9C 80011A9C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1AA0 80011AA0 0800E003 */  jr         $ra
    /* 1AA4 80011AA4 00000000 */   nop
endlabel PadInit
