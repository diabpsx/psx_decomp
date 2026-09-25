.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VSyncCallback, 0x34

glabel VSyncCallback
    /* 230C 8001230C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2310 80012310 0B80023C */  lui        $v0, %hi(D_800B53CC)
    /* 2314 80012314 CC53428C */  lw         $v0, %lo(D_800B53CC)($v0)
    /* 2318 80012318 21288000 */  addu       $a1, $a0, $zero
    /* 231C 8001231C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2320 80012320 1400428C */  lw         $v0, 0x14($v0)
    /* 2324 80012324 00000000 */  nop
    /* 2328 80012328 09F84000 */  jalr       $v0
    /* 232C 8001232C 04000424 */   addiu     $a0, $zero, 0x4
    /* 2330 80012330 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2334 80012334 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2338 80012338 0800E003 */  jr         $ra
    /* 233C 8001233C 00000000 */   nop
endlabel VSyncCallback
