.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreatePlrItems__Fi, 0x560

glabel CreatePlrItems__Fi
    /* 2FEAC 8003FEAC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 2FEB0 8003FEB0 2400B3AF */  sw         $s3, 0x24($sp)
    /* 2FEB4 8003FEB4 21988000 */  addu       $s3, $a0, $zero
    /* 2FEB8 8003FEB8 40101300 */  sll        $v0, $s3, 1
    /* 2FEBC 8003FEBC 21105300 */  addu       $v0, $v0, $s3
    /* 2FEC0 8003FEC0 80100200 */  sll        $v0, $v0, 2
    /* 2FEC4 8003FEC4 21105300 */  addu       $v0, $v0, $s3
    /* 2FEC8 8003FEC8 00110200 */  sll        $v0, $v0, 4
    /* 2FECC 8003FECC 23105300 */  subu       $v0, $v0, $s3
    /* 2FED0 8003FED0 80100200 */  sll        $v0, $v0, 2
    /* 2FED4 8003FED4 21105300 */  addu       $v0, $v0, $s3
    /* 2FED8 8003FED8 C0100200 */  sll        $v0, $v0, 3
    /* 2FEDC 8003FEDC 0E80033C */  lui        $v1, %hi(plr + 0x1B0)
    /* 2FEE0 8003FEE0 E8A66324 */  addiu      $v1, $v1, %lo(plr + 0x1B0)
    /* 2FEE4 8003FEE4 21104300 */  addu       $v0, $v0, $v1
    /* 2FEE8 8003FEE8 06000324 */  addiu      $v1, $zero, 0x6
    /* 2FEEC 8003FEEC FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 2FEF0 8003FEF0 3000BFAF */  sw         $ra, 0x30($sp)
    /* 2FEF4 8003FEF4 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 2FEF8 8003FEF8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 2FEFC 8003FEFC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 2FF00 8003FF00 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 2FF04 8003FF04 1800B0AF */  sw         $s0, 0x18($sp)
  .L8003FF08:
    /* 2FF08 8003FF08 2C0044A4 */  sh         $a0, 0x2C($v0)
    /* 2FF0C 8003FF0C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 2FF10 8003FF10 FDFF6414 */  bne        $v1, $a0, .L8003FF08
    /* 2FF14 8003FF14 6C004224 */   addiu     $v0, $v0, 0x6C
    /* 2FF18 8003FF18 40801300 */  sll        $s0, $s3, 1
    /* 2FF1C 8003FF1C 21801302 */  addu       $s0, $s0, $s3
    /* 2FF20 8003FF20 80801000 */  sll        $s0, $s0, 2
    /* 2FF24 8003FF24 21801302 */  addu       $s0, $s0, $s3
    /* 2FF28 8003FF28 00811000 */  sll        $s0, $s0, 4
    /* 2FF2C 8003FF2C 23801302 */  subu       $s0, $s0, $s3
    /* 2FF30 8003FF30 80801000 */  sll        $s0, $s0, 2
    /* 2FF34 8003FF34 21801302 */  addu       $s0, $s0, $s3
    /* 2FF38 8003FF38 C0801000 */  sll        $s0, $s0, 3
    /* 2FF3C 8003FF3C 0E80113C */  lui        $s1, %hi(plr + 0x1588)
    /* 2FF40 8003FF40 C0BA3126 */  addiu      $s1, $s1, %lo(plr + 0x1588)
    /* 2FF44 8003FF44 21201102 */  addu       $a0, $s0, $s1
    /* 2FF48 8003FF48 21280000 */  addu       $a1, $zero, $zero
    /* 2FF4C 8003FF4C E940000C */  jal        memset
    /* 2FF50 8003FF50 28000624 */   addiu     $a2, $zero, 0x28
    /* 2FF54 8003FF54 1CEF3126 */  addiu      $s1, $s1, -0x10E4
    /* 2FF58 8003FF58 21101102 */  addu       $v0, $s0, $s1
    /* 2FF5C 8003FF5C 27000324 */  addiu      $v1, $zero, 0x27
    /* 2FF60 8003FF60 FFFF0424 */  addiu      $a0, $zero, -0x1
  .L8003FF64:
    /* 2FF64 8003FF64 2C0044A4 */  sh         $a0, 0x2C($v0)
    /* 2FF68 8003FF68 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 2FF6C 8003FF6C FDFF6414 */  bne        $v1, $a0, .L8003FF64
    /* 2FF70 8003FF70 6C004224 */   addiu     $v0, $v0, 0x6C
    /* 2FF74 8003FF74 40101300 */  sll        $v0, $s3, 1
    /* 2FF78 8003FF78 21105300 */  addu       $v0, $v0, $s3
    /* 2FF7C 8003FF7C 80100200 */  sll        $v0, $v0, 2
    /* 2FF80 8003FF80 21105300 */  addu       $v0, $v0, $s3
    /* 2FF84 8003FF84 00110200 */  sll        $v0, $v0, 4
    /* 2FF88 8003FF88 23105300 */  subu       $v0, $v0, $s3
    /* 2FF8C 8003FF8C 80100200 */  sll        $v0, $v0, 2
    /* 2FF90 8003FF90 21105300 */  addu       $v0, $v0, $s3
    /* 2FF94 8003FF94 C0100200 */  sll        $v0, $v0, 3
    /* 2FF98 8003FF98 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2FF9C 8003FF9C 21082200 */  addu       $at, $at, $v0
    /* 2FFA0 8003FFA0 BCBA20AC */  sw         $zero, %lo(plr + 0x1584)($at)
    /* 2FFA4 8003FFA4 0E80033C */  lui        $v1, %hi(plr + 0x15B0)
    /* 2FFA8 8003FFA8 E8BA6324 */  addiu      $v1, $v1, %lo(plr + 0x15B0)
    /* 2FFAC 8003FFAC 21104300 */  addu       $v0, $v0, $v1
    /* 2FFB0 8003FFB0 07000324 */  addiu      $v1, $zero, 0x7
    /* 2FFB4 8003FFB4 FFFF0424 */  addiu      $a0, $zero, -0x1
  .L8003FFB8:
    /* 2FFB8 8003FFB8 2C0044A4 */  sh         $a0, 0x2C($v0)
    /* 2FFBC 8003FFBC FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 2FFC0 8003FFC0 FDFF6414 */  bne        $v1, $a0, .L8003FFB8
    /* 2FFC4 8003FFC4 6C004224 */   addiu     $v0, $v0, 0x6C
    /* 2FFC8 8003FFC8 40101300 */  sll        $v0, $s3, 1
    /* 2FFCC 8003FFCC 21105300 */  addu       $v0, $v0, $s3
    /* 2FFD0 8003FFD0 80100200 */  sll        $v0, $v0, 2
    /* 2FFD4 8003FFD4 21105300 */  addu       $v0, $v0, $s3
    /* 2FFD8 8003FFD8 00110200 */  sll        $v0, $v0, 4
    /* 2FFDC 8003FFDC 23105300 */  subu       $v0, $v0, $s3
    /* 2FFE0 8003FFE0 80100200 */  sll        $v0, $v0, 2
    /* 2FFE4 8003FFE4 21105300 */  addu       $v0, $v0, $s3
    /* 2FFE8 8003FFE8 C0A00200 */  sll        $s4, $v0, 3
    /* 2FFEC 8003FFEC 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2FFF0 8003FFF0 21083400 */  addu       $at, $at, $s4
    /* 2FFF4 8003FFF4 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2FFF8 8003FFF8 01001524 */  addiu      $s5, $zero, 0x1
    /* 2FFFC 8003FFFC 33007510 */  beq        $v1, $s5, .L800400CC
    /* 30000 80040000 02006228 */   slti      $v0, $v1, 0x2
    /* 30004 80040004 05004010 */  beqz       $v0, .L8004001C
    /* 30008 80040008 00000000 */   nop
    /* 3000C 8004000C 08006010 */  beqz       $v1, .L80040030
    /* 30010 80040010 00000000 */   nop
    /* 30014 80040014 5E000108 */  j          .L80040178
    /* 30018 80040018 00000000 */   nop
  .L8004001C:
    /* 3001C 8004001C 02000224 */  addiu      $v0, $zero, 0x2
    /* 30020 80040020 3E006210 */  beq        $v1, $v0, .L8004011C
    /* 30024 80040024 00000000 */   nop
    /* 30028 80040028 5E000108 */  j          .L80040178
    /* 3002C 8004002C 00000000 */   nop
  .L80040030:
    /* 30030 80040030 0E80113C */  lui        $s1, %hi(plr + 0x1B0)
    /* 30034 80040034 E8A63126 */  addiu      $s1, $s1, %lo(plr + 0x1B0)
    /* 30038 80040038 21809102 */  addu       $s0, $s4, $s1
    /* 3003C 8004003C B0011226 */  addiu      $s2, $s0, 0x1B0
    /* 30040 80040040 21204002 */  addu       $a0, $s2, $zero
    /* 30044 80040044 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 30048 80040048 01000524 */   addiu     $a1, $zero, 0x1
    /* 3004C 8004004C 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 30050 80040050 21204002 */   addu      $a0, $s2, $zero
    /* 30054 80040054 1C021026 */  addiu      $s0, $s0, 0x21C
    /* 30058 80040058 21200002 */  addu       $a0, $s0, $zero
    /* 3005C 8004005C F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 30060 80040060 02000524 */   addiu     $a1, $zero, 0x2
    /* 30064 80040064 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 30068 80040068 21200002 */   addu      $a0, $s0, $zero
    /* 3006C 8004006C 60173026 */  addiu      $s0, $s1, 0x1760
    /* 30070 80040070 21809002 */  addu       $s0, $s4, $s0
    /* 30074 80040074 21200002 */  addu       $a0, $s0, $zero
    /* 30078 80040078 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 3007C 8004007C 03000524 */   addiu     $a1, $zero, 0x3
    /* 30080 80040080 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 30084 80040084 21200002 */   addu      $a0, $s0, $zero
    /* 30088 80040088 1000B5AF */  sw         $s5, 0x10($sp)
    /* 3008C 8004008C 21206002 */  addu       $a0, $s3, $zero
    /* 30090 80040090 21280000 */  addu       $a1, $zero, $zero
    /* 30094 80040094 01000624 */  addiu      $a2, $zero, 0x1
    /* 30098 80040098 C967050C */  jal        func_80159F24
    /* 3009C 8004009C 03000724 */   addiu     $a3, $zero, 0x3
    /* 300A0 800400A0 00143126 */  addiu      $s1, $s1, 0x1400
    /* 300A4 800400A4 21889102 */  addu       $s1, $s4, $s1
    /* 300A8 800400A8 21202002 */  addu       $a0, $s1, $zero
    /* 300AC 800400AC F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 300B0 800400B0 18000524 */   addiu     $a1, $zero, 0x18
    /* 300B4 800400B4 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 300B8 800400B8 21202002 */   addu      $a0, $s1, $zero
    /* 300BC 800400BC 6C003126 */  addiu      $s1, $s1, 0x6C
    /* 300C0 800400C0 21202002 */  addu       $a0, $s1, $zero
    /* 300C4 800400C4 5A000108 */  j          .L80040168
    /* 300C8 800400C8 18000524 */   addiu     $a1, $zero, 0x18
  .L800400CC:
    /* 300CC 800400CC 0E80113C */  lui        $s1, %hi(plr + 0x1B0)
    /* 300D0 800400D0 E8A63126 */  addiu      $s1, $s1, %lo(plr + 0x1B0)
    /* 300D4 800400D4 21809102 */  addu       $s0, $s4, $s1
    /* 300D8 800400D8 B0011026 */  addiu      $s0, $s0, 0x1B0
    /* 300DC 800400DC 21200002 */  addu       $a0, $s0, $zero
    /* 300E0 800400E0 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 300E4 800400E4 04000524 */   addiu     $a1, $zero, 0x4
    /* 300E8 800400E8 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 300EC 800400EC 21200002 */   addu      $a0, $s0, $zero
    /* 300F0 800400F0 00143126 */  addiu      $s1, $s1, 0x1400
    /* 300F4 800400F4 21889102 */  addu       $s1, $s4, $s1
    /* 300F8 800400F8 21202002 */  addu       $a0, $s1, $zero
    /* 300FC 800400FC F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 30100 80040100 18000524 */   addiu     $a1, $zero, 0x18
    /* 30104 80040104 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 30108 80040108 21202002 */   addu      $a0, $s1, $zero
    /* 3010C 8004010C 6C003126 */  addiu      $s1, $s1, 0x6C
    /* 30110 80040110 21202002 */  addu       $a0, $s1, $zero
    /* 30114 80040114 5A000108 */  j          .L80040168
    /* 30118 80040118 18000524 */   addiu     $a1, $zero, 0x18
  .L8004011C:
    /* 3011C 8004011C 0E80113C */  lui        $s1, %hi(plr + 0x1B0)
    /* 30120 80040120 E8A63126 */  addiu      $s1, $s1, %lo(plr + 0x1B0)
    /* 30124 80040124 21809102 */  addu       $s0, $s4, $s1
    /* 30128 80040128 B0011026 */  addiu      $s0, $s0, 0x1B0
    /* 3012C 8004012C 21200002 */  addu       $a0, $s0, $zero
    /* 30130 80040130 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 30134 80040134 05000524 */   addiu     $a1, $zero, 0x5
    /* 30138 80040138 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 3013C 8004013C 21200002 */   addu      $a0, $s0, $zero
    /* 30140 80040140 00143126 */  addiu      $s1, $s1, 0x1400
    /* 30144 80040144 21889102 */  addu       $s1, $s4, $s1
    /* 30148 80040148 21202002 */  addu       $a0, $s1, $zero
    /* 3014C 8004014C F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 30150 80040150 19000524 */   addiu     $a1, $zero, 0x19
    /* 30154 80040154 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 30158 80040158 21202002 */   addu      $a0, $s1, $zero
    /* 3015C 8004015C 6C003126 */  addiu      $s1, $s1, 0x6C
    /* 30160 80040160 21202002 */  addu       $a0, $s1, $zero
    /* 30164 80040164 19000524 */  addiu      $a1, $zero, 0x19
  .L80040168:
    /* 30168 80040168 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 3016C 8004016C 00000000 */   nop
    /* 30170 80040170 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 30174 80040174 21202002 */   addu      $a0, $s1, $zero
  .L80040178:
    /* 30178 80040178 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 3017C 8004017C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 30180 80040180 00000000 */  nop
    /* 30184 80040184 42004010 */  beqz       $v0, .L80040290
    /* 30188 80040188 22000524 */   addiu     $a1, $zero, 0x22
    /* 3018C 8004018C 21200000 */  addu       $a0, $zero, $zero
    /* 30190 80040190 A704010C */  jal        GetItemAttrs__Fiii
    /* 30194 80040194 01000624 */   addiu     $a2, $zero, 0x1
    /* 30198 80040198 40101300 */  sll        $v0, $s3, 1
    /* 3019C 8004019C 21105300 */  addu       $v0, $v0, $s3
    /* 301A0 800401A0 80100200 */  sll        $v0, $v0, 2
    /* 301A4 800401A4 21105300 */  addu       $v0, $v0, $s3
    /* 301A8 800401A8 00110200 */  sll        $v0, $v0, 4
    /* 301AC 800401AC 23105300 */  subu       $v0, $v0, $s3
    /* 301B0 800401B0 80100200 */  sll        $v0, $v0, 2
    /* 301B4 800401B4 21105300 */  addu       $v0, $v0, $s3
    /* 301B8 800401B8 C0100200 */  sll        $v0, $v0, 3
    /* 301BC 800401BC 0E80033C */  lui        $v1, %hi(plr + 0x1688)
    /* 301C0 800401C0 C0BB6324 */  addiu      $v1, $v1, %lo(plr + 0x1688)
    /* 301C4 800401C4 21384300 */  addu       $a3, $v0, $v1
    /* 301C8 800401C8 0D80063C */  lui        $a2, %hi(item)
    /* 301CC 800401CC 541DC624 */  addiu      $a2, $a2, %lo(item)
    /* 301D0 800401D0 6000C824 */  addiu      $t0, $a2, 0x60
  .L800401D4:
    /* 301D4 800401D4 0000C28C */  lw         $v0, 0x0($a2)
    /* 301D8 800401D8 0400C38C */  lw         $v1, 0x4($a2)
    /* 301DC 800401DC 0800C48C */  lw         $a0, 0x8($a2)
    /* 301E0 800401E0 0C00C58C */  lw         $a1, 0xC($a2)
    /* 301E4 800401E4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 301E8 800401E8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 301EC 800401EC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 301F0 800401F0 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 301F4 800401F4 1000C624 */  addiu      $a2, $a2, 0x10
    /* 301F8 800401F8 F6FFC814 */  bne        $a2, $t0, .L800401D4
    /* 301FC 800401FC 1000E724 */   addiu     $a3, $a3, 0x10
    /* 30200 80040200 0000C28C */  lw         $v0, 0x0($a2)
    /* 30204 80040204 0400C38C */  lw         $v1, 0x4($a2)
    /* 30208 80040208 0800C48C */  lw         $a0, 0x8($a2)
    /* 3020C 8004020C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 30210 80040210 0400E3AC */  sw         $v1, 0x4($a3)
    /* 30214 80040214 0800E4AC */  sw         $a0, 0x8($a3)
    /* 30218 80040218 40101300 */  sll        $v0, $s3, 1
    /* 3021C 8004021C 21105300 */  addu       $v0, $v0, $s3
    /* 30220 80040220 80100200 */  sll        $v0, $v0, 2
    /* 30224 80040224 21105300 */  addu       $v0, $v0, $s3
    /* 30228 80040228 00110200 */  sll        $v0, $v0, 4
    /* 3022C 8004022C 23105300 */  subu       $v0, $v0, $s3
    /* 30230 80040230 80100200 */  sll        $v0, $v0, 2
    /* 30234 80040234 21105300 */  addu       $v0, $v0, $s3
    /* 30238 80040238 C0100200 */  sll        $v0, $v0, 3
    /* 3023C 8004023C 0E80103C */  lui        $s0, %hi(plr + 0x1688)
    /* 30240 80040240 C0BB1026 */  addiu      $s0, $s0, %lo(plr + 0x1688)
    /* 30244 80040244 21805000 */  addu       $s0, $v0, $s0
    /* 30248 80040248 21200002 */  addu       $a0, $s0, $zero
    /* 3024C 8004024C 01000324 */  addiu      $v1, $zero, 0x1
    /* 30250 80040250 0E80013C */  lui        $at, %hi(plr + 0x16EE)
    /* 30254 80040254 21082200 */  addu       $at, $at, $v0
    /* 30258 80040258 26BC23A0 */  sb         $v1, %lo(plr + 0x16EE)($at)
    /* 3025C 8004025C 1280063C */  lui        $a2, %hi(FePlayerNo)
    /* 30260 80040260 78B3C68C */  lw         $a2, %lo(FePlayerNo)($a2)
    /* 30264 80040264 01000324 */  addiu      $v1, $zero, 0x1
    /* 30268 80040268 0E80013C */  lui        $at, %hi(plr + 0x16AC)
    /* 3026C 8004026C 21082200 */  addu       $at, $at, $v0
    /* 30270 80040270 E4BB23A4 */  sh         $v1, %lo(plr + 0x16AC)($at)
    /* 30274 80040274 0E80013C */  lui        $at, %hi(plr + 0x16ED)
    /* 30278 80040278 21082200 */  addu       $at, $at, $v0
    /* 3027C 8004027C 25BC26A0 */  sb         $a2, %lo(plr + 0x16ED)($at)
    /* 30280 80040280 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 30284 80040284 22000524 */   addiu     $a1, $zero, 0x22
    /* 30288 80040288 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 3028C 8004028C 21200002 */   addu      $a0, $s0, $zero
  .L80040290:
    /* 30290 80040290 40801300 */  sll        $s0, $s3, 1
    /* 30294 80040294 21801302 */  addu       $s0, $s0, $s3
    /* 30298 80040298 80801000 */  sll        $s0, $s0, 2
    /* 3029C 8004029C 21801302 */  addu       $s0, $s0, $s3
    /* 302A0 800402A0 00811000 */  sll        $s0, $s0, 4
    /* 302A4 800402A4 23801302 */  subu       $s0, $s0, $s3
    /* 302A8 800402A8 80801000 */  sll        $s0, $s0, 2
    /* 302AC 800402AC 21801302 */  addu       $s0, $s0, $s3
    /* 302B0 800402B0 C0801000 */  sll        $s0, $s0, 3
    /* 302B4 800402B4 0E80123C */  lui        $s2, %hi(plr + 0x1910)
    /* 302B8 800402B8 48BE5226 */  addiu      $s2, $s2, %lo(plr + 0x1910)
    /* 302BC 800402BC 21881202 */  addu       $s1, $s0, $s2
    /* 302C0 800402C0 21202002 */  addu       $a0, $s1, $zero
    /* 302C4 800402C4 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 302C8 800402C8 21280000 */   addu      $a1, $zero, $zero
    /* 302CC 800402CC 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 302D0 800402D0 21202002 */   addu      $a0, $s1, $zero
    /* 302D4 800402D4 60002726 */  addiu      $a3, $s1, 0x60
    /* 302D8 800402D8 64000224 */  addiu      $v0, $zero, 0x64
    /* 302DC 800402DC 0E80013C */  lui        $at, %hi(plr + 0x1924)
    /* 302E0 800402E0 21083000 */  addu       $at, $at, $s0
    /* 302E4 800402E4 5CBE22AC */  sw         $v0, %lo(plr + 0x1924)($at)
    /* 302E8 800402E8 04000224 */  addiu      $v0, $zero, 0x4
    /* 302EC 800402EC 94EB5226 */  addiu      $s2, $s2, -0x146C
    /* 302F0 800402F0 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 302F4 800402F4 21083000 */  addu       $at, $at, $s0
    /* 302F8 800402F8 BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 302FC 800402FC 21901202 */  addu       $s2, $s0, $s2
    /* 30300 80040300 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 30304 80040304 21083000 */  addu       $at, $at, $s0
    /* 30308 80040308 94BE22A0 */  sb         $v0, %lo(plr + 0x195C)($at)
    /* 3030C 8004030C C0100300 */  sll        $v0, $v1, 3
    /* 30310 80040310 23104300 */  subu       $v0, $v0, $v1
    /* 30314 80040314 80100200 */  sll        $v0, $v0, 2
    /* 30318 80040318 23104300 */  subu       $v0, $v0, $v1
    /* 3031C 8004031C 80100200 */  sll        $v0, $v0, 2
    /* 30320 80040320 0E80013C */  lui        $at, %hi(plr + 0x1924)
    /* 30324 80040324 21083000 */  addu       $at, $at, $s0
    /* 30328 80040328 5CBE238C */  lw         $v1, %lo(plr + 0x1924)($at)
    /* 3032C 8004032C 21305200 */  addu       $a2, $v0, $s2
    /* 30330 80040330 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 30334 80040334 21083000 */  addu       $at, $at, $s0
    /* 30338 80040338 88A623AC */  sw         $v1, %lo(plr + 0x150)($at)
  .L8004033C:
    /* 3033C 8004033C 0000228E */  lw         $v0, 0x0($s1)
    /* 30340 80040340 0400238E */  lw         $v1, 0x4($s1)
    /* 30344 80040344 0800248E */  lw         $a0, 0x8($s1)
    /* 30348 80040348 0C00258E */  lw         $a1, 0xC($s1)
    /* 3034C 8004034C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 30350 80040350 0400C3AC */  sw         $v1, 0x4($a2)
    /* 30354 80040354 0800C4AC */  sw         $a0, 0x8($a2)
    /* 30358 80040358 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3035C 8004035C 10003126 */  addiu      $s1, $s1, 0x10
    /* 30360 80040360 F6FF2716 */  bne        $s1, $a3, .L8004033C
    /* 30364 80040364 1000C624 */   addiu     $a2, $a2, 0x10
    /* 30368 80040368 0000228E */  lw         $v0, 0x0($s1)
    /* 3036C 8004036C 0400238E */  lw         $v1, 0x4($s1)
    /* 30370 80040370 0800248E */  lw         $a0, 0x8($s1)
    /* 30374 80040374 0000C2AC */  sw         $v0, 0x0($a2)
    /* 30378 80040378 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3037C 8004037C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 30380 80040380 40101300 */  sll        $v0, $s3, 1
    /* 30384 80040384 21105300 */  addu       $v0, $v0, $s3
    /* 30388 80040388 80100200 */  sll        $v0, $v0, 2
    /* 3038C 8004038C 21105300 */  addu       $v0, $v0, $s3
    /* 30390 80040390 00110200 */  sll        $v0, $v0, 4
    /* 30394 80040394 23105300 */  subu       $v0, $v0, $s3
    /* 30398 80040398 80100200 */  sll        $v0, $v0, 2
    /* 3039C 8004039C 21105300 */  addu       $v0, $v0, $s3
    /* 303A0 800403A0 C0100200 */  sll        $v0, $v0, 3
    /* 303A4 800403A4 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 303A8 800403A8 21082200 */  addu       $at, $at, $v0
    /* 303AC 800403AC BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 303B0 800403B0 21206002 */  addu       $a0, $s3, $zero
    /* 303B4 800403B4 01006324 */  addiu      $v1, $v1, 0x1
    /* 303B8 800403B8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 303BC 800403BC 21082200 */  addu       $at, $at, $v0
    /* 303C0 800403C0 BCBA23AC */  sw         $v1, %lo(plr + 0x1584)($at)
    /* 303C4 800403C4 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 303C8 800403C8 21082200 */  addu       $at, $at, $v0
    /* 303CC 800403CC BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 303D0 800403D0 0E80013C */  lui        $at, %hi(plr + 0x15A6)
    /* 303D4 800403D4 21082200 */  addu       $at, $at, $v0
    /* 303D8 800403D8 DEBA23A0 */  sb         $v1, %lo(plr + 0x15A6)($at)
    /* 303DC 800403DC C6FE000C */  jal        CalcPlrInv__FiUc
    /* 303E0 800403E0 21280000 */   addu      $a1, $zero, $zero
    /* 303E4 800403E4 3000BF8F */  lw         $ra, 0x30($sp)
    /* 303E8 800403E8 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 303EC 800403EC 2800B48F */  lw         $s4, 0x28($sp)
    /* 303F0 800403F0 2400B38F */  lw         $s3, 0x24($sp)
    /* 303F4 800403F4 2000B28F */  lw         $s2, 0x20($sp)
    /* 303F8 800403F8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 303FC 800403FC 1800B08F */  lw         $s0, 0x18($sp)
    /* 30400 80040400 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 30404 80040404 0800E003 */  jr         $ra
    /* 30408 80040408 00000000 */   nop
endlabel CreatePlrItems__Fi
