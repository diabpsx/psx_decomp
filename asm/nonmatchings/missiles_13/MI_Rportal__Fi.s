.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Rportal__Fi, 0x23C

glabel MI_Rportal__Fi
    /* 10860 8014A458 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 10864 8014A45C 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 10868 8014A460 21888000 */  addu       $s1, $a0, $zero
    /* 1086C 8014A464 1000A727 */  addiu      $a3, $sp, 0x10
    /* 10870 8014A468 1280063C */  lui        $a2, %hi(D_8011A0F8)
    /* 10874 8014A46C F8A0C624 */  addiu      $a2, $a2, %lo(D_8011A0F8)
    /* 10878 8014A470 4000C824 */  addiu      $t0, $a2, 0x40
    /* 1087C 8014A474 6000BFAF */  sw         $ra, 0x60($sp)
    /* 10880 8014A478 5800B0AF */  sw         $s0, 0x58($sp)
  .L8014A47C:
    /* 10884 8014A47C 0000C28C */  lw         $v0, 0x0($a2)
    /* 10888 8014A480 0400C38C */  lw         $v1, 0x4($a2)
    /* 1088C 8014A484 0800C48C */  lw         $a0, 0x8($a2)
    /* 10890 8014A488 0C00C58C */  lw         $a1, 0xC($a2)
    /* 10894 8014A48C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 10898 8014A490 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1089C 8014A494 0800E4AC */  sw         $a0, 0x8($a3)
    /* 108A0 8014A498 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 108A4 8014A49C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 108A8 8014A4A0 F6FFC814 */  bne        $a2, $t0, .L8014A47C
    /* 108AC 8014A4A4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 108B0 8014A4A8 0000C28C */  lw         $v0, 0x0($a2)
    /* 108B4 8014A4AC 00000000 */  nop
    /* 108B8 8014A4B0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 108BC 8014A4B4 80101100 */  sll        $v0, $s1, 2
    /* 108C0 8014A4B8 21105100 */  addu       $v0, $v0, $s1
    /* 108C4 8014A4BC 80100200 */  sll        $v0, $v0, 2
    /* 108C8 8014A4C0 23105100 */  subu       $v0, $v0, $s1
    /* 108CC 8014A4C4 80800200 */  sll        $s0, $v0, 2
    /* 108D0 8014A4C8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 108D4 8014A4CC 21083000 */  addu       $at, $at, $s0
    /* 108D8 8014A4D0 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* 108DC 8014A4D4 00000000 */  nop
    /* 108E0 8014A4D8 0200622C */  sltiu      $v0, $v1, 0x2
    /* 108E4 8014A4DC 04004014 */  bnez       $v0, .L8014A4F0
    /* 108E8 8014A4E0 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 108EC 8014A4E4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 108F0 8014A4E8 21083000 */  addu       $at, $at, $s0
    /* 108F4 8014A4EC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L8014A4F0:
    /* 108F8 8014A4F0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 108FC 8014A4F4 21083000 */  addu       $at, $at, $s0
    /* 10900 8014A4F8 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* 10904 8014A4FC 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 10908 8014A500 21083000 */  addu       $at, $at, $s0
    /* 1090C 8014A504 762C2284 */  lh         $v0, %lo(missile + 0x1E)($at)
    /* 10910 8014A508 00000000 */  nop
    /* 10914 8014A50C 03006214 */  bne        $v1, $v0, .L8014A51C
    /* 10918 8014A510 21202002 */   addu      $a0, $s1, $zero
    /* 1091C 8014A514 09F5040C */  jal        SetMissDir__Fii
    /* 10920 8014A518 01000524 */   addiu     $a1, $zero, 0x1
  .L8014A51C:
    /* 10924 8014A51C 1280023C */  lui        $v0, %hi(currlevel)
    /* 10928 8014A520 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1092C 8014A524 00000000 */  nop
    /* 10930 8014A528 3A004010 */  beqz       $v0, .L8014A614
    /* 10934 8014A52C 01000224 */   addiu     $v0, $zero, 0x1
    /* 10938 8014A530 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 1093C 8014A534 21083000 */  addu       $at, $at, $s0
    /* 10940 8014A538 972C2380 */  lb         $v1, %lo(missile + 0x3F)($at)
    /* 10944 8014A53C 00000000 */  nop
    /* 10948 8014A540 35006210 */  beq        $v1, $v0, .L8014A618
    /* 1094C 8014A544 80101100 */   sll       $v0, $s1, 2
    /* 10950 8014A548 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10954 8014A54C 21083000 */  addu       $at, $at, $s0
    /* 10958 8014A550 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 1095C 8014A554 00000000 */  nop
    /* 10960 8014A558 39004010 */  beqz       $v0, .L8014A640
    /* 10964 8014A55C 80101100 */   sll       $v0, $s1, 2
    /* 10968 8014A560 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 1096C 8014A564 21083000 */  addu       $at, $at, $s0
    /* 10970 8014A568 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* 10974 8014A56C 00000000 */  nop
    /* 10978 8014A570 0E004014 */  bnez       $v0, .L8014A5AC
    /* 1097C 8014A574 00000000 */   nop
    /* 10980 8014A578 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 10984 8014A57C 21083000 */  addu       $at, $at, $s0
    /* 10988 8014A580 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* 1098C 8014A584 1000A68F */  lw         $a2, 0x10($sp)
    /* 10990 8014A588 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 10994 8014A58C 21083000 */  addu       $at, $at, $s0
    /* 10998 8014A590 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* 1099C 8014A594 83300600 */  sra        $a2, $a2, 2
    /* 109A0 8014A598 BA34010C */  jal        AddLight__Fiii
    /* 109A4 8014A59C 9000C624 */   addiu     $a2, $a2, 0x90
    /* 109A8 8014A5A0 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 109AC 8014A5A4 21083000 */  addu       $at, $at, $s0
    /* 109B0 8014A5A8 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
  .L8014A5AC:
    /* 109B4 8014A5AC 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 109B8 8014A5B0 21083000 */  addu       $at, $at, $s0
    /* 109BC 8014A5B4 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 109C0 8014A5B8 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 109C4 8014A5BC 21083000 */  addu       $at, $at, $s0
    /* 109C8 8014A5C0 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* 109CC 8014A5C4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 109D0 8014A5C8 21083000 */  addu       $at, $at, $s0
    /* 109D4 8014A5CC 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* 109D8 8014A5D0 80100200 */  sll        $v0, $v0, 2
    /* 109DC 8014A5D4 2110A203 */  addu       $v0, $sp, $v0
    /* 109E0 8014A5D8 1000478C */  lw         $a3, 0x10($v0)
    /* 109E4 8014A5DC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 109E8 8014A5E0 21083000 */  addu       $at, $at, $s0
    /* 109EC 8014A5E4 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* 109F0 8014A5E8 83380700 */  sra        $a3, $a3, 2
    /* 109F4 8014A5EC F834010C */  jal        ChangeLight__Fiiii
    /* 109F8 8014A5F0 9000E724 */   addiu     $a3, $a3, 0x90
    /* 109FC 8014A5F4 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 10A00 8014A5F8 21083000 */  addu       $at, $at, $s0
    /* 10A04 8014A5FC 782C2294 */  lhu        $v0, %lo(missile + 0x20)($at)
    /* 10A08 8014A600 00000000 */  nop
    /* 10A0C 8014A604 01004224 */  addiu      $v0, $v0, 0x1
    /* 10A10 8014A608 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 10A14 8014A60C 21083000 */  addu       $at, $at, $s0
    /* 10A18 8014A610 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
  .L8014A614:
    /* 10A1C 8014A614 80101100 */  sll        $v0, $s1, 2
  .L8014A618:
    /* 10A20 8014A618 21105100 */  addu       $v0, $v0, $s1
    /* 10A24 8014A61C 80100200 */  sll        $v0, $v0, 2
    /* 10A28 8014A620 23105100 */  subu       $v0, $v0, $s1
    /* 10A2C 8014A624 80100200 */  sll        $v0, $v0, 2
    /* 10A30 8014A628 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10A34 8014A62C 21082200 */  addu       $at, $at, $v0
    /* 10A38 8014A630 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 10A3C 8014A634 00000000 */  nop
    /* 10A40 8014A638 0E004014 */  bnez       $v0, .L8014A674
    /* 10A44 8014A63C 80101100 */   sll       $v0, $s1, 2
  .L8014A640:
    /* 10A48 8014A640 21105100 */  addu       $v0, $v0, $s1
    /* 10A4C 8014A644 80100200 */  sll        $v0, $v0, 2
    /* 10A50 8014A648 23105100 */  subu       $v0, $v0, $s1
    /* 10A54 8014A64C 80100200 */  sll        $v0, $v0, 2
    /* 10A58 8014A650 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 10A5C 8014A654 21082200 */  addu       $at, $at, $v0
    /* 10A60 8014A658 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 10A64 8014A65C 01000324 */  addiu      $v1, $zero, 0x1
    /* 10A68 8014A660 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 10A6C 8014A664 21082200 */  addu       $at, $at, $v0
    /* 10A70 8014A668 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 10A74 8014A66C D034010C */  jal        AddUnLight__Fi
    /* 10A78 8014A670 00000000 */   nop
  .L8014A674:
    /* 10A7C 8014A674 D1EA040C */  jal        PutMissile__Fi
    /* 10A80 8014A678 21202002 */   addu      $a0, $s1, $zero
    /* 10A84 8014A67C 6000BF8F */  lw         $ra, 0x60($sp)
    /* 10A88 8014A680 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 10A8C 8014A684 5800B08F */  lw         $s0, 0x58($sp)
    /* 10A90 8014A688 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 10A94 8014A68C 0800E003 */  jr         $ra
    /* 10A98 8014A690 00000000 */   nop
endlabel MI_Rportal__Fi
