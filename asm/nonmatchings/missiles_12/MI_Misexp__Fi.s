.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Misexp__Fi, 0x320

glabel MI_Misexp__Fi
    /* D4AC 801470A4 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* D4B0 801470A8 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* D4B4 801470AC 21888000 */  addu       $s1, $a0, $zero
    /* D4B8 801470B0 1000A727 */  addiu      $a3, $sp, 0x10
    /* D4BC 801470B4 1280063C */  lui        $a2, %hi(D_8011A19C)
    /* D4C0 801470B8 9CA1C624 */  addiu      $a2, $a2, %lo(D_8011A19C)
    /* D4C4 801470BC 2000C824 */  addiu      $t0, $a2, 0x20
    /* D4C8 801470C0 4000BFAF */  sw         $ra, 0x40($sp)
    /* D4CC 801470C4 3800B0AF */  sw         $s0, 0x38($sp)
  .L801470C8:
    /* D4D0 801470C8 0000C28C */  lw         $v0, 0x0($a2)
    /* D4D4 801470CC 0400C38C */  lw         $v1, 0x4($a2)
    /* D4D8 801470D0 0800C48C */  lw         $a0, 0x8($a2)
    /* D4DC 801470D4 0C00C58C */  lw         $a1, 0xC($a2)
    /* D4E0 801470D8 0000E2AC */  sw         $v0, 0x0($a3)
    /* D4E4 801470DC 0400E3AC */  sw         $v1, 0x4($a3)
    /* D4E8 801470E0 0800E4AC */  sw         $a0, 0x8($a3)
    /* D4EC 801470E4 0C00E5AC */  sw         $a1, 0xC($a3)
    /* D4F0 801470E8 1000C624 */  addiu      $a2, $a2, 0x10
    /* D4F4 801470EC F6FFC814 */  bne        $a2, $t0, .L801470C8
    /* D4F8 801470F0 1000E724 */   addiu     $a3, $a3, 0x10
    /* D4FC 801470F4 0000C28C */  lw         $v0, 0x0($a2)
    /* D500 801470F8 0400C38C */  lw         $v1, 0x4($a2)
    /* D504 801470FC 0000E2AC */  sw         $v0, 0x0($a3)
    /* D508 80147100 0400E3AC */  sw         $v1, 0x4($a3)
    /* D50C 80147104 80101100 */  sll        $v0, $s1, 2
    /* D510 80147108 21105100 */  addu       $v0, $v0, $s1
    /* D514 8014710C 80100200 */  sll        $v0, $v0, 2
    /* D518 80147110 23105100 */  subu       $v0, $v0, $s1
    /* D51C 80147114 80180200 */  sll        $v1, $v0, 2
    /* D520 80147118 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D524 8014711C 21082300 */  addu       $at, $at, $v1
    /* D528 80147120 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D52C 80147124 00000000 */  nop
    /* D530 80147128 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* D534 8014712C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D538 80147130 21082300 */  addu       $at, $at, $v1
    /* D53C 80147134 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* D540 80147138 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D544 8014713C 21082300 */  addu       $at, $at, $v1
    /* D548 80147140 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D54C 80147144 00000000 */  nop
    /* D550 80147148 0B004014 */  bnez       $v0, .L80147178
    /* D554 8014714C 01000224 */   addiu     $v0, $zero, 0x1
    /* D558 80147150 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D55C 80147154 21082300 */  addu       $at, $at, $v1
    /* D560 80147158 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D564 8014715C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* D568 80147160 21082300 */  addu       $at, $at, $v1
    /* D56C 80147164 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* D570 80147168 D034010C */  jal        AddUnLight__Fi
    /* D574 8014716C 00000000 */   nop
    /* D578 80147170 EB1C0508 */  j          .L801473AC
    /* D57C 80147174 00000000 */   nop
  .L80147178:
    /* D580 80147178 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D584 8014717C 21082300 */  addu       $at, $at, $v1
    /* D588 80147180 762C2684 */  lh         $a2, %lo(missile + 0x1E)($at)
    /* D58C 80147184 00000000 */  nop
    /* D590 80147188 3B00C014 */  bnez       $a2, .L80147278
    /* D594 8014718C 28000224 */   addiu     $v0, $zero, 0x28
    /* D598 80147190 1080013C */  lui        $at, %hi(missile + 0x37)
    /* D59C 80147194 21082300 */  addu       $at, $at, $v1
    /* D5A0 80147198 8F2C2490 */  lbu        $a0, %lo(missile + 0x37)($at)
    /* D5A4 8014719C 00000000 */  nop
    /* D5A8 801471A0 05008210 */  beq        $a0, $v0, .L801471B8
    /* D5AC 801471A4 2A000224 */   addiu     $v0, $zero, 0x2A
    /* D5B0 801471A8 0F008210 */  beq        $a0, $v0, .L801471E8
    /* D5B4 801471AC 80801100 */   sll       $s0, $s1, 2
    /* D5B8 801471B0 861C0508 */  j          .L80147218
    /* D5BC 801471B4 00000000 */   nop
  .L801471B8:
    /* D5C0 801471B8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D5C4 801471BC 21082300 */  addu       $at, $at, $v1
    /* D5C8 801471C0 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* D5CC 801471C4 1000A68F */  lw         $a2, 0x10($sp)
    /* D5D0 801471C8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D5D4 801471CC 21082300 */  addu       $at, $at, $v1
    /* D5D8 801471D0 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* D5DC 801471D4 83300600 */  sra        $a2, $a2, 2
    /* D5E0 801471D8 BA34010C */  jal        AddLight__Fiii
    /* D5E4 801471DC 4002C624 */   addiu     $a2, $a2, 0x240
    /* D5E8 801471E0 DD1C0508 */  j          .L80147374
    /* D5EC 801471E4 80101100 */   sll       $v0, $s1, 2
  .L801471E8:
    /* D5F0 801471E8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D5F4 801471EC 21082300 */  addu       $at, $at, $v1
    /* D5F8 801471F0 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* D5FC 801471F4 1000A68F */  lw         $a2, 0x10($sp)
    /* D600 801471F8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D604 801471FC 21082300 */  addu       $at, $at, $v1
    /* D608 80147200 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* D60C 80147204 83300600 */  sra        $a2, $a2, 2
    /* D610 80147208 BA34010C */  jal        AddLight__Fiii
    /* D614 8014720C B001C624 */   addiu     $a2, $a2, 0x1B0
    /* D618 80147210 DD1C0508 */  j          .L80147374
    /* D61C 80147214 80101100 */   sll       $v0, $s1, 2
  .L80147218:
    /* D620 80147218 21801102 */  addu       $s0, $s0, $s1
    /* D624 8014721C 80801000 */  sll        $s0, $s0, 2
    /* D628 80147220 23801102 */  subu       $s0, $s0, $s1
    /* D62C 80147224 80801000 */  sll        $s0, $s0, 2
    /* D630 80147228 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D634 8014722C 21083000 */  addu       $at, $at, $s0
    /* D638 80147230 762C2284 */  lh         $v0, %lo(missile + 0x1E)($at)
    /* D63C 80147234 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D640 80147238 21083000 */  addu       $at, $at, $s0
    /* D644 8014723C 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* D648 80147240 80100200 */  sll        $v0, $v0, 2
    /* D64C 80147244 2110A203 */  addu       $v0, $sp, $v0
    /* D650 80147248 1000468C */  lw         $a2, 0x10($v0)
    /* D654 8014724C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D658 80147250 21083000 */  addu       $at, $at, $s0
    /* D65C 80147254 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* D660 80147258 83300600 */  sra        $a2, $a2, 2
    /* D664 8014725C BA34010C */  jal        AddLight__Fiii
    /* D668 80147260 9000C624 */   addiu     $a2, $a2, 0x90
    /* D66C 80147264 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D670 80147268 21083000 */  addu       $at, $at, $s0
    /* D674 8014726C 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* D678 80147270 DD1C0508 */  j          .L80147374
    /* D67C 80147274 80101100 */   sll       $v0, $s1, 2
  .L80147278:
    /* D680 80147278 1080013C */  lui        $at, %hi(missile + 0x37)
    /* D684 8014727C 21082300 */  addu       $at, $at, $v1
    /* D688 80147280 8F2C2490 */  lbu        $a0, %lo(missile + 0x37)($at)
    /* D68C 80147284 00000000 */  nop
    /* D690 80147288 05008210 */  beq        $a0, $v0, .L801472A0
    /* D694 8014728C 2A000224 */   addiu     $v0, $zero, 0x2A
    /* D698 80147290 12008210 */  beq        $a0, $v0, .L801472DC
    /* D69C 80147294 80100600 */   sll       $v0, $a2, 2
    /* D6A0 80147298 C51C0508 */  j          .L80147314
    /* D6A4 8014729C 80101100 */   sll       $v0, $s1, 2
  .L801472A0:
    /* D6A8 801472A0 80100600 */  sll        $v0, $a2, 2
    /* D6AC 801472A4 2110A203 */  addu       $v0, $sp, $v0
    /* D6B0 801472A8 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D6B4 801472AC 21082300 */  addu       $at, $at, $v1
    /* D6B8 801472B0 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D6BC 801472B4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D6C0 801472B8 21082300 */  addu       $at, $at, $v1
    /* D6C4 801472BC 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* D6C8 801472C0 1000478C */  lw         $a3, 0x10($v0)
    /* D6CC 801472C4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D6D0 801472C8 21082300 */  addu       $at, $at, $v1
    /* D6D4 801472CC 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* D6D8 801472D0 83380700 */  sra        $a3, $a3, 2
    /* D6DC 801472D4 DA1C0508 */  j          .L80147368
    /* D6E0 801472D8 4002E724 */   addiu     $a3, $a3, 0x240
  .L801472DC:
    /* D6E4 801472DC 2110A203 */  addu       $v0, $sp, $v0
    /* D6E8 801472E0 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D6EC 801472E4 21082300 */  addu       $at, $at, $v1
    /* D6F0 801472E8 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D6F4 801472EC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D6F8 801472F0 21082300 */  addu       $at, $at, $v1
    /* D6FC 801472F4 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* D700 801472F8 1000478C */  lw         $a3, 0x10($v0)
    /* D704 801472FC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D708 80147300 21082300 */  addu       $at, $at, $v1
    /* D70C 80147304 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* D710 80147308 83380700 */  sra        $a3, $a3, 2
    /* D714 8014730C DA1C0508 */  j          .L80147368
    /* D718 80147310 B001E724 */   addiu     $a3, $a3, 0x1B0
  .L80147314:
    /* D71C 80147314 21105100 */  addu       $v0, $v0, $s1
    /* D720 80147318 80100200 */  sll        $v0, $v0, 2
    /* D724 8014731C 23105100 */  subu       $v0, $v0, $s1
    /* D728 80147320 80100200 */  sll        $v0, $v0, 2
    /* D72C 80147324 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D730 80147328 21082200 */  addu       $at, $at, $v0
    /* D734 8014732C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D738 80147330 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D73C 80147334 21082200 */  addu       $at, $at, $v0
    /* D740 80147338 762C2384 */  lh         $v1, %lo(missile + 0x1E)($at)
    /* D744 8014733C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D748 80147340 21082200 */  addu       $at, $at, $v0
    /* D74C 80147344 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* D750 80147348 80180300 */  sll        $v1, $v1, 2
    /* D754 8014734C 2118A303 */  addu       $v1, $sp, $v1
    /* D758 80147350 1000678C */  lw         $a3, 0x10($v1)
    /* D75C 80147354 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D760 80147358 21082200 */  addu       $at, $at, $v0
    /* D764 8014735C 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* D768 80147360 83380700 */  sra        $a3, $a3, 2
    /* D76C 80147364 9000E724 */  addiu      $a3, $a3, 0x90
  .L80147368:
    /* D770 80147368 F834010C */  jal        ChangeLight__Fiiii
    /* D774 8014736C 00000000 */   nop
    /* D778 80147370 80101100 */  sll        $v0, $s1, 2
  .L80147374:
    /* D77C 80147374 21105100 */  addu       $v0, $v0, $s1
    /* D780 80147378 80100200 */  sll        $v0, $v0, 2
    /* D784 8014737C 23105100 */  subu       $v0, $v0, $s1
    /* D788 80147380 80100200 */  sll        $v0, $v0, 2
    /* D78C 80147384 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D790 80147388 21082200 */  addu       $at, $at, $v0
    /* D794 8014738C 762C2394 */  lhu        $v1, %lo(missile + 0x1E)($at)
    /* D798 80147390 00000000 */  nop
    /* D79C 80147394 01006324 */  addiu      $v1, $v1, 0x1
    /* D7A0 80147398 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D7A4 8014739C 21082200 */  addu       $at, $at, $v0
    /* D7A8 801473A0 762C23A4 */  sh         $v1, %lo(missile + 0x1E)($at)
    /* D7AC 801473A4 D1EA040C */  jal        PutMissile__Fi
    /* D7B0 801473A8 21202002 */   addu      $a0, $s1, $zero
  .L801473AC:
    /* D7B4 801473AC 4000BF8F */  lw         $ra, 0x40($sp)
    /* D7B8 801473B0 3C00B18F */  lw         $s1, 0x3C($sp)
    /* D7BC 801473B4 3800B08F */  lw         $s0, 0x38($sp)
    /* D7C0 801473B8 4800BD27 */  addiu      $sp, $sp, 0x48
    /* D7C4 801473BC 0800E003 */  jr         $ra
    /* D7C8 801473C0 00000000 */   nop
endlabel MI_Misexp__Fi
