.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoorObjPrint__FP12ObjectStructiiP7TextDati, 0x23C

glabel DoorObjPrint__FP12ObjectStructiiP7TextDati
    /* 6DF88 8007DF88 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6DF8C 8007DF8C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6DF90 8007DF90 21888000 */  addu       $s1, $a0, $zero
    /* 6DF94 8007DF94 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6DF98 8007DF98 2198A000 */  addu       $s3, $a1, $zero
    /* 6DF9C 8007DF9C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 6DFA0 8007DFA0 21A0C000 */  addu       $s4, $a2, $zero
    /* 6DFA4 8007DFA4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6DFA8 8007DFA8 2190E000 */  addu       $s2, $a3, $zero
    /* 6DFAC 8007DFAC 3800B6AF */  sw         $s6, 0x38($sp)
    /* 6DFB0 8007DFB0 5000B68F */  lw         $s6, 0x50($sp)
    /* 6DFB4 8007DFB4 21200000 */  addu       $a0, $zero, $zero
    /* 6DFB8 8007DFB8 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 6DFBC 8007DFBC 3400B5AF */  sw         $s5, 0x34($sp)
    /* 6DFC0 8007DFC0 044F020C */  jal        GM_UseTexData__Fi
    /* 6DFC4 8007DFC4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 6DFC8 8007DFC8 21400000 */  addu       $t0, $zero, $zero
    /* 6DFCC 8007DFCC 21A84000 */  addu       $s5, $v0, $zero
    /* 6DFD0 8007DFD0 1E002482 */  lb         $a0, 0x1E($s1)
    /* 6DFD4 8007DFD4 21002382 */  lb         $v1, 0x21($s1)
    /* 6DFD8 8007DFD8 14002686 */  lh         $a2, 0x14($s1)
    /* 6DFDC 8007DFDC C0100400 */  sll        $v0, $a0, 3
    /* 6DFE0 8007DFE0 21104400 */  addu       $v0, $v0, $a0
    /* 6DFE4 8007DFE4 40100200 */  sll        $v0, $v0, 1
    /* 6DFE8 8007DFE8 FFFF6924 */  addiu      $t1, $v1, -0x1
    /* 6DFEC 8007DFEC 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 6DFF0 8007DFF0 21082200 */  addu       $at, $at, $v0
    /* 6DFF4 8007DFF4 B1842280 */  lb         $v0, %lo(AllObjects + 0x1)($at)
    /* 6DFF8 8007DFF8 2A000324 */  addiu      $v1, $zero, 0x2A
    /* 6DFFC 8007DFFC 80100200 */  sll        $v0, $v0, 2
    /* 6E000 8007E000 1180013C */  lui        $at, %hi(ObjMasterLoadList)
    /* 6E004 8007E004 21082200 */  addu       $at, $at, $v0
    /* 6E008 8007E008 F0692584 */  lh         $a1, %lo(ObjMasterLoadList)($at)
    /* 6E00C 8007E00C 1B008310 */  beq        $a0, $v1, .L8007E07C
    /* 6E010 8007E010 21800000 */   addu      $s0, $zero, $zero
    /* 6E014 8007E014 2B008228 */  slti       $v0, $a0, 0x2B
    /* 6E018 8007E018 07004010 */  beqz       $v0, .L8007E038
    /* 6E01C 8007E01C 01000224 */   addiu     $v0, $zero, 0x1
    /* 6E020 8007E020 1A008210 */  beq        $a0, $v0, .L8007E08C
    /* 6E024 8007E024 02000224 */   addiu     $v0, $zero, 0x2
    /* 6E028 8007E028 11008210 */  beq        $a0, $v0, .L8007E070
    /* 6E02C 8007E02C 00000000 */   nop
    /* 6E030 8007E030 23F80108 */  j          .L8007E08C
    /* 6E034 8007E034 00000000 */   nop
  .L8007E038:
    /* 6E038 8007E038 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 6E03C 8007E03C 12008210 */  beq        $a0, $v0, .L8007E088
    /* 6E040 8007E040 4B008228 */   slti      $v0, $a0, 0x4B
    /* 6E044 8007E044 05004010 */  beqz       $v0, .L8007E05C
    /* 6E048 8007E048 2B000224 */   addiu     $v0, $zero, 0x2B
    /* 6E04C 8007E04C 0A008210 */  beq        $a0, $v0, .L8007E078
    /* 6E050 8007E050 00000000 */   nop
    /* 6E054 8007E054 23F80108 */  j          .L8007E08C
    /* 6E058 8007E058 00000000 */   nop
  .L8007E05C:
    /* 6E05C 8007E05C 4B000224 */  addiu      $v0, $zero, 0x4B
    /* 6E060 8007E060 08008210 */  beq        $a0, $v0, .L8007E084
    /* 6E064 8007E064 00000000 */   nop
    /* 6E068 8007E068 23F80108 */  j          .L8007E08C
    /* 6E06C 8007E06C 00000000 */   nop
  .L8007E070:
    /* 6E070 8007E070 23F80108 */  j          .L8007E08C
    /* 6E074 8007E074 01000824 */   addiu     $t0, $zero, 0x1
  .L8007E078:
    /* 6E078 8007E078 01000824 */  addiu      $t0, $zero, 0x1
  .L8007E07C:
    /* 6E07C 8007E07C 23F80108 */  j          .L8007E08C
    /* 6E080 8007E080 01001024 */   addiu     $s0, $zero, 0x1
  .L8007E084:
    /* 6E084 8007E084 01000824 */  addiu      $t0, $zero, 0x1
  .L8007E088:
    /* 6E088 8007E088 02001024 */  addiu      $s0, $zero, 0x2
  .L8007E08C:
    /* 6E08C 8007E08C 0200C014 */  bnez       $a2, .L8007E098
    /* 6E090 8007E090 21204002 */   addu      $a0, $s2, $zero
    /* 6E094 8007E094 02000835 */  ori        $t0, $t0, 0x2
  .L8007E098:
    /* 6E098 8007E098 21300000 */  addu       $a2, $zero, $zero
    /* 6E09C 8007E09C 21380000 */  addu       $a3, $zero, $zero
    /* 6E0A0 8007E0A0 00811000 */  sll        $s0, $s0, 4
    /* 6E0A4 8007E0A4 80100800 */  sll        $v0, $t0, 2
    /* 6E0A8 8007E0A8 0E80033C */  lui        $v1, %hi(DoorOffsets)
    /* 6E0AC 8007E0AC 6C3B6324 */  addiu      $v1, $v1, %lo(DoorOffsets)
    /* 6E0B0 8007E0B0 21104300 */  addu       $v0, $v0, $v1
    /* 6E0B4 8007E0B4 21800202 */  addu       $s0, $s0, $v0
    /* 6E0B8 8007E0B8 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6E0BC 8007E0BC 1000A9AF */   sw        $t1, 0x10($sp)
    /* 6E0C0 8007E0C0 00000682 */  lb         $a2, 0x0($s0)
    /* 6E0C4 8007E0C4 01000782 */  lb         $a3, 0x1($s0)
    /* 6E0C8 8007E0C8 21204002 */  addu       $a0, $s2, $zero
    /* 6E0CC 8007E0CC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6E0D0 8007E0D0 02000382 */  lb         $v1, 0x2($s0)
    /* 6E0D4 8007E0D4 21284000 */  addu       $a1, $v0, $zero
    /* 6E0D8 8007E0D8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6E0DC 8007E0DC 21306602 */  addu       $a2, $s3, $a2
    /* 6E0E0 8007E0E0 21388702 */  addu       $a3, $s4, $a3
    /* 6E0E4 8007E0E4 2118C302 */  addu       $v1, $s6, $v1
    /* 6E0E8 8007E0E8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6E0EC 8007E0EC 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6E0F0 8007E0F0 14002386 */  lh         $v1, 0x14($s1)
    /* 6E0F4 8007E0F4 00000000 */  nop
    /* 6E0F8 8007E0F8 24006010 */  beqz       $v1, .L8007E18C
    /* 6E0FC 8007E0FC 21804000 */   addu      $s0, $v0, $zero
    /* 6E100 8007E100 1E002482 */  lb         $a0, 0x1E($s1)
    /* 6E104 8007E104 02000224 */  addiu      $v0, $zero, 0x2
    /* 6E108 8007E108 13008210 */  beq        $a0, $v0, .L8007E158
    /* 6E10C 8007E10C 03008228 */   slti      $v0, $a0, 0x3
    /* 6E110 8007E110 05004010 */  beqz       $v0, .L8007E128
    /* 6E114 8007E114 01000224 */   addiu     $v0, $zero, 0x1
    /* 6E118 8007E118 0A008210 */  beq        $a0, $v0, .L8007E144
    /* 6E11C 8007E11C 00000000 */   nop
    /* 6E120 8007E120 63F80108 */  j          .L8007E18C
    /* 6E124 8007E124 00000000 */   nop
  .L8007E128:
    /* 6E128 8007E128 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 6E12C 8007E12C 0A008210 */  beq        $a0, $v0, .L8007E158
    /* 6E130 8007E130 4B000224 */   addiu     $v0, $zero, 0x4B
    /* 6E134 8007E134 0F008210 */  beq        $a0, $v0, .L8007E174
    /* 6E138 8007E138 00000000 */   nop
    /* 6E13C 8007E13C 63F80108 */  j          .L8007E18C
    /* 6E140 8007E140 00000000 */   nop
  .L8007E144:
    /* 6E144 8007E144 0A000296 */  lhu        $v0, 0xA($s0)
    /* 6E148 8007E148 1A000396 */  lhu        $v1, 0x1A($s0)
    /* 6E14C 8007E14C ECFF4224 */  addiu      $v0, $v0, -0x14
    /* 6E150 8007E150 5AF80108 */  j          .L8007E168
    /* 6E154 8007E154 ECFF6324 */   addiu     $v1, $v1, -0x14
  .L8007E158:
    /* 6E158 8007E158 0A000296 */  lhu        $v0, 0xA($s0)
    /* 6E15C 8007E15C 1A000396 */  lhu        $v1, 0x1A($s0)
    /* 6E160 8007E160 14004224 */  addiu      $v0, $v0, 0x14
    /* 6E164 8007E164 14006324 */  addiu      $v1, $v1, 0x14
  .L8007E168:
    /* 6E168 8007E168 0A0002A6 */  sh         $v0, 0xA($s0)
    /* 6E16C 8007E16C 63F80108 */  j          .L8007E18C
    /* 6E170 8007E170 1A0003A6 */   sh        $v1, 0x1A($s0)
  .L8007E174:
    /* 6E174 8007E174 12000296 */  lhu        $v0, 0x12($s0)
    /* 6E178 8007E178 22000396 */  lhu        $v1, 0x22($s0)
    /* 6E17C 8007E17C 14004224 */  addiu      $v0, $v0, 0x14
    /* 6E180 8007E180 14006324 */  addiu      $v1, $v1, 0x14
    /* 6E184 8007E184 120002A6 */  sh         $v0, 0x12($s0)
    /* 6E188 8007E188 220003A6 */  sh         $v1, 0x22($s0)
  .L8007E18C:
    /* 6E18C 8007E18C 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 6E190 8007E190 2120A002 */   addu      $a0, $s5, $zero
    /* 6E194 8007E194 21100002 */  addu       $v0, $s0, $zero
    /* 6E198 8007E198 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 6E19C 8007E19C 3800B68F */  lw         $s6, 0x38($sp)
    /* 6E1A0 8007E1A0 3400B58F */  lw         $s5, 0x34($sp)
    /* 6E1A4 8007E1A4 3000B48F */  lw         $s4, 0x30($sp)
    /* 6E1A8 8007E1A8 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 6E1AC 8007E1AC 2800B28F */  lw         $s2, 0x28($sp)
    /* 6E1B0 8007E1B0 2400B18F */  lw         $s1, 0x24($sp)
    /* 6E1B4 8007E1B4 2000B08F */  lw         $s0, 0x20($sp)
    /* 6E1B8 8007E1B8 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6E1BC 8007E1BC 0800E003 */  jr         $ra
    /* 6E1C0 8007E1C0 00000000 */   nop
endlabel DoorObjPrint__FP12ObjectStructiiP7TextDati
