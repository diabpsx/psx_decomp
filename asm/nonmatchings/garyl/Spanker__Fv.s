.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Spanker__Fv, 0x54

glabel Spanker__Fv
    /* 745E0 800845E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 745E4 800845E4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 745E8 800845E8 5F86000C */  jal        GAL_GetUsedMem
    /* 745EC 800845EC 01000424 */   addiu     $a0, $zero, 0x1
    /* 745F0 800845F0 4286000C */  jal        GAL_GetFreeMem
    /* 745F4 800845F4 01000424 */   addiu     $a0, $zero, 0x1
    /* 745F8 800845F8 7C0380AF */  sw         $zero, %gp_rel(LastAddr)($gp)
    /* 745FC 800845FC 7C86000C */  jal        GAL_LargestFreeBlock
    /* 74600 80084600 01000424 */   addiu     $a0, $zero, 0x1
    /* 74604 80084604 468C000C */  jal        GAL_SortUsedRegionsByAddress
    /* 74608 80084608 01000424 */   addiu     $a0, $zero, 0x1
    /* 7460C 8008460C 0880053C */  lui        $a1, %hi(MemCb__FlPvUlPCcii)
    /* 74610 80084610 BC45A524 */  addiu      $a1, $a1, %lo(MemCb__FlPvUlPCcii)
    /* 74614 80084614 7588000C */  jal        GAL_IterateUsedMem
    /* 74618 80084618 01000424 */   addiu     $a0, $zero, 0x1
    /* 7461C 8008461C 9983000C */  jal        DBG_Halt
    /* 74620 80084620 00000000 */   nop
    /* 74624 80084624 1000BF8F */  lw         $ra, 0x10($sp)
    /* 74628 80084628 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7462C 8008462C 0800E003 */  jr         $ra
    /* 74630 80084630 00000000 */   nop
endlabel Spanker__Fv
