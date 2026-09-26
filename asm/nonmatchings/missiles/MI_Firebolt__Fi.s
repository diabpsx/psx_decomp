.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Firebolt__Fi, 0x714

glabel MI_Firebolt__Fi
    /* A1A0 80143D98 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* A1A4 80143D9C 3800B2AF */  sw         $s2, 0x38($sp)
    /* A1A8 80143DA0 21908000 */  addu       $s2, $a0, $zero
    /* A1AC 80143DA4 80101200 */  sll        $v0, $s2, 2
    /* A1B0 80143DA8 21105200 */  addu       $v0, $v0, $s2
    /* A1B4 80143DAC 80100200 */  sll        $v0, $v0, 2
    /* A1B8 80143DB0 23105200 */  subu       $v0, $v0, $s2
    /* A1BC 80143DB4 3000B0AF */  sw         $s0, 0x30($sp)
    /* A1C0 80143DB8 80800200 */  sll        $s0, $v0, 2
    /* A1C4 80143DBC 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* A1C8 80143DC0 4800BFAF */  sw         $ra, 0x48($sp)
    /* A1CC 80143DC4 4400B5AF */  sw         $s5, 0x44($sp)
    /* A1D0 80143DC8 4000B4AF */  sw         $s4, 0x40($sp)
    /* A1D4 80143DCC 3400B1AF */  sw         $s1, 0x34($sp)
    /* A1D8 80143DD0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A1DC 80143DD4 21083000 */  addu       $at, $at, $s0
    /* A1E0 80143DD8 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* A1E4 80143DDC 1080013C */  lui        $at, %hi(missile + 0x30)
    /* A1E8 80143DE0 21083000 */  addu       $at, $at, $s0
    /* A1EC 80143DE4 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* A1F0 80143DE8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* A1F4 80143DEC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A1F8 80143DF0 21083000 */  addu       $at, $at, $s0
    /* A1FC 80143DF4 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* A200 80143DF8 3F000224 */  addiu      $v0, $zero, 0x3F
    /* A204 80143DFC 23006214 */  bne        $v1, $v0, .L80143E8C
    /* A208 80143E00 21980000 */   addu      $s3, $zero, $zero
    /* A20C 80143E04 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* A210 80143E08 21083000 */  addu       $at, $at, $s0
    /* A214 80143E0C 972C2380 */  lb         $v1, %lo(missile + 0x3F)($at)
    /* A218 80143E10 08000224 */  addiu      $v0, $zero, 0x8
    /* A21C 80143E14 1E006214 */  bne        $v1, $v0, .L80143E90
    /* A220 80143E18 80101200 */   sll       $v0, $s2, 2
    /* A224 80143E1C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A228 80143E20 21083000 */  addu       $at, $at, $s0
    /* A22C 80143E24 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* A230 80143E28 00000000 */  nop
    /* A234 80143E2C 93014014 */  bnez       $v0, .L8014447C
    /* A238 80143E30 21204002 */   addu      $a0, $s2, $zero
    /* A23C 80143E34 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* A240 80143E38 21083000 */  addu       $at, $at, $s0
    /* A244 80143E3C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* A248 80143E40 00000000 */  nop
    /* A24C 80143E44 03008004 */  bltz       $a0, .L80143E54
    /* A250 80143E48 00000000 */   nop
    /* A254 80143E4C D034010C */  jal        AddUnLight__Fi
    /* A258 80143E50 00000000 */   nop
  .L80143E54:
    /* A25C 80143E54 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A260 80143E58 21083000 */  addu       $at, $at, $s0
    /* A264 80143E5C 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* A268 80143E60 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A26C 80143E64 21083000 */  addu       $at, $at, $s0
    /* A270 80143E68 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* A274 80143E6C 01000224 */  addiu      $v0, $zero, 0x1
    /* A278 80143E70 1080013C */  lui        $at, %hi(missile + 0x38)
    /* A27C 80143E74 21083000 */  addu       $at, $at, $s0
    /* A280 80143E78 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* A284 80143E7C E1F5000C */  jal        PlaySfxLoc__Fiii
    /* A288 80143E80 4B000424 */   addiu     $a0, $zero, 0x4B
    /* A28C 80143E84 1F110508 */  j          .L8014447C
    /* A290 80143E88 21204002 */   addu      $a0, $s2, $zero
  .L80143E8C:
    /* A294 80143E8C 80101200 */  sll        $v0, $s2, 2
  .L80143E90:
    /* A298 80143E90 21105200 */  addu       $v0, $v0, $s2
    /* A29C 80143E94 80100200 */  sll        $v0, $v0, 2
    /* A2A0 80143E98 23105200 */  subu       $v0, $v0, $s2
    /* A2A4 80143E9C 80800200 */  sll        $s0, $v0, 2
    /* A2A8 80143EA0 1080013C */  lui        $at, %hi(missile + 0x8)
    /* A2AC 80143EA4 21083000 */  addu       $at, $at, $s0
    /* A2B0 80143EA8 602C348C */  lw         $s4, %lo(missile + 0x8)($at)
    /* A2B4 80143EAC 1080013C */  lui        $at, %hi(missile)
    /* A2B8 80143EB0 21083000 */  addu       $at, $at, $s0
    /* A2BC 80143EB4 582C228C */  lw         $v0, %lo(missile)($at)
    /* A2C0 80143EB8 1080013C */  lui        $at, %hi(missile + 0x4)
    /* A2C4 80143EBC 21083000 */  addu       $at, $at, $s0
    /* A2C8 80143EC0 5C2C238C */  lw         $v1, %lo(missile + 0x4)($at)
    /* A2CC 80143EC4 21108202 */  addu       $v0, $s4, $v0
    /* A2D0 80143EC8 1080013C */  lui        $at, %hi(missile + 0x8)
    /* A2D4 80143ECC 21083000 */  addu       $at, $at, $s0
    /* A2D8 80143ED0 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* A2DC 80143ED4 1080013C */  lui        $at, %hi(missile + 0xC)
    /* A2E0 80143ED8 21083000 */  addu       $at, $at, $s0
    /* A2E4 80143EDC 642C228C */  lw         $v0, %lo(missile + 0xC)($at)
    /* A2E8 80143EE0 1080013C */  lui        $at, %hi(missile + 0xC)
    /* A2EC 80143EE4 21083000 */  addu       $at, $at, $s0
    /* A2F0 80143EE8 642C358C */  lw         $s5, %lo(missile + 0xC)($at)
    /* A2F4 80143EEC 21104300 */  addu       $v0, $v0, $v1
    /* A2F8 80143EF0 1080013C */  lui        $at, %hi(missile + 0xC)
    /* A2FC 80143EF4 21083000 */  addu       $at, $at, $s0
    /* A300 80143EF8 642C22AC */  sw         $v0, %lo(missile + 0xC)($at)
    /* A304 80143EFC 68EB040C */  jal        GetMissilePos__Fi
    /* A308 80143F00 21204002 */   addu      $a0, $s2, $zero
    /* A30C 80143F04 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* A310 80143F08 21083000 */  addu       $at, $at, $s0
    /* A314 80143F0C 862C3184 */  lh         $s1, %lo(missile + 0x2E)($at)
    /* A318 80143F10 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* A31C 80143F14 5C002212 */  beq        $s1, $v0, .L80144088
    /* A320 80143F18 00000000 */   nop
    /* A324 80143F1C 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* A328 80143F20 21083000 */  addu       $at, $at, $s0
    /* A32C 80143F24 722C2294 */  lhu        $v0, %lo(missile + 0x1A)($at)
    /* A330 80143F28 00000000 */  nop
    /* A334 80143F2C 42004014 */  bnez       $v0, .L80144038
    /* A338 80143F30 18000224 */   addiu     $v0, $zero, 0x18
    /* A33C 80143F34 1080013C */  lui        $at, %hi(missile + 0x30)
    /* A340 80143F38 21083000 */  addu       $at, $at, $s0
    /* A344 80143F3C 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* A348 80143F40 00000000 */  nop
    /* A34C 80143F44 0C006210 */  beq        $v1, $v0, .L80143F78
    /* A350 80143F48 19006228 */   slti      $v0, $v1, 0x19
    /* A354 80143F4C 05004010 */  beqz       $v0, .L80143F64
    /* A358 80143F50 01000224 */   addiu     $v0, $zero, 0x1
    /* A35C 80143F54 1F006210 */  beq        $v1, $v0, .L80143FD4
    /* A360 80143F58 80101200 */   sll       $v0, $s2, 2
    /* A364 80143F5C 2B100508 */  j          .L801440AC
    /* A368 80143F60 00000000 */   nop
  .L80143F64:
    /* A36C 80143F64 3F000224 */  addiu      $v0, $zero, 0x3F
    /* A370 80143F68 31006210 */  beq        $v1, $v0, .L80144030
    /* A374 80143F6C 80101200 */   sll       $v0, $s2, 2
    /* A378 80143F70 2B100508 */  j          .L801440AC
    /* A37C 80143F74 00000000 */   nop
  .L80143F78:
    /* A380 80143F78 40101100 */  sll        $v0, $s1, 1
    /* A384 80143F7C 21105100 */  addu       $v0, $v0, $s1
    /* A388 80143F80 80100200 */  sll        $v0, $v0, 2
    /* A38C 80143F84 21105100 */  addu       $v0, $v0, $s1
    /* A390 80143F88 00110200 */  sll        $v0, $v0, 4
    /* A394 80143F8C 23105100 */  subu       $v0, $v0, $s1
    /* A398 80143F90 80100200 */  sll        $v0, $v0, 2
    /* A39C 80143F94 21105100 */  addu       $v0, $v0, $s1
    /* A3A0 80143F98 C0100200 */  sll        $v0, $v0, 3
    /* A3A4 80143F9C 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* A3A8 80143FA0 21082200 */  addu       $at, $at, $v0
    /* A3AC 80143FA4 34A62294 */  lhu        $v0, %lo(plr + 0xFC)($at)
    /* A3B0 80143FA8 1080013C */  lui        $at, %hi(missile + 0x40)
    /* A3B4 80143FAC 21083000 */  addu       $at, $at, $s0
    /* A3B8 80143FB0 982C2480 */  lb         $a0, %lo(missile + 0x40)($at)
    /* A3BC 80143FB4 00140200 */  sll        $v0, $v0, 16
    /* A3C0 80143FB8 431C0200 */  sra        $v1, $v0, 17
    /* A3C4 80143FBC C3140200 */  sra        $v0, $v0, 19
    /* A3C8 80143FC0 23186200 */  subu       $v1, $v1, $v0
    /* A3CC 80143FC4 40100400 */  sll        $v0, $a0, 1
    /* A3D0 80143FC8 21186200 */  addu       $v1, $v1, $v0
    /* A3D4 80143FCC 2A100508 */  j          .L801440A8
    /* A3D8 80143FD0 21986400 */   addu      $s3, $v1, $a0
  .L80143FD4:
    /* A3DC 80143FD4 C9F6000C */  jal        ENG_random__Fl
    /* A3E0 80143FD8 0A000424 */   addiu     $a0, $zero, 0xA
    /* A3E4 80143FDC 40181100 */  sll        $v1, $s1, 1
    /* A3E8 80143FE0 21187100 */  addu       $v1, $v1, $s1
    /* A3EC 80143FE4 80180300 */  sll        $v1, $v1, 2
    /* A3F0 80143FE8 21187100 */  addu       $v1, $v1, $s1
    /* A3F4 80143FEC 00190300 */  sll        $v1, $v1, 4
    /* A3F8 80143FF0 23187100 */  subu       $v1, $v1, $s1
    /* A3FC 80143FF4 80180300 */  sll        $v1, $v1, 2
    /* A400 80143FF8 21187100 */  addu       $v1, $v1, $s1
    /* A404 80143FFC C0180300 */  sll        $v1, $v1, 3
    /* A408 80144000 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* A40C 80144004 21082300 */  addu       $at, $at, $v1
    /* A410 80144008 34A62394 */  lhu        $v1, %lo(plr + 0xFC)($at)
    /* A414 8014400C 1080013C */  lui        $at, %hi(missile + 0x40)
    /* A418 80144010 21083000 */  addu       $at, $at, $s0
    /* A41C 80144014 982C2480 */  lb         $a0, %lo(missile + 0x40)($at)
    /* A420 80144018 001C0300 */  sll        $v1, $v1, 16
    /* A424 8014401C C31C0300 */  sra        $v1, $v1, 19
    /* A428 80144020 01006324 */  addiu      $v1, $v1, 0x1
    /* A42C 80144024 21104300 */  addu       $v0, $v0, $v1
    /* A430 80144028 2A100508 */  j          .L801440A8
    /* A434 8014402C 21984400 */   addu      $s3, $v0, $a0
  .L80144030:
    /* A438 80144030 2A100508 */  j          .L801440A8
    /* A43C 80144034 21980000 */   addu      $s3, $zero, $zero
  .L80144038:
    /* A440 80144038 40801100 */  sll        $s0, $s1, 1
    /* A444 8014403C 21801102 */  addu       $s0, $s0, $s1
    /* A448 80144040 80801000 */  sll        $s0, $s0, 2
    /* A44C 80144044 21801102 */  addu       $s0, $s0, $s1
    /* A450 80144048 C0801000 */  sll        $s0, $s0, 3
    /* A454 8014404C 1080013C */  lui        $at, %hi(monster + 0x52)
    /* A458 80144050 21083000 */  addu       $at, $at, $s0
    /* A45C 80144054 E6532490 */  lbu        $a0, %lo(monster + 0x52)($at)
    /* A460 80144058 1080013C */  lui        $at, %hi(monster + 0x51)
    /* A464 8014405C 21083000 */  addu       $at, $at, $s0
    /* A468 80144060 E5532290 */  lbu        $v0, %lo(monster + 0x51)($at)
    /* A46C 80144064 00000000 */  nop
    /* A470 80144068 23208200 */  subu       $a0, $a0, $v0
    /* A474 8014406C C9F6000C */  jal        ENG_random__Fl
    /* A478 80144070 01008424 */   addiu     $a0, $a0, 0x1
    /* A47C 80144074 1080013C */  lui        $at, %hi(monster + 0x51)
    /* A480 80144078 21083000 */  addu       $at, $at, $s0
    /* A484 8014407C E5532390 */  lbu        $v1, %lo(monster + 0x51)($at)
    /* A488 80144080 2A100508 */  j          .L801440A8
    /* A48C 80144084 21984300 */   addu      $s3, $v0, $v1
  .L80144088:
    /* A490 80144088 1280043C */  lui        $a0, %hi(currlevel)
    /* A494 8014408C 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* A498 80144090 C9F6000C */  jal        ENG_random__Fl
    /* A49C 80144094 40200400 */   sll       $a0, $a0, 1
    /* A4A0 80144098 1280033C */  lui        $v1, %hi(currlevel)
    /* A4A4 8014409C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* A4A8 801440A0 00000000 */  nop
    /* A4AC 801440A4 21984300 */  addu       $s3, $v0, $v1
  .L801440A8:
    /* A4B0 801440A8 80101200 */  sll        $v0, $s2, 2
  .L801440AC:
    /* A4B4 801440AC 21105200 */  addu       $v0, $v0, $s2
    /* A4B8 801440B0 80100200 */  sll        $v0, $v0, 2
    /* A4BC 801440B4 23105200 */  subu       $v0, $v0, $s2
    /* A4C0 801440B8 80380200 */  sll        $a3, $v0, 2
    /* A4C4 801440BC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A4C8 801440C0 21082700 */  addu       $at, $at, $a3
    /* A4CC 801440C4 892C2880 */  lb         $t0, %lo(missile + 0x31)($at)
    /* A4D0 801440C8 1080013C */  lui        $at, %hi(missile + 0x35)
    /* A4D4 801440CC 21082700 */  addu       $at, $at, $a3
    /* A4D8 801440D0 8D2C2280 */  lb         $v0, %lo(missile + 0x35)($at)
    /* A4DC 801440D4 00000000 */  nop
    /* A4E0 801440D8 0A000215 */  bne        $t0, $v0, .L80144104
    /* A4E4 801440DC 00000000 */   nop
    /* A4E8 801440E0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A4EC 801440E4 21082700 */  addu       $at, $at, $a3
    /* A4F0 801440E8 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* A4F4 801440EC 1080013C */  lui        $at, %hi(missile + 0x36)
    /* A4F8 801440F0 21082700 */  addu       $at, $at, $a3
    /* A4FC 801440F4 8E2C2280 */  lb         $v0, %lo(missile + 0x36)($at)
    /* A500 801440F8 00000000 */  nop
    /* A504 801440FC 0F006210 */  beq        $v1, $v0, .L8014413C
    /* A508 80144100 80101200 */   sll       $v0, $s2, 2
  .L80144104:
    /* A50C 80144104 21204002 */  addu       $a0, $s2, $zero
    /* A510 80144108 21286002 */  addu       $a1, $s3, $zero
    /* A514 8014410C 2130A000 */  addu       $a2, $a1, $zero
    /* A518 80144110 1000A8AF */  sw         $t0, 0x10($sp)
    /* A51C 80144114 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A520 80144118 21082700 */  addu       $at, $at, $a3
    /* A524 8014411C 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* A528 80144120 21380000 */  addu       $a3, $zero, $zero
    /* A52C 80144124 01000224 */  addiu      $v0, $zero, 0x1
    /* A530 80144128 1800A0AF */  sw         $zero, 0x18($sp)
    /* A534 8014412C 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* A538 80144130 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* A53C 80144134 1400A3AF */   sw        $v1, 0x14($sp)
    /* A540 80144138 80101200 */  sll        $v0, $s2, 2
  .L8014413C:
    /* A544 8014413C 21105200 */  addu       $v0, $v0, $s2
    /* A548 80144140 80100200 */  sll        $v0, $v0, 2
    /* A54C 80144144 23105200 */  subu       $v0, $v0, $s2
    /* A550 80144148 80800200 */  sll        $s0, $v0, 2
    /* A554 8014414C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A558 80144150 21083000 */  addu       $at, $at, $s0
    /* A55C 80144154 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* A560 80144158 00000000 */  nop
    /* A564 8014415C 7B004014 */  bnez       $v0, .L8014434C
    /* A568 80144160 01000224 */   addiu     $v0, $zero, 0x1
    /* A56C 80144164 1080013C */  lui        $at, %hi(missile + 0x38)
    /* A570 80144168 21083000 */  addu       $at, $at, $s0
    /* A574 8014416C 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* A578 80144170 1080013C */  lui        $at, %hi(missile + 0x8)
    /* A57C 80144174 21083000 */  addu       $at, $at, $s0
    /* A580 80144178 602C34AC */  sw         $s4, %lo(missile + 0x8)($at)
    /* A584 8014417C 1080013C */  lui        $at, %hi(missile + 0xC)
    /* A588 80144180 21083000 */  addu       $at, $at, $s0
    /* A58C 80144184 642C35AC */  sw         $s5, %lo(missile + 0xC)($at)
    /* A590 80144188 68EB040C */  jal        GetMissilePos__Fi
    /* A594 8014418C 21204002 */   addu      $a0, $s2, $zero
    /* A598 80144190 1080013C */  lui        $at, %hi(missile + 0x30)
    /* A59C 80144194 21083000 */  addu       $at, $at, $s0
    /* A5A0 80144198 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* A5A4 8014419C 18000224 */  addiu      $v0, $zero, 0x18
    /* A5A8 801441A0 10006210 */  beq        $v1, $v0, .L801441E4
    /* A5AC 801441A4 19006228 */   slti      $v0, $v1, 0x19
    /* A5B0 801441A8 07004010 */  beqz       $v0, .L801441C8
    /* A5B4 801441AC 01000224 */   addiu     $v0, $zero, 0x1
    /* A5B8 801441B0 17006210 */  beq        $v1, $v0, .L80144210
    /* A5BC 801441B4 15000224 */   addiu     $v0, $zero, 0x15
    /* A5C0 801441B8 16006210 */  beq        $v1, $v0, .L80144214
    /* A5C4 801441BC 80101200 */   sll       $v0, $s2, 2
    /* A5C8 801441C0 C6100508 */  j          .L80144318
    /* A5CC 801441C4 21105200 */   addu      $v0, $v0, $s2
  .L801441C8:
    /* A5D0 801441C8 39000224 */  addiu      $v0, $zero, 0x39
    /* A5D4 801441CC 2B006210 */  beq        $v1, $v0, .L8014427C
    /* A5D8 801441D0 3F000224 */   addiu     $v0, $zero, 0x3F
    /* A5DC 801441D4 44006210 */  beq        $v1, $v0, .L801442E8
    /* A5E0 801441D8 21204002 */   addu      $a0, $s2, $zero
    /* A5E4 801441DC C5100508 */  j          .L80144314
    /* A5E8 801441E0 80101200 */   sll       $v0, $s2, 2
  .L801441E4:
    /* A5EC 801441E4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A5F0 801441E8 21083000 */  addu       $at, $at, $s0
    /* A5F4 801441EC 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* A5F8 801441F0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A5FC 801441F4 21083000 */  addu       $at, $at, $s0
    /* A600 801441F8 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* A604 801441FC 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* A608 80144200 21083000 */  addu       $at, $at, $s0
    /* A60C 80144204 972C2380 */  lb         $v1, %lo(missile + 0x3F)($at)
    /* A610 80144208 A9100508 */  j          .L801442A4
    /* A614 8014420C 19000224 */   addiu     $v0, $zero, 0x19
  .L80144210:
    /* A618 80144210 80101200 */  sll        $v0, $s2, 2
  .L80144214:
    /* A61C 80144214 21105200 */  addu       $v0, $v0, $s2
    /* A620 80144218 80100200 */  sll        $v0, $v0, 2
    /* A624 8014421C 23105200 */  subu       $v0, $v0, $s2
    /* A628 80144220 80100200 */  sll        $v0, $v0, 2
    /* A62C 80144224 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A630 80144228 21082200 */  addu       $at, $at, $v0
    /* A634 8014422C 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* A638 80144230 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A63C 80144234 21082200 */  addu       $at, $at, $v0
    /* A640 80144238 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* A644 8014423C 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* A648 80144240 21082200 */  addu       $at, $at, $v0
    /* A64C 80144244 972C2880 */  lb         $t0, %lo(missile + 0x3F)($at)
    /* A650 80144248 09000324 */  addiu      $v1, $zero, 0x9
    /* A654 8014424C 1400A3AF */  sw         $v1, 0x14($sp)
    /* A658 80144250 1000A8AF */  sw         $t0, 0x10($sp)
    /* A65C 80144254 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* A660 80144258 21082200 */  addu       $at, $at, $v0
    /* A664 8014425C 722C2380 */  lb         $v1, %lo(missile + 0x1A)($at)
    /* A668 80144260 00000000 */  nop
    /* A66C 80144264 1800A3AF */  sw         $v1, 0x18($sp)
    /* A670 80144268 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* A674 8014426C 21082200 */  addu       $at, $at, $v0
    /* A678 80144270 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* A67C 80144274 B3100508 */  j          .L801442CC
    /* A680 80144278 21304002 */   addu      $a2, $s2, $zero
  .L8014427C:
    /* A684 8014427C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A688 80144280 21083000 */  addu       $at, $at, $s0
    /* A68C 80144284 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* A690 80144288 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A694 8014428C 21083000 */  addu       $at, $at, $s0
    /* A698 80144290 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* A69C 80144294 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* A6A0 80144298 21083000 */  addu       $at, $at, $s0
    /* A6A4 8014429C 972C2380 */  lb         $v1, %lo(missile + 0x3F)($at)
    /* A6A8 801442A0 3A000224 */  addiu      $v0, $zero, 0x3A
  .L801442A4:
    /* A6AC 801442A4 1400A2AF */  sw         $v0, 0x14($sp)
    /* A6B0 801442A8 1000A3AF */  sw         $v1, 0x10($sp)
    /* A6B4 801442AC 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* A6B8 801442B0 21083000 */  addu       $at, $at, $s0
    /* A6BC 801442B4 722C2280 */  lb         $v0, %lo(missile + 0x1A)($at)
    /* A6C0 801442B8 21304002 */  addu       $a2, $s2, $zero
    /* A6C4 801442BC 1800A2AF */  sw         $v0, 0x18($sp)
    /* A6C8 801442C0 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* A6CC 801442C4 21083000 */  addu       $at, $at, $s0
    /* A6D0 801442C8 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
  .L801442CC:
    /* A6D4 801442CC 21380000 */  addu       $a3, $zero, $zero
    /* A6D8 801442D0 2000A0AF */  sw         $zero, 0x20($sp)
    /* A6DC 801442D4 2400A0AF */  sw         $zero, 0x24($sp)
    /* A6E0 801442D8 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* A6E4 801442DC 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* A6E8 801442E0 C5100508 */  j          .L80144314
    /* A6EC 801442E4 80101200 */   sll       $v0, $s2, 2
  .L801442E8:
    /* A6F0 801442E8 09F5040C */  jal        SetMissDir__Fii
    /* A6F4 801442EC 08000524 */   addiu     $a1, $zero, 0x8
    /* A6F8 801442F0 07000224 */  addiu      $v0, $zero, 0x7
    /* A6FC 801442F4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A700 801442F8 21083000 */  addu       $at, $at, $s0
    /* A704 801442FC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* A708 80144300 1080013C */  lui        $at, %hi(missile + 0x38)
    /* A70C 80144304 21083000 */  addu       $at, $at, $s0
    /* A710 80144308 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
    /* A714 8014430C 1F110508 */  j          .L8014447C
    /* A718 80144310 21204002 */   addu      $a0, $s2, $zero
  .L80144314:
    /* A71C 80144314 21105200 */  addu       $v0, $v0, $s2
  .L80144318:
    /* A720 80144318 80100200 */  sll        $v0, $v0, 2
    /* A724 8014431C 23105200 */  subu       $v0, $v0, $s2
    /* A728 80144320 80100200 */  sll        $v0, $v0, 2
    /* A72C 80144324 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* A730 80144328 21082200 */  addu       $at, $at, $v0
    /* A734 8014432C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* A738 80144330 00000000 */  nop
    /* A73C 80144334 50008004 */  bltz       $a0, .L80144478
    /* A740 80144338 00000000 */   nop
    /* A744 8014433C D034010C */  jal        AddUnLight__Fi
    /* A748 80144340 00000000 */   nop
    /* A74C 80144344 1F110508 */  j          .L8014447C
    /* A750 80144348 21204002 */   addu      $a0, $s2, $zero
  .L8014434C:
    /* A754 8014434C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A758 80144350 21083000 */  addu       $at, $at, $s0
    /* A75C 80144354 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* A760 80144358 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* A764 8014435C 21083000 */  addu       $at, $at, $s0
    /* A768 80144360 762C2384 */  lh         $v1, %lo(missile + 0x1E)($at)
    /* A76C 80144364 00160200 */  sll        $v0, $v0, 24
    /* A770 80144368 03260200 */  sra        $a0, $v0, 24
    /* A774 8014436C 03160200 */  sra        $v0, $v0, 24
    /* A778 80144370 0A004314 */  bne        $v0, $v1, .L8014439C
    /* A77C 80144374 00000000 */   nop
    /* A780 80144378 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A784 8014437C 21083000 */  addu       $at, $at, $s0
    /* A788 80144380 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* A78C 80144384 1080013C */  lui        $at, %hi(missile + 0x20)
    /* A790 80144388 21083000 */  addu       $at, $at, $s0
    /* A794 8014438C 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* A798 80144390 00000000 */  nop
    /* A79C 80144394 38006210 */  beq        $v1, $v0, .L80144478
    /* A7A0 80144398 00000000 */   nop
  .L8014439C:
    /* A7A4 8014439C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A7A8 801443A0 21083000 */  addu       $at, $at, $s0
    /* A7AC 801443A4 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* A7B0 801443A8 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* A7B4 801443AC 21083000 */  addu       $at, $at, $s0
    /* A7B8 801443B0 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* A7BC 801443B4 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* A7C0 801443B8 21083000 */  addu       $at, $at, $s0
    /* A7C4 801443BC 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* A7C8 801443C0 00160200 */  sll        $v0, $v0, 24
    /* A7CC 801443C4 03360200 */  sra        $a2, $v0, 24
    /* A7D0 801443C8 1080013C */  lui        $at, %hi(missile + 0x20)
    /* A7D4 801443CC 21083000 */  addu       $at, $at, $s0
    /* A7D8 801443D0 782C26A4 */  sh         $a2, %lo(missile + 0x20)($at)
    /* A7DC 801443D4 28008004 */  bltz       $a0, .L80144478
    /* A7E0 801443D8 28000224 */   addiu     $v0, $zero, 0x28
    /* A7E4 801443DC 1080013C */  lui        $at, %hi(missile + 0x37)
    /* A7E8 801443E0 21083000 */  addu       $at, $at, $s0
    /* A7EC 801443E4 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* A7F0 801443E8 00000000 */  nop
    /* A7F4 801443EC 05006210 */  beq        $v1, $v0, .L80144404
    /* A7F8 801443F0 2A000224 */   addiu     $v0, $zero, 0x2A
    /* A7FC 801443F4 0A006210 */  beq        $v1, $v0, .L80144420
    /* A800 801443F8 00340600 */   sll       $a2, $a2, 16
    /* A804 801443FC 0E110508 */  j          .L80144438
    /* A808 80144400 80101200 */   sll       $v0, $s2, 2
  .L80144404:
    /* A80C 80144404 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* A810 80144408 21083000 */  addu       $at, $at, $s0
    /* A814 8014440C 762C2584 */  lh         $a1, %lo(missile + 0x1E)($at)
    /* A818 80144410 00340600 */  sll        $a2, $a2, 16
    /* A81C 80144414 03340600 */  sra        $a2, $a2, 16
    /* A820 80144418 1C110508 */  j          .L80144470
    /* A824 8014441C 43020724 */   addiu     $a3, $zero, 0x243
  .L80144420:
    /* A828 80144420 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* A82C 80144424 21083000 */  addu       $at, $at, $s0
    /* A830 80144428 762C2584 */  lh         $a1, %lo(missile + 0x1E)($at)
    /* A834 8014442C 03340600 */  sra        $a2, $a2, 16
    /* A838 80144430 1C110508 */  j          .L80144470
    /* A83C 80144434 B3010724 */   addiu     $a3, $zero, 0x1B3
  .L80144438:
    /* A840 80144438 21105200 */  addu       $v0, $v0, $s2
    /* A844 8014443C 80100200 */  sll        $v0, $v0, 2
    /* A848 80144440 23105200 */  subu       $v0, $v0, $s2
    /* A84C 80144444 80100200 */  sll        $v0, $v0, 2
    /* A850 80144448 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* A854 8014444C 21082200 */  addu       $at, $at, $v0
    /* A858 80144450 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* A85C 80144454 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* A860 80144458 21082200 */  addu       $at, $at, $v0
    /* A864 8014445C 762C2584 */  lh         $a1, %lo(missile + 0x1E)($at)
    /* A868 80144460 1080013C */  lui        $at, %hi(missile + 0x20)
    /* A86C 80144464 21082200 */  addu       $at, $at, $v0
    /* A870 80144468 782C2684 */  lh         $a2, %lo(missile + 0x20)($at)
    /* A874 8014446C 95000724 */  addiu      $a3, $zero, 0x95
  .L80144470:
    /* A878 80144470 F834010C */  jal        ChangeLight__Fiiii
    /* A87C 80144474 00000000 */   nop
  .L80144478:
    /* A880 80144478 21204002 */  addu       $a0, $s2, $zero
  .L8014447C:
    /* A884 8014447C D1EA040C */  jal        PutMissile__Fi
    /* A888 80144480 00000000 */   nop
    /* A88C 80144484 4800BF8F */  lw         $ra, 0x48($sp)
    /* A890 80144488 4400B58F */  lw         $s5, 0x44($sp)
    /* A894 8014448C 4000B48F */  lw         $s4, 0x40($sp)
    /* A898 80144490 3C00B38F */  lw         $s3, 0x3C($sp)
    /* A89C 80144494 3800B28F */  lw         $s2, 0x38($sp)
    /* A8A0 80144498 3400B18F */  lw         $s1, 0x34($sp)
    /* A8A4 8014449C 3000B08F */  lw         $s0, 0x30($sp)
    /* A8A8 801444A0 5000BD27 */  addiu      $sp, $sp, 0x50
    /* A8AC 801444A4 0800E003 */  jr         $ra
    /* A8B0 801444A8 00000000 */   nop
endlabel MI_Firebolt__Fi
