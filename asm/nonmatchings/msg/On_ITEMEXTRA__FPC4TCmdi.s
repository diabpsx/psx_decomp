.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_ITEMEXTRA__FPC4TCmdi, 0x4C

glabel On_ITEMEXTRA__FPC4TCmdi
    /* 4084C 8005084C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40850 80050850 1800B0AF */  sw         $s0, 0x18($sp)
    /* 40854 80050854 21808000 */  addu       $s0, $a0, $zero
    /* 40858 80050858 04000592 */  lbu        $a1, 0x4($s0)
    /* 4085C 8005085C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 40860 80050860 E63B010C */  jal        delta_get_item__FPC9TCmdGItemUc
    /* 40864 80050864 00000000 */   nop
    /* 40868 80050868 1400028E */  lw         $v0, 0x14($s0)
    /* 4086C 8005086C 05000492 */  lbu        $a0, 0x5($s0)
    /* 40870 80050870 06000592 */  lbu        $a1, 0x6($s0)
    /* 40874 80050874 0E000696 */  lhu        $a2, 0xE($s0)
    /* 40878 80050878 10000796 */  lhu        $a3, 0x10($s0)
    /* 4087C 8005087C AE7B050C */  jal        func_8015EEB8
    /* 40880 80050880 1000A2AF */   sw        $v0, 0x10($sp)
    /* 40884 80050884 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 40888 80050888 1800B08F */  lw         $s0, 0x18($sp)
    /* 4088C 8005088C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40890 80050890 0800E003 */  jr         $ra
    /* 40894 80050894 00000000 */   nop
endlabel On_ITEMEXTRA__FPC4TCmdi
