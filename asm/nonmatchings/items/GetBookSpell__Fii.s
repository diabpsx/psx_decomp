.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetBookSpell__Fii, 0x260

glabel GetBookSpell__Fii
    /* 30B7C 80040B7C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 30B80 80040B80 1800B2AF */  sw         $s2, 0x18($sp)
    /* 30B84 80040B84 21908000 */  addu       $s2, $a0, $zero
    /* 30B88 80040B88 1400B1AF */  sw         $s1, 0x14($sp)
    /* 30B8C 80040B8C 2188A000 */  addu       $s1, $a1, $zero
    /* 30B90 80040B90 1000B0AF */  sw         $s0, 0x10($sp)
    /* 30B94 80040B94 21800000 */  addu       $s0, $zero, $zero
    /* 30B98 80040B98 02002016 */  bnez       $s1, .L80040BA4
    /* 30B9C 80040B9C 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 30BA0 80040BA0 01001124 */  addiu      $s1, $zero, 0x1
  .L80040BA4:
    /* 30BA4 80040BA4 C9F6000C */  jal        ENG_random__Fl
    /* 30BA8 80040BA8 25000424 */   addiu     $a0, $zero, 0x25
    /* 30BAC 80040BAC 01004524 */  addiu      $a1, $v0, 0x1
    /* 30BB0 80040BB0 3200A018 */  blez       $a1, .L80040C7C
    /* 30BB4 80040BB4 01000324 */   addiu     $v1, $zero, 0x1
    /* 30BB8 80040BB8 FFFF0C24 */  addiu      $t4, $zero, -0x1
    /* 30BBC 80040BBC 1280063C */  lui        $a2, %hi(FePlayerNo)
    /* 30BC0 80040BC0 78B3C68C */  lw         $a2, %lo(FePlayerNo)($a2)
    /* 30BC4 80040BC4 01000B24 */  addiu      $t3, $zero, 0x1
    /* 30BC8 80040BC8 20000A24 */  addiu      $t2, $zero, 0x20
    /* 30BCC 80040BCC 22000924 */  addiu      $t1, $zero, 0x22
    /* 30BD0 80040BD0 17000824 */  addiu      $t0, $zero, 0x17
    /* 30BD4 80040BD4 0A000724 */  addiu      $a3, $zero, 0xA
    /* 30BD8 80040BD8 34000424 */  addiu      $a0, $zero, 0x34
  .L80040BDC:
    /* 30BDC 80040BDC 0E80013C */  lui        $at, %hi(spelldata + 0xC)
    /* 30BE0 80040BE0 21082400 */  addu       $at, $at, $a0
    /* 30BE4 80040BE4 8CDB228C */  lw         $v0, %lo(spelldata + 0xC)($at)
    /* 30BE8 80040BE8 00000000 */  nop
    /* 30BEC 80040BEC 05004C10 */  beq        $v0, $t4, .L80040C04
    /* 30BF0 80040BF0 2A102202 */   slt       $v0, $s1, $v0
    /* 30BF4 80040BF4 03004014 */  bnez       $v0, .L80040C04
    /* 30BF8 80040BF8 00000000 */   nop
    /* 30BFC 80040BFC FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 30C00 80040C00 21806000 */  addu       $s0, $v1, $zero
  .L80040C04:
    /* 30C04 80040C04 34008424 */  addiu      $a0, $a0, 0x34
    /* 30C08 80040C08 0900CB10 */  beq        $a2, $t3, .L80040C30
    /* 30C0C 80040C0C 01006324 */   addiu     $v1, $v1, 0x1
    /* 30C10 80040C10 03006A14 */  bne        $v1, $t2, .L80040C20
    /* 30C14 80040C14 00000000 */   nop
    /* 30C18 80040C18 B4060424 */  addiu      $a0, $zero, 0x6B4
    /* 30C1C 80040C1C 21000324 */  addiu      $v1, $zero, 0x21
  .L80040C20:
    /* 30C20 80040C20 03006914 */  bne        $v1, $t1, .L80040C30
    /* 30C24 80040C24 00000000 */   nop
    /* 30C28 80040C28 1C070424 */  addiu      $a0, $zero, 0x71C
    /* 30C2C 80040C2C 23000324 */  addiu      $v1, $zero, 0x23
  .L80040C30:
    /* 30C30 80040C30 0A00C010 */  beqz       $a2, .L80040C5C
    /* 30C34 80040C34 25006228 */   slti      $v0, $v1, 0x25
    /* 30C38 80040C38 03006814 */  bne        $v1, $t0, .L80040C48
    /* 30C3C 80040C3C 00000000 */   nop
    /* 30C40 80040C40 E0040424 */  addiu      $a0, $zero, 0x4E0
    /* 30C44 80040C44 18000324 */  addiu      $v1, $zero, 0x18
  .L80040C48:
    /* 30C48 80040C48 04006714 */  bne        $v1, $a3, .L80040C5C
    /* 30C4C 80040C4C 25006228 */   slti      $v0, $v1, 0x25
    /* 30C50 80040C50 3C020424 */  addiu      $a0, $zero, 0x23C
    /* 30C54 80040C54 0B000324 */  addiu      $v1, $zero, 0xB
    /* 30C58 80040C58 25006228 */  slti       $v0, $v1, 0x25
  .L80040C5C:
    /* 30C5C 80040C5C 05004014 */  bnez       $v0, .L80040C74
    /* 30C60 80040C60 00000000 */   nop
    /* 30C64 80040C64 34000424 */  addiu      $a0, $zero, 0x34
    /* 30C68 80040C68 01000324 */  addiu      $v1, $zero, 0x1
    /* 30C6C 80040C6C FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 30C70 80040C70 01001024 */  addiu      $s0, $zero, 0x1
  .L80040C74:
    /* 30C74 80040C74 D9FFA01C */  bgtz       $a1, .L80040BDC
    /* 30C78 80040C78 00000000 */   nop
  .L80040C7C:
    /* 30C7C 80040C7C C0181200 */  sll        $v1, $s2, 3
    /* 30C80 80040C80 23187200 */  subu       $v1, $v1, $s2
    /* 30C84 80040C84 80180300 */  sll        $v1, $v1, 2
    /* 30C88 80040C88 23187200 */  subu       $v1, $v1, $s2
    /* 30C8C 80040C8C 40101000 */  sll        $v0, $s0, 1
    /* 30C90 80040C90 21105000 */  addu       $v0, $v0, $s0
    /* 30C94 80040C94 80100200 */  sll        $v0, $v0, 2
    /* 30C98 80040C98 21105000 */  addu       $v0, $v0, $s0
    /* 30C9C 80040C9C 80280200 */  sll        $a1, $v0, 2
    /* 30CA0 80040CA0 0E80013C */  lui        $at, %hi(spelldata + 0x4)
    /* 30CA4 80040CA4 21082500 */  addu       $at, $at, $a1
    /* 30CA8 80040CA8 84DB228C */  lw         $v0, %lo(spelldata + 0x4)($at)
    /* 30CAC 80040CAC 80200300 */  sll        $a0, $v1, 2
    /* 30CB0 80040CB0 0D80013C */  lui        $at, %hi(item + 0x26)
    /* 30CB4 80040CB4 21082400 */  addu       $at, $at, $a0
    /* 30CB8 80040CB8 7A1D22A4 */  sh         $v0, %lo(item + 0x26)($at)
    /* 30CBC 80040CBC 0E80013C */  lui        $at, %hi(spelldata + 0x4)
    /* 30CC0 80040CC0 21082500 */  addu       $at, $at, $a1
    /* 30CC4 80040CC4 84DB228C */  lw         $v0, %lo(spelldata + 0x4)($at)
    /* 30CC8 80040CC8 0D80013C */  lui        $at, %hi(item + 0x3D)
    /* 30CCC 80040CCC 21082400 */  addu       $at, $at, $a0
    /* 30CD0 80040CD0 911D30A0 */  sb         $s0, %lo(item + 0x3D)($at)
    /* 30CD4 80040CD4 0D80013C */  lui        $at, %hi(item + 0x28)
    /* 30CD8 80040CD8 21082400 */  addu       $at, $at, $a0
    /* 30CDC 80040CDC 7C1D22A4 */  sh         $v0, %lo(item + 0x28)($at)
    /* 30CE0 80040CE0 0E80013C */  lui        $at, %hi(spelldata + 0x18)
    /* 30CE4 80040CE4 21082500 */  addu       $at, $at, $a1
    /* 30CE8 80040CE8 98DB228C */  lw         $v0, %lo(spelldata + 0x18)($at)
    /* 30CEC 80040CEC 0D80013C */  lui        $at, %hi(item + 0x64)
    /* 30CF0 80040CF0 21082400 */  addu       $at, $at, $a0
    /* 30CF4 80040CF4 B81D22A0 */  sb         $v0, %lo(item + 0x64)($at)
    /* 30CF8 80040CF8 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 30CFC 80040CFC 21082400 */  addu       $at, $at, $a0
    /* 30D00 80040D00 681D228C */  lw         $v0, %lo(item + 0x14)($at)
    /* 30D04 80040D04 0E80013C */  lui        $at, %hi(spelldata + 0x2C)
    /* 30D08 80040D08 21082500 */  addu       $at, $at, $a1
    /* 30D0C 80040D0C ACDB238C */  lw         $v1, %lo(spelldata + 0x2C)($at)
    /* 30D10 80040D10 00000000 */  nop
    /* 30D14 80040D14 21104300 */  addu       $v0, $v0, $v1
    /* 30D18 80040D18 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 30D1C 80040D1C 21082400 */  addu       $at, $at, $a0
    /* 30D20 80040D20 681D22AC */  sw         $v0, %lo(item + 0x14)($at)
    /* 30D24 80040D24 0D80013C */  lui        $at, %hi(item + 0x18)
    /* 30D28 80040D28 21082400 */  addu       $at, $at, $a0
    /* 30D2C 80040D2C 6C1D228C */  lw         $v0, %lo(item + 0x18)($at)
    /* 30D30 80040D30 0E80013C */  lui        $at, %hi(spelldata + 0x2C)
    /* 30D34 80040D34 21082500 */  addu       $at, $at, $a1
    /* 30D38 80040D38 ACDB238C */  lw         $v1, %lo(spelldata + 0x2C)($at)
    /* 30D3C 80040D3C 00000000 */  nop
    /* 30D40 80040D40 21104300 */  addu       $v0, $v0, $v1
    /* 30D44 80040D44 0D80013C */  lui        $at, %hi(item + 0x18)
    /* 30D48 80040D48 21082400 */  addu       $at, $at, $a0
    /* 30D4C 80040D4C 6C1D22AC */  sw         $v0, %lo(item + 0x18)($at)
    /* 30D50 80040D50 0E80013C */  lui        $at, %hi(spelldata + 0x2)
    /* 30D54 80040D54 21082500 */  addu       $at, $at, $a1
    /* 30D58 80040D58 82DB2290 */  lbu        $v0, %lo(spelldata + 0x2)($at)
    /* 30D5C 80040D5C 00000000 */  nop
    /* 30D60 80040D60 04004014 */  bnez       $v0, .L80040D74
    /* 30D64 80040D64 57000224 */   addiu     $v0, $zero, 0x57
    /* 30D68 80040D68 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 30D6C 80040D6C 21082400 */  addu       $at, $at, $a0
    /* 30D70 80040D70 A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
  .L80040D74:
    /* 30D74 80040D74 0E80013C */  lui        $at, %hi(spelldata + 0x2)
    /* 30D78 80040D78 21082500 */  addu       $at, $at, $a1
    /* 30D7C 80040D7C 82DB2390 */  lbu        $v1, %lo(spelldata + 0x2)($at)
    /* 30D80 80040D80 01000224 */  addiu      $v0, $zero, 0x1
    /* 30D84 80040D84 09006214 */  bne        $v1, $v0, .L80040DAC
    /* 30D88 80040D88 02000224 */   addiu     $v0, $zero, 0x2
    /* 30D8C 80040D8C 58000224 */  addiu      $v0, $zero, 0x58
    /* 30D90 80040D90 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 30D94 80040D94 21082400 */  addu       $at, $at, $a0
    /* 30D98 80040D98 A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
    /* 30D9C 80040D9C 0E80013C */  lui        $at, %hi(spelldata + 0x2)
    /* 30DA0 80040DA0 21082500 */  addu       $at, $at, $a1
    /* 30DA4 80040DA4 82DB2390 */  lbu        $v1, %lo(spelldata + 0x2)($at)
    /* 30DA8 80040DA8 02000224 */  addiu      $v0, $zero, 0x2
  .L80040DAC:
    /* 30DAC 80040DAC 04006214 */  bne        $v1, $v0, .L80040DC0
    /* 30DB0 80040DB0 56000224 */   addiu     $v0, $zero, 0x56
    /* 30DB4 80040DB4 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 30DB8 80040DB8 21082400 */  addu       $at, $at, $a0
    /* 30DBC 80040DBC A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
  .L80040DC0:
    /* 30DC0 80040DC0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 30DC4 80040DC4 1800B28F */  lw         $s2, 0x18($sp)
    /* 30DC8 80040DC8 1400B18F */  lw         $s1, 0x14($sp)
    /* 30DCC 80040DCC 1000B08F */  lw         $s0, 0x10($sp)
    /* 30DD0 80040DD0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 30DD4 80040DD4 0800E003 */  jr         $ra
    /* 30DD8 80040DD8 00000000 */   nop
endlabel GetBookSpell__Fii
