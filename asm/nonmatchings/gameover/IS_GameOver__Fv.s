.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IS_GameOver__Fv, 0x28

glabel IS_GameOver__Fv
    /* 721DC 800821DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 721E0 800821E0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 721E4 800821E4 21200000 */  addu       $a0, $zero, $zero
    /* 721E8 800821E8 01800534 */  ori        $a1, $zero, 0x8001
    /* 721EC 800821EC B681000C */  jal        TSK_Exist
    /* 721F0 800821F0 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 721F4 800821F4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 721F8 800821F8 2B100200 */  sltu       $v0, $zero, $v0
    /* 721FC 800821FC 0800E003 */  jr         $ra
    /* 72200 80082200 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel IS_GameOver__Fv
