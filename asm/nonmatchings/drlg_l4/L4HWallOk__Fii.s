.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4HWallOk__Fii, 0x150

glabel L4HWallOk__Fii
    /* 15CA0 8014F898 01000924 */  addiu      $t1, $zero, 0x1
    /* 15CA4 8014F89C 0E800D3C */  lui        $t5, %hi(dungeon)
    /* 15CA8 8014F8A0 C440AD25 */  addiu      $t5, $t5, %lo(dungeon)
    /* 15CAC 8014F8A4 40180500 */  sll        $v1, $a1, 1
    /* 15CB0 8014F8A8 01008624 */  addiu      $a2, $a0, 0x1
    /* 15CB4 8014F8AC 40100600 */  sll        $v0, $a2, 1
    /* 15CB8 8014F8B0 21104600 */  addu       $v0, $v0, $a2
    /* 15CBC 8014F8B4 40110200 */  sll        $v0, $v0, 5
    /* 15CC0 8014F8B8 21104D00 */  addu       $v0, $v0, $t5
    /* 15CC4 8014F8BC 21406200 */  addu       $t0, $v1, $v0
    /* 15CC8 8014F8C0 06000C24 */  addiu      $t4, $zero, 0x6
    /* 15CCC 8014F8C4 80100500 */  sll        $v0, $a1, 2
    /* 15CD0 8014F8C8 21104500 */  addu       $v0, $v0, $a1
    /* 15CD4 8014F8CC 00000795 */  lhu        $a3, 0x0($t0)
    /* 15CD8 8014F8D0 12800A3C */  lui        $t2, %hi(mydflags)
    /* 15CDC 8014F8D4 D8C04A8D */  lw         $t2, %lo(mydflags)($t2)
    /* 15CE0 8014F8D8 483E0508 */  j          .L8014F920
    /* 15CE4 8014F8DC C0580200 */   sll       $t3, $v0, 3
  .L8014F8E0:
    /* 15CE8 8014F8E0 FEFF0295 */  lhu        $v0, -0x2($t0)
    /* 15CEC 8014F8E4 00000000 */  nop
    /* 15CF0 8014F8E8 15004714 */  bne        $v0, $a3, .L8014F940
    /* 15CF4 8014F8EC 00000000 */   nop
    /* 15CF8 8014F8F0 02000295 */  lhu        $v0, 0x2($t0)
    /* 15CFC 8014F8F4 00000000 */  nop
    /* 15D00 8014F8F8 11004714 */  bne        $v0, $a3, .L8014F940
    /* 15D04 8014F8FC 00000000 */   nop
    /* 15D08 8014F900 01002925 */  addiu      $t1, $t1, 0x1
    /* 15D0C 8014F904 21308900 */  addu       $a2, $a0, $t1
    /* 15D10 8014F908 40100600 */  sll        $v0, $a2, 1
    /* 15D14 8014F90C 21104600 */  addu       $v0, $v0, $a2
    /* 15D18 8014F910 40110200 */  sll        $v0, $v0, 5
    /* 15D1C 8014F914 21104D00 */  addu       $v0, $v0, $t5
    /* 15D20 8014F918 21406200 */  addu       $t0, $v1, $v0
    /* 15D24 8014F91C 00000795 */  lhu        $a3, 0x0($t0)
  .L8014F920:
    /* 15D28 8014F920 00000000 */  nop
    /* 15D2C 8014F924 0600EC14 */  bne        $a3, $t4, .L8014F940
    /* 15D30 8014F928 21106601 */   addu      $v0, $t3, $a2
    /* 15D34 8014F92C 21104201 */  addu       $v0, $t2, $v0
    /* 15D38 8014F930 00004290 */  lbu        $v0, 0x0($v0)
    /* 15D3C 8014F934 00000000 */  nop
    /* 15D40 8014F938 E9FF4010 */  beqz       $v0, .L8014F8E0
    /* 15D44 8014F93C 00000000 */   nop
  .L8014F940:
    /* 15D48 8014F940 21188900 */  addu       $v1, $a0, $t1
    /* 15D4C 8014F944 0E80043C */  lui        $a0, %hi(dungeon)
    /* 15D50 8014F948 C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 15D54 8014F94C 40100300 */  sll        $v0, $v1, 1
    /* 15D58 8014F950 21104300 */  addu       $v0, $v0, $v1
    /* 15D5C 8014F954 40110200 */  sll        $v0, $v0, 5
    /* 15D60 8014F958 21104400 */  addu       $v0, $v0, $a0
    /* 15D64 8014F95C 40180500 */  sll        $v1, $a1, 1
    /* 15D68 8014F960 21186200 */  addu       $v1, $v1, $v0
    /* 15D6C 8014F964 00006494 */  lhu        $a0, 0x0($v1)
    /* 15D70 8014F968 00000000 */  nop
    /* 15D74 8014F96C 0A008238 */  xori       $v0, $a0, 0xA
    /* 15D78 8014F970 0100422C */  sltiu      $v0, $v0, 0x1
    /* 15D7C 8014F974 21184000 */  addu       $v1, $v0, $zero
    /* 15D80 8014F978 0C000224 */  addiu      $v0, $zero, 0xC
    /* 15D84 8014F97C 02008214 */  bne        $a0, $v0, .L8014F988
    /* 15D88 8014F980 0D000224 */   addiu     $v0, $zero, 0xD
    /* 15D8C 8014F984 01000324 */  addiu      $v1, $zero, 0x1
  .L8014F988:
    /* 15D90 8014F988 02008214 */  bne        $a0, $v0, .L8014F994
    /* 15D94 8014F98C 0F000224 */   addiu     $v0, $zero, 0xF
    /* 15D98 8014F990 01000324 */  addiu      $v1, $zero, 0x1
  .L8014F994:
    /* 15D9C 8014F994 02008214 */  bne        $a0, $v0, .L8014F9A0
    /* 15DA0 8014F998 10000224 */   addiu     $v0, $zero, 0x10
    /* 15DA4 8014F99C 01000324 */  addiu      $v1, $zero, 0x1
  .L8014F9A0:
    /* 15DA8 8014F9A0 02008214 */  bne        $a0, $v0, .L8014F9AC
    /* 15DAC 8014F9A4 15000224 */   addiu     $v0, $zero, 0x15
    /* 15DB0 8014F9A8 01000324 */  addiu      $v1, $zero, 0x1
  .L8014F9AC:
    /* 15DB4 8014F9AC 02008214 */  bne        $a0, $v0, .L8014F9B8
    /* 15DB8 8014F9B0 16000224 */   addiu     $v0, $zero, 0x16
    /* 15DBC 8014F9B4 01000324 */  addiu      $v1, $zero, 0x1
  .L8014F9B8:
    /* 15DC0 8014F9B8 02008214 */  bne        $a0, $v0, .L8014F9C4
    /* 15DC4 8014F9BC 04002229 */   slti      $v0, $t1, 0x4
    /* 15DC8 8014F9C0 01000324 */  addiu      $v1, $zero, 0x1
  .L8014F9C4:
    /* 15DCC 8014F9C4 03004010 */  beqz       $v0, .L8014F9D4
    /* 15DD0 8014F9C8 FF006330 */   andi      $v1, $v1, 0xFF
    /* 15DD4 8014F9CC 21180000 */  addu       $v1, $zero, $zero
    /* 15DD8 8014F9D0 FF006330 */  andi       $v1, $v1, 0xFF
  .L8014F9D4:
    /* 15DDC 8014F9D4 02006014 */  bnez       $v1, .L8014F9E0
    /* 15DE0 8014F9D8 21102001 */   addu      $v0, $t1, $zero
    /* 15DE4 8014F9DC FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8014F9E0:
    /* 15DE8 8014F9E0 0800E003 */  jr         $ra
    /* 15DEC 8014F9E4 00000000 */   nop
endlabel L4HWallOk__Fii
