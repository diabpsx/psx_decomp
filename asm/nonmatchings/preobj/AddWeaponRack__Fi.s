.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddWeaponRack__Fi, 0x88

glabel AddWeaponRack__Fi
    /* 1D550 80157148 1280023C */  lui        $v0, %hi(weaponFlag)
    /* 1D554 8015714C 96C14290 */  lbu        $v0, %lo(weaponFlag)($v0)
    /* 1D558 80157150 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D55C 80157154 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D560 80157158 21808000 */  addu       $s0, $a0, $zero
    /* 1D564 8015715C 0D004014 */  bnez       $v0, .L80157194
    /* 1D568 80157160 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1D56C 80157164 40101000 */  sll        $v0, $s0, 1
    /* 1D570 80157168 21105000 */  addu       $v0, $v0, $s0
    /* 1D574 8015716C 80100200 */  sll        $v0, $v0, 2
    /* 1D578 80157170 23105000 */  subu       $v0, $v0, $s0
    /* 1D57C 80157174 80100200 */  sll        $v0, $v0, 2
    /* 1D580 80157178 02000324 */  addiu      $v1, $zero, 0x2
    /* 1D584 8015717C 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 1D588 80157180 21082200 */  addu       $at, $at, $v0
    /* 1D58C 80157184 718C23A0 */  sb         $v1, %lo(object + 0x25)($at)
    /* 1D590 80157188 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 1D594 8015718C 21082200 */  addu       $at, $at, $v0
    /* 1D598 80157190 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
  .L80157194:
    /* 1D59C 80157194 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D5A0 80157198 00000000 */   nop
    /* 1D5A4 8015719C 40181000 */  sll        $v1, $s0, 1
    /* 1D5A8 801571A0 21187000 */  addu       $v1, $v1, $s0
    /* 1D5AC 801571A4 80180300 */  sll        $v1, $v1, 2
    /* 1D5B0 801571A8 23187000 */  subu       $v1, $v1, $s0
    /* 1D5B4 801571AC 80180300 */  sll        $v1, $v1, 2
    /* 1D5B8 801571B0 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D5BC 801571B4 21082300 */  addu       $at, $at, $v1
    /* 1D5C0 801571B8 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D5C4 801571BC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D5C8 801571C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D5CC 801571C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D5D0 801571C8 0800E003 */  jr         $ra
    /* 1D5D4 801571CC 00000000 */   nop
endlabel AddWeaponRack__Fi
