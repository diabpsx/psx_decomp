.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_FallenFear__Fii, 0x1E8

glabel M_FallenFear__Fii
    /* 1BB54 8015574C 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 1BB58 80155750 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1BB5C 80155754 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1BB60 80155758 21B08000 */  addu       $s6, $a0, $zero
    /* 1BB64 8015575C 3400B7AF */  sw         $s7, 0x34($sp)
    /* 1BB68 80155760 21B8A000 */  addu       $s7, $a1, $zero
    /* 1BB6C 80155764 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1BB70 80155768 21A00000 */  addu       $s4, $zero, $zero
    /* 1BB74 8015576C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1BB78 80155770 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1BB7C 80155774 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1BB80 80155778 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1BB84 8015577C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1BB88 80155780 60004018 */  blez       $v0, .L80155904
    /* 1BB8C 80155784 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1BB90 80155788 21980000 */  addu       $s3, $zero, $zero
    /* 1BB94 8015578C 21A80000 */  addu       $s5, $zero, $zero
  .L80155790:
    /* 1BB98 80155790 1180013C */  lui        $at, %hi(monstactive)
    /* 1BB9C 80155794 21083500 */  addu       $at, $at, $s5
    /* 1BBA0 80155798 C4A02484 */  lh         $a0, %lo(monstactive)($at)
    /* 1BBA4 8015579C 00000000 */  nop
    /* 1BBA8 801557A0 40100400 */  sll        $v0, $a0, 1
    /* 1BBAC 801557A4 21104400 */  addu       $v0, $v0, $a0
    /* 1BBB0 801557A8 80100200 */  sll        $v0, $v0, 2
    /* 1BBB4 801557AC 21104400 */  addu       $v0, $v0, $a0
    /* 1BBB8 801557B0 C0100200 */  sll        $v0, $v0, 3
    /* 1BBBC 801557B4 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1BBC0 801557B8 21082200 */  addu       $at, $at, $v0
    /* 1BBC4 801557BC F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 1BBC8 801557C0 00000000 */  nop
    /* 1BBCC 801557C4 12004290 */  lbu        $v0, 0x12($v0)
    /* 1BBD0 801557C8 00000000 */  nop
    /* 1BBD4 801557CC FCFF4324 */  addiu      $v1, $v0, -0x4
    /* 1BBD8 801557D0 0C00622C */  sltiu      $v0, $v1, 0xC
    /* 1BBDC 801557D4 0F004010 */  beqz       $v0, .L80155814
    /* 1BBE0 801557D8 21900000 */   addu      $s2, $zero, $zero
    /* 1BBE4 801557DC 80100300 */  sll        $v0, $v1, 2
    /* 1BBE8 801557E0 1280013C */  lui        $at, %hi(jtbl_8011A378)
    /* 1BBEC 801557E4 21082200 */  addu       $at, $at, $v0
    /* 1BBF0 801557E8 78A3228C */  lw         $v0, %lo(jtbl_8011A378)($at)
    /* 1BBF4 801557EC 00000000 */  nop
    /* 1BBF8 801557F0 08004000 */  jr         $v0
    /* 1BBFC 801557F4 00000000 */   nop
    /* 1BC00 801557F8 05560508 */  j          .L80155814
    /* 1BC04 801557FC 07001224 */   addiu     $s2, $zero, 0x7
    /* 1BC08 80155800 05560508 */  j          .L80155814
    /* 1BC0C 80155804 05001224 */   addiu     $s2, $zero, 0x5
    /* 1BC10 80155808 05560508 */  j          .L80155814
    /* 1BC14 8015580C 03001224 */   addiu     $s2, $zero, 0x3
    /* 1BC18 80155810 02001224 */  addiu      $s2, $zero, 0x2
  .L80155814:
    /* 1BC1C 80155814 40100400 */  sll        $v0, $a0, 1
    /* 1BC20 80155818 21104400 */  addu       $v0, $v0, $a0
    /* 1BC24 8015581C 80100200 */  sll        $v0, $v0, 2
    /* 1BC28 80155820 21104400 */  addu       $v0, $v0, $a0
    /* 1BC2C 80155824 C0800200 */  sll        $s0, $v0, 3
    /* 1BC30 80155828 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 1BC34 8015582C 21083000 */  addu       $at, $at, $s0
    /* 1BC38 80155830 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 1BC3C 80155834 08000224 */  addiu      $v0, $zero, 0x8
    /* 1BC40 80155838 2C006214 */  bne        $v1, $v0, .L801558EC
    /* 1BC44 8015583C 00000000 */   nop
    /* 1BC48 80155840 2A004012 */  beqz       $s2, .L801558EC
    /* 1BC4C 80155844 21880000 */   addu      $s1, $zero, $zero
    /* 1BC50 80155848 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1BC54 8015584C 21083000 */  addu       $at, $at, $s0
    /* 1BC58 80155850 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 1BC5C 80155854 6D41000C */  jal        abs
    /* 1BC60 80155858 2320C402 */   subu      $a0, $s6, $a0
    /* 1BC64 8015585C 05004228 */  slti       $v0, $v0, 0x5
    /* 1BC68 80155860 07004010 */  beqz       $v0, .L80155880
    /* 1BC6C 80155864 00000000 */   nop
    /* 1BC70 80155868 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1BC74 8015586C 21083000 */  addu       $at, $at, $s0
    /* 1BC78 80155870 C9532480 */  lb         $a0, %lo(monster + 0x35)($at)
    /* 1BC7C 80155874 6D41000C */  jal        abs
    /* 1BC80 80155878 2320E402 */   subu      $a0, $s7, $a0
    /* 1BC84 8015587C 05005128 */  slti       $s1, $v0, 0x5
  .L80155880:
    /* 1BC88 80155880 1A002012 */  beqz       $s1, .L801558EC
    /* 1BC8C 80155884 00000000 */   nop
    /* 1BC90 80155888 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1BC94 8015588C 21083000 */  addu       $at, $at, $s0
    /* 1BC98 80155890 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1BC9C 80155894 00000000 */  nop
    /* 1BCA0 80155898 83110200 */  sra        $v0, $v0, 6
    /* 1BCA4 8015589C 13004018 */  blez       $v0, .L801558EC
    /* 1BCA8 801558A0 2120C002 */   addu      $a0, $s6, $zero
    /* 1BCAC 801558A4 02000224 */  addiu      $v0, $zero, 0x2
    /* 1BCB0 801558A8 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 1BCB4 801558AC 21083000 */  addu       $at, $at, $s0
    /* 1BCB8 801558B0 DD5322A0 */  sb         $v0, %lo(monster + 0x49)($at)
    /* 1BCBC 801558B4 1080013C */  lui        $at, %hi(monster + 0x4)
    /* 1BCC0 801558B8 21083000 */  addu       $at, $at, $s0
    /* 1BCC4 801558BC 985332AC */  sw         $s2, %lo(monster + 0x4)($at)
    /* 1BCC8 801558C0 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1BCCC 801558C4 21083300 */  addu       $at, $at, $s3
    /* 1BCD0 801558C8 C8532680 */  lb         $a2, %lo(monster + 0x34)($at)
    /* 1BCD4 801558CC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1BCD8 801558D0 21083300 */  addu       $at, $at, $s3
    /* 1BCDC 801558D4 C9532780 */  lb         $a3, %lo(monster + 0x35)($at)
    /* 1BCE0 801558D8 8AF6000C */  jal        GetDirection__Fiiii
    /* 1BCE4 801558DC 2128E002 */   addu      $a1, $s7, $zero
    /* 1BCE8 801558E0 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1BCEC 801558E4 21083000 */  addu       $at, $at, $s0
    /* 1BCF0 801558E8 D05322A0 */  sb         $v0, %lo(monster + 0x3C)($at)
  .L801558EC:
    /* 1BCF4 801558EC 68007326 */  addiu      $s3, $s3, 0x68
    /* 1BCF8 801558F0 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 1BCFC 801558F4 01009426 */  addiu      $s4, $s4, 0x1
    /* 1BD00 801558F8 2A108202 */  slt        $v0, $s4, $v0
    /* 1BD04 801558FC A4FF4014 */  bnez       $v0, .L80155790
    /* 1BD08 80155900 0200B526 */   addiu     $s5, $s5, 0x2
  .L80155904:
    /* 1BD0C 80155904 3800BF8F */  lw         $ra, 0x38($sp)
    /* 1BD10 80155908 3400B78F */  lw         $s7, 0x34($sp)
    /* 1BD14 8015590C 3000B68F */  lw         $s6, 0x30($sp)
    /* 1BD18 80155910 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1BD1C 80155914 2800B48F */  lw         $s4, 0x28($sp)
    /* 1BD20 80155918 2400B38F */  lw         $s3, 0x24($sp)
    /* 1BD24 8015591C 2000B28F */  lw         $s2, 0x20($sp)
    /* 1BD28 80155920 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1BD2C 80155924 1800B08F */  lw         $s0, 0x18($sp)
    /* 1BD30 80155928 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1BD34 8015592C 0800E003 */  jr         $ra
    /* 1BD38 80155930 00000000 */   nop
endlabel M_FallenFear__Fii
