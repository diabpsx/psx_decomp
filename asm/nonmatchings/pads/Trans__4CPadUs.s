.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Trans__4CPadUs, 0x124

glabel Trans__4CPadUs
    /* 799AC 800899AC 2120A000 */  addu       $a0, $a1, $zero
    /* 799B0 800899B0 02130400 */  srl        $v0, $a0, 12
    /* 799B4 800899B4 0040A530 */  andi       $a1, $a1, 0x4000
    /* 799B8 800899B8 0200A010 */  beqz       $a1, .L800899C4
    /* 799BC 800899BC 01004230 */   andi      $v0, $v0, 0x1
    /* 799C0 800899C0 02004234 */  ori        $v0, $v0, 0x2
  .L800899C4:
    /* 799C4 800899C4 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 799C8 800899C8 00808230 */  andi       $v0, $a0, 0x8000
    /* 799CC 800899CC 02004014 */  bnez       $v0, .L800899D8
    /* 799D0 800899D0 04006234 */   ori       $v0, $v1, 0x4
    /* 799D4 800899D4 21106000 */  addu       $v0, $v1, $zero
  .L800899D8:
    /* 799D8 800899D8 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 799DC 800899DC 00208230 */  andi       $v0, $a0, 0x2000
    /* 799E0 800899E0 02004014 */  bnez       $v0, .L800899EC
    /* 799E4 800899E4 08006234 */   ori       $v0, $v1, 0x8
    /* 799E8 800899E8 21106000 */  addu       $v0, $v1, $zero
  .L800899EC:
    /* 799EC 800899EC FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 799F0 800899F0 00088230 */  andi       $v0, $a0, 0x800
    /* 799F4 800899F4 02004014 */  bnez       $v0, .L80089A00
    /* 799F8 800899F8 10006234 */   ori       $v0, $v1, 0x10
    /* 799FC 800899FC 21106000 */  addu       $v0, $v1, $zero
  .L80089A00:
    /* 79A00 80089A00 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A04 80089A04 00018230 */  andi       $v0, $a0, 0x100
    /* 79A08 80089A08 02004014 */  bnez       $v0, .L80089A14
    /* 79A0C 80089A0C 20006234 */   ori       $v0, $v1, 0x20
    /* 79A10 80089A10 21106000 */  addu       $v0, $v1, $zero
  .L80089A14:
    /* 79A14 80089A14 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A18 80089A18 00018230 */  andi       $v0, $a0, 0x100
    /* 79A1C 80089A1C 02004014 */  bnez       $v0, .L80089A28
    /* 79A20 80089A20 20006234 */   ori       $v0, $v1, 0x20
    /* 79A24 80089A24 21106000 */  addu       $v0, $v1, $zero
  .L80089A28:
    /* 79A28 80089A28 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A2C 80089A2C 40008230 */  andi       $v0, $a0, 0x40
    /* 79A30 80089A30 02004014 */  bnez       $v0, .L80089A3C
    /* 79A34 80089A34 00016234 */   ori       $v0, $v1, 0x100
    /* 79A38 80089A38 21106000 */  addu       $v0, $v1, $zero
  .L80089A3C:
    /* 79A3C 80089A3C FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A40 80089A40 80008230 */  andi       $v0, $a0, 0x80
    /* 79A44 80089A44 02004014 */  bnez       $v0, .L80089A50
    /* 79A48 80089A48 80006234 */   ori       $v0, $v1, 0x80
    /* 79A4C 80089A4C 21106000 */  addu       $v0, $v1, $zero
  .L80089A50:
    /* 79A50 80089A50 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A54 80089A54 20008230 */  andi       $v0, $a0, 0x20
    /* 79A58 80089A58 02004014 */  bnez       $v0, .L80089A64
    /* 79A5C 80089A5C 40006234 */   ori       $v0, $v1, 0x40
    /* 79A60 80089A60 21106000 */  addu       $v0, $v1, $zero
  .L80089A64:
    /* 79A64 80089A64 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A68 80089A68 10008230 */  andi       $v0, $a0, 0x10
    /* 79A6C 80089A6C 02004014 */  bnez       $v0, .L80089A78
    /* 79A70 80089A70 00026234 */   ori       $v0, $v1, 0x200
    /* 79A74 80089A74 21106000 */  addu       $v0, $v1, $zero
  .L80089A78:
    /* 79A78 80089A78 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A7C 80089A7C 04008230 */  andi       $v0, $a0, 0x4
    /* 79A80 80089A80 02004014 */  bnez       $v0, .L80089A8C
    /* 79A84 80089A84 00046234 */   ori       $v0, $v1, 0x400
    /* 79A88 80089A88 21106000 */  addu       $v0, $v1, $zero
  .L80089A8C:
    /* 79A8C 80089A8C FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79A90 80089A90 01008230 */  andi       $v0, $a0, 0x1
    /* 79A94 80089A94 02004014 */  bnez       $v0, .L80089AA0
    /* 79A98 80089A98 00086234 */   ori       $v0, $v1, 0x800
    /* 79A9C 80089A9C 21106000 */  addu       $v0, $v1, $zero
  .L80089AA0:
    /* 79AA0 80089AA0 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79AA4 80089AA4 08008230 */  andi       $v0, $a0, 0x8
    /* 79AA8 80089AA8 02004014 */  bnez       $v0, .L80089AB4
    /* 79AAC 80089AAC 00106234 */   ori       $v0, $v1, 0x1000
    /* 79AB0 80089AB0 21106000 */  addu       $v0, $v1, $zero
  .L80089AB4:
    /* 79AB4 80089AB4 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 79AB8 80089AB8 02008230 */  andi       $v0, $a0, 0x2
    /* 79ABC 80089ABC 02004014 */  bnez       $v0, .L80089AC8
    /* 79AC0 80089AC0 00206234 */   ori       $v0, $v1, 0x2000
    /* 79AC4 80089AC4 21106000 */  addu       $v0, $v1, $zero
  .L80089AC8:
    /* 79AC8 80089AC8 0800E003 */  jr         $ra
    /* 79ACC 80089ACC 00000000 */   nop
endlabel Trans__4CPadUs
