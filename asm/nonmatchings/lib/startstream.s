.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching startstream, 0x2C

glabel startstream
    /* 1D3DC 8002D3DC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D3E0 8002D3E0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D3E4 8002D3E4 01000624 */  addiu      $a2, $zero, 0x1
    /* 1D3E8 8002D3E8 21380000 */  addu       $a3, $zero, $zero
    /* 1D3EC 8002D3EC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D3F0 8002D3F0 ABB4000C */  jal        purgestreamcommanda
    /* 1D3F4 8002D3F4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1D3F8 8002D3F8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D3FC 8002D3FC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D400 8002D400 0800E003 */  jr         $ra
    /* 1D404 8002D404 00000000 */   nop
endlabel startstream
