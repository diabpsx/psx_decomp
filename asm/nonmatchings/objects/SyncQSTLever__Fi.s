.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncQSTLever__Fi, 0xF8

glabel SyncQSTLever__Fi
    /* 4EFF4 8005EFF4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4EFF8 8005EFF8 40100400 */  sll        $v0, $a0, 1
    /* 4EFFC 8005EFFC 21104400 */  addu       $v0, $v0, $a0
    /* 4F000 8005F000 80100200 */  sll        $v0, $v0, 2
    /* 4F004 8005F004 23104400 */  subu       $v0, $v0, $a0
    /* 4F008 8005F008 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4F00C 8005F00C 80800200 */  sll        $s0, $v0, 2
    /* 4F010 8005F010 1400BFAF */  sw         $ra, 0x14($sp)
    /* 4F014 8005F014 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4F018 8005F018 21083000 */  addu       $at, $at, $s0
    /* 4F01C 8005F01C 6D8C2380 */  lb         $v1, %lo(object + 0x21)($at)
    /* 4F020 8005F020 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 4F024 8005F024 21083000 */  addu       $at, $at, $s0
    /* 4F028 8005F028 648C2284 */  lh         $v0, %lo(object + 0x18)($at)
    /* 4F02C 8005F02C 00000000 */  nop
    /* 4F030 8005F030 29006214 */  bne        $v1, $v0, .L8005F0D8
    /* 4F034 8005F034 00000000 */   nop
    /* 4F038 8005F038 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4F03C 8005F03C 21083000 */  addu       $at, $at, $s0
    /* 4F040 8005F040 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 4F044 8005F044 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4F048 8005F048 21083000 */  addu       $at, $at, $s0
    /* 4F04C 8005F04C 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 4F050 8005F050 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4F054 8005F054 21083000 */  addu       $at, $at, $s0
    /* 4F058 8005F058 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 4F05C 8005F05C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F060 8005F060 21083000 */  addu       $at, $at, $s0
    /* 4F064 8005F064 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 4F068 8005F068 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 4F06C 8005F06C 00000000 */   nop
    /* 4F070 8005F070 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F074 8005F074 21083000 */  addu       $at, $at, $s0
    /* 4F078 8005F078 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4F07C 8005F07C 47000224 */  addiu      $v0, $zero, 0x47
    /* 4F080 8005F080 15006214 */  bne        $v1, $v0, .L8005F0D8
    /* 4F084 8005F084 09000224 */   addiu     $v0, $zero, 0x9
    /* 4F088 8005F088 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4F08C 8005F08C 21083000 */  addu       $at, $at, $s0
    /* 4F090 8005F090 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 4F094 8005F094 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4F098 8005F098 21083000 */  addu       $at, $at, $s0
    /* 4F09C 8005F09C 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 4F0A0 8005F0A0 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4F0A4 8005F0A4 21083000 */  addu       $at, $at, $s0
    /* 4F0A8 8005F0A8 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 4F0AC 8005F0AC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F0B0 8005F0B0 21083000 */  addu       $at, $at, $s0
    /* 4F0B4 8005F0B4 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 4F0B8 8005F0B8 1280103C */  lui        $s0, %hi(TransVal)
    /* 4F0BC 8005F0BC 48C11082 */  lb         $s0, %lo(TransVal)($s0)
    /* 4F0C0 8005F0C0 1280013C */  lui        $at, %hi(TransVal)
    /* 4F0C4 8005F0C4 48C122A0 */  sb         $v0, %lo(TransVal)($at)
    /* 4F0C8 8005F0C8 375E010C */  jal        DRLG_MRectTrans__Fiiii
    /* 4F0CC 8005F0CC 00000000 */   nop
    /* 4F0D0 8005F0D0 1280013C */  lui        $at, %hi(TransVal)
    /* 4F0D4 8005F0D4 48C130A0 */  sb         $s0, %lo(TransVal)($at)
  .L8005F0D8:
    /* 4F0D8 8005F0D8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 4F0DC 8005F0DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 4F0E0 8005F0E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4F0E4 8005F0E4 0800E003 */  jr         $ra
    /* 4F0E8 8005F0E8 00000000 */   nop
endlabel SyncQSTLever__Fi
