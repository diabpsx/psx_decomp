.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDownButton__7GamePadiPFi_v, 0x44

glabel SetDownButton__7GamePadiPFi_v
    /* 68638 80078638 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6863C 8007863C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 68640 80078640 21808000 */  addu       $s0, $a0, $zero
    /* 68644 80078644 1400B1AF */  sw         $s1, 0x14($sp)
    /* 68648 80078648 2188C000 */  addu       $s1, $a2, $zero
    /* 6864C 8007864C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 68650 80078650 CA71020C */  jal        get_key_pad__Fi
    /* 68654 80078654 2120A000 */   addu      $a0, $a1, $zero
    /* 68658 80078658 80100200 */  sll        $v0, $v0, 2
    /* 6865C 8007865C 21105000 */  addu       $v0, $v0, $s0
    /* 68660 80078660 600051AC */  sw         $s1, 0x60($v0)
    /* 68664 80078664 1800BF8F */  lw         $ra, 0x18($sp)
    /* 68668 80078668 1400B18F */  lw         $s1, 0x14($sp)
    /* 6866C 8007866C 1000B08F */  lw         $s0, 0x10($sp)
    /* 68670 80078670 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 68674 80078674 0800E003 */  jr         $ra
    /* 68678 80078678 00000000 */   nop
endlabel SetDownButton__7GamePadiPFi_v
