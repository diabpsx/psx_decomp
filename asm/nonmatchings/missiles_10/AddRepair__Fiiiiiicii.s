.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddRepair__Fiiiiiicii, 0xB8

glabel AddRepair__Fiiiiiicii
    /* 7CC8 801418C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7CCC 801418C4 80100400 */  sll        $v0, $a0, 2
    /* 7CD0 801418C8 21104400 */  addu       $v0, $v0, $a0
    /* 7CD4 801418CC 80100200 */  sll        $v0, $v0, 2
    /* 7CD8 801418D0 23104400 */  subu       $v0, $v0, $a0
    /* 7CDC 801418D4 80100200 */  sll        $v0, $v0, 2
    /* 7CE0 801418D8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7CE4 801418DC 01001124 */  addiu      $s1, $zero, 0x1
    /* 7CE8 801418E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7CEC 801418E4 3C00B08F */  lw         $s0, 0x3C($sp)
    /* 7CF0 801418E8 1A000524 */  addiu      $a1, $zero, 0x1A
    /* 7CF4 801418EC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7CF8 801418F0 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 7CFC 801418F4 21082200 */  addu       $at, $at, $v0
    /* 7D00 801418F8 902C31A0 */  sb         $s1, %lo(missile + 0x38)($at)
    /* 7D04 801418FC C2DC010C */  jal        UseMana__Fii
    /* 7D08 80141900 21200002 */   addu      $a0, $s0, $zero
    /* 7D0C 80141904 1280023C */  lui        $v0, %hi(myplr)
    /* 7D10 80141908 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 7D14 8014190C 00000000 */  nop
    /* 7D18 80141910 13000216 */  bne        $s0, $v0, .L80141960
    /* 7D1C 80141914 00000000 */   nop
    /* 7D20 80141918 1280023C */  lui        $v0, %hi(sbookflag)
    /* 7D24 8014191C C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 7D28 80141920 00000000 */  nop
    /* 7D2C 80141924 03004010 */  beqz       $v0, .L80141934
    /* 7D30 80141928 00000000 */   nop
    /* 7D34 8014192C 1280013C */  lui        $at, %hi(sbookflag)
    /* 7D38 80141930 C6B620A0 */  sb         $zero, %lo(sbookflag)($at)
  .L80141934:
    /* 7D3C 80141934 1280023C */  lui        $v0, %hi(invflag)
    /* 7D40 80141938 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 7D44 8014193C 00000000 */  nop
    /* 7D48 80141940 03004014 */  bnez       $v0, .L80141950
    /* 7D4C 80141944 00000000 */   nop
    /* 7D50 80141948 1280013C */  lui        $at, %hi(invflag)
    /* 7D54 8014194C 2CC331A0 */  sb         $s1, %lo(invflag)($at)
  .L80141950:
    /* 7D58 80141950 1280013C */  lui        $at, %hi(options_pad)
    /* 7D5C 80141954 50B230AC */  sw         $s0, %lo(options_pad)($at)
    /* 7D60 80141958 01DE000C */  jal        NewCursor__Fi
    /* 7D64 8014195C 03000424 */   addiu     $a0, $zero, 0x3
  .L80141960:
    /* 7D68 80141960 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7D6C 80141964 1400B18F */  lw         $s1, 0x14($sp)
    /* 7D70 80141968 1000B08F */  lw         $s0, 0x10($sp)
    /* 7D74 8014196C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7D78 80141970 0800E003 */  jr         $ra
    /* 7D7C 80141974 00000000 */   nop
endlabel AddRepair__Fiiiiiicii
