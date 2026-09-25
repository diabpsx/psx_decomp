.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_UpdateLeader__Fi, 0x110

glabel M_UpdateLeader__Fi
    /* 6FFD4 8007FFD4 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 6FFD8 8007FFD8 1280023C */  lui        $v0, %hi(nummonsters)
    /* 6FFDC 8007FFDC CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 6FFE0 8007FFE0 00000000 */  nop
    /* 6FFE4 8007FFE4 20004018 */  blez       $v0, .L80080068
    /* 6FFE8 8007FFE8 21280000 */   addu      $a1, $zero, $zero
    /* 6FFEC 8007FFEC 01000724 */  addiu      $a3, $zero, 0x1
    /* 6FFF0 8007FFF0 1180063C */  lui        $a2, %hi(monstactive)
    /* 6FFF4 8007FFF4 C4A0C624 */  addiu      $a2, $a2, %lo(monstactive)
  .L8007FFF8:
    /* 6FFF8 8007FFF8 0000C284 */  lh         $v0, 0x0($a2)
    /* 6FFFC 8007FFFC 00000000 */  nop
    /* 70000 80080000 40180200 */  sll        $v1, $v0, 1
    /* 70004 80080004 21186200 */  addu       $v1, $v1, $v0
    /* 70008 80080008 80180300 */  sll        $v1, $v1, 2
    /* 7000C 8008000C 21186200 */  addu       $v1, $v1, $v0
    /* 70010 80080010 C0180300 */  sll        $v1, $v1, 3
    /* 70014 80080014 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 70018 80080018 21082300 */  addu       $at, $at, $v1
    /* 7001C 8008001C EB532290 */  lbu        $v0, %lo(monster + 0x57)($at)
    /* 70020 80080020 00000000 */  nop
    /* 70024 80080024 0A004714 */  bne        $v0, $a3, .L80080050
    /* 70028 80080028 00000000 */   nop
    /* 7002C 8008002C 1080013C */  lui        $at, %hi(monster + 0x56)
    /* 70030 80080030 21082300 */  addu       $at, $at, $v1
    /* 70034 80080034 EA532290 */  lbu        $v0, %lo(monster + 0x56)($at)
    /* 70038 80080038 00000000 */  nop
    /* 7003C 8008003C 04004414 */  bne        $v0, $a0, .L80080050
    /* 70040 80080040 00000000 */   nop
    /* 70044 80080044 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 70048 80080048 21082300 */  addu       $at, $at, $v1
    /* 7004C 8008004C EB5320A0 */  sb         $zero, %lo(monster + 0x57)($at)
  .L80080050:
    /* 70050 80080050 1280023C */  lui        $v0, %hi(nummonsters)
    /* 70054 80080054 CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 70058 80080058 0100A524 */  addiu      $a1, $a1, 0x1
    /* 7005C 8008005C 2A10A200 */  slt        $v0, $a1, $v0
    /* 70060 80080060 E5FF4014 */  bnez       $v0, .L8007FFF8
    /* 70064 80080064 0200C624 */   addiu     $a2, $a2, 0x2
  .L80080068:
    /* 70068 80080068 40100400 */  sll        $v0, $a0, 1
    /* 7006C 8008006C 21104400 */  addu       $v0, $v0, $a0
    /* 70070 80080070 80100200 */  sll        $v0, $v0, 2
    /* 70074 80080074 21104400 */  addu       $v0, $v0, $a0
    /* 70078 80080078 C0200200 */  sll        $a0, $v0, 3
    /* 7007C 8008007C 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 70080 80080080 21082400 */  addu       $at, $at, $a0
    /* 70084 80080084 EB532390 */  lbu        $v1, %lo(monster + 0x57)($at)
    /* 70088 80080088 01000224 */  addiu      $v0, $zero, 0x1
    /* 7008C 8008008C 12006214 */  bne        $v1, $v0, .L800800D8
    /* 70090 80080090 00000000 */   nop
    /* 70094 80080094 1080013C */  lui        $at, %hi(monster + 0x56)
    /* 70098 80080098 21082400 */  addu       $at, $at, $a0
    /* 7009C 8008009C EA532290 */  lbu        $v0, %lo(monster + 0x56)($at)
    /* 700A0 800800A0 00000000 */  nop
    /* 700A4 800800A4 40180200 */  sll        $v1, $v0, 1
    /* 700A8 800800A8 21186200 */  addu       $v1, $v1, $v0
    /* 700AC 800800AC 80180300 */  sll        $v1, $v1, 2
    /* 700B0 800800B0 21186200 */  addu       $v1, $v1, $v0
    /* 700B4 800800B4 C0180300 */  sll        $v1, $v1, 3
    /* 700B8 800800B8 1080013C */  lui        $at, %hi(monster + 0x58)
    /* 700BC 800800BC 21082300 */  addu       $at, $at, $v1
    /* 700C0 800800C0 EC532290 */  lbu        $v0, %lo(monster + 0x58)($at)
    /* 700C4 800800C4 00000000 */  nop
    /* 700C8 800800C8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 700CC 800800CC 1080013C */  lui        $at, %hi(monster + 0x58)
    /* 700D0 800800D0 21082300 */  addu       $at, $at, $v1
    /* 700D4 800800D4 EC5322A0 */  sb         $v0, %lo(monster + 0x58)($at)
  .L800800D8:
    /* 700D8 800800D8 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 700DC 800800DC 0800E003 */  jr         $ra
    /* 700E0 800800E0 00000000 */   nop
endlabel M_UpdateLeader__Fi
