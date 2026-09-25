.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_KNOCKBACK__FPC4TCmdi, 0xBC

glabel On_KNOCKBACK__FPC4TCmdi
    /* 41518 80051518 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4151C 8005151C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41520 80051520 2188A000 */  addu       $s1, $a1, $zero
    /* 41524 80051524 40101100 */  sll        $v0, $s1, 1
    /* 41528 80051528 21105100 */  addu       $v0, $v0, $s1
    /* 4152C 8005152C 80100200 */  sll        $v0, $v0, 2
    /* 41530 80051530 21105100 */  addu       $v0, $v0, $s1
    /* 41534 80051534 00110200 */  sll        $v0, $v0, 4
    /* 41538 80051538 23105100 */  subu       $v0, $v0, $s1
    /* 4153C 8005153C 80100200 */  sll        $v0, $v0, 2
    /* 41540 80051540 21105100 */  addu       $v0, $v0, $s1
    /* 41544 80051544 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41548 80051548 02009094 */  lhu        $s0, 0x2($a0)
    /* 4154C 8005154C C0100200 */  sll        $v0, $v0, 3
    /* 41550 80051550 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41554 80051554 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 41558 80051558 21082200 */  addu       $at, $at, $v0
    /* 4155C 8005155C 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 41560 80051560 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 41564 80051564 21082200 */  addu       $at, $at, $v0
    /* 41568 80051568 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 4156C 8005156C 40101000 */  sll        $v0, $s0, 1
    /* 41570 80051570 21105000 */  addu       $v0, $v0, $s0
    /* 41574 80051574 80100200 */  sll        $v0, $v0, 2
    /* 41578 80051578 21105000 */  addu       $v0, $v0, $s0
    /* 4157C 8005157C C0100200 */  sll        $v0, $v0, 3
    /* 41580 80051580 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 41584 80051584 21082200 */  addu       $at, $at, $v0
    /* 41588 80051588 C8532680 */  lb         $a2, %lo(monster + 0x34)($at)
    /* 4158C 8005158C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 41590 80051590 21082200 */  addu       $at, $at, $v0
    /* 41594 80051594 C9532780 */  lb         $a3, %lo(monster + 0x35)($at)
    /* 41598 80051598 8AF6000C */  jal        GetDirection__Fiiii
    /* 4159C 8005159C 00000000 */   nop
    /* 415A0 800515A0 21200002 */  addu       $a0, $s0, $zero
    /* 415A4 800515A4 2F2C050C */  jal        func_8014B0BC
    /* 415A8 800515A8 21284000 */   addu      $a1, $v0, $zero
    /* 415AC 800515AC 21200002 */  addu       $a0, $s0, $zero
    /* 415B0 800515B0 21282002 */  addu       $a1, $s1, $zero
    /* 415B4 800515B4 B62C050C */  jal        func_8014B2D8
    /* 415B8 800515B8 21300000 */   addu      $a2, $zero, $zero
    /* 415BC 800515BC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 415C0 800515C0 1400B18F */  lw         $s1, 0x14($sp)
    /* 415C4 800515C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 415C8 800515C8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 415CC 800515CC 0800E003 */  jr         $ra
    /* 415D0 800515D0 00000000 */   nop
endlabel On_KNOCKBACK__FPC4TCmdi
