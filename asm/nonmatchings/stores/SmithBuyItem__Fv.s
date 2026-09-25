.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SmithBuyItem__Fv, 0x280

glabel SmithBuyItem__Fv
    /* 60B94 80070B94 1280033C */  lui        $v1, %hi(myplr)
    /* 60B98 80070B98 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 60B9C 80070B9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 60BA0 80070BA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 60BA4 80070BA4 40100300 */  sll        $v0, $v1, 1
    /* 60BA8 80070BA8 21104300 */  addu       $v0, $v0, $v1
    /* 60BAC 80070BAC 80100200 */  sll        $v0, $v0, 2
    /* 60BB0 80070BB0 21104300 */  addu       $v0, $v0, $v1
    /* 60BB4 80070BB4 00110200 */  sll        $v0, $v0, 4
    /* 60BB8 80070BB8 23104300 */  subu       $v0, $v0, $v1
    /* 60BBC 80070BBC 80100200 */  sll        $v0, $v0, 2
    /* 60BC0 80070BC0 21104300 */  addu       $v0, $v0, $v1
    /* 60BC4 80070BC4 C0100200 */  sll        $v0, $v0, 3
    /* 60BC8 80070BC8 0E80013C */  lui        $at, %hi(plr + 0x1928)
    /* 60BCC 80070BCC 21082200 */  addu       $at, $at, $v0
    /* 60BD0 80070BD0 60BE248C */  lw         $a0, %lo(plr + 0x1928)($at)
    /* 60BD4 80070BD4 D2C1010C */  jal        TakePlrsMoney__Fl
    /* 60BD8 80070BD8 00000000 */   nop
    /* 60BDC 80070BDC 1280033C */  lui        $v1, %hi(myplr)
    /* 60BE0 80070BE0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 60BE4 80070BE4 00000000 */  nop
    /* 60BE8 80070BE8 40100300 */  sll        $v0, $v1, 1
    /* 60BEC 80070BEC 21104300 */  addu       $v0, $v0, $v1
    /* 60BF0 80070BF0 80100200 */  sll        $v0, $v0, 2
    /* 60BF4 80070BF4 21104300 */  addu       $v0, $v0, $v1
    /* 60BF8 80070BF8 00110200 */  sll        $v0, $v0, 4
    /* 60BFC 80070BFC 23104300 */  subu       $v0, $v0, $v1
    /* 60C00 80070C00 80100200 */  sll        $v0, $v0, 2
    /* 60C04 80070C04 21104300 */  addu       $v0, $v0, $v1
    /* 60C08 80070C08 C0180200 */  sll        $v1, $v0, 3
    /* 60C0C 80070C0C 0E80013C */  lui        $at, %hi(plr + 0x1961)
    /* 60C10 80070C10 21082300 */  addu       $at, $at, $v1
    /* 60C14 80070C14 99BE2280 */  lb         $v0, %lo(plr + 0x1961)($at)
    /* 60C18 80070C18 00000000 */  nop
    /* 60C1C 80070C1C 04004014 */  bnez       $v0, .L80070C30
    /* 60C20 80070C20 00000000 */   nop
    /* 60C24 80070C24 0E80013C */  lui        $at, %hi(plr + 0x1979)
    /* 60C28 80070C28 21082300 */  addu       $at, $at, $v1
    /* 60C2C 80070C2C B1BE20A0 */  sb         $zero, %lo(plr + 0x1979)($at)
  .L80070C30:
    /* 60C30 80070C30 02A9010C */  jal        StoreAutoPlace__Fv
    /* 60C34 80070C34 00000000 */   nop
    /* 60C38 80070C38 0821838F */  lw         $v1, %gp_rel(D_8011C888)($gp)
    /* 60C3C 80070C3C 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 60C40 80070C40 00000000 */  nop
    /* 60C44 80070C44 23186200 */  subu       $v1, $v1, $v0
    /* 60C48 80070C48 02006104 */  bgez       $v1, .L80070C54
    /* 60C4C 80070C4C 00000000 */   nop
    /* 60C50 80070C50 03006324 */  addiu      $v1, $v1, 0x3
  .L80070C54:
    /* 60C54 80070C54 1021828F */  lw         $v0, %gp_rel(D_8011C890)($gp)
    /* 60C58 80070C58 83180300 */  sra        $v1, $v1, 2
    /* 60C5C 80070C5C 21486200 */  addu       $t1, $v1, $v0
    /* 60C60 80070C60 13000224 */  addiu      $v0, $zero, 0x13
    /* 60C64 80070C64 0E002215 */  bne        $t1, $v0, .L80070CA0
    /* 60C68 80070C68 01002225 */   addiu     $v0, $t1, 0x1
    /* 60C6C 80070C6C 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 60C70 80070C70 00000000 */  nop
    /* 60C74 80070C74 00190200 */  sll        $v1, $v0, 4
    /* 60C78 80070C78 21186200 */  addu       $v1, $v1, $v0
    /* 60C7C 80070C7C C0180300 */  sll        $v1, $v1, 3
    /* 60C80 80070C80 23186200 */  subu       $v1, $v1, $v0
    /* 60C84 80070C84 00190300 */  sll        $v1, $v1, 4
    /* 60C88 80070C88 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 60C8C 80070C8C 0E80013C */  lui        $at, %hi(_smithitem + 0x830)
    /* 60C90 80070C90 21082300 */  addu       $at, $at, $v1
    /* 60C94 80070C94 58EC22A4 */  sh         $v0, %lo(_smithitem + 0x830)($at)
    /* 60C98 80070C98 7DC30108 */  j          .L80070DF4
    /* 60C9C 80070C9C 00000000 */   nop
  .L80070CA0:
    /* 60CA0 80070CA0 C0180200 */  sll        $v1, $v0, 3
    /* 60CA4 80070CA4 23186200 */  subu       $v1, $v1, $v0
    /* 60CA8 80070CA8 80180300 */  sll        $v1, $v1, 2
    /* 60CAC 80070CAC 23186200 */  subu       $v1, $v1, $v0
    /* 60CB0 80070CB0 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 60CB4 80070CB4 80180300 */  sll        $v1, $v1, 2
    /* 60CB8 80070CB8 00110400 */  sll        $v0, $a0, 4
    /* 60CBC 80070CBC 21104400 */  addu       $v0, $v0, $a0
    /* 60CC0 80070CC0 C0100200 */  sll        $v0, $v0, 3
    /* 60CC4 80070CC4 23104400 */  subu       $v0, $v0, $a0
    /* 60CC8 80070CC8 00110200 */  sll        $v0, $v0, 4
    /* 60CCC 80070CCC 21186200 */  addu       $v1, $v1, $v0
    /* 60CD0 80070CD0 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 60CD4 80070CD4 21082300 */  addu       $at, $at, $v1
    /* 60CD8 80070CD8 54E42384 */  lh         $v1, %lo(_smithitem + 0x2C)($at)
    /* 60CDC 80070CDC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 60CE0 80070CE0 34006210 */  beq        $v1, $v0, .L80070DB4
    /* 60CE4 80070CE4 FFFF0C24 */   addiu     $t4, $zero, -0x1
    /* 60CE8 80070CE8 0E800D3C */  lui        $t5, %hi(_smithitem)
    /* 60CEC 80070CEC 28E4AD25 */  addiu      $t5, $t5, %lo(_smithitem)
    /* 60CF0 80070CF0 C0100900 */  sll        $v0, $t1, 3
    /* 60CF4 80070CF4 23104900 */  subu       $v0, $v0, $t1
    /* 60CF8 80070CF8 80100200 */  sll        $v0, $v0, 2
    /* 60CFC 80070CFC 23104900 */  subu       $v0, $v0, $t1
    /* 60D00 80070D00 80100200 */  sll        $v0, $v0, 2
    /* 60D04 80070D04 6C004B24 */  addiu      $t3, $v0, 0x6C
    /* 60D08 80070D08 21504000 */  addu       $t2, $v0, $zero
  .L80070D0C:
    /* 60D0C 80070D0C 00110400 */  sll        $v0, $a0, 4
    /* 60D10 80070D10 21104400 */  addu       $v0, $v0, $a0
    /* 60D14 80070D14 C0100200 */  sll        $v0, $v0, 3
    /* 60D18 80070D18 23104400 */  subu       $v0, $v0, $a0
    /* 60D1C 80070D1C 00110200 */  sll        $v0, $v0, 4
    /* 60D20 80070D20 21104D00 */  addu       $v0, $v0, $t5
    /* 60D24 80070D24 21104201 */  addu       $v0, $t2, $v0
    /* 60D28 80070D28 21304000 */  addu       $a2, $v0, $zero
    /* 60D2C 80070D2C 6C00C724 */  addiu      $a3, $a2, 0x6C
    /* 60D30 80070D30 CC00C824 */  addiu      $t0, $a2, 0xCC
  .L80070D34:
    /* 60D34 80070D34 0000E28C */  lw         $v0, 0x0($a3)
    /* 60D38 80070D38 0400E38C */  lw         $v1, 0x4($a3)
    /* 60D3C 80070D3C 0800E48C */  lw         $a0, 0x8($a3)
    /* 60D40 80070D40 0C00E58C */  lw         $a1, 0xC($a3)
    /* 60D44 80070D44 0000C2AC */  sw         $v0, 0x0($a2)
    /* 60D48 80070D48 0400C3AC */  sw         $v1, 0x4($a2)
    /* 60D4C 80070D4C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 60D50 80070D50 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 60D54 80070D54 1000E724 */  addiu      $a3, $a3, 0x10
    /* 60D58 80070D58 F6FFE814 */  bne        $a3, $t0, .L80070D34
    /* 60D5C 80070D5C 1000C624 */   addiu     $a2, $a2, 0x10
    /* 60D60 80070D60 0000E28C */  lw         $v0, 0x0($a3)
    /* 60D64 80070D64 0400E38C */  lw         $v1, 0x4($a3)
    /* 60D68 80070D68 0800E48C */  lw         $a0, 0x8($a3)
    /* 60D6C 80070D6C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 60D70 80070D70 0400C3AC */  sw         $v1, 0x4($a2)
    /* 60D74 80070D74 0800C4AC */  sw         $a0, 0x8($a2)
    /* 60D78 80070D78 6C006B25 */  addiu      $t3, $t3, 0x6C
    /* 60D7C 80070D7C 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 60D80 80070D80 6C004A25 */  addiu      $t2, $t2, 0x6C
    /* 60D84 80070D84 00110400 */  sll        $v0, $a0, 4
    /* 60D88 80070D88 21104400 */  addu       $v0, $v0, $a0
    /* 60D8C 80070D8C C0100200 */  sll        $v0, $v0, 3
    /* 60D90 80070D90 23104400 */  subu       $v0, $v0, $a0
    /* 60D94 80070D94 00110200 */  sll        $v0, $v0, 4
    /* 60D98 80070D98 21106201 */  addu       $v0, $t3, $v0
    /* 60D9C 80070D9C 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 60DA0 80070DA0 21082200 */  addu       $at, $at, $v0
    /* 60DA4 80070DA4 54E42284 */  lh         $v0, %lo(_smithitem + 0x2C)($at)
    /* 60DA8 80070DA8 00000000 */  nop
    /* 60DAC 80070DAC D7FF4C14 */  bne        $v0, $t4, .L80070D0C
    /* 60DB0 80070DB0 01002925 */   addiu     $t1, $t1, 0x1
  .L80070DB4:
    /* 60DB4 80070DB4 C0180900 */  sll        $v1, $t1, 3
    /* 60DB8 80070DB8 23186900 */  subu       $v1, $v1, $t1
    /* 60DBC 80070DBC 80180300 */  sll        $v1, $v1, 2
    /* 60DC0 80070DC0 23186900 */  subu       $v1, $v1, $t1
    /* 60DC4 80070DC4 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 60DC8 80070DC8 80180300 */  sll        $v1, $v1, 2
    /* 60DCC 80070DCC 00110400 */  sll        $v0, $a0, 4
    /* 60DD0 80070DD0 21104400 */  addu       $v0, $v0, $a0
    /* 60DD4 80070DD4 C0100200 */  sll        $v0, $v0, 3
    /* 60DD8 80070DD8 23104400 */  subu       $v0, $v0, $a0
    /* 60DDC 80070DDC 00110200 */  sll        $v0, $v0, 4
    /* 60DE0 80070DE0 21186200 */  addu       $v1, $v1, $v0
    /* 60DE4 80070DE4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 60DE8 80070DE8 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 60DEC 80070DEC 21082300 */  addu       $at, $at, $v1
    /* 60DF0 80070DF0 54E422A4 */  sh         $v0, %lo(_smithitem + 0x2C)($at)
  .L80070DF4:
    /* 60DF4 80070DF4 1280043C */  lui        $a0, %hi(myplr)
    /* 60DF8 80070DF8 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 60DFC 80070DFC C6FE000C */  jal        CalcPlrInv__FiUc
    /* 60E00 80070E00 01000524 */   addiu     $a1, $zero, 0x1
    /* 60E04 80070E04 1000BF8F */  lw         $ra, 0x10($sp)
    /* 60E08 80070E08 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 60E0C 80070E0C 0800E003 */  jr         $ra
    /* 60E10 80070E10 00000000 */   nop
endlabel SmithBuyItem__Fv
