.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching seekstream, 0x38

glabel seekstream
    /* 1D5E4 8002D5E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D5E8 8002D5E8 2138A000 */  addu       $a3, $a1, $zero
    /* 1D5EC 8002D5EC 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D5F0 8002D5F0 1280053C */  lui        $a1, %hi(D_8011C500)
    /* 1D5F4 8002D5F4 00C5A524 */  addiu      $a1, $a1, %lo(D_8011C500)
    /* 1D5F8 8002D5F8 02000624 */  addiu      $a2, $zero, 0x2
    /* 1D5FC 8002D5FC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D600 8002D600 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1D604 8002D604 5EB4000C */  jal        streamcommanda
    /* 1D608 8002D608 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1D60C 8002D60C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D610 8002D610 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D614 8002D614 0800E003 */  jr         $ra
    /* 1D618 8002D618 00000000 */   nop
endlabel seekstream
