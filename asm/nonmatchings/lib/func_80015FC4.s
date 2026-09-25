.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80015FC4, 0x34

glabel func_80015FC4
    /* 5FC4 80015FC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5FC8 80015FC8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5FCC 80015FCC 1748000C */  jal        VSync
    /* 5FD0 80015FD0 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 5FD4 80015FD4 F0004224 */  addiu      $v0, $v0, 0xF0
    /* 5FD8 80015FD8 0B80013C */  lui        $at, %hi(D_800B55B8)
    /* 5FDC 80015FDC B85522AC */  sw         $v0, %lo(D_800B55B8)($at)
    /* 5FE0 80015FE0 0B80013C */  lui        $at, %hi(D_800B55BC)
    /* 5FE4 80015FE4 BC5520AC */  sw         $zero, %lo(D_800B55BC)($at)
    /* 5FE8 80015FE8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 5FEC 80015FEC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5FF0 80015FF0 0800E003 */  jr         $ra
    /* 5FF4 80015FF4 00000000 */   nop
endlabel func_80015FC4
