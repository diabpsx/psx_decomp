.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InvMoveCursUp__Fv, 0x1F8

glabel InvMoveCursUp__Fv
    /* 27D60 80161958 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27D64 8016195C 1280023C */  lui        $v0, %hi(myplr)
    /* 27D68 80161960 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 27D6C 80161964 1400BFAF */  sw         $ra, 0x14($sp)
    /* 27D70 80161968 1000B0AF */  sw         $s0, 0x10($sp)
    /* 27D74 8016196C 80100200 */  sll        $v0, $v0, 2
    /* 27D78 80161970 1280013C */  lui        $at, %hi(_pcurs)
    /* 27D7C 80161974 21082200 */  addu       $at, $at, $v0
    /* 27D80 80161978 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 27D84 8016197C B41B908F */  lw         $s0, %gp_rel(InvCursPos)($gp)
    /* 27D88 80161980 0C004228 */  slti       $v0, $v0, 0xC
    /* 27D8C 80161984 1D004010 */  beqz       $v0, .L801619FC
    /* 27D90 80161988 21200000 */   addu      $a0, $zero, $zero
    /* 27D94 8016198C 1400022E */  sltiu      $v0, $s0, 0x14
    /* 27D98 80161990 10004010 */  beqz       $v0, .L801619D4
    /* 27D9C 80161994 80101000 */   sll       $v0, $s0, 2
    /* 27DA0 80161998 1280013C */  lui        $at, %hi(jtbl_8011A5D8)
    /* 27DA4 8016199C 21082200 */  addu       $at, $at, $v0
    /* 27DA8 801619A0 D8A5228C */  lw         $v0, %lo(jtbl_8011A5D8)($at)
    /* 27DAC 801619A4 00000000 */  nop
    /* 27DB0 801619A8 08004000 */  jr         $v0
    /* 27DB4 801619AC 00000000 */   nop
    /* 27DB8 801619B0 93860508 */  j          .L80161A4C
    /* 27DBC 801619B4 06000224 */   addiu     $v0, $zero, 0x6
    /* 27DC0 801619B8 B41B80AF */  sw         $zero, %gp_rel(InvCursPos)($gp)
    /* 27DC4 801619BC 94860508 */  j          .L80161A50
    /* 27DC8 801619C0 00000000 */   nop
    /* 27DCC 801619C4 93860508 */  j          .L80161A4C
    /* 27DD0 801619C8 06000224 */   addiu     $v0, $zero, 0x6
    /* 27DD4 801619CC 93860508 */  j          .L80161A4C
    /* 27DD8 801619D0 06000224 */   addiu     $v0, $zero, 0x6
  .L801619D4:
    /* 27DDC 801619D4 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 27DE0 801619D8 00000000 */  nop
    /* 27DE4 801619DC E7FF6224 */  addiu      $v0, $v1, -0x19
    /* 27DE8 801619E0 2800422C */  sltiu      $v0, $v0, 0x28
    /* 27DEC 801619E4 16004010 */  beqz       $v0, .L80161A40
    /* 27DF0 801619E8 23006228 */   slti      $v0, $v1, 0x23
    /* 27DF4 801619EC 12004010 */  beqz       $v0, .L80161A38
    /* 27DF8 801619F0 13000224 */   addiu     $v0, $zero, 0x13
    /* 27DFC 801619F4 93860508 */  j          .L80161A4C
    /* 27E00 801619F8 00000000 */   nop
  .L801619FC:
    /* 27E04 801619FC 1400022E */  sltiu      $v0, $s0, 0x14
    /* 27E08 80161A00 07004010 */  beqz       $v0, .L80161A20
    /* 27E0C 80161A04 80101000 */   sll       $v0, $s0, 2
    /* 27E10 80161A08 1280013C */  lui        $at, %hi(jtbl_8011A628)
    /* 27E14 80161A0C 21082200 */  addu       $at, $at, $v0
    /* 27E18 80161A10 28A6228C */  lw         $v0, %lo(jtbl_8011A628)($at)
    /* 27E1C 80161A14 00000000 */  nop
    /* 27E20 80161A18 08004000 */  jr         $v0
    /* 27E24 80161A1C 00000000 */   nop
  .L80161A20:
    /* 27E28 80161A20 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 27E2C 80161A24 00000000 */  nop
    /* 27E30 80161A28 E7FF6224 */  addiu      $v0, $v1, -0x19
    /* 27E34 80161A2C 2800422C */  sltiu      $v0, $v0, 0x28
    /* 27E38 80161A30 04004010 */  beqz       $v0, .L80161A44
    /* 27E3C 80161A34 41006228 */   slti      $v0, $v1, 0x41
  .L80161A38:
    /* 27E40 80161A38 94860508 */  j          .L80161A50
    /* 27E44 80161A3C 01000424 */   addiu     $a0, $zero, 0x1
  .L80161A40:
    /* 27E48 80161A40 41006228 */  slti       $v0, $v1, 0x41
  .L80161A44:
    /* 27E4C 80161A44 02004014 */  bnez       $v0, .L80161A50
    /* 27E50 80161A48 F7FF6224 */   addiu     $v0, $v1, -0x9
  .L80161A4C:
    /* 27E54 80161A4C B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
  .L80161A50:
    /* 27E58 80161A50 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 27E5C 80161A54 00000000 */  nop
    /* 27E60 80161A58 E7FF6224 */  addiu      $v0, $v1, -0x19
    /* 27E64 80161A5C 2800422C */  sltiu      $v0, $v0, 0x28
    /* 27E68 80161A60 2E004010 */  beqz       $v0, .L80161B1C
    /* 27E6C 80161A64 00000000 */   nop
    /* 27E70 80161A68 2C008010 */  beqz       $a0, .L80161B1C
    /* 27E74 80161A6C 23006228 */   slti      $v0, $v1, 0x23
    /* 27E78 80161A70 29004010 */  beqz       $v0, .L80161B18
    /* 27E7C 80161A74 F6FF6224 */   addiu     $v0, $v1, -0xA
    /* 27E80 80161A78 1280033C */  lui        $v1, %hi(myplr)
    /* 27E84 80161A7C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 27E88 80161A80 00000000 */  nop
    /* 27E8C 80161A84 40100300 */  sll        $v0, $v1, 1
    /* 27E90 80161A88 21104300 */  addu       $v0, $v0, $v1
    /* 27E94 80161A8C 80100200 */  sll        $v0, $v0, 2
    /* 27E98 80161A90 21104300 */  addu       $v0, $v0, $v1
    /* 27E9C 80161A94 00110200 */  sll        $v0, $v0, 4
    /* 27EA0 80161A98 23104300 */  subu       $v0, $v0, $v1
    /* 27EA4 80161A9C 80100200 */  sll        $v0, $v0, 2
    /* 27EA8 80161AA0 21104300 */  addu       $v0, $v0, $v1
    /* 27EAC 80161AA4 C0100200 */  sll        $v0, $v0, 3
    /* 27EB0 80161AA8 0E80013C */  lui        $at, %hi(plr + 0x1964)
    /* 27EB4 80161AAC 21082200 */  addu       $at, $at, $v0
    /* 27EB8 80161AB0 9CBE2290 */  lbu        $v0, %lo(plr + 0x1964)($at)
    /* 27EBC 80161AB4 00000000 */  nop
    /* 27EC0 80161AB8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 27EC4 80161ABC 00160200 */  sll        $v0, $v0, 24
    /* 27EC8 80161AC0 031E0200 */  sra        $v1, $v0, 24
    /* 27ECC 80161AC4 0800622C */  sltiu      $v0, $v1, 0x8
    /* 27ED0 80161AC8 14004010 */  beqz       $v0, .L80161B1C
    /* 27ED4 80161ACC 80100300 */   sll       $v0, $v1, 2
    /* 27ED8 80161AD0 1280013C */  lui        $at, %hi(jtbl_8011A678)
    /* 27EDC 80161AD4 21082200 */  addu       $at, $at, $v0
    /* 27EE0 80161AD8 78A6228C */  lw         $v0, %lo(jtbl_8011A678)($at)
    /* 27EE4 80161ADC 00000000 */  nop
    /* 27EE8 80161AE0 08004000 */  jr         $v0
    /* 27EEC 80161AE4 00000000 */   nop
    /* 27EF0 80161AE8 C6860508 */  j          .L80161B18
    /* 27EF4 80161AEC 07000224 */   addiu     $v0, $zero, 0x7
    /* 27EF8 80161AF0 C6860508 */  j          .L80161B18
    /* 27EFC 80161AF4 07000224 */   addiu     $v0, $zero, 0x7
    /* 27F00 80161AF8 C6860508 */  j          .L80161B18
    /* 27F04 80161AFC 13000224 */   addiu     $v0, $zero, 0x13
    /* 27F08 80161B00 B41B80AF */  sw         $zero, %gp_rel(InvCursPos)($gp)
    /* 27F0C 80161B04 C7860508 */  j          .L80161B1C
    /* 27F10 80161B08 00000000 */   nop
    /* 27F14 80161B0C C6860508 */  j          .L80161B18
    /* 27F18 80161B10 04000224 */   addiu     $v0, $zero, 0x4
    /* 27F1C 80161B14 06000224 */  addiu      $v0, $zero, 0x6
  .L80161B18:
    /* 27F20 80161B18 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
  .L80161B1C:
    /* 27F24 80161B1C D784050C */  jal        InvSetItemCurs__Fv
    /* 27F28 80161B20 00000000 */   nop
    /* 27F2C 80161B24 B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 27F30 80161B28 00000000 */  nop
    /* 27F34 80161B2C 03000212 */  beq        $s0, $v0, .L80161B3C
    /* 27F38 80161B30 00000000 */   nop
    /* 27F3C 80161B34 C6F5000C */  jal        PlaySFX__Fi
    /* 27F40 80161B38 32000424 */   addiu     $a0, $zero, 0x32
  .L80161B3C:
    /* 27F44 80161B3C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 27F48 80161B40 1000B08F */  lw         $s0, 0x10($sp)
    /* 27F4C 80161B44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 27F50 80161B48 0800E003 */  jr         $ra
    /* 27F54 80161B4C 00000000 */   nop
endlabel InvMoveCursUp__Fv
