.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXinit, 0x30

glabel DDXinit
    /* 1336C 8002336C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 13370 80023370 1000BFAF */  sw         $ra, 0x10($sp)
    /* 13374 80023374 9B8C000C */  jal        SwapByte
    /* 13378 80023378 FE000434 */   ori       $a0, $zero, 0xFE
    /* 1337C 8002337C 9B8C000C */  jal        SwapByte
    /* 13380 80023380 69000434 */   ori       $a0, $zero, 0x69
    /* 13384 80023384 C28C000C */  jal        GetLong
    /* 13388 80023388 00000000 */   nop
    /* 1338C 8002338C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13390 80023390 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13394 80023394 0800E003 */  jr         $ra
    /* 13398 80023398 00000000 */   nop
endlabel DDXinit
