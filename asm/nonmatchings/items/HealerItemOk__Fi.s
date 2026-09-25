.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HealerItemOk__Fi, 0x1B4

glabel HealerItemOk__Fi
    /* 39D64 80049D64 40290400 */  sll        $a1, $a0, 5
    /* 39D68 80049D68 1180013C */  lui        $at, %hi(AllItemsList + 0x4)
    /* 39D6C 80049D6C 21082500 */  addu       $at, $at, $a1
    /* 39D70 80049D70 A8132280 */  lb         $v0, %lo(AllItemsList + 0x4)($at)
    /* 39D74 80049D74 00000000 */  nop
    /* 39D78 80049D78 03004010 */  beqz       $v0, .L80049D88
    /* 39D7C 80049D7C 21300000 */   addu      $a2, $zero, $zero
    /* 39D80 80049D80 C4270108 */  j          .L80049F10
    /* 39D84 80049D84 21100000 */   addu      $v0, $zero, $zero
  .L80049D88:
    /* 39D88 80049D88 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 39D8C 80049D8C 21082500 */  addu       $at, $at, $a1
    /* 39D90 80049D90 BC132390 */  lbu        $v1, %lo(AllItemsList + 0x18)($at)
    /* 39D94 80049D94 15000224 */  addiu      $v0, $zero, 0x15
    /* 39D98 80049D98 08006214 */  bne        $v1, $v0, .L80049DBC
    /* 39D9C 80049D9C 02000224 */   addiu     $v0, $zero, 0x2
    /* 39DA0 80049DA0 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 39DA4 80049DA4 21082500 */  addu       $at, $at, $a1
    /* 39DA8 80049DA8 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 39DAC 80049DAC 00000000 */  nop
    /* 39DB0 80049DB0 03006214 */  bne        $v1, $v0, .L80049DC0
    /* 39DB4 80049DB4 40290400 */   sll       $a1, $a0, 5
    /* 39DB8 80049DB8 01000624 */  addiu      $a2, $zero, 0x1
  .L80049DBC:
    /* 39DBC 80049DBC 40290400 */  sll        $a1, $a0, 5
  .L80049DC0:
    /* 39DC0 80049DC0 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 39DC4 80049DC4 21082500 */  addu       $at, $at, $a1
    /* 39DC8 80049DC8 BC132390 */  lbu        $v1, %lo(AllItemsList + 0x18)($at)
    /* 39DCC 80049DCC 16000224 */  addiu      $v0, $zero, 0x16
    /* 39DD0 80049DD0 20006214 */  bne        $v1, $v0, .L80049E54
    /* 39DD4 80049DD4 20000224 */   addiu     $v0, $zero, 0x20
    /* 39DD8 80049DD8 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 39DDC 80049DDC 21082500 */  addu       $at, $at, $a1
    /* 39DE0 80049DE0 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 39DE4 80049DE4 00000000 */  nop
    /* 39DE8 80049DE8 07006214 */  bne        $v1, $v0, .L80049E08
    /* 39DEC 80049DEC 00000000 */   nop
    /* 39DF0 80049DF0 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 39DF4 80049DF4 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 39DF8 80049DF8 00000000 */  nop
    /* 39DFC 80049DFC 03004014 */  bnez       $v0, .L80049E0C
    /* 39E00 80049E00 40290400 */   sll       $a1, $a0, 5
    /* 39E04 80049E04 21300000 */  addu       $a2, $zero, $zero
  .L80049E08:
    /* 39E08 80049E08 40290400 */  sll        $a1, $a0, 5
  .L80049E0C:
    /* 39E0C 80049E0C 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 39E10 80049E10 21082500 */  addu       $at, $at, $a1
    /* 39E14 80049E14 BC132390 */  lbu        $v1, %lo(AllItemsList + 0x18)($at)
    /* 39E18 80049E18 16000224 */  addiu      $v0, $zero, 0x16
    /* 39E1C 80049E1C 0D006214 */  bne        $v1, $v0, .L80049E54
    /* 39E20 80049E20 22000224 */   addiu     $v0, $zero, 0x22
    /* 39E24 80049E24 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 39E28 80049E28 21082500 */  addu       $at, $at, $a1
    /* 39E2C 80049E2C BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 39E30 80049E30 00000000 */  nop
    /* 39E34 80049E34 07006214 */  bne        $v1, $v0, .L80049E54
    /* 39E38 80049E38 00000000 */   nop
    /* 39E3C 80049E3C 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 39E40 80049E40 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 39E44 80049E44 00000000 */  nop
    /* 39E48 80049E48 17004014 */  bnez       $v0, .L80049EA8
    /* 39E4C 80049E4C 40110400 */   sll       $v0, $a0, 5
    /* 39E50 80049E50 21300000 */  addu       $a2, $zero, $zero
  .L80049E54:
    /* 39E54 80049E54 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 39E58 80049E58 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 39E5C 80049E5C 00000000 */  nop
    /* 39E60 80049E60 11004014 */  bnez       $v0, .L80049EA8
    /* 39E64 80049E64 40110400 */   sll       $v0, $a0, 5
    /* 39E68 80049E68 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 39E6C 80049E6C 21082200 */  addu       $at, $at, $v0
    /* 39E70 80049E70 BC132390 */  lbu        $v1, %lo(AllItemsList + 0x18)($at)
    /* 39E74 80049E74 0A000224 */  addiu      $v0, $zero, 0xA
    /* 39E78 80049E78 02006214 */  bne        $v1, $v0, .L80049E84
    /* 39E7C 80049E7C 0B000224 */   addiu     $v0, $zero, 0xB
    /* 39E80 80049E80 01000624 */  addiu      $a2, $zero, 0x1
  .L80049E84:
    /* 39E84 80049E84 02006214 */  bne        $v1, $v0, .L80049E90
    /* 39E88 80049E88 0C000224 */   addiu     $v0, $zero, 0xC
    /* 39E8C 80049E8C 01000624 */  addiu      $a2, $zero, 0x1
  .L80049E90:
    /* 39E90 80049E90 02006214 */  bne        $v1, $v0, .L80049E9C
    /* 39E94 80049E94 0D000224 */   addiu     $v0, $zero, 0xD
    /* 39E98 80049E98 01000624 */  addiu      $a2, $zero, 0x1
  .L80049E9C:
    /* 39E9C 80049E9C 02006214 */  bne        $v1, $v0, .L80049EA8
    /* 39EA0 80049EA0 40110400 */   sll       $v0, $a0, 5
    /* 39EA4 80049EA4 01000624 */  addiu      $a2, $zero, 0x1
  .L80049EA8:
    /* 39EA8 80049EA8 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 39EAC 80049EAC 21082200 */  addu       $at, $at, $v0
    /* 39EB0 80049EB0 BC132390 */  lbu        $v1, %lo(AllItemsList + 0x18)($at)
    /* 39EB4 80049EB4 02000424 */  addiu      $a0, $zero, 0x2
    /* 39EB8 80049EB8 02006414 */  bne        $v1, $a0, .L80049EC4
    /* 39EBC 80049EBC 12000224 */   addiu     $v0, $zero, 0x12
    /* 39EC0 80049EC0 01000624 */  addiu      $a2, $zero, 0x1
  .L80049EC4:
    /* 39EC4 80049EC4 02006214 */  bne        $v1, $v0, .L80049ED0
    /* 39EC8 80049EC8 13000224 */   addiu     $v0, $zero, 0x13
    /* 39ECC 80049ECC 01000624 */  addiu      $a2, $zero, 0x1
  .L80049ED0:
    /* 39ED0 80049ED0 02006214 */  bne        $v1, $v0, .L80049EDC
    /* 39ED4 80049ED4 03000224 */   addiu     $v0, $zero, 0x3
    /* 39ED8 80049ED8 01000624 */  addiu      $a2, $zero, 0x1
  .L80049EDC:
    /* 39EDC 80049EDC 02006214 */  bne        $v1, $v0, .L80049EE8
    /* 39EE0 80049EE0 00000000 */   nop
    /* 39EE4 80049EE4 21300000 */  addu       $a2, $zero, $zero
  .L80049EE8:
    /* 39EE8 80049EE8 02006414 */  bne        $v1, $a0, .L80049EF4
    /* 39EEC 80049EEC 06000224 */   addiu     $v0, $zero, 0x6
    /* 39EF0 80049EF0 21300000 */  addu       $a2, $zero, $zero
  .L80049EF4:
    /* 39EF4 80049EF4 02006214 */  bne        $v1, $v0, .L80049F00
    /* 39EF8 80049EF8 07000224 */   addiu     $v0, $zero, 0x7
    /* 39EFC 80049EFC 21300000 */  addu       $a2, $zero, $zero
  .L80049F00:
    /* 39F00 80049F00 03006214 */  bne        $v1, $v0, .L80049F10
    /* 39F04 80049F04 2110C000 */   addu      $v0, $a2, $zero
    /* 39F08 80049F08 21300000 */  addu       $a2, $zero, $zero
    /* 39F0C 80049F0C 2110C000 */  addu       $v0, $a2, $zero
  .L80049F10:
    /* 39F10 80049F10 0800E003 */  jr         $ra
    /* 39F14 80049F14 00000000 */   nop
endlabel HealerItemOk__Fi
