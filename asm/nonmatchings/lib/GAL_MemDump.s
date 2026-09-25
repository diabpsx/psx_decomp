.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_MemDump, 0x74

glabel GAL_MemDump
    /* 12F84 80022F84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12F88 80022F88 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 12F8C 80022F8C FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 12F90 80022F90 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12F94 80022F94 24808200 */  and        $s0, $a0, $v0
    /* 12F98 80022F98 1400BFAF */  sw         $ra, 0x14($sp)
    /* 12F9C 80022F9C 4286000C */  jal        GAL_GetFreeMem
    /* 12FA0 80022FA0 21200002 */   addu      $a0, $s0, $zero
    /* 12FA4 80022FA4 1180043C */  lui        $a0, %hi(D_8010E910)
    /* 12FA8 80022FA8 10E98424 */  addiu      $a0, $a0, %lo(D_8010E910)
    /* 12FAC 80022FAC 9B83000C */  jal        DBG_SendMessage
    /* 12FB0 80022FB0 21284000 */   addu      $a1, $v0, $zero
    /* 12FB4 80022FB4 4286000C */  jal        GAL_GetFreeMem
    /* 12FB8 80022FB8 21200002 */   addu      $a0, $s0, $zero
    /* 12FBC 80022FBC 1180043C */  lui        $a0, %hi(D_8010E920)
    /* 12FC0 80022FC0 20E98424 */  addiu      $a0, $a0, %lo(D_8010E920)
    /* 12FC4 80022FC4 9B83000C */  jal        DBG_SendMessage
    /* 12FC8 80022FC8 21284000 */   addu      $a1, $v0, $zero
    /* 12FCC 80022FCC 1280053C */  lui        $a1, %hi(D_8011C9E0)
    /* 12FD0 80022FD0 E0C9A58C */  lw         $a1, %lo(D_8011C9E0)($a1)
    /* 12FD4 80022FD4 1180043C */  lui        $a0, %hi(D_8010E934)
    /* 12FD8 80022FD8 34E98424 */  addiu      $a0, $a0, %lo(D_8010E934)
    /* 12FDC 80022FDC 9B83000C */  jal        DBG_SendMessage
    /* 12FE0 80022FE0 00000000 */   nop
    /* 12FE4 80022FE4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12FE8 80022FE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 12FEC 80022FEC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12FF0 80022FF0 0800E003 */  jr         $ra
    /* 12FF4 80022FF4 00000000 */   nop
endlabel GAL_MemDump
