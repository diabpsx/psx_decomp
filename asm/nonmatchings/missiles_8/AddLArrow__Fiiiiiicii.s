.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddLArrow__Fiiiiiicii, 0x1E8

glabel AddLArrow__Fiiiiiicii
    /* 3878 8013D470 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 387C 8013D474 2800B4AF */  sw         $s4, 0x28($sp)
    /* 3880 8013D478 21A08000 */  addu       $s4, $a0, $zero
    /* 3884 8013D47C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 3888 8013D480 2188A000 */  addu       $s1, $a1, $zero
    /* 388C 8013D484 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3890 8013D488 4000B38F */  lw         $s3, 0x40($sp)
    /* 3894 8013D48C 4400A28F */  lw         $v0, 0x44($sp)
    /* 3898 8013D490 4C00A48F */  lw         $a0, 0x4C($sp)
    /* 389C 8013D494 4800A593 */  lbu        $a1, 0x48($sp)
    /* 38A0 8013D498 2000B2AF */  sw         $s2, 0x20($sp)
    /* 38A4 8013D49C 2190C000 */  addu       $s2, $a2, $zero
    /* 38A8 8013D4A0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 38AC 8013D4A4 2180E000 */  addu       $s0, $a3, $zero
    /* 38B0 8013D4A8 0B003016 */  bne        $s1, $s0, .L8013D4D8
    /* 38B4 8013D4AC 2C00BFAF */   sw        $ra, 0x2C($sp)
    /* 38B8 8013D4B0 09005316 */  bne        $s2, $s3, .L8013D4D8
    /* 38BC 8013D4B4 80100200 */   sll       $v0, $v0, 2
    /* 38C0 8013D4B8 1080013C */  lui        $at, %hi(XDirAdd)
    /* 38C4 8013D4BC 21082200 */  addu       $at, $at, $v0
    /* 38C8 8013D4C0 D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 38CC 8013D4C4 1080013C */  lui        $at, %hi(YDirAdd)
    /* 38D0 8013D4C8 21082200 */  addu       $at, $at, $v0
    /* 38D4 8013D4CC F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 38D8 8013D4D0 21802302 */  addu       $s0, $s1, $v1
    /* 38DC 8013D4D4 21984202 */  addu       $s3, $s2, $v0
  .L8013D4D8:
    /* 38E0 8013D4D8 2700A014 */  bnez       $a1, .L8013D578
    /* 38E4 8013D4DC 40100400 */   sll       $v0, $a0, 1
    /* 38E8 8013D4E0 21104400 */  addu       $v0, $v0, $a0
    /* 38EC 8013D4E4 80100200 */  sll        $v0, $v0, 2
    /* 38F0 8013D4E8 21104400 */  addu       $v0, $v0, $a0
    /* 38F4 8013D4EC 00110200 */  sll        $v0, $v0, 4
    /* 38F8 8013D4F0 23104400 */  subu       $v0, $v0, $a0
    /* 38FC 8013D4F4 80100200 */  sll        $v0, $v0, 2
    /* 3900 8013D4F8 21104400 */  addu       $v0, $v0, $a0
    /* 3904 8013D4FC C0380200 */  sll        $a3, $v0, 3
    /* 3908 8013D500 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 390C 8013D504 21082700 */  addu       $at, $at, $a3
    /* 3910 8013D508 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 3914 8013D50C 01000224 */  addiu      $v0, $zero, 0x1
    /* 3918 8013D510 0C006214 */  bne        $v1, $v0, .L8013D544
    /* 391C 8013D514 21208002 */   addu      $a0, $s4, $zero
    /* 3920 8013D518 21282002 */  addu       $a1, $s1, $zero
    /* 3924 8013D51C 21304002 */  addu       $a2, $s2, $zero
    /* 3928 8013D520 1000B3AF */  sw         $s3, 0x10($sp)
    /* 392C 8013D524 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 3930 8013D528 21082700 */  addu       $at, $at, $a3
    /* 3934 8013D52C 74A62290 */  lbu        $v0, %lo(plr + 0x13C)($at)
    /* 3938 8013D530 21380002 */  addu       $a3, $s0, $zero
    /* 393C 8013D534 00160200 */  sll        $v0, $v0, 24
    /* 3940 8013D538 83160200 */  sra        $v0, $v0, 26
    /* 3944 8013D53C 64F50408 */  j          .L8013D590
    /* 3948 8013D540 1F004224 */   addiu     $v0, $v0, 0x1F
  .L8013D544:
    /* 394C 8013D544 0D006014 */  bnez       $v1, .L8013D57C
    /* 3950 8013D548 21304002 */   addu      $a2, $s2, $zero
    /* 3954 8013D54C 21208002 */  addu       $a0, $s4, $zero
    /* 3958 8013D550 21282002 */  addu       $a1, $s1, $zero
    /* 395C 8013D554 1000B3AF */  sw         $s3, 0x10($sp)
    /* 3960 8013D558 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 3964 8013D55C 21082700 */  addu       $at, $at, $a3
    /* 3968 8013D560 74A62290 */  lbu        $v0, %lo(plr + 0x13C)($at)
    /* 396C 8013D564 21380002 */  addu       $a3, $s0, $zero
    /* 3970 8013D568 00160200 */  sll        $v0, $v0, 24
    /* 3974 8013D56C C3160200 */  sra        $v0, $v0, 27
    /* 3978 8013D570 64F50408 */  j          .L8013D590
    /* 397C 8013D574 1F004224 */   addiu     $v0, $v0, 0x1F
  .L8013D578:
    /* 3980 8013D578 21208002 */  addu       $a0, $s4, $zero
  .L8013D57C:
    /* 3984 8013D57C 21282002 */  addu       $a1, $s1, $zero
    /* 3988 8013D580 21304002 */  addu       $a2, $s2, $zero
    /* 398C 8013D584 21380002 */  addu       $a3, $s0, $zero
    /* 3990 8013D588 20000224 */  addiu      $v0, $zero, 0x20
    /* 3994 8013D58C 1000B3AF */  sw         $s3, 0x10($sp)
  .L8013D590:
    /* 3998 8013D590 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 399C 8013D594 1400A2AF */   sw        $v0, 0x14($sp)
    /* 39A0 8013D598 21202002 */  addu       $a0, $s1, $zero
    /* 39A4 8013D59C 21284002 */  addu       $a1, $s2, $zero
    /* 39A8 8013D5A0 21300002 */  addu       $a2, $s0, $zero
    /* 39AC 8013D5A4 B3E9040C */  jal        GetDirection16__Fiiii
    /* 39B0 8013D5A8 21386002 */   addu      $a3, $s3, $zero
    /* 39B4 8013D5AC 21208002 */  addu       $a0, $s4, $zero
    /* 39B8 8013D5B0 09F5040C */  jal        SetMissDir__Fii
    /* 39BC 8013D5B4 21284000 */   addu      $a1, $v0, $zero
    /* 39C0 8013D5B8 80101400 */  sll        $v0, $s4, 2
    /* 39C4 8013D5BC 21105400 */  addu       $v0, $v0, $s4
    /* 39C8 8013D5C0 80100200 */  sll        $v0, $v0, 2
    /* 39CC 8013D5C4 23105400 */  subu       $v0, $v0, $s4
    /* 39D0 8013D5C8 80800200 */  sll        $s0, $v0, 2
    /* 39D4 8013D5CC 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 39D8 8013D5D0 21083000 */  addu       $at, $at, $s0
    /* 39DC 8013D5D4 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 39E0 8013D5D8 00010224 */  addiu      $v0, $zero, 0x100
    /* 39E4 8013D5DC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 39E8 8013D5E0 21083000 */  addu       $at, $at, $s0
    /* 39EC 8013D5E4 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 39F0 8013D5E8 38000224 */  addiu      $v0, $zero, 0x38
    /* 39F4 8013D5EC 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 39F8 8013D5F0 21083000 */  addu       $at, $at, $s0
    /* 39FC 8013D5F4 762C31A4 */  sh         $s1, %lo(missile + 0x1E)($at)
    /* 3A00 8013D5F8 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 3A04 8013D5FC 21083000 */  addu       $at, $at, $s0
    /* 3A08 8013D600 782C32A4 */  sh         $s2, %lo(missile + 0x20)($at)
    /* 3A0C 8013D604 04006214 */  bne        $v1, $v0, .L8013D618
    /* 3A10 8013D608 21202002 */   addu      $a0, $s1, $zero
    /* 3A14 8013D60C 21284002 */  addu       $a1, $s2, $zero
    /* 3A18 8013D610 88F50408 */  j          .L8013D620
    /* 3A1C 8013D614 65030624 */   addiu     $a2, $zero, 0x365
  .L8013D618:
    /* 3A20 8013D618 21284002 */  addu       $a1, $s2, $zero
    /* 3A24 8013D61C 95000624 */  addiu      $a2, $zero, 0x95
  .L8013D620:
    /* 3A28 8013D620 BA34010C */  jal        AddLight__Fiii
    /* 3A2C 8013D624 00000000 */   nop
    /* 3A30 8013D628 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 3A34 8013D62C 21083000 */  addu       $at, $at, $s0
    /* 3A38 8013D630 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 3A3C 8013D634 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 3A40 8013D638 2800B48F */  lw         $s4, 0x28($sp)
    /* 3A44 8013D63C 2400B38F */  lw         $s3, 0x24($sp)
    /* 3A48 8013D640 2000B28F */  lw         $s2, 0x20($sp)
    /* 3A4C 8013D644 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3A50 8013D648 1800B08F */  lw         $s0, 0x18($sp)
    /* 3A54 8013D64C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3A58 8013D650 0800E003 */  jr         $ra
    /* 3A5C 8013D654 00000000 */   nop
endlabel AddLArrow__Fiiiiiicii
