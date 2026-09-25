.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_note2pitch, 0x138

glabel _spu_note2pitch
    /* 9B68 80019B68 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 9B6C 80019B6C FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 9B70 80019B70 C0210400 */  sll        $a0, $a0, 7
    /* 9B74 80019B74 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 9B78 80019B78 21208500 */  addu       $a0, $a0, $a1
    /* 9B7C 80019B7C FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 9B80 80019B80 C0310600 */  sll        $a2, $a2, 7
    /* 9B84 80019B84 FFFFE730 */  andi       $a3, $a3, 0xFFFF
    /* 9B88 80019B88 2130C700 */  addu       $a2, $a2, $a3
    /* 9B8C 80019B8C 2330C400 */  subu       $a2, $a2, $a0
    /* 9B90 80019B90 0200C104 */  bgez       $a2, .L80019B9C
    /* 9B94 80019B94 2128C000 */   addu      $a1, $a2, $zero
    /* 9B98 80019B98 23280600 */  negu       $a1, $a2
  .L80019B9C:
    /* 9B9C 80019B9C AA2A023C */  lui        $v0, (0x2AAAAAAB >> 16)
    /* 9BA0 80019BA0 ABAA4234 */  ori        $v0, $v0, (0x2AAAAAAB & 0xFFFF)
    /* 9BA4 80019BA4 1800A200 */  mult       $a1, $v0
    /* 9BA8 80019BA8 C3170500 */  sra        $v0, $a1, 31
    /* 9BAC 80019BAC 10480000 */  mfhi       $t1
    /* 9BB0 80019BB0 031A0900 */  sra        $v1, $t1, 8
    /* 9BB4 80019BB4 23186200 */  subu       $v1, $v1, $v0
    /* 9BB8 80019BB8 21206000 */  addu       $a0, $v1, $zero
    /* 9BBC 80019BBC 40100400 */  sll        $v0, $a0, 1
    /* 9BC0 80019BC0 21104400 */  addu       $v0, $v0, $a0
    /* 9BC4 80019BC4 40120200 */  sll        $v0, $v0, 9
    /* 9BC8 80019BC8 0400C004 */  bltz       $a2, .L80019BDC
    /* 9BCC 80019BCC 2318A200 */   subu      $v1, $a1, $v0
    /* 9BD0 80019BD0 00100224 */  addiu      $v0, $zero, 0x1000
    /* 9BD4 80019BD4 FD660008 */  j          .L80019BF4
    /* 9BD8 80019BD8 04108200 */   sllv      $v0, $v0, $a0
  .L80019BDC:
    /* 9BDC 80019BDC 03006010 */  beqz       $v1, .L80019BEC
    /* 9BE0 80019BE0 00060224 */   addiu     $v0, $zero, 0x600
    /* 9BE4 80019BE4 01008424 */  addiu      $a0, $a0, 0x1
    /* 9BE8 80019BE8 23184300 */  subu       $v1, $v0, $v1
  .L80019BEC:
    /* 9BEC 80019BEC 00100224 */  addiu      $v0, $zero, 0x1000
    /* 9BF0 80019BF0 07108200 */  srav       $v0, $v0, $a0
  .L80019BF4:
    /* 9BF4 80019BF4 FFFF4630 */  andi       $a2, $v0, 0xFFFF
    /* 9BF8 80019BF8 3B100424 */  addiu      $a0, $zero, 0x103B
    /* 9BFC 80019BFC 1800C400 */  mult       $a2, $a0
    /* 9C00 80019C00 003B0600 */  sll        $a3, $a2, 12
    /* 9C04 80019C04 21280000 */  addu       $a1, $zero, $zero
    /* 9C08 80019C08 02006104 */  bgez       $v1, .L80019C14
    /* 9C0C 80019C0C 21106000 */   addu      $v0, $v1, $zero
    /* 9C10 80019C10 23100200 */  negu       $v0, $v0
  .L80019C14:
    /* 9C14 80019C14 42190200 */  srl        $v1, $v0, 5
    /* 9C18 80019C18 1F004830 */  andi       $t0, $v0, 0x1F
    /* 9C1C 80019C1C 12480000 */  mflo       $t1
    /* 9C20 80019C20 10006010 */  beqz       $v1, .L80019C64
    /* 9C24 80019C24 0000A9AF */   sw        $t1, 0x0($sp)
    /* 9C28 80019C28 1800C400 */  mult       $a2, $a0
  .L80019C2C:
    /* 9C2C 80019C2C 80110400 */  sll        $v0, $a0, 6
    /* 9C30 80019C30 21104400 */  addu       $v0, $v0, $a0
    /* 9C34 80019C34 00110200 */  sll        $v0, $v0, 4
    /* 9C38 80019C38 23104400 */  subu       $v0, $v0, $a0
    /* 9C3C 80019C3C 80100200 */  sll        $v0, $v0, 2
    /* 9C40 80019C40 12380000 */  mflo       $a3
    /* 9C44 80019C44 23204400 */  subu       $a0, $v0, $a0
    /* 9C48 80019C48 02230400 */  srl        $a0, $a0, 12
    /* 9C4C 80019C4C 1800C400 */  mult       $a2, $a0
    /* 9C50 80019C50 0100A524 */  addiu      $a1, $a1, 0x1
    /* 9C54 80019C54 2A10A300 */  slt        $v0, $a1, $v1
    /* 9C58 80019C58 12480000 */  mflo       $t1
    /* 9C5C 80019C5C F3FF4014 */  bnez       $v0, .L80019C2C
    /* 9C60 80019C60 0000A9AF */   sw        $t1, 0x0($sp)
  .L80019C64:
    /* 9C64 80019C64 0000A98F */  lw         $t1, 0x0($sp)
    /* 9C68 80019C68 00000000 */  nop
    /* 9C6C 80019C6C 23102701 */  subu       $v0, $t1, $a3
    /* 9C70 80019C70 42110200 */  srl        $v0, $v0, 5
    /* 9C74 80019C74 18004800 */  mult       $v0, $t0
    /* 9C78 80019C78 12480000 */  mflo       $t1
    /* 9C7C 80019C7C 2110E900 */  addu       $v0, $a3, $t1
    /* 9C80 80019C80 021B0200 */  srl        $v1, $v0, 12
    /* 9C84 80019C84 0040622C */  sltiu      $v0, $v1, 0x4000
    /* 9C88 80019C88 03004014 */  bnez       $v0, .L80019C98
    /* 9C8C 80019C8C FFFF6230 */   andi      $v0, $v1, 0xFFFF
    /* 9C90 80019C90 FF3F0324 */  addiu      $v1, $zero, 0x3FFF
    /* 9C94 80019C94 FFFF6230 */  andi       $v0, $v1, 0xFFFF
  .L80019C98:
    /* 9C98 80019C98 0800E003 */  jr         $ra
    /* 9C9C 80019C9C 0800BD27 */   addiu     $sp, $sp, 0x8
endlabel _spu_note2pitch
