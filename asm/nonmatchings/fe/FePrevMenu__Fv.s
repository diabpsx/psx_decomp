.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FePrevMenu__Fv, 0x148

glabel FePrevMenu__Fv
    /* 92C 8013A524 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 930 8013A528 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 934 8013A52C 0D80023C */  lui        $v0, %hi(FeNewP2ClassMenu)
    /* 938 8013A530 0CD74224 */  addiu      $v0, $v0, %lo(FeNewP2ClassMenu)
    /* 93C 8013A534 09006214 */  bne        $v1, $v0, .L8013A55C
    /* 940 8013A538 1000BFAF */   sw        $ra, 0x10($sp)
    /* 944 8013A53C A80B828F */  lw         $v0, %gp_rel(LoadedChar)($gp)
    /* 948 8013A540 00000000 */  nop
    /* 94C 8013A544 05004010 */  beqz       $v0, .L8013A55C
    /* 950 8013A548 00000000 */   nop
    /* 954 8013A54C 0D80023C */  lui        $v0, %hi(FeNewP1ClassMenu)
    /* 958 8013A550 D4D64224 */  addiu      $v0, $v0, %lo(FeNewP1ClassMenu)
    /* 95C 8013A554 0D80013C */  lui        $at, %hi(FeNewP2ClassMenu + 0x18)
    /* 960 8013A558 24D722AC */  sw         $v0, %lo(FeNewP2ClassMenu + 0x18)($at)
  .L8013A55C:
    /* 964 8013A55C 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 968 8013A560 0D80023C */  lui        $v0, %hi(FeDifficultyMenu)
    /* 96C 8013A564 44D74224 */  addiu      $v0, $v0, %lo(FeDifficultyMenu)
    /* 970 8013A568 15006214 */  bne        $v1, $v0, .L8013A5C0
    /* 974 8013A56C 00000000 */   nop
    /* 978 8013A570 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 97C 8013A574 00000000 */  nop
    /* 980 8013A578 09004010 */  beqz       $v0, .L8013A5A0
    /* 984 8013A57C 00000000 */   nop
    /* 988 8013A580 AC0B828F */  lw         $v0, %gp_rel(LoadedChar + 0x4)($gp)
    /* 98C 8013A584 00000000 */  nop
    /* 990 8013A588 0D004010 */  beqz       $v0, .L8013A5C0
    /* 994 8013A58C 00000000 */   nop
    /* 998 8013A590 0D80023C */  lui        $v0, %hi(FeNewP2ClassMenu)
    /* 99C 8013A594 0CD74224 */  addiu      $v0, $v0, %lo(FeNewP2ClassMenu)
    /* 9A0 8013A598 6EE90408 */  j          .L8013A5B8
    /* 9A4 8013A59C 00000000 */   nop
  .L8013A5A0:
    /* 9A8 8013A5A0 A80B828F */  lw         $v0, %gp_rel(LoadedChar)($gp)
    /* 9AC 8013A5A4 00000000 */  nop
    /* 9B0 8013A5A8 05004010 */  beqz       $v0, .L8013A5C0
    /* 9B4 8013A5AC 00000000 */   nop
    /* 9B8 8013A5B0 0D80023C */  lui        $v0, %hi(FeNewP1ClassMenu)
    /* 9BC 8013A5B4 D4D64224 */  addiu      $v0, $v0, %lo(FeNewP1ClassMenu)
  .L8013A5B8:
    /* 9C0 8013A5B8 0D80013C */  lui        $at, %hi(FeDifficultyMenu + 0x18)
    /* 9C4 8013A5BC 5CD722AC */  sw         $v0, %lo(FeDifficultyMenu + 0x18)($at)
  .L8013A5C0:
    /* 9C8 8013A5C0 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* 9CC 8013A5C4 0D80023C */  lui        $v0, %hi(FeNewP2ClassMenu)
    /* 9D0 8013A5C8 0CD74224 */  addiu      $v0, $v0, %lo(FeNewP2ClassMenu)
    /* 9D4 8013A5CC 07008214 */  bne        $a0, $v0, .L8013A5EC
    /* 9D8 8013A5D0 00000000 */   nop
    /* 9DC 8013A5D4 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 9E0 8013A5D8 040C838F */  lw         $v1, %gp_rel(FeNoOfPlayers)($gp)
    /* 9E4 8013A5DC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9E8 8013A5E0 01006324 */  addiu      $v1, $v1, 0x1
    /* 9EC 8013A5E4 F80B82AF */  sw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 9F0 8013A5E8 040C83AF */  sw         $v1, %gp_rel(FeNoOfPlayers)($gp)
  .L8013A5EC:
    /* 9F4 8013A5EC 0D80023C */  lui        $v0, %hi(FeMainMenu)
    /* 9F8 8013A5F0 9CD64224 */  addiu      $v0, $v0, %lo(FeMainMenu)
    /* 9FC 8013A5F4 19008210 */  beq        $a0, $v0, .L8013A65C
    /* A00 8013A5F8 00000000 */   nop
    /* A04 8013A5FC 1800828C */  lw         $v0, 0x18($a0)
    /* A08 8013A600 00000000 */  nop
    /* A0C 8013A604 15004010 */  beqz       $v0, .L8013A65C
    /* A10 8013A608 00000000 */   nop
    /* A14 8013A60C 140C82AF */  sw         $v0, %gp_rel(FeCurMenu)($gp)
    /* A18 8013A610 09E7040C */  jal        FeInitBuffer__Fv
    /* A1C 8013A614 00000000 */   nop
    /* A20 8013A618 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* A24 8013A61C 00000000 */  nop
    /* A28 8013A620 0400838C */  lw         $v1, 0x4($a0)
    /* A2C 8013A624 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* A30 8013A628 02006214 */  bne        $v1, $v0, .L8013A634
    /* A34 8013A62C 01000224 */   addiu     $v0, $zero, 0x1
    /* A38 8013A630 040082AC */  sw         $v0, 0x4($a0)
  .L8013A634:
    /* A3C 8013A634 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* A40 8013A638 00000000 */  nop
    /* A44 8013A63C 1000428C */  lw         $v0, 0x10($v0)
    /* A48 8013A640 00000000 */  nop
    /* A4C 8013A644 09F84000 */  jalr       $v0
    /* A50 8013A648 00000000 */   nop
    /* A54 8013A64C B40B80AF */  sw         $zero, %gp_rel(FeMenuDelay)($gp)
    /* A58 8013A650 C6F5000C */  jal        PlaySFX__Fi
    /* A5C 8013A654 33000424 */   addiu     $a0, $zero, 0x33
    /* A60 8013A658 B80B80AF */  sw         $zero, %gp_rel(JustQuitQText)($gp)
  .L8013A65C:
    /* A64 8013A65C 1000BF8F */  lw         $ra, 0x10($sp)
    /* A68 8013A660 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A6C 8013A664 0800E003 */  jr         $ra
    /* A70 8013A668 00000000 */   nop
endlabel FePrevMenu__Fv
