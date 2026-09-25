.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecalcStoreStats__Fv, 0x2E4

glabel RecalcStoreStats__Fv
    /* 38858 80048858 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3885C 8004885C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 38860 80048860 21880000 */  addu       $s1, $zero, $zero
    /* 38864 80048864 1000B0AF */  sw         $s0, 0x10($sp)
    /* 38868 80048868 21800000 */  addu       $s0, $zero, $zero
    /* 3886C 8004886C 1800BFAF */  sw         $ra, 0x18($sp)
  .L80048870:
    /* 38870 80048870 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 38874 80048874 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 38878 80048878 00000000 */  nop
    /* 3887C 8004887C 00110300 */  sll        $v0, $v1, 4
    /* 38880 80048880 21104300 */  addu       $v0, $v0, $v1
    /* 38884 80048884 C0100200 */  sll        $v0, $v0, 3
    /* 38888 80048888 23104300 */  subu       $v0, $v0, $v1
    /* 3888C 8004888C 00290200 */  sll        $a1, $v0, 4
    /* 38890 80048890 21100502 */  addu       $v0, $s0, $a1
    /* 38894 80048894 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 38898 80048898 21082200 */  addu       $at, $at, $v0
    /* 3889C 8004889C 54E42384 */  lh         $v1, %lo(_smithitem + 0x2C)($at)
    /* 388A0 800488A0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 388A4 800488A4 12006210 */  beq        $v1, $v0, .L800488F0
    /* 388A8 800488A8 00000000 */   nop
    /* 388AC 800488AC 0E80043C */  lui        $a0, %hi(_smithitem)
    /* 388B0 800488B0 28E48424 */  addiu      $a0, $a0, %lo(_smithitem)
    /* 388B4 800488B4 21200402 */  addu       $a0, $s0, $a0
    /* 388B8 800488B8 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 388BC 800488BC 2120A400 */   addu      $a0, $a1, $a0
    /* 388C0 800488C0 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 388C4 800488C4 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 388C8 800488C8 00000000 */  nop
    /* 388CC 800488CC 00190400 */  sll        $v1, $a0, 4
    /* 388D0 800488D0 21186400 */  addu       $v1, $v1, $a0
    /* 388D4 800488D4 C0180300 */  sll        $v1, $v1, 3
    /* 388D8 800488D8 23186400 */  subu       $v1, $v1, $a0
    /* 388DC 800488DC 00190300 */  sll        $v1, $v1, 4
    /* 388E0 800488E0 21180302 */  addu       $v1, $s0, $v1
    /* 388E4 800488E4 0E80013C */  lui        $at, %hi(_smithitem + 0x66)
    /* 388E8 800488E8 21082300 */  addu       $at, $at, $v1
    /* 388EC 800488EC 8EE422A0 */  sb         $v0, %lo(_smithitem + 0x66)($at)
  .L800488F0:
    /* 388F0 800488F0 01003126 */  addiu      $s1, $s1, 0x1
    /* 388F4 800488F4 1400222A */  slti       $v0, $s1, 0x14
    /* 388F8 800488F8 DDFF4014 */  bnez       $v0, .L80048870
    /* 388FC 800488FC 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 38900 80048900 21880000 */  addu       $s1, $zero, $zero
    /* 38904 80048904 21800000 */  addu       $s0, $zero, $zero
  .L80048908:
    /* 38908 80048908 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3890C 8004890C B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 38910 80048910 00000000 */  nop
    /* 38914 80048914 80100300 */  sll        $v0, $v1, 2
    /* 38918 80048918 21104300 */  addu       $v0, $v0, $v1
    /* 3891C 8004891C 00110200 */  sll        $v0, $v0, 4
    /* 38920 80048920 21104300 */  addu       $v0, $v0, $v1
    /* 38924 80048924 C0280200 */  sll        $a1, $v0, 3
    /* 38928 80048928 21100502 */  addu       $v0, $s0, $a1
    /* 3892C 8004892C 0E80013C */  lui        $at, %hi(_premiumitem + 0x2C)
    /* 38930 80048930 21082200 */  addu       $at, $at, $v0
    /* 38934 80048934 34F52384 */  lh         $v1, %lo(_premiumitem + 0x2C)($at)
    /* 38938 80048938 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3893C 8004893C 12006210 */  beq        $v1, $v0, .L80048988
    /* 38940 80048940 00000000 */   nop
    /* 38944 80048944 0E80043C */  lui        $a0, %hi(_premiumitem)
    /* 38948 80048948 08F58424 */  addiu      $a0, $a0, %lo(_premiumitem)
    /* 3894C 8004894C 21200402 */  addu       $a0, $s0, $a0
    /* 38950 80048950 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 38954 80048954 2120A400 */   addu      $a0, $a1, $a0
    /* 38958 80048958 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3895C 8004895C B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 38960 80048960 00000000 */  nop
    /* 38964 80048964 80180400 */  sll        $v1, $a0, 2
    /* 38968 80048968 21186400 */  addu       $v1, $v1, $a0
    /* 3896C 8004896C 00190300 */  sll        $v1, $v1, 4
    /* 38970 80048970 21186400 */  addu       $v1, $v1, $a0
    /* 38974 80048974 C0180300 */  sll        $v1, $v1, 3
    /* 38978 80048978 21180302 */  addu       $v1, $s0, $v1
    /* 3897C 8004897C 0E80013C */  lui        $at, %hi(_premiumitem + 0x66)
    /* 38980 80048980 21082300 */  addu       $at, $at, $v1
    /* 38984 80048984 6EF522A0 */  sb         $v0, %lo(_premiumitem + 0x66)($at)
  .L80048988:
    /* 38988 80048988 01003126 */  addiu      $s1, $s1, 0x1
    /* 3898C 8004898C 0600222A */  slti       $v0, $s1, 0x6
    /* 38990 80048990 DDFF4014 */  bnez       $v0, .L80048908
    /* 38994 80048994 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 38998 80048998 21880000 */  addu       $s1, $zero, $zero
    /* 3899C 8004899C 21800000 */  addu       $s0, $zero, $zero
  .L800489A0:
    /* 389A0 800489A0 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 389A4 800489A4 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 389A8 800489A8 00000000 */  nop
    /* 389AC 800489AC 00110300 */  sll        $v0, $v1, 4
    /* 389B0 800489B0 21104300 */  addu       $v0, $v0, $v1
    /* 389B4 800489B4 C0100200 */  sll        $v0, $v0, 3
    /* 389B8 800489B8 23104300 */  subu       $v0, $v0, $v1
    /* 389BC 800489BC 00290200 */  sll        $a1, $v0, 4
    /* 389C0 800489C0 21100502 */  addu       $v0, $s0, $a1
    /* 389C4 800489C4 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 389C8 800489C8 21082200 */  addu       $at, $at, $v0
    /* 389CC 800489CC 44FA2384 */  lh         $v1, %lo(_witchitem + 0x2C)($at)
    /* 389D0 800489D0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 389D4 800489D4 12006210 */  beq        $v1, $v0, .L80048A20
    /* 389D8 800489D8 00000000 */   nop
    /* 389DC 800489DC 0E80043C */  lui        $a0, %hi(_witchitem)
    /* 389E0 800489E0 18FA8424 */  addiu      $a0, $a0, %lo(_witchitem)
    /* 389E4 800489E4 21200402 */  addu       $a0, $s0, $a0
    /* 389E8 800489E8 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 389EC 800489EC 2120A400 */   addu      $a0, $a1, $a0
    /* 389F0 800489F0 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 389F4 800489F4 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 389F8 800489F8 00000000 */  nop
    /* 389FC 800489FC 00190400 */  sll        $v1, $a0, 4
    /* 38A00 80048A00 21186400 */  addu       $v1, $v1, $a0
    /* 38A04 80048A04 C0180300 */  sll        $v1, $v1, 3
    /* 38A08 80048A08 23186400 */  subu       $v1, $v1, $a0
    /* 38A0C 80048A0C 00190300 */  sll        $v1, $v1, 4
    /* 38A10 80048A10 21180302 */  addu       $v1, $s0, $v1
    /* 38A14 80048A14 0E80013C */  lui        $at, %hi(_witchitem + 0x66)
    /* 38A18 80048A18 21082300 */  addu       $at, $at, $v1
    /* 38A1C 80048A1C 7EFA22A0 */  sb         $v0, %lo(_witchitem + 0x66)($at)
  .L80048A20:
    /* 38A20 80048A20 01003126 */  addiu      $s1, $s1, 0x1
    /* 38A24 80048A24 1400222A */  slti       $v0, $s1, 0x14
    /* 38A28 80048A28 DDFF4014 */  bnez       $v0, .L800489A0
    /* 38A2C 80048A2C 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 38A30 80048A30 21880000 */  addu       $s1, $zero, $zero
    /* 38A34 80048A34 21800000 */  addu       $s0, $zero, $zero
  .L80048A38:
    /* 38A38 80048A38 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 38A3C 80048A3C B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 38A40 80048A40 00000000 */  nop
    /* 38A44 80048A44 00110300 */  sll        $v0, $v1, 4
    /* 38A48 80048A48 21104300 */  addu       $v0, $v0, $v1
    /* 38A4C 80048A4C C0100200 */  sll        $v0, $v0, 3
    /* 38A50 80048A50 23104300 */  subu       $v0, $v0, $v1
    /* 38A54 80048A54 00290200 */  sll        $a1, $v0, 4
    /* 38A58 80048A58 21100502 */  addu       $v0, $s0, $a1
    /* 38A5C 80048A5C 0E80013C */  lui        $at, %hi(_healitem + 0x2C)
    /* 38A60 80048A60 21082200 */  addu       $at, $at, $v0
    /* 38A64 80048A64 FC0B2384 */  lh         $v1, %lo(_healitem + 0x2C)($at)
    /* 38A68 80048A68 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 38A6C 80048A6C 12006210 */  beq        $v1, $v0, .L80048AB8
    /* 38A70 80048A70 00000000 */   nop
    /* 38A74 80048A74 0E80043C */  lui        $a0, %hi(_healitem)
    /* 38A78 80048A78 D00B8424 */  addiu      $a0, $a0, %lo(_healitem)
    /* 38A7C 80048A7C 21200402 */  addu       $a0, $s0, $a0
    /* 38A80 80048A80 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 38A84 80048A84 2120A400 */   addu      $a0, $a1, $a0
    /* 38A88 80048A88 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 38A8C 80048A8C B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 38A90 80048A90 00000000 */  nop
    /* 38A94 80048A94 00190400 */  sll        $v1, $a0, 4
    /* 38A98 80048A98 21186400 */  addu       $v1, $v1, $a0
    /* 38A9C 80048A9C C0180300 */  sll        $v1, $v1, 3
    /* 38AA0 80048AA0 23186400 */  subu       $v1, $v1, $a0
    /* 38AA4 80048AA4 00190300 */  sll        $v1, $v1, 4
    /* 38AA8 80048AA8 21180302 */  addu       $v1, $s0, $v1
    /* 38AAC 80048AAC 0E80013C */  lui        $at, %hi(_healitem + 0x66)
    /* 38AB0 80048AB0 21082300 */  addu       $at, $at, $v1
    /* 38AB4 80048AB4 360C22A0 */  sb         $v0, %lo(_healitem + 0x66)($at)
  .L80048AB8:
    /* 38AB8 80048AB8 01003126 */  addiu      $s1, $s1, 0x1
    /* 38ABC 80048ABC 1400222A */  slti       $v0, $s1, 0x14
    /* 38AC0 80048AC0 DDFF4014 */  bnez       $v0, .L80048A38
    /* 38AC4 80048AC4 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 38AC8 80048AC8 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 38ACC 80048ACC B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 38AD0 80048AD0 00000000 */  nop
    /* 38AD4 80048AD4 C0200200 */  sll        $a0, $v0, 3
    /* 38AD8 80048AD8 23208200 */  subu       $a0, $a0, $v0
    /* 38ADC 80048ADC 80200400 */  sll        $a0, $a0, 2
    /* 38AE0 80048AE0 23208200 */  subu       $a0, $a0, $v0
    /* 38AE4 80048AE4 80200400 */  sll        $a0, $a0, 2
    /* 38AE8 80048AE8 0E80023C */  lui        $v0, %hi(_boyitem)
    /* 38AEC 80048AEC F80A4224 */  addiu      $v0, $v0, %lo(_boyitem)
    /* 38AF0 80048AF0 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 38AF4 80048AF4 21208200 */   addu      $a0, $a0, $v0
    /* 38AF8 80048AF8 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 38AFC 80048AFC B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 38B00 80048B00 00000000 */  nop
    /* 38B04 80048B04 C0180400 */  sll        $v1, $a0, 3
    /* 38B08 80048B08 23186400 */  subu       $v1, $v1, $a0
    /* 38B0C 80048B0C 80180300 */  sll        $v1, $v1, 2
    /* 38B10 80048B10 23186400 */  subu       $v1, $v1, $a0
    /* 38B14 80048B14 80180300 */  sll        $v1, $v1, 2
    /* 38B18 80048B18 0E80013C */  lui        $at, %hi(_boyitem + 0x66)
    /* 38B1C 80048B1C 21082300 */  addu       $at, $at, $v1
    /* 38B20 80048B20 5E0B22A0 */  sb         $v0, %lo(_boyitem + 0x66)($at)
    /* 38B24 80048B24 1800BF8F */  lw         $ra, 0x18($sp)
    /* 38B28 80048B28 1400B18F */  lw         $s1, 0x14($sp)
    /* 38B2C 80048B2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 38B30 80048B30 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 38B34 80048B34 0800E003 */  jr         $ra
    /* 38B38 80048B38 00000000 */   nop
endlabel RecalcStoreStats__Fv
