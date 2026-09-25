.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeltaSaveLevel__Fv, 0xFC

glabel DeltaSaveLevel__Fv
    /* 3F5D4 8004F5D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3F5D8 8004F5D8 21180000 */  addu       $v1, $zero, $zero
    /* 3F5DC 8004F5DC 1280053C */  lui        $a1, %hi(myplr)
    /* 3F5E0 8004F5E0 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 3F5E4 8004F5E4 21200000 */  addu       $a0, $zero, $zero
    /* 3F5E8 8004F5E8 1000BFAF */  sw         $ra, 0x10($sp)
  .L8004F5EC:
    /* 3F5EC 8004F5EC 04006510 */  beq        $v1, $a1, .L8004F600
    /* 3F5F0 8004F5F0 00000000 */   nop
    /* 3F5F4 8004F5F4 0E80013C */  lui        $at, %hi(plr + 0x184)
    /* 3F5F8 8004F5F8 21082400 */  addu       $at, $at, $a0
    /* 3F5FC 8004F5FC BCA620AC */  sw         $zero, %lo(plr + 0x184)($at)
  .L8004F600:
    /* 3F600 8004F600 01006324 */  addiu      $v1, $v1, 0x1
    /* 3F604 8004F604 02006228 */  slti       $v0, $v1, 0x2
    /* 3F608 8004F608 F8FF4014 */  bnez       $v0, .L8004F5EC
    /* 3F60C 8004F60C E8198424 */   addiu     $a0, $a0, 0x19E8
    /* 3F610 8004F610 1280023C */  lui        $v0, %hi(setlevel)
    /* 3F614 8004F614 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 3F618 8004F618 00000000 */  nop
    /* 3F61C 8004F61C 11004014 */  bnez       $v0, .L8004F664
    /* 3F620 8004F620 00000000 */   nop
    /* 3F624 8004F624 1280033C */  lui        $v1, %hi(myplr)
    /* 3F628 8004F628 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 3F62C 8004F62C 1280043C */  lui        $a0, %hi(currlevel)
    /* 3F630 8004F630 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 3F634 8004F634 40100300 */  sll        $v0, $v1, 1
    /* 3F638 8004F638 21104300 */  addu       $v0, $v0, $v1
    /* 3F63C 8004F63C 80100200 */  sll        $v0, $v0, 2
    /* 3F640 8004F640 21104300 */  addu       $v0, $v0, $v1
    /* 3F644 8004F644 00110200 */  sll        $v0, $v0, 4
    /* 3F648 8004F648 23104300 */  subu       $v0, $v0, $v1
    /* 3F64C 8004F64C 80100200 */  sll        $v0, $v0, 2
    /* 3F650 8004F650 21104300 */  addu       $v0, $v0, $v1
    /* 3F654 8004F654 0E80033C */  lui        $v1, %hi(plr + 0x166)
    /* 3F658 8004F658 9EA66324 */  addiu      $v1, $v1, %lo(plr + 0x166)
    /* 3F65C 8004F65C A83D0108 */  j          .L8004F6A0
    /* 3F660 8004F660 C0100200 */   sll       $v0, $v0, 3
  .L8004F664:
    /* 3F664 8004F664 1280033C */  lui        $v1, %hi(myplr)
    /* 3F668 8004F668 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 3F66C 8004F66C 1280043C */  lui        $a0, %hi(setlvlnum)
    /* 3F670 8004F670 0FC18490 */  lbu        $a0, %lo(setlvlnum)($a0)
    /* 3F674 8004F674 40100300 */  sll        $v0, $v1, 1
    /* 3F678 8004F678 21104300 */  addu       $v0, $v0, $v1
    /* 3F67C 8004F67C 80100200 */  sll        $v0, $v0, 2
    /* 3F680 8004F680 21104300 */  addu       $v0, $v0, $v1
    /* 3F684 8004F684 00110200 */  sll        $v0, $v0, 4
    /* 3F688 8004F688 23104300 */  subu       $v0, $v0, $v1
    /* 3F68C 8004F68C 80100200 */  sll        $v0, $v0, 2
    /* 3F690 8004F690 21104300 */  addu       $v0, $v0, $v1
    /* 3F694 8004F694 C0100200 */  sll        $v0, $v0, 3
    /* 3F698 8004F698 0E80033C */  lui        $v1, %hi(plr + 0x177)
    /* 3F69C 8004F69C AFA66324 */  addiu      $v1, $v1, %lo(plr + 0x177)
  .L8004F6A0:
    /* 3F6A0 8004F6A0 21104300 */  addu       $v0, $v0, $v1
    /* 3F6A4 8004F6A4 21104400 */  addu       $v0, $v0, $a0
    /* 3F6A8 8004F6A8 01000324 */  addiu      $v1, $zero, 0x1
    /* 3F6AC 8004F6AC 000043A0 */  sb         $v1, 0x0($v0)
    /* 3F6B0 8004F6B0 1280043C */  lui        $a0, %hi(currlevel)
    /* 3F6B4 8004F6B4 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 3F6B8 8004F6B8 033B010C */  jal        delta_leave_sync__FUc
    /* 3F6BC 8004F6BC 00000000 */   nop
    /* 3F6C0 8004F6C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3F6C4 8004F6C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3F6C8 8004F6C8 0800E003 */  jr         $ra
    /* 3F6CC 8004F6CC 00000000 */   nop
endlabel DeltaSaveLevel__Fv
