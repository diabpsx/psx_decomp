.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncLever__Fi, 0x84

glabel SyncLever__Fi
    /* 4EF70 8005EF70 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4EF74 8005EF74 40100400 */  sll        $v0, $a0, 1
    /* 4EF78 8005EF78 21104400 */  addu       $v0, $v0, $a0
    /* 4EF7C 8005EF7C 80100200 */  sll        $v0, $v0, 2
    /* 4EF80 8005EF80 23104400 */  subu       $v0, $v0, $a0
    /* 4EF84 8005EF84 80180200 */  sll        $v1, $v0, 2
    /* 4EF88 8005EF88 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4EF8C 8005EF8C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4EF90 8005EF90 21082300 */  addu       $at, $at, $v1
    /* 4EF94 8005EF94 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4EF98 8005EF98 00000000 */  nop
    /* 4EF9C 8005EF9C 0F004014 */  bnez       $v0, .L8005EFDC
    /* 4EFA0 8005EFA0 00000000 */   nop
    /* 4EFA4 8005EFA4 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4EFA8 8005EFA8 21082300 */  addu       $at, $at, $v1
    /* 4EFAC 8005EFAC 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 4EFB0 8005EFB0 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4EFB4 8005EFB4 21082300 */  addu       $at, $at, $v1
    /* 4EFB8 8005EFB8 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 4EFBC 8005EFBC 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4EFC0 8005EFC0 21082300 */  addu       $at, $at, $v1
    /* 4EFC4 8005EFC4 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 4EFC8 8005EFC8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4EFCC 8005EFCC 21082300 */  addu       $at, $at, $v1
    /* 4EFD0 8005EFD0 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 4EFD4 8005EFD4 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4EFD8 8005EFD8 00000000 */   nop
  .L8005EFDC:
    /* 4EFDC 8005EFDC F5E3000C */  jal        FillCrapBits__Fv
    /* 4EFE0 8005EFE0 00000000 */   nop
    /* 4EFE4 8005EFE4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4EFE8 8005EFE8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4EFEC 8005EFEC 0800E003 */  jr         $ra
    /* 4EFF0 8005EFF0 00000000 */   nop
endlabel SyncLever__Fi
