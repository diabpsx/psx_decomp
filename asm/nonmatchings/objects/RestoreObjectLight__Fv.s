.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RestoreObjectLight__Fv, 0x1CC

glabel RestoreObjectLight__Fv
    /* 4F9C4 8005F9C4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 4F9C8 8005F9C8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 4F9CC 8005F9CC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 4F9D0 8005F9D0 A934010C */  jal        InitLighting__Fv
    /* 4F9D4 8005F9D4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 4F9D8 8005F9D8 1280023C */  lui        $v0, %hi(nummonsters)
    /* 4F9DC 8005F9DC CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 4F9E0 8005F9E0 00000000 */  nop
    /* 4F9E4 8005F9E4 1B004018 */  blez       $v0, .L8005FA54
    /* 4F9E8 8005F9E8 21880000 */   addu      $s1, $zero, $zero
    /* 4F9EC 8005F9EC 1180103C */  lui        $s0, %hi(monstactive)
    /* 4F9F0 8005F9F0 C4A01026 */  addiu      $s0, $s0, %lo(monstactive)
  .L8005F9F4:
    /* 4F9F4 8005F9F4 00000386 */  lh         $v1, 0x0($s0)
    /* 4F9F8 8005F9F8 00000000 */  nop
    /* 4F9FC 8005F9FC 40100300 */  sll        $v0, $v1, 1
    /* 4FA00 8005FA00 21104300 */  addu       $v0, $v0, $v1
    /* 4FA04 8005FA04 80100200 */  sll        $v0, $v0, 2
    /* 4FA08 8005FA08 21104300 */  addu       $v0, $v0, $v1
    /* 4FA0C 8005FA0C C0100200 */  sll        $v0, $v0, 3
    /* 4FA10 8005FA10 1080033C */  lui        $v1, %hi(monster)
    /* 4FA14 8005FA14 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 4FA18 8005FA18 21184300 */  addu       $v1, $v0, $v1
    /* 4FA1C 8005FA1C 4F006290 */  lbu        $v0, 0x4F($v1)
    /* 4FA20 8005FA20 00000000 */  nop
    /* 4FA24 8005FA24 05004010 */  beqz       $v0, .L8005FA3C
    /* 4FA28 8005FA28 00000000 */   nop
    /* 4FA2C 8005FA2C 34006480 */  lb         $a0, 0x34($v1)
    /* 4FA30 8005FA30 35006580 */  lb         $a1, 0x35($v1)
    /* 4FA34 8005FA34 BA34010C */  jal        AddLight__Fiii
    /* 4FA38 8005FA38 F4230624 */   addiu     $a2, $zero, 0x23F4
  .L8005FA3C:
    /* 4FA3C 8005FA3C 1280023C */  lui        $v0, %hi(nummonsters)
    /* 4FA40 8005FA40 CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 4FA44 8005FA44 01003126 */  addiu      $s1, $s1, 0x1
    /* 4FA48 8005FA48 2A102202 */  slt        $v0, $s1, $v0
    /* 4FA4C 8005FA4C E9FF4014 */  bnez       $v0, .L8005F9F4
    /* 4FA50 8005FA50 02001026 */   addiu     $s0, $s0, 0x2
  .L8005FA54:
    /* 4FA54 8005FA54 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 4FA58 8005FA58 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 4FA5C 8005FA5C 00000000 */  nop
    /* 4FA60 8005FA60 17004004 */  bltz       $v0, .L8005FAC0
    /* 4FA64 8005FA64 21880000 */   addu      $s1, $zero, $zero
    /* 4FA68 8005FA68 21800000 */  addu       $s0, $zero, $zero
  .L8005FA6C:
    /* 4FA6C 8005FA6C 01003126 */  addiu      $s1, $s1, 0x1
    /* 4FA70 8005FA70 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 4FA74 8005FA74 21083000 */  addu       $at, $at, $s0
    /* 4FA78 8005FA78 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 4FA7C 8005FA7C 0E80013C */  lui        $at, %hi(plr + 0xD4)
    /* 4FA80 8005FA80 21083000 */  addu       $at, $at, $s0
    /* 4FA84 8005FA84 0CA62680 */  lb         $a2, %lo(plr + 0xD4)($at)
    /* 4FA88 8005FA88 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 4FA8C 8005FA8C 21083000 */  addu       $at, $at, $s0
    /* 4FA90 8005FA90 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 4FA94 8005FA94 BA34010C */  jal        AddLight__Fiii
    /* 4FA98 8005FA98 F023C624 */   addiu     $a2, $a2, 0x23F0
    /* 4FA9C 8005FA9C 0E80013C */  lui        $at, %hi(plr + 0x5B)
    /* 4FAA0 8005FAA0 21083000 */  addu       $at, $at, $s0
    /* 4FAA4 8005FAA4 93A522A0 */  sb         $v0, %lo(plr + 0x5B)($at)
    /* 4FAA8 8005FAA8 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 4FAAC 8005FAAC 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 4FAB0 8005FAB0 00000000 */  nop
    /* 4FAB4 8005FAB4 2A105100 */  slt        $v0, $v0, $s1
    /* 4FAB8 8005FAB8 ECFF4010 */  beqz       $v0, .L8005FA6C
    /* 4FABC 8005FABC E8191026 */   addiu     $s0, $s0, 0x19E8
  .L8005FAC0:
    /* 4FAC0 8005FAC0 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4FAC4 8005FAC4 00000000 */  nop
    /* 4FAC8 8005FAC8 2B004018 */  blez       $v0, .L8005FB78
    /* 4FACC 8005FACC 21880000 */   addu      $s1, $zero, $zero
    /* 4FAD0 8005FAD0 1180103C */  lui        $s0, %hi(jtbl_801175C8)
    /* 4FAD4 8005FAD4 C8751026 */  addiu      $s0, $s0, %lo(jtbl_801175C8)
  .L8005FAD8:
    /* 4FAD8 8005FAD8 0E80013C */  lui        $at, %hi(objectactive)
    /* 4FADC 8005FADC 21083100 */  addu       $at, $at, $s1
    /* 4FAE0 8005FAE0 20A22280 */  lb         $v0, %lo(objectactive)($at)
    /* 4FAE4 8005FAE4 00000000 */  nop
    /* 4FAE8 8005FAE8 40180200 */  sll        $v1, $v0, 1
    /* 4FAEC 8005FAEC 21186200 */  addu       $v1, $v1, $v0
    /* 4FAF0 8005FAF0 80180300 */  sll        $v1, $v1, 2
    /* 4FAF4 8005FAF4 23186200 */  subu       $v1, $v1, $v0
    /* 4FAF8 8005FAF8 80180300 */  sll        $v1, $v1, 2
    /* 4FAFC 8005FAFC 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4FB00 8005FB00 21082300 */  addu       $at, $at, $v1
    /* 4FB04 8005FB04 6A8C2680 */  lb         $a2, %lo(object + 0x1E)($at)
    /* 4FB08 8005FB08 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4FB0C 8005FB0C 21082300 */  addu       $at, $at, $v1
    /* 4FB10 8005FB10 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4FB14 8005FB14 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4FB18 8005FB18 21082300 */  addu       $at, $at, $v1
    /* 4FB1C 8005FB1C 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4FB20 8005FB20 5D00C22C */  sltiu      $v0, $a2, 0x5D
    /* 4FB24 8005FB24 0F004010 */  beqz       $v0, .L8005FB64
    /* 4FB28 8005FB28 80100600 */   sll       $v0, $a2, 2
    /* 4FB2C 8005FB2C 21105000 */  addu       $v0, $v0, $s0
    /* 4FB30 8005FB30 0000428C */  lw         $v0, 0x0($v0)
    /* 4FB34 8005FB34 00000000 */  nop
    /* 4FB38 8005FB38 08004000 */  jr         $v0
    /* 4FB3C 8005FB3C 00000000 */   nop
  jlabel .L8005FB40
    /* 4FB40 8005FB40 D77E0108 */  j          .L8005FB5C
    /* 4FB44 8005FB44 F3030624 */   addiu     $a2, $zero, 0x3F3
  jlabel .L8005FB48
    /* 4FB48 8005FB48 D77E0108 */  j          .L8005FB5C
    /* 4FB4C 8005FB4C F3030624 */   addiu     $a2, $zero, 0x3F3
  jlabel .L8005FB50
    /* 4FB50 8005FB50 D77E0108 */  j          .L8005FB5C
    /* 4FB54 8005FB54 F3030624 */   addiu     $a2, $zero, 0x3F3
  jlabel .L8005FB58
    /* 4FB58 8005FB58 B8010624 */  addiu      $a2, $zero, 0x1B8
  .L8005FB5C:
    /* 4FB5C 8005FB5C 617E010C */  jal        AddLamp__Fiii
    /* 4FB60 8005FB60 00000000 */   nop
  jlabel .L8005FB64
    /* 4FB64 8005FB64 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4FB68 8005FB68 01003126 */  addiu      $s1, $s1, 0x1
    /* 4FB6C 8005FB6C 2A102202 */  slt        $v0, $s1, $v0
    /* 4FB70 8005FB70 D9FF4014 */  bnez       $v0, .L8005FAD8
    /* 4FB74 8005FB74 00000000 */   nop
  .L8005FB78:
    /* 4FB78 8005FB78 2800BF8F */  lw         $ra, 0x28($sp)
    /* 4FB7C 8005FB7C 2400B18F */  lw         $s1, 0x24($sp)
    /* 4FB80 8005FB80 2000B08F */  lw         $s0, 0x20($sp)
    /* 4FB84 8005FB84 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4FB88 8005FB88 0800E003 */  jr         $ra
    /* 4FB8C 8005FB8C 00000000 */   nop
endlabel RestoreObjectLight__Fv
