.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80011CC0, 0x78

glabel func_80011CC0
    /* 1CC0 80011CC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CC4 80011CC4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CC8 80011CC8 6346000C */  jal        EnterCriticalSection
    /* 1CCC 80011CCC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1CD0 80011CD0 01000424 */  addiu      $a0, $zero, 0x1
    /* 1CD4 80011CD4 1380033C */  lui        $v1, %hi(D_8012FF94)
    /* 1CD8 80011CD8 94FF6324 */  addiu      $v1, $v1, %lo(D_8012FF94)
    /* 1CDC 80011CDC FCFF7024 */  addiu      $s0, $v1, -0x4
    /* 1CE0 80011CE0 0180023C */  lui        $v0, %hi(D_80011D70)
    /* 1CE4 80011CE4 701D4224 */  addiu      $v0, $v0, %lo(D_80011D70)
    /* 1CE8 80011CE8 000062AC */  sw         $v0, 0x0($v1)
    /* 1CEC 80011CEC 0180023C */  lui        $v0, %hi(D_80011DD8)
    /* 1CF0 80011CF0 D81D4224 */  addiu      $v0, $v0, %lo(D_80011DD8)
    /* 1CF4 80011CF4 040062AC */  sw         $v0, 0x4($v1)
    /* 1CF8 80011CF8 1380013C */  lui        $at, %hi(D_8012FF90)
    /* 1CFC 80011CFC 90FF20AC */  sw         $zero, %lo(D_8012FF90)($at)
    /* 1D00 80011D00 1380013C */  lui        $at, %hi(D_8012FF9C)
    /* 1D04 80011D04 9CFF20AC */  sw         $zero, %lo(D_8012FF9C)($at)
    /* 1D08 80011D08 9B47000C */  jal        SysDeqIntRP
    /* 1D0C 80011D0C 21280002 */   addu      $a1, $s0, $zero
    /* 1D10 80011D10 01000424 */  addiu      $a0, $zero, 0x1
    /* 1D14 80011D14 9747000C */  jal        SysEnqIntRP
    /* 1D18 80011D18 21280002 */   addu      $a1, $s0, $zero
    /* 1D1C 80011D1C 6746000C */  jal        ExitCriticalSection
    /* 1D20 80011D20 00000000 */   nop
    /* 1D24 80011D24 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D28 80011D28 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D2C 80011D2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D30 80011D30 0800E003 */  jr         $ra
    /* 1D34 80011D34 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel func_80011CC0
