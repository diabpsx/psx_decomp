.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_ACTIVATEPORTAL__FPC4TCmdi, 0x44

glabel On_ACTIVATEPORTAL__FPC4TCmdi
    /* 4216C 8005216C 21108000 */  addu       $v0, $a0, $zero
    /* 42170 80052170 06004394 */  lhu        $v1, 0x6($v0)
    /* 42174 80052174 08004490 */  lbu        $a0, 0x8($v0)
    /* 42178 80052178 02004690 */  lbu        $a2, 0x2($v0)
    /* 4217C 8005217C 04004794 */  lhu        $a3, 0x4($v0)
    /* 42180 80052180 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 42184 80052184 1000A3AF */  sw         $v1, 0x10($sp)
    /* 42188 80052188 01004390 */  lbu        $v1, 0x1($v0)
    /* 4218C 8005218C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 42190 80052190 1400A4AF */  sw         $a0, 0x14($sp)
    /* 42194 80052194 2120A000 */  addu       $a0, $a1, $zero
    /* 42198 80052198 4F04020C */  jal        ActivatePortal__FiiiiiUc
    /* 4219C 8005219C 21286000 */   addu      $a1, $v1, $zero
    /* 421A0 800521A0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 421A4 800521A4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 421A8 800521A8 0800E003 */  jr         $ra
    /* 421AC 800521AC 00000000 */   nop
endlabel On_ACTIVATEPORTAL__FPC4TCmdi
