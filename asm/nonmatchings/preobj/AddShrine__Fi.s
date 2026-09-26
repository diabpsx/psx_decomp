.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddShrine__Fi, 0x148

glabel AddShrine__Fi
    /* 1CD28 80156920 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1CD2C 80156924 3400B1AF */  sw         $s1, 0x34($sp)
    /* 1CD30 80156928 21888000 */  addu       $s1, $a0, $zero
    /* 1CD34 8015692C 40101100 */  sll        $v0, $s1, 1
    /* 1CD38 80156930 21105100 */  addu       $v0, $v0, $s1
    /* 1CD3C 80156934 80100200 */  sll        $v0, $v0, 2
    /* 1CD40 80156938 23105100 */  subu       $v0, $v0, $s1
    /* 1CD44 8015693C 80100200 */  sll        $v0, $v0, 2
    /* 1CD48 80156940 01000324 */  addiu      $v1, $zero, 0x1
    /* 1CD4C 80156944 01000524 */  addiu      $a1, $zero, 0x1
    /* 1CD50 80156948 02000824 */  addiu      $t0, $zero, 0x2
    /* 1CD54 8015694C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1CD58 80156950 3000B0AF */  sw         $s0, 0x30($sp)
    /* 1CD5C 80156954 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 1CD60 80156958 21082200 */  addu       $at, $at, $v0
    /* 1CD64 8015695C 758C23A0 */  sb         $v1, %lo(object + 0x29)($at)
    /* 1CD68 80156960 1000A327 */  addiu      $v1, $sp, 0x10
    /* 1CD6C 80156964 0E80043C */  lui        $a0, %hi(shrineavail)
    /* 1CD70 80156968 1C8C8424 */  addiu      $a0, $a0, %lo(shrineavail)
    /* 1CD74 8015696C 1700A627 */  addiu      $a2, $sp, 0x17
    /* 1CD78 80156970 1A008724 */  addiu      $a3, $a0, 0x1A
  .L80156974:
    /* 1CD7C 80156974 1280023C */  lui        $v0, %hi(currlevel)
    /* 1CD80 80156978 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1CD84 8015697C 00000000 */  nop
    /* 1CD88 80156980 0A004010 */  beqz       $v0, .L801569AC
    /* 1CD8C 80156984 00000000 */   nop
    /* 1CD90 80156988 03006614 */  bne        $v1, $a2, .L80156998
    /* 1CD94 8015698C 00000000 */   nop
    /* 1CD98 80156990 675A0508 */  j          .L8015699C
    /* 1CD9C 80156994 09004228 */   slti      $v0, $v0, 0x9
  .L80156998:
    /* 1CDA0 80156998 11004228 */  slti       $v0, $v0, 0x11
  .L8015699C:
    /* 1CDA4 8015699C 03004010 */  beqz       $v0, .L801569AC
    /* 1CDA8 801569A0 00000000 */   nop
    /* 1CDAC 801569A4 6C5A0508 */  j          .L801569B0
    /* 1CDB0 801569A8 000065A0 */   sb        $a1, 0x0($v1)
  .L801569AC:
    /* 1CDB4 801569AC 000060A0 */  sb         $zero, 0x0($v1)
  .L801569B0:
    /* 1CDB8 801569B0 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 1CDBC 801569B4 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 1CDC0 801569B8 00000000 */  nop
    /* 1CDC4 801569BC 0B004510 */  beq        $v0, $a1, .L801569EC
    /* 1CDC8 801569C0 00000000 */   nop
    /* 1CDCC 801569C4 00008280 */  lb         $v0, 0x0($a0)
    /* 1CDD0 801569C8 00000000 */  nop
    /* 1CDD4 801569CC 02004514 */  bne        $v0, $a1, .L801569D8
    /* 1CDD8 801569D0 00000000 */   nop
    /* 1CDDC 801569D4 000060A0 */  sb         $zero, 0x0($v1)
  .L801569D8:
    /* 1CDE0 801569D8 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 1CDE4 801569DC A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 1CDE8 801569E0 00000000 */  nop
    /* 1CDEC 801569E4 06004514 */  bne        $v0, $a1, .L80156A00
    /* 1CDF0 801569E8 00000000 */   nop
  .L801569EC:
    /* 1CDF4 801569EC 00008280 */  lb         $v0, 0x0($a0)
    /* 1CDF8 801569F0 00000000 */  nop
    /* 1CDFC 801569F4 02004814 */  bne        $v0, $t0, .L80156A00
    /* 1CE00 801569F8 00000000 */   nop
    /* 1CE04 801569FC 000060A0 */  sb         $zero, 0x0($v1)
  .L80156A00:
    /* 1CE08 80156A00 01008424 */  addiu      $a0, $a0, 0x1
    /* 1CE0C 80156A04 2A108700 */  slt        $v0, $a0, $a3
    /* 1CE10 80156A08 DAFF4014 */  bnez       $v0, .L80156974
    /* 1CE14 80156A0C 01006324 */   addiu     $v1, $v1, 0x1
    /* 1CE18 80156A10 1000B027 */  addiu      $s0, $sp, 0x10
  .L80156A14:
    /* 1CE1C 80156A14 C9F6000C */  jal        ENG_random__Fl
    /* 1CE20 80156A18 1A000424 */   addiu     $a0, $zero, 0x1A
    /* 1CE24 80156A1C 21184000 */  addu       $v1, $v0, $zero
    /* 1CE28 80156A20 21100302 */  addu       $v0, $s0, $v1
    /* 1CE2C 80156A24 00004290 */  lbu        $v0, 0x0($v0)
    /* 1CE30 80156A28 00000000 */  nop
    /* 1CE34 80156A2C F9FF4010 */  beqz       $v0, .L80156A14
    /* 1CE38 80156A30 40101100 */   sll       $v0, $s1, 1
    /* 1CE3C 80156A34 21105100 */  addu       $v0, $v0, $s1
    /* 1CE40 80156A38 80100200 */  sll        $v0, $v0, 2
    /* 1CE44 80156A3C 23105100 */  subu       $v0, $v0, $s1
    /* 1CE48 80156A40 80100200 */  sll        $v0, $v0, 2
    /* 1CE4C 80156A44 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1CE50 80156A48 21082200 */  addu       $at, $at, $v0
    /* 1CE54 80156A4C 5A8C23A4 */  sh         $v1, %lo(object + 0xE)($at)
    /* 1CE58 80156A50 3800BF8F */  lw         $ra, 0x38($sp)
    /* 1CE5C 80156A54 3400B18F */  lw         $s1, 0x34($sp)
    /* 1CE60 80156A58 3000B08F */  lw         $s0, 0x30($sp)
    /* 1CE64 80156A5C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1CE68 80156A60 0800E003 */  jr         $ra
    /* 1CE6C 80156A64 00000000 */   nop
endlabel AddShrine__Fi
