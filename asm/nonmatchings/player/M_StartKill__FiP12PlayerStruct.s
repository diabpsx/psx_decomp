.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartKill__FiP12PlayerStruct, 0x38

glabel M_StartKill__FiP12PlayerStruct
    /* 568E8 800668E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 568EC 800668EC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 568F0 800668F0 21808000 */  addu       $s0, $a0, $zero
    /* 568F4 800668F4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 568F8 800668F8 787F010C */  jal        plrind__FP12PlayerStruct
    /* 568FC 800668FC 2120A000 */   addu      $a0, $a1, $zero
    /* 56900 80066900 21200002 */  addu       $a0, $s0, $zero
    /* 56904 80066904 F630050C */  jal        func_8014C3D8
    /* 56908 80066908 21284000 */   addu      $a1, $v0, $zero
    /* 5690C 8006690C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 56910 80066910 1000B08F */  lw         $s0, 0x10($sp)
    /* 56914 80066914 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56918 80066918 0800E003 */  jr         $ra
    /* 5691C 8006691C 00000000 */   nop
endlabel M_StartKill__FiP12PlayerStruct
