.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_WALKXY__FPC4TCmdi, 0x80

glabel On_WALKXY__FPC4TCmdi
    /* 3FF74 8004FF74 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3FF78 8004FF78 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3FF7C 8004FF7C 21888000 */  addu       $s1, $a0, $zero
    /* 3FF80 8004FF80 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3FF84 8004FF84 2180A000 */  addu       $s0, $a1, $zero
    /* 3FF88 8004FF88 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3FF8C 8004FF8C 959C010C */  jal        ClrPlrPath__Fi
    /* 3FF90 8004FF90 21200002 */   addu      $a0, $s0, $zero
    /* 3FF94 8004FF94 21200002 */  addu       $a0, $s0, $zero
    /* 3FF98 8004FF98 01002592 */  lbu        $a1, 0x1($s1)
    /* 3FF9C 8004FF9C 02002692 */  lbu        $a2, 0x2($s1)
    /* 3FFA0 8004FFA0 4F9B010C */  jal        MakePlrPath__FiiiUc
    /* 3FFA4 8004FFA4 01000724 */   addiu     $a3, $zero, 0x1
    /* 3FFA8 8004FFA8 40101000 */  sll        $v0, $s0, 1
    /* 3FFAC 8004FFAC 21105000 */  addu       $v0, $v0, $s0
    /* 3FFB0 8004FFB0 80100200 */  sll        $v0, $v0, 2
    /* 3FFB4 8004FFB4 21105000 */  addu       $v0, $v0, $s0
    /* 3FFB8 8004FFB8 00110200 */  sll        $v0, $v0, 4
    /* 3FFBC 8004FFBC 23105000 */  subu       $v0, $v0, $s0
    /* 3FFC0 8004FFC0 80100200 */  sll        $v0, $v0, 2
    /* 3FFC4 8004FFC4 21105000 */  addu       $v0, $v0, $s0
    /* 3FFC8 8004FFC8 C0100200 */  sll        $v0, $v0, 3
    /* 3FFCC 8004FFCC FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 3FFD0 8004FFD0 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 3FFD4 8004FFD4 21082200 */  addu       $at, $at, $v0
    /* 3FFD8 8004FFD8 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 3FFDC 8004FFDC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3FFE0 8004FFE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 3FFE4 8004FFE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 3FFE8 8004FFE8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3FFEC 8004FFEC 0800E003 */  jr         $ra
    /* 3FFF0 8004FFF0 00000000 */   nop
endlabel On_WALKXY__FPC4TCmdi
