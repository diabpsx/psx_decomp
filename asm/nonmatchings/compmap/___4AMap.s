.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___4AMap, 0x48

glabel ___4AMap
    /* 72160 80082160 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72164 80082164 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72168 80082168 21888000 */  addu       $s1, $a0, $zero
    /* 7216C 8008216C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72170 80082170 1800BFAF */  sw         $ra, 0x18($sp)
    /* 72174 80082174 AA06020C */  jal        Init__4AMap
    /* 72178 80082178 2180A000 */   addu      $s0, $a1, $zero
    /* 7217C 8008217C 01001032 */  andi       $s0, $s0, 0x1
    /* 72180 80082180 03000012 */  beqz       $s0, .L80082190
    /* 72184 80082184 00000000 */   nop
    /* 72188 80082188 BE44000C */  jal        __builtin_delete
    /* 7218C 8008218C 21202002 */   addu      $a0, $s1, $zero
  .L80082190:
    /* 72190 80082190 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72194 80082194 1400B18F */  lw         $s1, 0x14($sp)
    /* 72198 80082198 1000B08F */  lw         $s0, 0x10($sp)
    /* 7219C 8008219C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 721A0 800821A0 0800E003 */  jr         $ra
    /* 721A4 800821A4 00000000 */   nop
endlabel ___4AMap
