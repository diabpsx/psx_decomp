.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckMonsterHit__FiRUc, 0xDC

glabel CheckMonsterHit__FiRUc
    /* 1CD94 8015698C 40100400 */  sll        $v0, $a0, 1
    /* 1CD98 80156990 21104400 */  addu       $v0, $v0, $a0
    /* 1CD9C 80156994 80100200 */  sll        $v0, $v0, 2
    /* 1CDA0 80156998 21104400 */  addu       $v0, $v0, $a0
    /* 1CDA4 8015699C C0300200 */  sll        $a2, $v0, 3
    /* 1CDA8 801569A0 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 1CDAC 801569A4 21082600 */  addu       $at, $at, $a2
    /* 1CDB0 801569A8 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 1CDB4 801569AC 0C000224 */  addiu      $v0, $zero, 0xC
    /* 1CDB8 801569B0 14006214 */  bne        $v1, $v0, .L80156A04
    /* 1CDBC 801569B4 40100400 */   sll       $v0, $a0, 1
    /* 1CDC0 801569B8 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1CDC4 801569BC 21082600 */  addu       $at, $at, $a2
    /* 1CDC8 801569C0 C0532394 */  lhu        $v1, %lo(monster + 0x2C)($at)
    /* 1CDCC 801569C4 00000000 */  nop
    /* 1CDD0 801569C8 04006230 */  andi       $v0, $v1, 0x4
    /* 1CDD4 801569CC 0C004010 */  beqz       $v0, .L80156A00
    /* 1CDD8 801569D0 01000224 */   addiu     $v0, $zero, 0x1
    /* 1CDDC 801569D4 FBFF6330 */  andi       $v1, $v1, 0xFFFB
    /* 1CDE0 801569D8 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1CDE4 801569DC 21082600 */  addu       $at, $at, $a2
    /* 1CDE8 801569E0 C05323A4 */  sh         $v1, %lo(monster + 0x2C)($at)
    /* 1CDEC 801569E4 07000324 */  addiu      $v1, $zero, 0x7
    /* 1CDF0 801569E8 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1CDF4 801569EC 21082600 */  addu       $at, $at, $a2
    /* 1CDF8 801569F0 C75323A0 */  sb         $v1, %lo(monster + 0x33)($at)
    /* 1CDFC 801569F4 01000324 */  addiu      $v1, $zero, 0x1
    /* 1CE00 801569F8 985A0508 */  j          .L80156A60
    /* 1CE04 801569FC 0000A3A0 */   sb        $v1, 0x0($a1)
  .L80156A00:
    /* 1CE08 80156A00 40100400 */  sll        $v0, $a0, 1
  .L80156A04:
    /* 1CE0C 80156A04 21104400 */  addu       $v0, $v0, $a0
    /* 1CE10 80156A08 80100200 */  sll        $v0, $v0, 2
    /* 1CE14 80156A0C 21104400 */  addu       $v0, $v0, $a0
    /* 1CE18 80156A10 C0180200 */  sll        $v1, $v0, 3
    /* 1CE1C 80156A14 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1CE20 80156A18 21082300 */  addu       $at, $at, $v1
    /* 1CE24 80156A1C F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 1CE28 80156A20 00000000 */  nop
    /* 1CE2C 80156A24 12004290 */  lbu        $v0, 0x12($v0)
    /* 1CE30 80156A28 00000000 */  nop
    /* 1CE34 80156A2C 97FF4224 */  addiu      $v0, $v0, -0x69
    /* 1CE38 80156A30 0400422C */  sltiu      $v0, $v0, 0x4
    /* 1CE3C 80156A34 09004010 */  beqz       $v0, .L80156A5C
    /* 1CE40 80156A38 01000224 */   addiu     $v0, $zero, 0x1
    /* 1CE44 80156A3C 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 1CE48 80156A40 21082300 */  addu       $at, $at, $v1
    /* 1CE4C 80156A44 DD532390 */  lbu        $v1, %lo(monster + 0x49)($at)
    /* 1CE50 80156A48 00000000 */  nop
    /* 1CE54 80156A4C 03006210 */  beq        $v1, $v0, .L80156A5C
    /* 1CE58 80156A50 00000000 */   nop
    /* 1CE5C 80156A54 985A0508 */  j          .L80156A60
    /* 1CE60 80156A58 0000A0A0 */   sb        $zero, 0x0($a1)
  .L80156A5C:
    /* 1CE64 80156A5C 21100000 */  addu       $v0, $zero, $zero
  .L80156A60:
    /* 1CE68 80156A60 0800E003 */  jr         $ra
    /* 1CE6C 80156A64 00000000 */   nop
endlabel CheckMonsterHit__FiRUc
