.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoUnVision__Fiiii, 0x108

glabel DoUnVision__Fiiii
    /* 3CD38 8004CD38 0500E010 */  beqz       $a3, .L8004CD50
    /* 3CD3C 8004CD3C 01000224 */   addiu     $v0, $zero, 0x1
    /* 3CD40 8004CD40 0400E210 */  beq        $a3, $v0, .L8004CD54
    /* 3CD44 8004CD44 02000724 */   addiu     $a3, $zero, 0x2
    /* 3CD48 8004CD48 55330108 */  j          .L8004CD54
    /* 3CD4C 8004CD4C 03000724 */   addiu     $a3, $zero, 0x3
  .L8004CD50:
    /* 3CD50 8004CD50 01000724 */  addiu      $a3, $zero, 0x1
  .L8004CD54:
    /* 3CD54 8004CD54 0100C624 */  addiu      $a2, $a2, 0x1
    /* 3CD58 8004CD58 2360A600 */  subu       $t4, $a1, $a2
    /* 3CD5C 8004CD5C 2128A600 */  addu       $a1, $a1, $a2
    /* 3CD60 8004CD60 23188600 */  subu       $v1, $a0, $a2
    /* 3CD64 8004CD64 02008105 */  bgez       $t4, .L8004CD70
    /* 3CD68 8004CD68 21208600 */   addu      $a0, $a0, $a2
    /* 3CD6C 8004CD6C 21600000 */  addu       $t4, $zero, $zero
  .L8004CD70:
    /* 3CD70 8004CD70 6100A228 */  slti       $v0, $a1, 0x61
    /* 3CD74 8004CD74 02004014 */  bnez       $v0, .L8004CD80
    /* 3CD78 8004CD78 00000000 */   nop
    /* 3CD7C 8004CD7C 60000524 */  addiu      $a1, $zero, 0x60
  .L8004CD80:
    /* 3CD80 8004CD80 02006104 */  bgez       $v1, .L8004CD8C
    /* 3CD84 8004CD84 61008228 */   slti      $v0, $a0, 0x61
    /* 3CD88 8004CD88 21180000 */  addu       $v1, $zero, $zero
  .L8004CD8C:
    /* 3CD8C 8004CD8C 02004014 */  bnez       $v0, .L8004CD98
    /* 3CD90 8004CD90 21486000 */   addu      $t1, $v1, $zero
    /* 3CD94 8004CD94 60000424 */  addiu      $a0, $zero, 0x60
  .L8004CD98:
    /* 3CD98 8004CD98 2A102401 */  slt        $v0, $t1, $a0
    /* 3CD9C 8004CD9C 26004010 */  beqz       $v0, .L8004CE38
    /* 3CDA0 8004CDA0 0400E234 */   ori       $v0, $a3, 0x4
    /* 3CDA4 8004CDA4 27300700 */  nor        $a2, $zero, $a3
    /* 3CDA8 8004CDA8 27580200 */  nor        $t3, $zero, $v0
    /* 3CDAC 8004CDAC C0100900 */  sll        $v0, $t1, 3
    /* 3CDB0 8004CDB0 23104900 */  subu       $v0, $v0, $t1
    /* 3CDB4 8004CDB4 C0410200 */  sll        $t0, $v0, 7
  .L8004CDB8:
    /* 3CDB8 8004CDB8 21188001 */  addu       $v1, $t4, $zero
    /* 3CDBC 8004CDBC 2A106500 */  slt        $v0, $v1, $a1
    /* 3CDC0 8004CDC0 19004010 */  beqz       $v0, .L8004CE28
    /* 3CDC4 8004CDC4 C0100300 */   sll       $v0, $v1, 3
    /* 3CDC8 8004CDC8 21384800 */  addu       $a3, $v0, $t0
    /* 3CDCC 8004CDCC C0100500 */  sll        $v0, $a1, 3
    /* 3CDD0 8004CDD0 21504800 */  addu       $t2, $v0, $t0
  .L8004CDD4:
    /* 3CDD4 8004CDD4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CDD8 8004CDD8 21082700 */  addu       $at, $at, $a3
    /* 3CDDC 8004CDDC 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 3CDE0 8004CDE0 00000000 */  nop
    /* 3CDE4 8004CDE4 01006230 */  andi       $v0, $v1, 0x1
    /* 3CDE8 8004CDE8 03004010 */  beqz       $v0, .L8004CDF8
    /* 3CDEC 8004CDEC 02006230 */   andi      $v0, $v1, 0x2
    /* 3CDF0 8004CDF0 06004014 */  bnez       $v0, .L8004CE0C
    /* 3CDF4 8004CDF4 24106600 */   and       $v0, $v1, $a2
  .L8004CDF8:
    /* 3CDF8 8004CDF8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CDFC 8004CDFC 21082700 */  addu       $at, $at, $a3
    /* 3CE00 8004CE00 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 3CE04 8004CE04 00000000 */  nop
    /* 3CE08 8004CE08 24104B00 */  and        $v0, $v0, $t3
  .L8004CE0C:
    /* 3CE0C 8004CE0C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CE10 8004CE10 21082700 */  addu       $at, $at, $a3
    /* 3CE14 8004CE14 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 3CE18 8004CE18 0800E724 */  addiu      $a3, $a3, 0x8
    /* 3CE1C 8004CE1C 2A10EA00 */  slt        $v0, $a3, $t2
    /* 3CE20 8004CE20 ECFF4014 */  bnez       $v0, .L8004CDD4
    /* 3CE24 8004CE24 00000000 */   nop
  .L8004CE28:
    /* 3CE28 8004CE28 01002925 */  addiu      $t1, $t1, 0x1
    /* 3CE2C 8004CE2C 2A102401 */  slt        $v0, $t1, $a0
    /* 3CE30 8004CE30 E1FF4014 */  bnez       $v0, .L8004CDB8
    /* 3CE34 8004CE34 80030825 */   addiu     $t0, $t0, 0x380
  .L8004CE38:
    /* 3CE38 8004CE38 0800E003 */  jr         $ra
    /* 3CE3C 8004CE3C 00000000 */   nop
endlabel DoUnVision__Fiiii
