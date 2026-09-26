.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutMissile__Fi, 0x25C

glabel PutMissile__Fi
    /* F4C 8013AB44 80100400 */  sll        $v0, $a0, 2
    /* F50 8013AB48 21104400 */  addu       $v0, $v0, $a0
    /* F54 8013AB4C 80100200 */  sll        $v0, $v0, 2
    /* F58 8013AB50 23104400 */  subu       $v0, $v0, $a0
    /* F5C 8013AB54 80100200 */  sll        $v0, $v0, 2
    /* F60 8013AB58 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F64 8013AB5C 21082200 */  addu       $at, $at, $v0
    /* F68 8013AB60 892C2780 */  lb         $a3, %lo(missile + 0x31)($at)
    /* F6C 8013AB64 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F70 8013AB68 21082200 */  addu       $at, $at, $v0
    /* F74 8013AB6C 8A2C2880 */  lb         $t0, %lo(missile + 0x32)($at)
    /* F78 8013AB70 0700E018 */  blez       $a3, .L8013AB90
    /* F7C 8013AB74 F8FFBD27 */   addiu     $sp, $sp, -0x8
    /* F80 8013AB78 05000019 */  blez       $t0, .L8013AB90
    /* F84 8013AB7C 7000E228 */   slti      $v0, $a3, 0x70
    /* F88 8013AB80 03004010 */  beqz       $v0, .L8013AB90
    /* F8C 8013AB84 70000229 */   slti      $v0, $t0, 0x70
    /* F90 8013AB88 0B004014 */  bnez       $v0, .L8013ABB8
    /* F94 8013AB8C 80100400 */   sll       $v0, $a0, 2
  .L8013AB90:
    /* F98 8013AB90 80100400 */  sll        $v0, $a0, 2
    /* F9C 8013AB94 21104400 */  addu       $v0, $v0, $a0
    /* FA0 8013AB98 80100200 */  sll        $v0, $v0, 2
    /* FA4 8013AB9C 23104400 */  subu       $v0, $v0, $a0
    /* FA8 8013ABA0 80100200 */  sll        $v0, $v0, 2
    /* FAC 8013ABA4 01000324 */  addiu      $v1, $zero, 0x1
    /* FB0 8013ABA8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* FB4 8013ABAC 21082200 */  addu       $at, $at, $v0
    /* FB8 8013ABB0 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* FBC 8013ABB4 80100400 */  sll        $v0, $a0, 2
  .L8013ABB8:
    /* FC0 8013ABB8 21104400 */  addu       $v0, $v0, $a0
    /* FC4 8013ABBC 80100200 */  sll        $v0, $v0, 2
    /* FC8 8013ABC0 23104400 */  subu       $v0, $v0, $a0
    /* FCC 8013ABC4 80480200 */  sll        $t1, $v0, 2
    /* FD0 8013ABC8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* FD4 8013ABCC 21082900 */  addu       $at, $at, $t1
    /* FD8 8013ABD0 902C2290 */  lbu        $v0, %lo(missile + 0x38)($at)
    /* FDC 8013ABD4 00000000 */  nop
    /* FE0 8013ABD8 6E004014 */  bnez       $v0, .L8013AD94
    /* FE4 8013ABDC C0100800 */   sll       $v0, $t0, 3
    /* FE8 8013ABE0 C0180700 */  sll        $v1, $a3, 3
    /* FEC 8013ABE4 23186700 */  subu       $v1, $v1, $a3
    /* FF0 8013ABE8 C0190300 */  sll        $v1, $v1, 7
    /* FF4 8013ABEC 21284300 */  addu       $a1, $v0, $v1
    /* FF8 8013ABF0 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* FFC 8013ABF4 21082500 */  addu       $at, $at, $a1
    /* 1000 8013ABF8 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1004 8013ABFC 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 1008 8013AC00 21082500 */  addu       $at, $at, $a1
    /* 100C 8013AC04 2D7A2380 */  lb         $v1, %lo(dung_map + 0x5)($at)
    /* 1010 8013AC08 40004234 */  ori        $v0, $v0, 0x40
    /* 1014 8013AC0C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1018 8013AC10 21082500 */  addu       $at, $at, $a1
    /* 101C 8013AC14 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 1020 8013AC18 07006014 */  bnez       $v1, .L8013AC38
    /* 1024 8013AC1C 21106000 */   addu      $v0, $v1, $zero
    /* 1028 8013AC20 01008224 */  addiu      $v0, $a0, 0x1
    /* 102C 8013AC24 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 1030 8013AC28 21082500 */  addu       $at, $at, $a1
    /* 1034 8013AC2C 2D7A22A0 */  sb         $v0, %lo(dung_map + 0x5)($at)
    /* 1038 8013AC30 5AEB0408 */  j          .L8013AD68
    /* 103C 8013AC34 80100400 */   sll       $v0, $a0, 2
  .L8013AC38:
    /* 1040 8013AC38 3B006104 */  bgez       $v1, .L8013AD28
    /* 1044 8013AC3C 21304000 */   addu      $a2, $v0, $zero
    /* 1048 8013AC40 6000C230 */  andi       $v0, $a2, 0x60
    /* 104C 8013AC44 42390200 */  srl        $a3, $v0, 5
    /* 1050 8013AC48 1F00C230 */  andi       $v0, $a2, 0x1F
    /* 1054 8013AC4C 1080033C */  lui        $v1, %hi(dMissArray)
    /* 1058 8013AC50 74516324 */  addiu      $v1, $v1, %lo(dMissArray)
    /* 105C 8013AC54 80100200 */  sll        $v0, $v0, 2
    /* 1060 8013AC58 21304300 */  addu       $a2, $v0, $v1
    /* 1064 8013AC5C 2110C700 */  addu       $v0, $a2, $a3
    /* 1068 8013AC60 00004380 */  lb         $v1, 0x0($v0)
    /* 106C 8013AC64 00000000 */  nop
    /* 1070 8013AC68 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1074 8013AC6C 80100300 */  sll        $v0, $v1, 2
    /* 1078 8013AC70 21104300 */  addu       $v0, $v0, $v1
    /* 107C 8013AC74 80100200 */  sll        $v0, $v0, 2
    /* 1080 8013AC78 23104300 */  subu       $v0, $v0, $v1
    /* 1084 8013AC7C 80100200 */  sll        $v0, $v0, 2
    /* 1088 8013AC80 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 108C 8013AC84 21082900 */  addu       $at, $at, $t1
    /* 1090 8013AC88 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 1094 8013AC8C 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 1098 8013AC90 21082200 */  addu       $at, $at, $v0
    /* 109C 8013AC94 882C2280 */  lb         $v0, %lo(missile + 0x30)($at)
    /* 10A0 8013AC98 00000000 */  nop
    /* 10A4 8013AC9C 3D006210 */  beq        $v1, $v0, .L8013AD94
    /* 10A8 8013ACA0 0100E324 */   addiu     $v1, $a3, 0x1
    /* 10AC 8013ACA4 04006228 */  slti       $v0, $v1, 0x4
    /* 10B0 8013ACA8 2E004010 */  beqz       $v0, .L8013AD64
    /* 10B4 8013ACAC 01008224 */   addiu     $v0, $a0, 0x1
    /* 10B8 8013ACB0 2118C300 */  addu       $v1, $a2, $v1
    /* 10BC 8013ACB4 000062A0 */  sb         $v0, 0x0($v1)
    /* 10C0 8013ACB8 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 10C4 8013ACBC 21082500 */  addu       $at, $at, $a1
    /* 10C8 8013ACC0 2D7A2290 */  lbu        $v0, %lo(dung_map + 0x5)($at)
    /* 10CC 8013ACC4 00000000 */  nop
    /* 10D0 8013ACC8 20004224 */  addiu      $v0, $v0, 0x20
    /* 10D4 8013ACCC 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 10D8 8013ACD0 21082500 */  addu       $at, $at, $a1
    /* 10DC 8013ACD4 2D7A22A0 */  sb         $v0, %lo(dung_map + 0x5)($at)
    /* 10E0 8013ACD8 5AEB0408 */  j          .L8013AD68
    /* 10E4 8013ACDC 80100400 */   sll       $v0, $a0, 2
  .L8013ACE0:
    /* 10E8 8013ACE0 01008224 */  addiu      $v0, $a0, 0x1
    /* 10EC 8013ACE4 1080013C */  lui        $at, %hi(dMissArray)
    /* 10F0 8013ACE8 21082300 */  addu       $at, $at, $v1
    /* 10F4 8013ACEC 745126A0 */  sb         $a2, %lo(dMissArray)($at)
    /* 10F8 8013ACF0 1080013C */  lui        $at, %hi(dMissArray + 0x1)
    /* 10FC 8013ACF4 21082300 */  addu       $at, $at, $v1
    /* 1100 8013ACF8 755122A0 */  sb         $v0, %lo(dMissArray + 0x1)($at)
    /* 1104 8013ACFC C0180800 */  sll        $v1, $t0, 3
    /* 1108 8013AD00 C0100700 */  sll        $v0, $a3, 3
    /* 110C 8013AD04 23104700 */  subu       $v0, $v0, $a3
    /* 1110 8013AD08 C0110200 */  sll        $v0, $v0, 7
    /* 1114 8013AD0C 21186200 */  addu       $v1, $v1, $v0
    /* 1118 8013AD10 A0FFA224 */  addiu      $v0, $a1, -0x60
    /* 111C 8013AD14 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 1120 8013AD18 21082300 */  addu       $at, $at, $v1
    /* 1124 8013AD1C 2D7A22A0 */  sb         $v0, %lo(dung_map + 0x5)($at)
    /* 1128 8013AD20 5AEB0408 */  j          .L8013AD68
    /* 112C 8013AD24 80100400 */   sll       $v0, $a0, 2
  .L8013AD28:
    /* 1130 8013AD28 21280000 */  addu       $a1, $zero, $zero
    /* 1134 8013AD2C 00160500 */  sll        $v0, $a1, 24
  .L8013AD30:
    /* 1138 8013AD30 831D0200 */  sra        $v1, $v0, 22
    /* 113C 8013AD34 1080013C */  lui        $at, %hi(dMissArray)
    /* 1140 8013AD38 21082300 */  addu       $at, $at, $v1
    /* 1144 8013AD3C 74512280 */  lb         $v0, %lo(dMissArray)($at)
    /* 1148 8013AD40 00000000 */  nop
    /* 114C 8013AD44 E6FF4010 */  beqz       $v0, .L8013ACE0
    /* 1150 8013AD48 0100A224 */   addiu     $v0, $a1, 0x1
    /* 1154 8013AD4C 21284000 */  addu       $a1, $v0, $zero
    /* 1158 8013AD50 00160200 */  sll        $v0, $v0, 24
    /* 115C 8013AD54 03160200 */  sra        $v0, $v0, 24
    /* 1160 8013AD58 20004228 */  slti       $v0, $v0, 0x20
    /* 1164 8013AD5C F4FF4014 */  bnez       $v0, .L8013AD30
    /* 1168 8013AD60 00160500 */   sll       $v0, $a1, 24
  .L8013AD64:
    /* 116C 8013AD64 80100400 */  sll        $v0, $a0, 2
  .L8013AD68:
    /* 1170 8013AD68 21104400 */  addu       $v0, $v0, $a0
    /* 1174 8013AD6C 80100200 */  sll        $v0, $v0, 2
    /* 1178 8013AD70 23104400 */  subu       $v0, $v0, $a0
    /* 117C 8013AD74 80100200 */  sll        $v0, $v0, 2
    /* 1180 8013AD78 1080013C */  lui        $at, %hi(missile + 0x3C)
    /* 1184 8013AD7C 21082200 */  addu       $at, $at, $v0
    /* 1188 8013AD80 942C2290 */  lbu        $v0, %lo(missile + 0x3C)($at)
    /* 118C 8013AD84 00000000 */  nop
    /* 1190 8013AD88 02004010 */  beqz       $v0, .L8013AD94
    /* 1194 8013AD8C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1198 8013AD90 0C1B82A3 */  sb         $v0, %gp_rel(MissilePreFlag)($gp)
  .L8013AD94:
    /* 119C 8013AD94 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 11A0 8013AD98 0800E003 */  jr         $ra
    /* 11A4 8013AD9C 00000000 */   nop
endlabel PutMissile__Fi
