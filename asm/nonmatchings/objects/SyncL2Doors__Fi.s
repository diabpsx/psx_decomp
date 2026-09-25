.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncL2Doors__Fi, 0x168

glabel SyncL2Doors__Fi
    /* 4F0F4 8005F0F4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4F0F8 8005F0F8 40100400 */  sll        $v0, $a0, 1
    /* 4F0FC 8005F0FC 21104400 */  addu       $v0, $v0, $a0
    /* 4F100 8005F100 80100200 */  sll        $v0, $v0, 2
    /* 4F104 8005F104 23104400 */  subu       $v0, $v0, $a0
    /* 4F108 8005F108 80180200 */  sll        $v1, $v0, 2
    /* 4F10C 8005F10C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 4F110 8005F110 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F114 8005F114 21082300 */  addu       $at, $at, $v1
    /* 4F118 8005F118 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4F11C 8005F11C 00000000 */  nop
    /* 4F120 8005F120 06004014 */  bnez       $v0, .L8005F13C
    /* 4F124 8005F124 01000224 */   addiu     $v0, $zero, 0x1
    /* 4F128 8005F128 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 4F12C 8005F12C 21082300 */  addu       $at, $at, $v1
    /* 4F130 8005F130 748C20A0 */  sb         $zero, %lo(object + 0x28)($at)
    /* 4F134 8005F134 537C0108 */  j          .L8005F14C
    /* 4F138 8005F138 40100400 */   sll       $v0, $a0, 1
  .L8005F13C:
    /* 4F13C 8005F13C 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 4F140 8005F140 21082300 */  addu       $at, $at, $v1
    /* 4F144 8005F144 748C22A0 */  sb         $v0, %lo(object + 0x28)($at)
    /* 4F148 8005F148 40100400 */  sll        $v0, $a0, 1
  .L8005F14C:
    /* 4F14C 8005F14C 21104400 */  addu       $v0, $v0, $a0
    /* 4F150 8005F150 80100200 */  sll        $v0, $v0, 2
    /* 4F154 8005F154 23104400 */  subu       $v0, $v0, $a0
    /* 4F158 8005F158 80300200 */  sll        $a2, $v0, 2
    /* 4F15C 8005F15C 02000224 */  addiu      $v0, $zero, 0x2
    /* 4F160 8005F160 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4F164 8005F164 21082600 */  addu       $at, $at, $a2
    /* 4F168 8005F168 6B8C2780 */  lb         $a3, %lo(object + 0x1F)($at)
    /* 4F16C 8005F16C 2A000324 */  addiu      $v1, $zero, 0x2A
    /* 4F170 8005F170 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4F174 8005F174 21082600 */  addu       $at, $at, $a2
    /* 4F178 8005F178 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 4F17C 8005F17C 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F180 8005F180 21082600 */  addu       $at, $at, $a2
    /* 4F184 8005F184 6A8C2280 */  lb         $v0, %lo(object + 0x1E)($at)
    /* 4F188 8005F188 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4F18C 8005F18C 21082600 */  addu       $at, $at, $a2
    /* 4F190 8005F190 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4F194 8005F194 12004314 */  bne        $v0, $v1, .L8005F1E0
    /* 4F198 8005F198 40100400 */   sll       $v0, $a0, 1
    /* 4F19C 8005F19C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F1A0 8005F1A0 21082600 */  addu       $at, $at, $a2
    /* 4F1A4 8005F1A4 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4F1A8 8005F1A8 00000000 */  nop
    /* 4F1AC 8005F1AC 04004014 */  bnez       $v0, .L8005F1C0
    /* 4F1B0 8005F1B0 21184000 */   addu      $v1, $v0, $zero
    /* 4F1B4 8005F1B4 2120E000 */  addu       $a0, $a3, $zero
    /* 4F1B8 8005F1B8 917C0108 */  j          .L8005F244
    /* 4F1BC 8005F1BC 1A020624 */   addiu     $a2, $zero, 0x21A
  .L8005F1C0:
    /* 4F1C0 8005F1C0 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 4F1C4 8005F1C4 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 4F1C8 8005F1C8 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4F1CC 8005F1CC 03004010 */  beqz       $v0, .L8005F1DC
    /* 4F1D0 8005F1D0 0D000624 */   addiu     $a2, $zero, 0xD
    /* 4F1D4 8005F1D4 917C0108 */  j          .L8005F244
    /* 4F1D8 8005F1D8 2120E000 */   addu      $a0, $a3, $zero
  .L8005F1DC:
    /* 4F1DC 8005F1DC 40100400 */  sll        $v0, $a0, 1
  .L8005F1E0:
    /* 4F1E0 8005F1E0 21104400 */  addu       $v0, $v0, $a0
    /* 4F1E4 8005F1E4 80100200 */  sll        $v0, $v0, 2
    /* 4F1E8 8005F1E8 23104400 */  subu       $v0, $v0, $a0
    /* 4F1EC 8005F1EC 80300200 */  sll        $a2, $v0, 2
    /* 4F1F0 8005F1F0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F1F4 8005F1F4 21082600 */  addu       $at, $at, $a2
    /* 4F1F8 8005F1F8 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4F1FC 8005F1FC 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 4F200 8005F200 12006214 */  bne        $v1, $v0, .L8005F24C
    /* 4F204 8005F204 00000000 */   nop
    /* 4F208 8005F208 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F20C 8005F20C 21082600 */  addu       $at, $at, $a2
    /* 4F210 8005F210 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4F214 8005F214 00000000 */  nop
    /* 4F218 8005F218 04004014 */  bnez       $v0, .L8005F22C
    /* 4F21C 8005F21C 21184000 */   addu      $v1, $v0, $zero
    /* 4F220 8005F220 2120E000 */  addu       $a0, $a3, $zero
    /* 4F224 8005F224 917C0108 */  j          .L8005F244
    /* 4F228 8005F228 1C020624 */   addiu     $a2, $zero, 0x21C
  .L8005F22C:
    /* 4F22C 8005F22C FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 4F230 8005F230 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 4F234 8005F234 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4F238 8005F238 04004010 */  beqz       $v0, .L8005F24C
    /* 4F23C 8005F23C 2120E000 */   addu      $a0, $a3, $zero
    /* 4F240 8005F240 11000624 */  addiu      $a2, $zero, 0x11
  .L8005F244:
    /* 4F244 8005F244 D555010C */  jal        ObjSetMicro__Fiii
    /* 4F248 8005F248 00000000 */   nop
  .L8005F24C:
    /* 4F24C 8005F24C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 4F250 8005F250 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4F254 8005F254 0800E003 */  jr         $ra
    /* 4F258 8005F258 00000000 */   nop
endlabel SyncL2Doors__Fi
