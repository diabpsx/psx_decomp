.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTelekinesis__Fiiiiiicii, 0x70

glabel AddTelekinesis__Fiiiiiicii
    /* 8928 80142520 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 892C 80142524 80100400 */  sll        $v0, $a0, 2
    /* 8930 80142528 21104400 */  addu       $v0, $v0, $a0
    /* 8934 8014252C 80100200 */  sll        $v0, $v0, 2
    /* 8938 80142530 23104400 */  subu       $v0, $v0, $a0
    /* 893C 80142534 80100200 */  sll        $v0, $v0, 2
    /* 8940 80142538 01000324 */  addiu      $v1, $zero, 0x1
    /* 8944 8014253C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8948 80142540 3400B08F */  lw         $s0, 0x34($sp)
    /* 894C 80142544 21000524 */  addiu      $a1, $zero, 0x21
    /* 8950 80142548 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8954 8014254C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 8958 80142550 21082200 */  addu       $at, $at, $v0
    /* 895C 80142554 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 8960 80142558 C2DC010C */  jal        UseMana__Fii
    /* 8964 8014255C 21200002 */   addu      $a0, $s0, $zero
    /* 8968 80142560 1280023C */  lui        $v0, %hi(myplr)
    /* 896C 80142564 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 8970 80142568 00000000 */  nop
    /* 8974 8014256C 03000216 */  bne        $s0, $v0, .L8014257C
    /* 8978 80142570 00000000 */   nop
    /* 897C 80142574 01DE000C */  jal        NewCursor__Fi
    /* 8980 80142578 07000424 */   addiu     $a0, $zero, 0x7
  .L8014257C:
    /* 8984 8014257C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8988 80142580 1000B08F */  lw         $s0, 0x10($sp)
    /* 898C 80142584 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8990 80142588 0800E003 */  jr         $ra
    /* 8994 8014258C 00000000 */   nop
endlabel AddTelekinesis__Fiiiiiicii
