.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddUnLight__Fi, 0x24

glabel AddUnLight__Fi
    /* 3D340 8004D340 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3D344 8004D344 05008210 */  beq        $a0, $v0, .L8004D35C
    /* 3D348 8004D348 C0180400 */   sll       $v1, $a0, 3
    /* 3D34C 8004D34C 01000224 */  addiu      $v0, $zero, 0x1
    /* 3D350 8004D350 0D80013C */  lui        $at, %hi(LightList + 0x5)
    /* 3D354 8004D354 21082300 */  addu       $at, $at, $v1
    /* 3D358 8004D358 056322A0 */  sb         $v0, %lo(LightList + 0x5)($at)
  .L8004D35C:
    /* 3D35C 8004D35C 0800E003 */  jr         $ra
    /* 3D360 8004D360 00000000 */   nop
endlabel AddUnLight__Fi
