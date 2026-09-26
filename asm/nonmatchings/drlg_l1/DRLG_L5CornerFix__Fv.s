.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5CornerFix__Fv, 0x10C

glabel DRLG_L5CornerFix__Fv
    /* 6C2C 80140824 01000B24 */  addiu      $t3, $zero, 0x1
    /* 6C30 80140828 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 6C34 8014082C C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 6C38 80140830 A0FFD825 */  addiu      $t8, $t6, -0x60
    /* 6C3C 80140834 0D000D24 */  addiu      $t5, $zero, 0xD
    /* 6C40 80140838 01000C24 */  addiu      $t4, $zero, 0x1
    /* 6C44 8014083C 6000CF25 */  addiu      $t7, $t6, 0x60
    /* 6C48 80140840 28000A24 */  addiu      $t2, $zero, 0x28
  .L80140844:
    /* 6C4C 80140844 01000924 */  addiu      $t1, $zero, 0x1
    /* 6C50 80140848 40400B00 */  sll        $t0, $t3, 1
    /* 6C54 8014084C 6000C725 */  addiu      $a3, $t6, 0x60
    /* 6C58 80140850 60000624 */  addiu      $a2, $zero, 0x60
  .L80140854:
    /* 6C5C 80140854 1280033C */  lui        $v1, %hi(mydflags)
    /* 6C60 80140858 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 6C64 8014085C 21104901 */  addu       $v0, $t2, $t1
    /* 6C68 80140860 21286200 */  addu       $a1, $v1, $v0
    /* 6C6C 80140864 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6C70 80140868 00000000 */  nop
    /* 6C74 8014086C 80004230 */  andi       $v0, $v0, 0x80
    /* 6C78 80140870 16004014 */  bnez       $v0, .L801408CC
    /* 6C7C 80140874 21200701 */   addu      $a0, $t0, $a3
    /* 6C80 80140878 00008394 */  lhu        $v1, 0x0($a0)
    /* 6C84 8014087C 11000224 */  addiu      $v0, $zero, 0x11
    /* 6C88 80140880 14006214 */  bne        $v1, $v0, .L801408D4
    /* 6C8C 80140884 CA000224 */   addiu     $v0, $zero, 0xCA
    /* 6C90 80140888 2110D800 */  addu       $v0, $a2, $t8
    /* 6C94 8014088C 21100201 */  addu       $v0, $t0, $v0
    /* 6C98 80140890 00004294 */  lhu        $v0, 0x0($v0)
    /* 6C9C 80140894 00000000 */  nop
    /* 6CA0 80140898 0E004D14 */  bne        $v0, $t5, .L801408D4
    /* 6CA4 8014089C CA000224 */   addiu     $v0, $zero, 0xCA
    /* 6CA8 801408A0 FEFF8294 */  lhu        $v0, -0x2($a0)
    /* 6CAC 801408A4 00000000 */  nop
    /* 6CB0 801408A8 0A004C14 */  bne        $v0, $t4, .L801408D4
    /* 6CB4 801408AC CA000224 */   addiu     $v0, $zero, 0xCA
    /* 6CB8 801408B0 10000224 */  addiu      $v0, $zero, 0x10
    /* 6CBC 801408B4 000082A4 */  sh         $v0, 0x0($a0)
    /* 6CC0 801408B8 D8FFA290 */  lbu        $v0, -0x28($a1)
    /* 6CC4 801408BC 00000000 */  nop
    /* 6CC8 801408C0 80004230 */  andi       $v0, $v0, 0x80
    /* 6CCC 801408C4 D8FFA2A0 */  sb         $v0, -0x28($a1)
    /* 6CD0 801408C8 21200701 */  addu       $a0, $t0, $a3
  .L801408CC:
    /* 6CD4 801408CC 00008394 */  lhu        $v1, 0x0($a0)
    /* 6CD8 801408D0 CA000224 */  addiu      $v0, $zero, 0xCA
  .L801408D4:
    /* 6CDC 801408D4 0B006214 */  bne        $v1, $v0, .L80140904
    /* 6CE0 801408D8 2110CF00 */   addu      $v0, $a2, $t7
    /* 6CE4 801408DC 21100201 */  addu       $v0, $t0, $v0
    /* 6CE8 801408E0 00004294 */  lhu        $v0, 0x0($v0)
    /* 6CEC 801408E4 00000000 */  nop
    /* 6CF0 801408E8 06004D14 */  bne        $v0, $t5, .L80140904
    /* 6CF4 801408EC 00000000 */   nop
    /* 6CF8 801408F0 02008294 */  lhu        $v0, 0x2($a0)
    /* 6CFC 801408F4 00000000 */  nop
    /* 6D00 801408F8 02004C14 */  bne        $v0, $t4, .L80140904
    /* 6D04 801408FC 08000224 */   addiu     $v0, $zero, 0x8
    /* 6D08 80140900 000082A4 */  sh         $v0, 0x0($a0)
  .L80140904:
    /* 6D0C 80140904 6000E724 */  addiu      $a3, $a3, 0x60
    /* 6D10 80140908 01002925 */  addiu      $t1, $t1, 0x1
    /* 6D14 8014090C 27002229 */  slti       $v0, $t1, 0x27
    /* 6D18 80140910 D0FF4014 */  bnez       $v0, .L80140854
    /* 6D1C 80140914 6000C624 */   addiu     $a2, $a2, 0x60
    /* 6D20 80140918 01006B25 */  addiu      $t3, $t3, 0x1
    /* 6D24 8014091C 27006229 */  slti       $v0, $t3, 0x27
    /* 6D28 80140920 C8FF4014 */  bnez       $v0, .L80140844
    /* 6D2C 80140924 28004A25 */   addiu     $t2, $t2, 0x28
    /* 6D30 80140928 0800E003 */  jr         $ra
    /* 6D34 8014092C 00000000 */   nop
endlabel DRLG_L5CornerFix__Fv
