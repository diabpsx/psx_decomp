.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlrDeathModeOK__Fi, 0x68

glabel PlrDeathModeOK__Fi
    /* 54B68 80064B68 8812828F */  lw         $v0, %gp_rel(myplr)($gp)
    /* 54B6C 80064B6C 00000000 */  nop
    /* 54B70 80064B70 15008214 */  bne        $a0, $v0, .L80064BC8
    /* 54B74 80064B74 01000224 */   addiu     $v0, $zero, 0x1
    /* 54B78 80064B78 40100400 */  sll        $v0, $a0, 1
    /* 54B7C 80064B7C 21104400 */  addu       $v0, $v0, $a0
    /* 54B80 80064B80 80100200 */  sll        $v0, $v0, 2
    /* 54B84 80064B84 21104400 */  addu       $v0, $v0, $a0
    /* 54B88 80064B88 00110200 */  sll        $v0, $v0, 4
    /* 54B8C 80064B8C 23104400 */  subu       $v0, $v0, $a0
    /* 54B90 80064B90 80100200 */  sll        $v0, $v0, 2
    /* 54B94 80064B94 21104400 */  addu       $v0, $v0, $a0
    /* 54B98 80064B98 C0100200 */  sll        $v0, $v0, 3
    /* 54B9C 80064B9C 0E80013C */  lui        $at, %hi(plr)
    /* 54BA0 80064BA0 21082200 */  addu       $at, $at, $v0
    /* 54BA4 80064BA4 38A5238C */  lw         $v1, %lo(plr)($at)
    /* 54BA8 80064BA8 08000224 */  addiu      $v0, $zero, 0x8
    /* 54BAC 80064BAC 03006210 */  beq        $v1, $v0, .L80064BBC
    /* 54BB0 80064BB0 0B000224 */   addiu     $v0, $zero, 0xB
    /* 54BB4 80064BB4 03006214 */  bne        $v1, $v0, .L80064BC4
    /* 54BB8 80064BB8 0A006238 */   xori      $v0, $v1, 0xA
  .L80064BBC:
    /* 54BBC 80064BBC F2920108 */  j          .L80064BC8
    /* 54BC0 80064BC0 01000224 */   addiu     $v0, $zero, 0x1
  .L80064BC4:
    /* 54BC4 80064BC4 0100422C */  sltiu      $v0, $v0, 0x1
  .L80064BC8:
    /* 54BC8 80064BC8 0800E003 */  jr         $ra
    /* 54BCC 80064BCC 00000000 */   nop
endlabel PlrDeathModeOK__Fi
