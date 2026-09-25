.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TryDropPlayerItems__FP12PlayerStruct, 0x13C

glabel TryDropPlayerItems__FP12PlayerStruct
    /* 5180C 8006180C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 51810 80061810 1800B2AF */  sw         $s2, 0x18($sp)
    /* 51814 80061814 21908000 */  addu       $s2, $a0, $zero
    /* 51818 80061818 2400BFAF */  sw         $ra, 0x24($sp)
    /* 5181C 8006181C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 51820 80061820 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 51824 80061824 1400B1AF */  sw         $s1, 0x14($sp)
    /* 51828 80061828 787F010C */  jal        plrind__FP12PlayerStruct
    /* 5182C 8006182C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 51830 80061830 80100200 */  sll        $v0, $v0, 2
    /* 51834 80061834 1280043C */  lui        $a0, %hi(PlayerDeathCount)
    /* 51838 80061838 10BA8424 */  addiu      $a0, $a0, %lo(PlayerDeathCount)
    /* 5183C 8006183C 21204400 */  addu       $a0, $v0, $a0
    /* 51840 80061840 1280033C */  lui        $v1, %hi(currlevel)
    /* 51844 80061844 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 51848 80061848 0000828C */  lw         $v0, 0x0($a0)
    /* 5184C 8006184C 10006338 */  xori       $v1, $v1, 0x10
    /* 51850 80061850 0100632C */  sltiu      $v1, $v1, 0x1
    /* 51854 80061854 04004018 */  blez       $v0, .L80061868
    /* 51858 80061858 21806000 */   addu      $s0, $v1, $zero
    /* 5185C 8006185C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 51860 80061860 000082AC */  sw         $v0, 0x0($a0)
    /* 51864 80061864 0000828C */  lw         $v0, 0x0($a0)
  .L80061868:
    /* 51868 80061868 00000000 */  nop
    /* 5186C 8006186C 2D004014 */  bnez       $v0, .L80061924
    /* 51870 80061870 FFFF0324 */   addiu     $v1, $zero, -0x1
    /* 51874 80061874 8812828F */  lw         $v0, %gp_rel(myplr)($gp)
    /* 51878 80061878 000083AC */  sw         $v1, 0x0($a0)
    /* 5187C 8006187C 80100200 */  sll        $v0, $v0, 2
    /* 51880 80061880 1280013C */  lui        $at, %hi(_pcurs)
    /* 51884 80061884 21082200 */  addu       $at, $at, $v0
    /* 51888 80061888 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 5188C 8006188C 00000000 */  nop
    /* 51890 80061890 0C004228 */  slti       $v0, $v0, 0xC
    /* 51894 80061894 08004014 */  bnez       $v0, .L800618B8
    /* 51898 80061898 21A04002 */   addu      $s4, $s2, $zero
    /* 5189C 8006189C 21204002 */  addu       $a0, $s2, $zero
    /* 518A0 800618A0 10194526 */  addiu      $a1, $s2, 0x1910
    /* 518A4 800618A4 21300000 */  addu       $a2, $zero, $zero
    /* 518A8 800618A8 7785010C */  jal        PlrDeadItem__FP12PlayerStructP10ItemStructii
    /* 518AC 800618AC 21380000 */   addu      $a3, $zero, $zero
    /* 518B0 800618B0 01DE000C */  jal        NewCursor__Fi
    /* 518B4 800618B4 01000424 */   addiu     $a0, $zero, 0x1
  .L800618B8:
    /* 518B8 800618B8 FF000232 */  andi       $v0, $s0, 0xFF
    /* 518BC 800618BC 19004014 */  bnez       $v0, .L80061924
    /* 518C0 800618C0 00000000 */   nop
    /* 518C4 800618C4 D186010C */  jal        DropHalfPlayersGold__FP12PlayerStruct
    /* 518C8 800618C8 21204002 */   addu      $a0, $s2, $zero
    /* 518CC 800618CC B0015126 */  addiu      $s1, $s2, 0x1B0
    /* 518D0 800618D0 07001024 */  addiu      $s0, $zero, 0x7
    /* 518D4 800618D4 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 518D8 800618D8 FFFF1026 */  addiu      $s0, $s0, -0x1
  .L800618DC:
    /* 518DC 800618DC 0F001312 */  beq        $s0, $s3, .L8006191C
    /* 518E0 800618E0 21204002 */   addu      $a0, $s2, $zero
    /* 518E4 800618E4 42008282 */  lb         $v0, 0x42($s4)
    /* 518E8 800618E8 21282002 */  addu       $a1, $s1, $zero
    /* 518EC 800618EC 21105000 */  addu       $v0, $v0, $s0
    /* 518F0 800618F0 07004230 */  andi       $v0, $v0, 0x7
    /* 518F4 800618F4 1280013C */  lui        $at, %hi(offset_x)
    /* 518F8 800618F8 21082200 */  addu       $at, $at, $v0
    /* 518FC 800618FC A8C22680 */  lb         $a2, %lo(offset_x)($at)
    /* 51900 80061900 1280013C */  lui        $at, %hi(offset_y)
    /* 51904 80061904 21082200 */  addu       $at, $at, $v0
    /* 51908 80061908 B0C22780 */  lb         $a3, %lo(offset_y)($at)
    /* 5190C 8006190C 7785010C */  jal        PlrDeadItem__FP12PlayerStructP10ItemStructii
    /* 51910 80061910 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 51914 80061914 37860108 */  j          .L800618DC
    /* 51918 80061918 FFFF1026 */   addiu     $s0, $s0, -0x1
  .L8006191C:
    /* 5191C 8006191C 209A010C */  jal        CalcPlrInv__FP12PlayerStructUc
    /* 51920 80061920 21280000 */   addu      $a1, $zero, $zero
  .L80061924:
    /* 51924 80061924 2400BF8F */  lw         $ra, 0x24($sp)
    /* 51928 80061928 2000B48F */  lw         $s4, 0x20($sp)
    /* 5192C 8006192C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 51930 80061930 1800B28F */  lw         $s2, 0x18($sp)
    /* 51934 80061934 1400B18F */  lw         $s1, 0x14($sp)
    /* 51938 80061938 1000B08F */  lw         $s0, 0x10($sp)
    /* 5193C 8006193C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 51940 80061940 0800E003 */  jr         $ra
    /* 51944 80061944 00000000 */   nop
endlabel TryDropPlayerItems__FP12PlayerStruct
