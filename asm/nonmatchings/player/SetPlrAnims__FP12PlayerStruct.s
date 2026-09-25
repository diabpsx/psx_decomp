.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlrAnims__FP12PlayerStruct, 0x23C

glabel SetPlrAnims__FP12PlayerStruct
    /* 4FE54 8005FE54 1280023C */  lui        $v0, %hi(leveltype)
    /* 4FE58 8005FE58 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4FE5C 8005FE5C F6008580 */  lb         $a1, 0xF6($a0)
    /* 4FE60 8005FE60 18004014 */  bnez       $v0, .L8005FEC4
    /* 4FE64 8005FE64 40100500 */   sll       $v0, $a1, 1
    /* 4FE68 8005FE68 21104500 */  addu       $v0, $v0, $a1
    /* 4FE6C 8005FE6C 80100200 */  sll        $v0, $v0, 2
    /* 4FE70 8005FE70 23104500 */  subu       $v0, $v0, $a1
    /* 4FE74 8005FE74 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x7)
    /* 4FE78 8005FE78 21082200 */  addu       $at, $at, $v0
    /* 4FE7C 8005FE7C DFA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x7)($at)
    /* 4FE80 8005FE80 00000000 */  nop
    /* 4FE84 8005FE84 900183AC */  sw         $v1, 0x190($a0)
    /* 4FE88 8005FE88 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x8)
    /* 4FE8C 8005FE8C 21082200 */  addu       $at, $at, $v0
    /* 4FE90 8005FE90 E0A32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x8)($at)
    /* 4FE94 8005FE94 00000000 */  nop
    /* 4FE98 8005FE98 940183AC */  sw         $v1, 0x194($a0)
    /* 4FE9C 8005FE9C 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x4)
    /* 4FEA0 8005FEA0 21082200 */  addu       $at, $at, $v0
    /* 4FEA4 8005FEA4 DCA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x4)($at)
    /* 4FEA8 8005FEA8 00000000 */  nop
    /* 4FEAC 8005FEAC A80183AC */  sw         $v1, 0x1A8($a0)
    /* 4FEB0 8005FEB0 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x5)
    /* 4FEB4 8005FEB4 21082200 */  addu       $at, $at, $v0
    /* 4FEB8 8005FEB8 DDA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x5)($at)
    /* 4FEBC 8005FEBC DC7F0108 */  j          .L8005FF70
    /* 4FEC0 8005FEC0 9C0183AC */   sw        $v1, 0x19C($a0)
  .L8005FEC4:
    /* 4FEC4 8005FEC4 21104500 */  addu       $v0, $v0, $a1
    /* 4FEC8 8005FEC8 80100200 */  sll        $v0, $v0, 2
    /* 4FECC 8005FECC 23104500 */  subu       $v0, $v0, $a1
    /* 4FED0 8005FED0 0E80013C */  lui        $at, %hi(PlrGFXAnimLens)
    /* 4FED4 8005FED4 21082200 */  addu       $at, $at, $v0
    /* 4FED8 8005FED8 D8A32380 */  lb         $v1, %lo(PlrGFXAnimLens)($at)
    /* 4FEDC 8005FEDC 00000000 */  nop
    /* 4FEE0 8005FEE0 900183AC */  sw         $v1, 0x190($a0)
    /* 4FEE4 8005FEE4 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x2)
    /* 4FEE8 8005FEE8 21082200 */  addu       $at, $at, $v0
    /* 4FEEC 8005FEEC DAA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x2)($at)
    /* 4FEF0 8005FEF0 00000000 */  nop
    /* 4FEF4 8005FEF4 940183AC */  sw         $v1, 0x194($a0)
    /* 4FEF8 8005FEF8 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x1)
    /* 4FEFC 8005FEFC 21082200 */  addu       $at, $at, $v0
    /* 4FF00 8005FF00 D9A32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x1)($at)
    /* 4FF04 8005FF04 00000000 */  nop
    /* 4FF08 8005FF08 980183AC */  sw         $v1, 0x198($a0)
    /* 4FF0C 8005FF0C 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x6)
    /* 4FF10 8005FF10 21082200 */  addu       $at, $at, $v0
    /* 4FF14 8005FF14 DEA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x6)($at)
    /* 4FF18 8005FF18 00000000 */  nop
    /* 4FF1C 8005FF1C A40183AC */  sw         $v1, 0x1A4($a0)
    /* 4FF20 8005FF20 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x5)
    /* 4FF24 8005FF24 21082200 */  addu       $at, $at, $v0
    /* 4FF28 8005FF28 DDA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x5)($at)
    /* 4FF2C 8005FF2C 00000000 */  nop
    /* 4FF30 8005FF30 9C0183AC */  sw         $v1, 0x19C($a0)
    /* 4FF34 8005FF34 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x4)
    /* 4FF38 8005FF38 21082200 */  addu       $at, $at, $v0
    /* 4FF3C 8005FF3C DCA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x4)($at)
    /* 4FF40 8005FF40 00000000 */  nop
    /* 4FF44 8005FF44 A80183AC */  sw         $v1, 0x1A8($a0)
    /* 4FF48 8005FF48 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x3)
    /* 4FF4C 8005FF4C 21082200 */  addu       $at, $at, $v0
    /* 4FF50 8005FF50 DBA32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x3)($at)
    /* 4FF54 8005FF54 00000000 */  nop
    /* 4FF58 8005FF58 AC0183AC */  sw         $v1, 0x1AC($a0)
    /* 4FF5C 8005FF5C 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0x9)
    /* 4FF60 8005FF60 21082200 */  addu       $at, $at, $v0
    /* 4FF64 8005FF64 E1A32380 */  lb         $v1, %lo(PlrGFXAnimLens + 0x9)($at)
    /* 4FF68 8005FF68 00000000 */  nop
    /* 4FF6C 8005FF6C 8C0183AC */  sw         $v1, 0x18C($a0)
  .L8005FF70:
    /* 4FF70 8005FF70 0E80013C */  lui        $at, %hi(PlrGFXAnimLens + 0xA)
    /* 4FF74 8005FF74 21082200 */  addu       $at, $at, $v0
    /* 4FF78 8005FF78 E2A32280 */  lb         $v0, %lo(PlrGFXAnimLens + 0xA)($at)
    /* 4FF7C 8005FF7C 00000000 */  nop
    /* 4FF80 8005FF80 A00182AC */  sw         $v0, 0x1A0($a0)
    /* 4FF84 8005FF84 43008290 */  lbu        $v0, 0x43($a0)
    /* 4FF88 8005FF88 1700A014 */  bnez       $a1, .L8005FFE8
    /* 4FF8C 8005FF8C 0F004330 */   andi      $v1, $v0, 0xF
    /* 4FF90 8005FF90 04000224 */  addiu      $v0, $zero, 0x4
    /* 4FF94 8005FF94 09006214 */  bne        $v1, $v0, .L8005FFBC
    /* 4FF98 8005FF98 05000224 */   addiu     $v0, $zero, 0x5
    /* 4FF9C 8005FF9C 1280023C */  lui        $v0, %hi(leveltype)
    /* 4FFA0 8005FFA0 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4FFA4 8005FFA4 00000000 */  nop
    /* 4FFA8 8005FFA8 02004010 */  beqz       $v0, .L8005FFB4
    /* 4FFAC 8005FFAC 08000224 */   addiu     $v0, $zero, 0x8
    /* 4FFB0 8005FFB0 900182AC */  sw         $v0, 0x190($a0)
  .L8005FFB4:
    /* 4FFB4 8005FFB4 21800108 */  j          .L80060084
    /* 4FFB8 8005FFB8 0B000224 */   addiu     $v0, $zero, 0xB
  .L8005FFBC:
    /* 4FFBC 8005FFBC 04006214 */  bne        $v1, $v0, .L8005FFD0
    /* 4FFC0 8005FFC0 14000224 */   addiu     $v0, $zero, 0x14
    /* 4FFC4 8005FFC4 980182AC */  sw         $v0, 0x198($a0)
    /* 4FFC8 8005FFC8 21800108 */  j          .L80060084
    /* 4FFCC 8005FFCC 0A000224 */   addiu     $v0, $zero, 0xA
  .L8005FFD0:
    /* 4FFD0 8005FFD0 08000224 */  addiu      $v0, $zero, 0x8
    /* 4FFD4 8005FFD4 2C006214 */  bne        $v1, $v0, .L80060088
    /* 4FFD8 8005FFD8 10000224 */   addiu     $v0, $zero, 0x10
    /* 4FFDC 8005FFDC 980182AC */  sw         $v0, 0x198($a0)
    /* 4FFE0 8005FFE0 21800108 */  j          .L80060084
    /* 4FFE4 8005FFE4 0B000224 */   addiu     $v0, $zero, 0xB
  .L8005FFE8:
    /* 4FFE8 8005FFE8 01000624 */  addiu      $a2, $zero, 0x1
    /* 4FFEC 8005FFEC 1300A614 */  bne        $a1, $a2, .L8006003C
    /* 4FFF0 8005FFF0 02000224 */   addiu     $v0, $zero, 0x2
    /* 4FFF4 8005FFF4 05000224 */  addiu      $v0, $zero, 0x5
    /* 4FFF8 8005FFF8 04006214 */  bne        $v1, $v0, .L8006000C
    /* 4FFFC 8005FFFC 16000224 */   addiu     $v0, $zero, 0x16
    /* 50000 80060000 980182AC */  sw         $v0, 0x198($a0)
    /* 50004 80060004 21800108 */  j          .L80060084
    /* 50008 80060008 0D000224 */   addiu     $v0, $zero, 0xD
  .L8006000C:
    /* 5000C 8006000C 04000224 */  addiu      $v0, $zero, 0x4
    /* 50010 80060010 04006214 */  bne        $v1, $v0, .L80060024
    /* 50014 80060014 0C000224 */   addiu     $v0, $zero, 0xC
    /* 50018 80060018 980182AC */  sw         $v0, 0x198($a0)
    /* 5001C 8006001C 21800108 */  j          .L80060084
    /* 50020 80060020 07000224 */   addiu     $v0, $zero, 0x7
  .L80060024:
    /* 50024 80060024 08000224 */  addiu      $v0, $zero, 0x8
    /* 50028 80060028 17006214 */  bne        $v1, $v0, .L80060088
    /* 5002C 8006002C 10000224 */   addiu     $v0, $zero, 0x10
    /* 50030 80060030 980182AC */  sw         $v0, 0x198($a0)
    /* 50034 80060034 21800108 */  j          .L80060084
    /* 50038 80060038 0B000224 */   addiu     $v0, $zero, 0xB
  .L8006003C:
    /* 5003C 8006003C 1200A214 */  bne        $a1, $v0, .L80060088
    /* 50040 80060040 00000000 */   nop
    /* 50044 80060044 03006014 */  bnez       $v1, .L80060054
    /* 50048 80060048 14000224 */   addiu     $v0, $zero, 0x14
    /* 5004C 8006004C 22800108 */  j          .L80060088
    /* 50050 80060050 980182AC */   sw        $v0, 0x198($a0)
  .L80060054:
    /* 50054 80060054 03006614 */  bne        $v1, $a2, .L80060064
    /* 50058 80060058 04000224 */   addiu     $v0, $zero, 0x4
    /* 5005C 8006005C 21800108 */  j          .L80060084
    /* 50060 80060060 09000224 */   addiu     $v0, $zero, 0x9
  .L80060064:
    /* 50064 80060064 03006214 */  bne        $v1, $v0, .L80060074
    /* 50068 80060068 05000224 */   addiu     $v0, $zero, 0x5
    /* 5006C 8006006C 1F800108 */  j          .L8006007C
    /* 50070 80060070 14000224 */   addiu     $v0, $zero, 0x14
  .L80060074:
    /* 50074 80060074 04006214 */  bne        $v1, $v0, .L80060088
    /* 50078 80060078 18000224 */   addiu     $v0, $zero, 0x18
  .L8006007C:
    /* 5007C 8006007C 980182AC */  sw         $v0, 0x198($a0)
    /* 50080 80060080 10000224 */  addiu      $v0, $zero, 0x10
  .L80060084:
    /* 50084 80060084 8C0182AC */  sw         $v0, 0x18C($a0)
  .L80060088:
    /* 50088 80060088 0800E003 */  jr         $ra
    /* 5008C 8006008C 00000000 */   nop
endlabel SetPlrAnims__FP12PlayerStruct
