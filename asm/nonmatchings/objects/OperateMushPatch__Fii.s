.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateMushPatch__Fii, 0x214

glabel OperateMushPatch__Fii
    /* 48F90 80058F90 1280023C */  lui        $v0, %hi(numitems)
    /* 48F94 80058F94 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 48F98 80058F98 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 48F9C 80058F9C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 48FA0 80058FA0 21888000 */  addu       $s1, $a0, $zero
    /* 48FA4 80058FA4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 48FA8 80058FA8 2190A000 */  addu       $s2, $a1, $zero
    /* 48FAC 80058FAC 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 48FB0 80058FB0 7F004228 */  slti       $v0, $v0, 0x7F
    /* 48FB4 80058FB4 05004014 */  bnez       $v0, .L80058FCC
    /* 48FB8 80058FB8 2000B0AF */   sw        $s0, 0x20($sp)
    /* 48FBC 80058FBC C6F5000C */  jal        PlaySFX__Fi
    /* 48FC0 80058FC0 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 48FC4 80058FC4 62640108 */  j          .L80059188
    /* 48FC8 80058FC8 00000000 */   nop
  .L80058FCC:
    /* 48FCC 80058FCC 40101200 */  sll        $v0, $s2, 1
    /* 48FD0 80058FD0 21105200 */  addu       $v0, $v0, $s2
    /* 48FD4 80058FD4 80100200 */  sll        $v0, $v0, 2
    /* 48FD8 80058FD8 23105200 */  subu       $v0, $v0, $s2
    /* 48FDC 80058FDC 80800200 */  sll        $s0, $v0, 2
    /* 48FE0 80058FE0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 48FE4 80058FE4 21083000 */  addu       $at, $at, $s0
    /* 48FE8 80058FE8 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 48FEC 80058FEC 00000000 */  nop
    /* 48FF0 80058FF0 65004010 */  beqz       $v0, .L80059188
    /* 48FF4 80058FF4 02000424 */   addiu     $a0, $zero, 0x2
    /* 48FF8 80058FF8 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 48FFC 80058FFC 21083000 */  addu       $at, $at, $s0
    /* 49000 80059000 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 49004 80059004 0E80023C */  lui        $v0, %hi(quests + 0x16)
    /* 49008 80059008 56DA4290 */  lbu        $v0, %lo(quests + 0x16)($v0)
    /* 4900C 8005900C 1280033C */  lui        $v1, %hi(deltaload)
    /* 49010 80059010 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 49014 80059014 07004414 */  bne        $v0, $a0, .L80059034
    /* 49018 80059018 00000000 */   nop
    /* 4901C 8005901C 0E80023C */  lui        $v0, %hi(quests + 0x23)
    /* 49020 80059020 63DA4290 */  lbu        $v0, %lo(quests + 0x23)($v0)
    /* 49024 80059024 00000000 */  nop
    /* 49028 80059028 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4902C 8005902C 26004010 */  beqz       $v0, .L800590C8
    /* 49030 80059030 00000000 */   nop
  .L80059034:
    /* 49034 80059034 54006014 */  bnez       $v1, .L80059188
    /* 49038 80059038 00000000 */   nop
    /* 4903C 8005903C 1280023C */  lui        $v0, %hi(myplr)
    /* 49040 80059040 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 49044 80059044 00000000 */  nop
    /* 49048 80059048 4F002216 */  bne        $s1, $v0, .L80059188
    /* 4904C 8005904C 40101100 */   sll       $v0, $s1, 1
    /* 49050 80059050 21105100 */  addu       $v0, $v0, $s1
    /* 49054 80059054 80100200 */  sll        $v0, $v0, 2
    /* 49058 80059058 21105100 */  addu       $v0, $v0, $s1
    /* 4905C 8005905C 00110200 */  sll        $v0, $v0, 4
    /* 49060 80059060 23105100 */  subu       $v0, $v0, $s1
    /* 49064 80059064 80100200 */  sll        $v0, $v0, 2
    /* 49068 80059068 21105100 */  addu       $v0, $v0, $s1
    /* 4906C 8005906C C0100200 */  sll        $v0, $v0, 3
    /* 49070 80059070 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 49074 80059074 21082200 */  addu       $at, $at, $v0
    /* 49078 80059078 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 4907C 8005907C 00000000 */  nop
    /* 49080 80059080 05006014 */  bnez       $v1, .L80059098
    /* 49084 80059084 01000224 */   addiu     $v0, $zero, 0x1
    /* 49088 80059088 C6F5000C */  jal        PlaySFX__Fi
    /* 4908C 8005908C D8020424 */   addiu     $a0, $zero, 0x2D8
    /* 49090 80059090 62640108 */  j          .L80059188
    /* 49094 80059094 00000000 */   nop
  .L80059098:
    /* 49098 80059098 05006214 */  bne        $v1, $v0, .L800590B0
    /* 4909C 8005909C 00000000 */   nop
    /* 490A0 800590A0 C6F5000C */  jal        PlaySFX__Fi
    /* 490A4 800590A4 70020424 */   addiu     $a0, $zero, 0x270
    /* 490A8 800590A8 62640108 */  j          .L80059188
    /* 490AC 800590AC 00000000 */   nop
  .L800590B0:
    /* 490B0 800590B0 35006414 */  bne        $v1, $a0, .L80059188
    /* 490B4 800590B4 00000000 */   nop
    /* 490B8 800590B8 C6F5000C */  jal        PlaySFX__Fi
    /* 490BC 800590BC 08020424 */   addiu     $a0, $zero, 0x208
    /* 490C0 800590C0 62640108 */  j          .L80059188
    /* 490C4 800590C4 00000000 */   nop
  .L800590C8:
    /* 490C8 800590C8 0A006014 */  bnez       $v1, .L800590F4
    /* 490CC 800590CC 02000224 */   addiu     $v0, $zero, 0x2
    /* 490D0 800590D0 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 490D4 800590D4 21083000 */  addu       $at, $at, $s0
    /* 490D8 800590D8 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 490DC 800590DC 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 490E0 800590E0 21083000 */  addu       $at, $at, $s0
    /* 490E4 800590E4 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 490E8 800590E8 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 490EC 800590EC 12000424 */   addiu     $a0, $zero, 0x12
    /* 490F0 800590F0 02000224 */  addiu      $v0, $zero, 0x2
  .L800590F4:
    /* 490F4 800590F4 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 490F8 800590F8 21083000 */  addu       $at, $at, $s0
    /* 490FC 800590FC 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 49100 80059100 0E80023C */  lui        $v0, %hi(quests + 0x26)
    /* 49104 80059104 66DA4290 */  lbu        $v0, %lo(quests + 0x26)($v0)
    /* 49108 80059108 00000000 */  nop
    /* 4910C 8005910C 0F004014 */  bnez       $v0, .L8005914C
    /* 49110 80059110 1800A627 */   addiu     $a2, $sp, 0x18
    /* 49114 80059114 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 49118 80059118 21083000 */  addu       $at, $at, $s0
    /* 4911C 8005911C 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 49120 80059120 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 49124 80059124 21083000 */  addu       $at, $at, $s0
    /* 49128 80059128 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4912C 8005912C 7F02010C */  jal        GetSuperItemLoc__FiiRiT2
    /* 49130 80059130 1C00A727 */   addiu     $a3, $sp, 0x1C
    /* 49134 80059134 11000424 */  addiu      $a0, $zero, 0x11
    /* 49138 80059138 1000A0AF */  sw         $zero, 0x10($sp)
    /* 4913C 8005913C 1800A58F */  lw         $a1, 0x18($sp)
    /* 49140 80059140 1C00A68F */  lw         $a2, 0x1C($sp)
    /* 49144 80059144 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 49148 80059148 21380000 */   addu      $a3, $zero, $zero
  .L8005914C:
    /* 4914C 8005914C 1280023C */  lui        $v0, %hi(deltaload)
    /* 49150 80059150 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 49154 80059154 00000000 */  nop
    /* 49158 80059158 0B004014 */  bnez       $v0, .L80059188
    /* 4915C 8005915C 03000224 */   addiu     $v0, $zero, 0x3
    /* 49160 80059160 0E80013C */  lui        $at, %hi(quests + 0x23)
    /* 49164 80059164 63DA22A0 */  sb         $v0, %lo(quests + 0x23)($at)
    /* 49168 80059168 01000424 */  addiu      $a0, $zero, 0x1
    /* 4916C 8005916C 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 49170 80059170 01000524 */   addiu     $a1, $zero, 0x1
    /* 49174 80059174 21200000 */  addu       $a0, $zero, $zero
    /* 49178 80059178 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 4917C 8005917C FFFF2632 */  andi       $a2, $s1, 0xFFFF
    /* 49180 80059180 183E010C */  jal        NetSendCmdParam2__FUcUcUsUs
    /* 49184 80059184 FFFF4732 */   andi      $a3, $s2, 0xFFFF
  .L80059188:
    /* 49188 80059188 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 4918C 8005918C 2800B28F */  lw         $s2, 0x28($sp)
    /* 49190 80059190 2400B18F */  lw         $s1, 0x24($sp)
    /* 49194 80059194 2000B08F */  lw         $s0, 0x20($sp)
    /* 49198 80059198 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4919C 8005919C 0800E003 */  jr         $ra
    /* 491A0 800591A0 00000000 */   nop
endlabel OperateMushPatch__Fii
