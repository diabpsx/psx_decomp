.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBookLever__Fiiiiiiiii, 0x1F4

glabel AddBookLever__Fiiiiiiiii
    /* 1E428 80158020 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1E42C 80158024 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1E430 80158028 5400B68F */  lw         $s6, 0x54($sp)
    /* 1E434 8015802C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1E438 80158030 21A80000 */  addu       $s5, $zero, $zero
    /* 1E43C 80158034 3400BFAF */  sw         $ra, 0x34($sp)
    /* 1E440 80158038 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1E444 8015803C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1E448 80158040 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1E44C 80158044 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1E450 80158048 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1E454 8015804C 01001224 */  addiu      $s2, $zero, 0x1
  .L80158050:
    /* 1E458 80158050 C9F6000C */  jal        ENG_random__Fl
    /* 1E45C 80158054 40000424 */   addiu     $a0, $zero, 0x40
    /* 1E460 80158058 10005424 */  addiu      $s4, $v0, 0x10
    /* 1E464 8015805C C9F6000C */  jal        ENG_random__Fl
    /* 1E468 80158060 40000424 */   addiu     $a0, $zero, 0x40
    /* 1E46C 80158064 10005324 */  addiu      $s3, $v0, 0x10
    /* 1E470 80158068 FEFF1124 */  addiu      $s1, $zero, -0x2
  .L8015806C:
    /* 1E474 8015806C FEFF1024 */  addiu      $s0, $zero, -0x2
    /* 1E478 80158070 21209002 */  addu       $a0, $s4, $s0
  .L80158074:
    /* 1E47C 80158074 305D050C */  jal        RndLocOk__Fii
    /* 1E480 80158078 21287102 */   addu      $a1, $s3, $s1
    /* 1E484 8015807C FF004230 */  andi       $v0, $v0, 0xFF
    /* 1E488 80158080 02004014 */  bnez       $v0, .L8015808C
    /* 1E48C 80158084 00000000 */   nop
    /* 1E490 80158088 21900000 */  addu       $s2, $zero, $zero
  .L8015808C:
    /* 1E494 8015808C 01001026 */  addiu      $s0, $s0, 0x1
    /* 1E498 80158090 0300022A */  slti       $v0, $s0, 0x3
    /* 1E49C 80158094 F7FF4014 */  bnez       $v0, .L80158074
    /* 1E4A0 80158098 21209002 */   addu      $a0, $s4, $s0
    /* 1E4A4 8015809C 01003126 */  addiu      $s1, $s1, 0x1
    /* 1E4A8 801580A0 0300222A */  slti       $v0, $s1, 0x3
    /* 1E4AC 801580A4 F1FF4014 */  bnez       $v0, .L8015806C
    /* 1E4B0 801580A8 FF004232 */   andi      $v0, $s2, 0xFF
    /* 1E4B4 801580AC 06004014 */  bnez       $v0, .L801580C8
    /* 1E4B8 801580B0 0100B526 */   addiu     $s5, $s5, 0x1
    /* 1E4BC 801580B4 214EA22A */  slti       $v0, $s5, 0x4E21
    /* 1E4C0 801580B8 4B004010 */  beqz       $v0, .L801581E8
    /* 1E4C4 801580BC 01001224 */   addiu     $s2, $zero, 0x1
    /* 1E4C8 801580C0 14600508 */  j          .L80158050
    /* 1E4CC 801580C4 00000000 */   nop
  .L801580C8:
    /* 1E4D0 801580C8 DC9E010C */  jal        QuestStatus__Fi
    /* 1E4D4 801580CC 08000424 */   addiu     $a0, $zero, 0x8
    /* 1E4D8 801580D0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1E4DC 801580D4 04004010 */  beqz       $v0, .L801580E8
    /* 1E4E0 801580D8 47000424 */   addiu     $a0, $zero, 0x47
    /* 1E4E4 801580DC 21288002 */  addu       $a1, $s4, $zero
    /* 1E4E8 801580E0 BE4E010C */  jal        AddObject__Fiii
    /* 1E4EC 801580E4 21306002 */   addu      $a2, $s3, $zero
  .L801580E8:
    /* 1E4F0 801580E8 DC9E010C */  jal        QuestStatus__Fi
    /* 1E4F4 801580EC 0B000424 */   addiu     $a0, $zero, 0xB
    /* 1E4F8 801580F0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1E4FC 801580F4 04004010 */  beqz       $v0, .L80158108
    /* 1E500 801580F8 58000424 */   addiu     $a0, $zero, 0x58
    /* 1E504 801580FC 21288002 */  addu       $a1, $s4, $zero
    /* 1E508 80158100 BE4E010C */  jal        AddObject__Fiii
    /* 1E50C 80158104 21306002 */   addu      $a2, $s3, $zero
  .L80158108:
    /* 1E510 80158108 DC9E010C */  jal        QuestStatus__Fi
    /* 1E514 8015810C 09000424 */   addiu     $a0, $zero, 0x9
    /* 1E518 80158110 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1E51C 80158114 0E004010 */  beqz       $v0, .L80158150
    /* 1E520 80158118 C0181300 */   sll       $v1, $s3, 3
    /* 1E524 8015811C 48000424 */  addiu      $a0, $zero, 0x48
    /* 1E528 80158120 1280033C */  lui        $v1, %hi(setpc_x)
    /* 1E52C 80158124 E4C0638C */  lw         $v1, %lo(setpc_x)($v1)
    /* 1E530 80158128 1280023C */  lui        $v0, %hi(setpc_y)
    /* 1E534 8015812C E8C0428C */  lw         $v0, %lo(setpc_y)($v0)
    /* 1E538 80158130 40180300 */  sll        $v1, $v1, 1
    /* 1E53C 80158134 19007424 */  addiu      $s4, $v1, 0x19
    /* 1E540 80158138 40100200 */  sll        $v0, $v0, 1
    /* 1E544 8015813C 28005324 */  addiu      $s3, $v0, 0x28
    /* 1E548 80158140 21288002 */  addu       $a1, $s4, $zero
    /* 1E54C 80158144 BE4E010C */  jal        AddObject__Fiii
    /* 1E550 80158148 21306002 */   addu      $a2, $s3, $zero
    /* 1E554 8015814C C0181300 */  sll        $v1, $s3, 3
  .L80158150:
    /* 1E558 80158150 C0101400 */  sll        $v0, $s4, 3
    /* 1E55C 80158154 23105400 */  subu       $v0, $v0, $s4
    /* 1E560 80158158 C0110200 */  sll        $v0, $v0, 7
    /* 1E564 8015815C 21186200 */  addu       $v1, $v1, $v0
    /* 1E568 80158160 4800A58F */  lw         $a1, 0x48($sp)
    /* 1E56C 80158164 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1E570 80158168 21082300 */  addu       $at, $at, $v1
    /* 1E574 8015816C 2B7A3080 */  lb         $s0, %lo(dung_map + 0x3)($at)
    /* 1E578 80158170 4C00A68F */  lw         $a2, 0x4C($sp)
    /* 1E57C 80158174 1280023C */  lui        $v0, %hi(leverid)
    /* 1E580 80158178 DCB9428C */  lw         $v0, %lo(leverid)($v0)
    /* 1E584 8015817C 5000A78F */  lw         $a3, 0x50($sp)
    /* 1E588 80158180 1000B6AF */  sw         $s6, 0x10($sp)
    /* 1E58C 80158184 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 1E590 80158188 21200002 */  addu       $a0, $s0, $zero
    /* 1E594 8015818C 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1E598 80158190 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1E59C 80158194 5800A58F */  lw         $a1, 0x58($sp)
    /* 1E5A0 80158198 B44E010C */  jal        SetBookMsg__Fii
    /* 1E5A4 8015819C 21200002 */   addu      $a0, $s0, $zero
    /* 1E5A8 801581A0 40101000 */  sll        $v0, $s0, 1
    /* 1E5AC 801581A4 21105000 */  addu       $v0, $v0, $s0
    /* 1E5B0 801581A8 80100200 */  sll        $v0, $v0, 2
    /* 1E5B4 801581AC 23105000 */  subu       $v0, $v0, $s0
    /* 1E5B8 801581B0 80100200 */  sll        $v0, $v0, 2
    /* 1E5BC 801581B4 1280033C */  lui        $v1, %hi(leverid)
    /* 1E5C0 801581B8 DCB9638C */  lw         $v1, %lo(leverid)($v1)
    /* 1E5C4 801581BC 02000424 */  addiu      $a0, $zero, 0x2
    /* 1E5C8 801581C0 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 1E5CC 801581C4 21082200 */  addu       $at, $at, $v0
    /* 1E5D0 801581C8 648C24A4 */  sh         $a0, %lo(object + 0x18)($at)
    /* 1E5D4 801581CC 01006324 */  addiu      $v1, $v1, 0x1
    /* 1E5D8 801581D0 1280013C */  lui        $at, %hi(leverid)
    /* 1E5DC 801581D4 DCB923AC */  sw         $v1, %lo(leverid)($at)
    /* 1E5E0 801581D8 01000324 */  addiu      $v1, $zero, 0x1
    /* 1E5E4 801581DC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1E5E8 801581E0 21082200 */  addu       $at, $at, $v0
    /* 1E5EC 801581E4 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
  .L801581E8:
    /* 1E5F0 801581E8 3400BF8F */  lw         $ra, 0x34($sp)
    /* 1E5F4 801581EC 3000B68F */  lw         $s6, 0x30($sp)
    /* 1E5F8 801581F0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1E5FC 801581F4 2800B48F */  lw         $s4, 0x28($sp)
    /* 1E600 801581F8 2400B38F */  lw         $s3, 0x24($sp)
    /* 1E604 801581FC 2000B28F */  lw         $s2, 0x20($sp)
    /* 1E608 80158200 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1E60C 80158204 1800B08F */  lw         $s0, 0x18($sp)
    /* 1E610 80158208 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1E614 8015820C 0800E003 */  jr         $ra
    /* 1E618 80158210 00000000 */   nop
endlabel AddBookLever__Fiiiiiiiii
