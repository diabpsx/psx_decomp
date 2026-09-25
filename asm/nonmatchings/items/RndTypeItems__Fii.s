.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndTypeItems__Fii, 0x170

glabel RndTypeItems__Fii
    /* 33C40 80043C40 E8F7BD27 */  addiu      $sp, $sp, -0x818
    /* 33C44 80043C44 21608000 */  addu       $t4, $a0, $zero
    /* 33C48 80043C48 21200000 */  addu       $a0, $zero, $zero
    /* 33C4C 80043C4C 21400000 */  addu       $t0, $zero, $zero
    /* 33C50 80043C50 1180033C */  lui        $v1, %hi(AllItemsList + 0x2)
    /* 33C54 80043C54 A6136380 */  lb         $v1, %lo(AllItemsList + 0x2)($v1)
    /* 33C58 80043C58 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 33C5C 80043C5C 4B006210 */  beq        $v1, $v0, .L80043D8C
    /* 33C60 80043C60 1008BFAF */   sw        $ra, 0x810($sp)
    /* 33C64 80043C64 FFFF0924 */  addiu      $t1, $zero, -0x1
    /* 33C68 80043C68 EAFFA224 */  addiu      $v0, $a1, -0x16
    /* 33C6C 80043C6C 02004B2C */  sltiu      $t3, $v0, 0x2
    /* 33C70 80043C70 1280023C */  lui        $v0, %hi(currlevel)
    /* 33C74 80043C74 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 33C78 80043C78 21300000 */  addu       $a2, $zero, $zero
    /* 33C7C 80043C7C 40500200 */  sll        $t2, $v0, 1
  .L80043C80:
    /* 33C80 80043C80 1180013C */  lui        $at, %hi(AllItemsList)
    /* 33C84 80043C84 21082600 */  addu       $at, $at, $a2
    /* 33C88 80043C88 A4132290 */  lbu        $v0, %lo(AllItemsList)($at)
    /* 33C8C 80043C8C 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 33C90 80043C90 21082600 */  addu       $at, $at, $a2
    /* 33C94 80043C94 AE132380 */  lb         $v1, %lo(AllItemsList + 0xA)($at)
    /* 33C98 80043C98 2B100200 */  sltu       $v0, $zero, $v0
    /* 33C9C 80043C9C 2A184301 */  slt        $v1, $t2, $v1
    /* 33CA0 80043CA0 02006010 */  beqz       $v1, .L80043CAC
    /* 33CA4 80043CA4 21384000 */   addu      $a3, $v0, $zero
    /* 33CA8 80043CA8 21380000 */  addu       $a3, $zero, $zero
  .L80043CAC:
    /* 33CAC 80043CAC 1180013C */  lui        $at, %hi(AllItemsList + 0x4)
    /* 33CB0 80043CB0 21082600 */  addu       $at, $at, $a2
    /* 33CB4 80043CB4 A8132280 */  lb         $v0, %lo(AllItemsList + 0x4)($at)
    /* 33CB8 80043CB8 00000000 */  nop
    /* 33CBC 80043CBC 02004C10 */  beq        $v0, $t4, .L80043CC8
    /* 33CC0 80043CC0 00000000 */   nop
    /* 33CC4 80043CC4 21380000 */  addu       $a3, $zero, $zero
  .L80043CC8:
    /* 33CC8 80043CC8 0800A910 */  beq        $a1, $t1, .L80043CEC
    /* 33CCC 80043CCC 00000000 */   nop
    /* 33CD0 80043CD0 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 33CD4 80043CD4 21082600 */  addu       $at, $at, $a2
    /* 33CD8 80043CD8 BC132290 */  lbu        $v0, %lo(AllItemsList + 0x18)($at)
    /* 33CDC 80043CDC 00000000 */  nop
    /* 33CE0 80043CE0 02004510 */  beq        $v0, $a1, .L80043CEC
    /* 33CE4 80043CE4 00000000 */   nop
    /* 33CE8 80043CE8 21380000 */  addu       $a3, $zero, $zero
  .L80043CEC:
    /* 33CEC 80043CEC 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 33CF0 80043CF0 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 33CF4 80043CF4 00000000 */  nop
    /* 33CF8 80043CF8 16004010 */  beqz       $v0, .L80043D54
    /* 33CFC 80043CFC 15000224 */   addiu     $v0, $zero, 0x15
    /* 33D00 80043D00 0500A210 */  beq        $a1, $v0, .L80043D18
    /* 33D04 80043D04 18000224 */   addiu     $v0, $zero, 0x18
    /* 33D08 80043D08 0300A210 */  beq        $a1, $v0, .L80043D18
    /* 33D0C 80043D0C 00000000 */   nop
    /* 33D10 80043D10 11006011 */  beqz       $t3, .L80043D58
    /* 33D14 80043D14 FF00E230 */   andi      $v0, $a3, 0xFF
  .L80043D18:
    /* 33D18 80043D18 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 33D1C 80043D1C 21082600 */  addu       $at, $at, $a2
    /* 33D20 80043D20 BC132290 */  lbu        $v0, %lo(AllItemsList + 0x18)($at)
    /* 33D24 80043D24 00000000 */  nop
    /* 33D28 80043D28 0B004514 */  bne        $v0, $a1, .L80043D58
    /* 33D2C 80043D2C FF00E230 */   andi      $v0, $a3, 0xFF
    /* 33D30 80043D30 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33D34 80043D34 21082600 */  addu       $at, $at, $a2
    /* 33D38 80043D38 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 33D3C 80043D3C 17000224 */  addiu      $v0, $zero, 0x17
    /* 33D40 80043D40 03006210 */  beq        $v1, $v0, .L80043D50
    /* 33D44 80043D44 0A000224 */   addiu     $v0, $zero, 0xA
    /* 33D48 80043D48 03006214 */  bne        $v1, $v0, .L80043D58
    /* 33D4C 80043D4C FF00E230 */   andi      $v0, $a3, 0xFF
  .L80043D50:
    /* 33D50 80043D50 21380000 */  addu       $a3, $zero, $zero
  .L80043D54:
    /* 33D54 80043D54 FF00E230 */  andi       $v0, $a3, 0xFF
  .L80043D58:
    /* 33D58 80043D58 05004010 */  beqz       $v0, .L80043D70
    /* 33D5C 80043D5C 80100400 */   sll       $v0, $a0, 2
    /* 33D60 80043D60 1000A327 */  addiu      $v1, $sp, 0x10
    /* 33D64 80043D64 21104300 */  addu       $v0, $v0, $v1
    /* 33D68 80043D68 000048AC */  sw         $t0, 0x0($v0)
    /* 33D6C 80043D6C 01008424 */  addiu      $a0, $a0, 0x1
  .L80043D70:
    /* 33D70 80043D70 2000C624 */  addiu      $a2, $a2, 0x20
    /* 33D74 80043D74 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 33D78 80043D78 21082600 */  addu       $at, $at, $a2
    /* 33D7C 80043D7C A6132280 */  lb         $v0, %lo(AllItemsList + 0x2)($at)
    /* 33D80 80043D80 00000000 */  nop
    /* 33D84 80043D84 BEFF4914 */  bne        $v0, $t1, .L80043C80
    /* 33D88 80043D88 01000825 */   addiu     $t0, $t0, 0x1
  .L80043D8C:
    /* 33D8C 80043D8C C9F6000C */  jal        ENG_random__Fl
    /* 33D90 80043D90 00000000 */   nop
    /* 33D94 80043D94 80100200 */  sll        $v0, $v0, 2
    /* 33D98 80043D98 2110A203 */  addu       $v0, $sp, $v0
    /* 33D9C 80043D9C 1000428C */  lw         $v0, 0x10($v0)
    /* 33DA0 80043DA0 1008BF8F */  lw         $ra, 0x810($sp)
    /* 33DA4 80043DA4 1808BD27 */  addiu      $sp, $sp, 0x818
    /* 33DA8 80043DA8 0800E003 */  jr         $ra
    /* 33DAC 80043DAC 00000000 */   nop
endlabel RndTypeItems__Fii
