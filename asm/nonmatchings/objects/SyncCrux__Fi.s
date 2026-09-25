.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncCrux__Fi, 0x138

glabel SyncCrux__Fi
    /* 4EE38 8005EE38 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4EE3C 8005EE3C 01000724 */  addiu      $a3, $zero, 0x1
    /* 4EE40 8005EE40 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4EE44 8005EE44 21300000 */  addu       $a2, $zero, $zero
    /* 4EE48 8005EE48 30004018 */  blez       $v0, .L8005EF0C
    /* 4EE4C 8005EE4C 1800BFAF */   sw        $ra, 0x18($sp)
    /* 4EE50 8005EE50 16000A24 */  addiu      $t2, $zero, 0x16
    /* 4EE54 8005EE54 40100400 */  sll        $v0, $a0, 1
    /* 4EE58 8005EE58 21104400 */  addu       $v0, $v0, $a0
    /* 4EE5C 8005EE5C 80100200 */  sll        $v0, $v0, 2
    /* 4EE60 8005EE60 23104400 */  subu       $v0, $v0, $a0
    /* 4EE64 8005EE64 80400200 */  sll        $t0, $v0, 2
    /* 4EE68 8005EE68 FFFF0924 */  addiu      $t1, $zero, -0x1
  .L8005EE6C:
    /* 4EE6C 8005EE6C 0E80013C */  lui        $at, %hi(objectactive)
    /* 4EE70 8005EE70 21082600 */  addu       $at, $at, $a2
    /* 4EE74 8005EE74 20A22280 */  lb         $v0, %lo(objectactive)($at)
    /* 4EE78 8005EE78 00000000 */  nop
    /* 4EE7C 8005EE7C 40180200 */  sll        $v1, $v0, 1
    /* 4EE80 8005EE80 21186200 */  addu       $v1, $v1, $v0
    /* 4EE84 8005EE84 80180300 */  sll        $v1, $v1, 2
    /* 4EE88 8005EE88 23186200 */  subu       $v1, $v1, $v0
    /* 4EE8C 8005EE8C 80280300 */  sll        $a1, $v1, 2
    /* 4EE90 8005EE90 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4EE94 8005EE94 21082500 */  addu       $at, $at, $a1
    /* 4EE98 8005EE98 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4EE9C 8005EE9C 00000000 */  nop
    /* 4EEA0 8005EEA0 ECFF6224 */  addiu      $v0, $v1, -0x14
    /* 4EEA4 8005EEA4 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4EEA8 8005EEA8 03004014 */  bnez       $v0, .L8005EEB8
    /* 4EEAC 8005EEAC 00000000 */   nop
    /* 4EEB0 8005EEB0 11006A14 */  bne        $v1, $t2, .L8005EEF8
    /* 4EEB4 8005EEB4 00000000 */   nop
  .L8005EEB8:
    /* 4EEB8 8005EEB8 0E80013C */  lui        $at, %hi(object + 0x1C)
    /* 4EEBC 8005EEBC 21082800 */  addu       $at, $at, $t0
    /* 4EEC0 8005EEC0 688C2384 */  lh         $v1, %lo(object + 0x1C)($at)
    /* 4EEC4 8005EEC4 0E80013C */  lui        $at, %hi(object + 0x1C)
    /* 4EEC8 8005EEC8 21082500 */  addu       $at, $at, $a1
    /* 4EECC 8005EECC 688C2284 */  lh         $v0, %lo(object + 0x1C)($at)
    /* 4EED0 8005EED0 00000000 */  nop
    /* 4EED4 8005EED4 08006214 */  bne        $v1, $v0, .L8005EEF8
    /* 4EED8 8005EED8 00000000 */   nop
    /* 4EEDC 8005EEDC 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 4EEE0 8005EEE0 21082500 */  addu       $at, $at, $a1
    /* 4EEE4 8005EEE4 6E8C2280 */  lb         $v0, %lo(object + 0x22)($at)
    /* 4EEE8 8005EEE8 00000000 */  nop
    /* 4EEEC 8005EEEC 02004910 */  beq        $v0, $t1, .L8005EEF8
    /* 4EEF0 8005EEF0 00000000 */   nop
    /* 4EEF4 8005EEF4 21380000 */  addu       $a3, $zero, $zero
  .L8005EEF8:
    /* 4EEF8 8005EEF8 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4EEFC 8005EEFC 0100C624 */  addiu      $a2, $a2, 0x1
    /* 4EF00 8005EF00 2A10C200 */  slt        $v0, $a2, $v0
    /* 4EF04 8005EF04 D9FF4014 */  bnez       $v0, .L8005EE6C
    /* 4EF08 8005EF08 00000000 */   nop
  .L8005EF0C:
    /* 4EF0C 8005EF0C FF00E230 */  andi       $v0, $a3, 0xFF
    /* 4EF10 8005EF10 13004010 */  beqz       $v0, .L8005EF60
    /* 4EF14 8005EF14 40100400 */   sll       $v0, $a0, 1
    /* 4EF18 8005EF18 21104400 */  addu       $v0, $v0, $a0
    /* 4EF1C 8005EF1C 80100200 */  sll        $v0, $v0, 2
    /* 4EF20 8005EF20 23104400 */  subu       $v0, $v0, $a0
    /* 4EF24 8005EF24 80100200 */  sll        $v0, $v0, 2
    /* 4EF28 8005EF28 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4EF2C 8005EF2C 21082200 */  addu       $at, $at, $v0
    /* 4EF30 8005EF30 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 4EF34 8005EF34 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4EF38 8005EF38 21082200 */  addu       $at, $at, $v0
    /* 4EF3C 8005EF3C 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 4EF40 8005EF40 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4EF44 8005EF44 21082200 */  addu       $at, $at, $v0
    /* 4EF48 8005EF48 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 4EF4C 8005EF4C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4EF50 8005EF50 21082200 */  addu       $at, $at, $v0
    /* 4EF54 8005EF54 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 4EF58 8005EF58 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4EF5C 8005EF5C 00000000 */   nop
  .L8005EF60:
    /* 4EF60 8005EF60 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4EF64 8005EF64 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4EF68 8005EF68 0800E003 */  jr         $ra
    /* 4EF6C 8005EF6C 00000000 */   nop
endlabel SyncCrux__Fi
