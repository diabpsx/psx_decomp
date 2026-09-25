.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_PLAYER_JOINLEVEL__FPC4TCmdi, 0x208

glabel On_PLAYER_JOINLEVEL__FPC4TCmdi
    /* 41F64 80051F64 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41F68 80051F68 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41F6C 80051F6C 2188A000 */  addu       $s1, $a1, $zero
    /* 41F70 80051F70 40101100 */  sll        $v0, $s1, 1
    /* 41F74 80051F74 21105100 */  addu       $v0, $v0, $s1
    /* 41F78 80051F78 80100200 */  sll        $v0, $v0, 2
    /* 41F7C 80051F7C 21105100 */  addu       $v0, $v0, $s1
    /* 41F80 80051F80 00110200 */  sll        $v0, $v0, 4
    /* 41F84 80051F84 23105100 */  subu       $v0, $v0, $s1
    /* 41F88 80051F88 80100200 */  sll        $v0, $v0, 2
    /* 41F8C 80051F8C 21105100 */  addu       $v0, $v0, $s1
    /* 41F90 80051F90 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41F94 80051F94 C0800200 */  sll        $s0, $v0, 3
    /* 41F98 80051F98 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41F9C 80051F9C 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 41FA0 80051FA0 21083000 */  addu       $at, $at, $s0
    /* 41FA4 80051FA4 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 41FA8 80051FA8 0E80013C */  lui        $at, %hi(plr + 0xD5)
    /* 41FAC 80051FAC 21083000 */  addu       $at, $at, $s0
    /* 41FB0 80051FB0 0DA620A0 */  sb         $zero, %lo(plr + 0xD5)($at)
    /* 41FB4 80051FB4 67004010 */  beqz       $v0, .L80052154
    /* 41FB8 80051FB8 00000000 */   nop
    /* 41FBC 80051FBC 65002012 */  beqz       $s1, .L80052154
    /* 41FC0 80051FC0 00000000 */   nop
    /* 41FC4 80051FC4 01008290 */  lbu        $v0, 0x1($a0)
    /* 41FC8 80051FC8 02008390 */  lbu        $v1, 0x2($a0)
    /* 41FCC 80051FCC 04008594 */  lhu        $a1, 0x4($a0)
    /* 41FD0 80051FD0 0E80013C */  lui        $at, %hi(plr + 0x184)
    /* 41FD4 80051FD4 21083000 */  addu       $at, $at, $s0
    /* 41FD8 80051FD8 BCA620AC */  sw         $zero, %lo(plr + 0x184)($at)
    /* 41FDC 80051FDC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 41FE0 80051FE0 21083000 */  addu       $at, $at, $s0
    /* 41FE4 80051FE4 68A522A4 */  sh         $v0, %lo(plr + 0x30)($at)
    /* 41FE8 80051FE8 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 41FEC 80051FEC 21083000 */  addu       $at, $at, $s0
    /* 41FF0 80051FF0 6AA523A4 */  sh         $v1, %lo(plr + 0x32)($at)
    /* 41FF4 80051FF4 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41FF8 80051FF8 21083000 */  addu       $at, $at, $s0
    /* 41FFC 80051FFC 5CA525AC */  sw         $a1, %lo(plr + 0x24)($at)
    /* 42000 80052000 A89C010C */  jal        SyncInitPlr__Fi
    /* 42004 80052004 21202002 */   addu      $a0, $s1, $zero
    /* 42008 80052008 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4200C 8005200C 21083000 */  addu       $at, $at, $s0
    /* 42010 80052010 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 42014 80052014 00000000 */  nop
    /* 42018 80052018 83110200 */  sra        $v0, $v0, 6
    /* 4201C 8005201C 05004018 */  blez       $v0, .L80052034
    /* 42020 80052020 21202002 */   addu      $a0, $s1, $zero
    /* 42024 80052024 299B010C */  jal        StartStand__Fii
    /* 42028 80052028 21280000 */   addu      $a1, $zero, $zero
    /* 4202C 8005202C 29480108 */  j          .L800520A4
    /* 42030 80052030 40101100 */   sll       $v0, $s1, 1
  .L80052034:
    /* 42034 80052034 01000524 */  addiu      $a1, $zero, 0x1
    /* 42038 80052038 0E80013C */  lui        $at, %hi(plr + 0x1A8)
    /* 4203C 8005203C 21083000 */  addu       $at, $at, $s0
    /* 42040 80052040 E0A6268C */  lw         $a2, %lo(plr + 0x1A8)($at)
    /* 42044 80052044 08000224 */  addiu      $v0, $zero, 0x8
    /* 42048 80052048 0E80013C */  lui        $at, %hi(plr + 0x43)
    /* 4204C 8005204C 21083000 */  addu       $at, $at, $s0
    /* 42050 80052050 7BA520A0 */  sb         $zero, %lo(plr + 0x43)($at)
    /* 42054 80052054 0E80013C */  lui        $at, %hi(plr)
    /* 42058 80052058 21083000 */  addu       $at, $at, $s0
    /* 4205C 8005205C 38A522AC */  sw         $v0, %lo(plr)($at)
    /* 42060 80052060 9C9B010C */  jal        NewPlrAnim__Fiiii
    /* 42064 80052064 01000724 */   addiu     $a3, $zero, 0x1
    /* 42068 80052068 0E80013C */  lui        $at, %hi(plr + 0x50)
    /* 4206C 8005206C 21083000 */  addu       $at, $at, $s0
    /* 42070 80052070 88A5228C */  lw         $v0, %lo(plr + 0x50)($at)
    /* 42074 80052074 0E80013C */  lui        $at, %hi(plr + 0x50)
    /* 42078 80052078 21083000 */  addu       $at, $at, $s0
    /* 4207C 8005207C 88A5238C */  lw         $v1, %lo(plr + 0x50)($at)
    /* 42080 80052080 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 42084 80052084 40180300 */  sll        $v1, $v1, 1
    /* 42088 80052088 0E80013C */  lui        $at, %hi(plr + 0x54)
    /* 4208C 8005208C 21083000 */  addu       $at, $at, $s0
    /* 42090 80052090 8CA522AC */  sw         $v0, %lo(plr + 0x54)($at)
    /* 42094 80052094 0E80013C */  lui        $at, %hi(plr + 0x164)
    /* 42098 80052098 21083000 */  addu       $at, $at, $s0
    /* 4209C 8005209C 9CA623A4 */  sh         $v1, %lo(plr + 0x164)($at)
    /* 420A0 800520A0 40101100 */  sll        $v0, $s1, 1
  .L800520A4:
    /* 420A4 800520A4 21105100 */  addu       $v0, $v0, $s1
    /* 420A8 800520A8 80100200 */  sll        $v0, $v0, 2
    /* 420AC 800520AC 21105100 */  addu       $v0, $v0, $s1
    /* 420B0 800520B0 00110200 */  sll        $v0, $v0, 4
    /* 420B4 800520B4 23105100 */  subu       $v0, $v0, $s1
    /* 420B8 800520B8 80100200 */  sll        $v0, $v0, 2
    /* 420BC 800520BC 21105100 */  addu       $v0, $v0, $s1
    /* 420C0 800520C0 C0800200 */  sll        $s0, $v0, 3
    /* 420C4 800520C4 0E80013C */  lui        $at, %hi(plr + 0x5C)
    /* 420C8 800520C8 21083000 */  addu       $at, $at, $s0
    /* 420CC 800520CC 94A52380 */  lb         $v1, %lo(plr + 0x5C)($at)
    /* 420D0 800520D0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 420D4 800520D4 0C006214 */  bne        $v1, $v0, .L80052108
    /* 420D8 800520D8 0A000624 */   addiu     $a2, $zero, 0xA
    /* 420DC 800520DC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 420E0 800520E0 21083000 */  addu       $at, $at, $s0
    /* 420E4 800520E4 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 420E8 800520E8 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 420EC 800520EC 21083000 */  addu       $at, $at, $s0
    /* 420F0 800520F0 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 420F4 800520F4 6A35010C */  jal        AddVision__FiiiUc
    /* 420F8 800520F8 FF002732 */   andi      $a3, $s1, 0xFF
    /* 420FC 800520FC 0E80013C */  lui        $at, %hi(plr + 0x5C)
    /* 42100 80052100 21083000 */  addu       $at, $at, $s0
    /* 42104 80052104 94A522A0 */  sb         $v0, %lo(plr + 0x5C)($at)
  .L80052108:
    /* 42108 80052108 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 4210C 8005210C 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 42110 80052110 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 42114 80052114 A3B920A0 */  sb         $zero, %lo(gbActivePlayers)($at)
    /* 42118 80052118 03004010 */  beqz       $v0, .L80052128
    /* 4211C 8005211C 01000224 */   addiu     $v0, $zero, 0x1
    /* 42120 80052120 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 42124 80052124 A3B922A0 */  sb         $v0, %lo(gbActivePlayers)($at)
  .L80052128:
    /* 42128 80052128 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 4212C 8005212C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 42130 80052130 00000000 */  nop
    /* 42134 80052134 07004010 */  beqz       $v0, .L80052154
    /* 42138 80052138 00000000 */   nop
    /* 4213C 8005213C 1280023C */  lui        $v0, %hi(gbActivePlayers)
    /* 42140 80052140 A3B94290 */  lbu        $v0, %lo(gbActivePlayers)($v0)
    /* 42144 80052144 00000000 */  nop
    /* 42148 80052148 01004224 */  addiu      $v0, $v0, 0x1
    /* 4214C 8005214C 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 42150 80052150 A3B922A0 */  sb         $v0, %lo(gbActivePlayers)($at)
  .L80052154:
    /* 42154 80052154 1800BF8F */  lw         $ra, 0x18($sp)
    /* 42158 80052158 1400B18F */  lw         $s1, 0x14($sp)
    /* 4215C 8005215C 1000B08F */  lw         $s0, 0x10($sp)
    /* 42160 80052160 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 42164 80052164 0800E003 */  jr         $ra
    /* 42168 80052168 00000000 */   nop
endlabel On_PLAYER_JOINLEVEL__FPC4TCmdi
