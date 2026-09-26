.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutMissile__Fi, 0xF8

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
    /* FE0 8013ABD8 6E004014 */  bnez       $v0, D_8013AD94
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
    /* 1038 8013AC30 5AEB0408 */  j          D_8013AD68
    /* 103C 8013AC34 80100400 */   sll       $v0, $a0, 2
  .L8013AC38:
    /* 1040 8013AC38 3B006104 */  bgez       $v1, D_8013AD28
endlabel PutMissile__Fi
