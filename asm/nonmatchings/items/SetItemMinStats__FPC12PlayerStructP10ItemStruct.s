.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetItemMinStats__FPC12PlayerStructP10ItemStruct, 0x2C

glabel SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 2F728 8003F728 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2F72C 8003F72C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2F730 8003F730 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2F734 8003F734 B7FD000C */  jal        ItemMinStats__FPC12PlayerStructPC10ItemStruct
    /* 2F738 8003F738 2180A000 */   addu      $s0, $a1, $zero
    /* 2F73C 8003F73C 660002A2 */  sb         $v0, 0x66($s0)
    /* 2F740 8003F740 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2F744 8003F744 1000B08F */  lw         $s0, 0x10($sp)
    /* 2F748 8003F748 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2F74C 8003F74C 0800E003 */  jr         $ra
    /* 2F750 8003F750 00000000 */   nop
endlabel SetItemMinStats__FPC12PlayerStructP10ItemStruct
