.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FixL3HallofHeroes__Fv, 0x154

glabel FixL3HallofHeroes__Fv
    /* 12BC0 8014C7B8 21480000 */  addu       $t1, $zero, $zero
    /* 12BC4 8014C7BC 05000B24 */  addiu      $t3, $zero, 0x5
    /* 12BC8 8014C7C0 0E800A3C */  lui        $t2, %hi(dungeon)
    /* 12BCC 8014C7C4 C4404A25 */  addiu      $t2, $t2, %lo(dungeon)
    /* 12BD0 8014C7C8 60004C25 */  addiu      $t4, $t2, 0x60
    /* 12BD4 8014C7CC 07000824 */  addiu      $t0, $zero, 0x7
    /* 12BD8 8014C7D0 21300000 */  addu       $a2, $zero, $zero
  .L8014C7D4:
    /* 12BDC 8014C7D4 40380900 */  sll        $a3, $t1, 1
    /* 12BE0 8014C7D8 21288001 */  addu       $a1, $t4, $zero
    /* 12BE4 8014C7DC 21204001 */  addu       $a0, $t2, $zero
  .L8014C7E0:
    /* 12BE8 8014C7E0 2118E400 */  addu       $v1, $a3, $a0
    /* 12BEC 8014C7E4 00006294 */  lhu        $v0, 0x0($v1)
    /* 12BF0 8014C7E8 00000000 */  nop
    /* 12BF4 8014C7EC 06004B14 */  bne        $v0, $t3, .L8014C808
    /* 12BF8 8014C7F0 2110E500 */   addu      $v0, $a3, $a1
    /* 12BFC 8014C7F4 02004294 */  lhu        $v0, 0x2($v0)
    /* 12C00 8014C7F8 00000000 */  nop
    /* 12C04 8014C7FC 02004814 */  bne        $v0, $t0, .L8014C808
    /* 12C08 8014C800 00000000 */   nop
    /* 12C0C 8014C804 000068A4 */  sh         $t0, 0x0($v1)
  .L8014C808:
    /* 12C10 8014C808 6000A524 */  addiu      $a1, $a1, 0x60
    /* 12C14 8014C80C 0100C624 */  addiu      $a2, $a2, 0x1
    /* 12C18 8014C810 2800C228 */  slti       $v0, $a2, 0x28
    /* 12C1C 8014C814 F2FF4014 */  bnez       $v0, .L8014C7E0
    /* 12C20 8014C818 60008424 */   addiu     $a0, $a0, 0x60
    /* 12C24 8014C81C 01002925 */  addiu      $t1, $t1, 0x1
    /* 12C28 8014C820 28002229 */  slti       $v0, $t1, 0x28
    /* 12C2C 8014C824 EBFF4014 */  bnez       $v0, .L8014C7D4
    /* 12C30 8014C828 21300000 */   addu      $a2, $zero, $zero
    /* 12C34 8014C82C 21480000 */  addu       $t1, $zero, $zero
    /* 12C38 8014C830 05000D24 */  addiu      $t5, $zero, 0x5
    /* 12C3C 8014C834 0E800F3C */  lui        $t7, %hi(dungeon)
    /* 12C40 8014C838 C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
    /* 12C44 8014C83C 6000EE25 */  addiu      $t6, $t7, 0x60
    /* 12C48 8014C840 0C000C24 */  addiu      $t4, $zero, 0xC
    /* 12C4C 8014C844 07000624 */  addiu      $a2, $zero, 0x7
  .L8014C848:
    /* 12C50 8014C848 40380900 */  sll        $a3, $t1, 1
    /* 12C54 8014C84C 2128E001 */  addu       $a1, $t7, $zero
    /* 12C58 8014C850 21500000 */  addu       $t2, $zero, $zero
    /* 12C5C 8014C854 2140C001 */  addu       $t0, $t6, $zero
    /* 12C60 8014C858 000FAB24 */  addiu      $t3, $a1, 0xF00
  .L8014C85C:
    /* 12C64 8014C85C 2120E500 */  addu       $a0, $a3, $a1
    /* 12C68 8014C860 00008294 */  lhu        $v0, 0x0($a0)
    /* 12C6C 8014C864 00000000 */  nop
    /* 12C70 8014C868 1D004D14 */  bne        $v0, $t5, .L8014C8E0
    /* 12C74 8014C86C 2118E800 */   addu      $v1, $a3, $t0
    /* 12C78 8014C870 02006294 */  lhu        $v0, 0x2($v1)
    /* 12C7C 8014C874 00000000 */  nop
    /* 12C80 8014C878 09004C14 */  bne        $v0, $t4, .L8014C8A0
    /* 12C84 8014C87C 00000000 */   nop
    /* 12C88 8014C880 00006294 */  lhu        $v0, 0x0($v1)
    /* 12C8C 8014C884 00000000 */  nop
    /* 12C90 8014C888 05004614 */  bne        $v0, $a2, .L8014C8A0
    /* 12C94 8014C88C 00000000 */   nop
    /* 12C98 8014C890 000086A4 */  sh         $a2, 0x0($a0)
    /* 12C9C 8014C894 020086A4 */  sh         $a2, 0x2($a0)
    /* 12CA0 8014C898 020066A4 */  sh         $a2, 0x2($v1)
    /* 12CA4 8014C89C 2120E500 */  addu       $a0, $a3, $a1
  .L8014C8A0:
    /* 12CA8 8014C8A0 00008294 */  lhu        $v0, 0x0($a0)
    /* 12CAC 8014C8A4 00000000 */  nop
    /* 12CB0 8014C8A8 0D004D14 */  bne        $v0, $t5, .L8014C8E0
    /* 12CB4 8014C8AC 21104E01 */   addu      $v0, $t2, $t6
    /* 12CB8 8014C8B0 2118E200 */  addu       $v1, $a3, $v0
    /* 12CBC 8014C8B4 02006294 */  lhu        $v0, 0x2($v1)
    /* 12CC0 8014C8B8 00000000 */  nop
    /* 12CC4 8014C8BC 08004C14 */  bne        $v0, $t4, .L8014C8E0
    /* 12CC8 8014C8C0 00000000 */   nop
    /* 12CCC 8014C8C4 02008294 */  lhu        $v0, 0x2($a0)
    /* 12CD0 8014C8C8 00000000 */  nop
    /* 12CD4 8014C8CC 04004614 */  bne        $v0, $a2, .L8014C8E0
    /* 12CD8 8014C8D0 00000000 */   nop
    /* 12CDC 8014C8D4 000086A4 */  sh         $a2, 0x0($a0)
    /* 12CE0 8014C8D8 000066A4 */  sh         $a2, 0x0($v1)
    /* 12CE4 8014C8DC 020066A4 */  sh         $a2, 0x2($v1)
  .L8014C8E0:
    /* 12CE8 8014C8E0 6000A524 */  addiu      $a1, $a1, 0x60
    /* 12CEC 8014C8E4 60004A25 */  addiu      $t2, $t2, 0x60
    /* 12CF0 8014C8E8 2A10AB00 */  slt        $v0, $a1, $t3
    /* 12CF4 8014C8EC DBFF4014 */  bnez       $v0, .L8014C85C
    /* 12CF8 8014C8F0 60000825 */   addiu     $t0, $t0, 0x60
    /* 12CFC 8014C8F4 01002925 */  addiu      $t1, $t1, 0x1
    /* 12D00 8014C8F8 28002229 */  slti       $v0, $t1, 0x28
    /* 12D04 8014C8FC D2FF4014 */  bnez       $v0, .L8014C848
    /* 12D08 8014C900 00000000 */   nop
    /* 12D0C 8014C904 0800E003 */  jr         $ra
    /* 12D10 8014C908 00000000 */   nop
endlabel FixL3HallofHeroes__Fv
