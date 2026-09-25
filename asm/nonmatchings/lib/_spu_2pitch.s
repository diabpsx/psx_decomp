.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_2pitch, 0x8C

glabel _spu_2pitch
    /* 9ADC 80019ADC 3B100324 */  addiu      $v1, $zero, 0x103B
    /* 9AE0 80019AE0 18008300 */  mult       $a0, $v1
    /* 9AE4 80019AE4 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 9AE8 80019AE8 00430400 */  sll        $t0, $a0, 12
    /* 9AEC 80019AEC 21300000 */  addu       $a2, $zero, $zero
    /* 9AF0 80019AF0 42390500 */  srl        $a3, $a1, 5
    /* 9AF4 80019AF4 1F00A530 */  andi       $a1, $a1, 0x1F
    /* 9AF8 80019AF8 12480000 */  mflo       $t1
    /* 9AFC 80019AFC 1000E010 */  beqz       $a3, .L80019B40
    /* 9B00 80019B00 0000A9AF */   sw        $t1, 0x0($sp)
    /* 9B04 80019B04 18008300 */  mult       $a0, $v1
  .L80019B08:
    /* 9B08 80019B08 80110300 */  sll        $v0, $v1, 6
    /* 9B0C 80019B0C 21104300 */  addu       $v0, $v0, $v1
    /* 9B10 80019B10 00110200 */  sll        $v0, $v0, 4
    /* 9B14 80019B14 23104300 */  subu       $v0, $v0, $v1
    /* 9B18 80019B18 80100200 */  sll        $v0, $v0, 2
    /* 9B1C 80019B1C 12400000 */  mflo       $t0
    /* 9B20 80019B20 23184300 */  subu       $v1, $v0, $v1
    /* 9B24 80019B24 021B0300 */  srl        $v1, $v1, 12
    /* 9B28 80019B28 18008300 */  mult       $a0, $v1
    /* 9B2C 80019B2C 0100C624 */  addiu      $a2, $a2, 0x1
    /* 9B30 80019B30 2A10C700 */  slt        $v0, $a2, $a3
    /* 9B34 80019B34 12480000 */  mflo       $t1
    /* 9B38 80019B38 F3FF4014 */  bnez       $v0, .L80019B08
    /* 9B3C 80019B3C 0000A9AF */   sw        $t1, 0x0($sp)
  .L80019B40:
    /* 9B40 80019B40 0000A98F */  lw         $t1, 0x0($sp)
    /* 9B44 80019B44 00000000 */  nop
    /* 9B48 80019B48 23102801 */  subu       $v0, $t1, $t0
    /* 9B4C 80019B4C 42110200 */  srl        $v0, $v0, 5
    /* 9B50 80019B50 18004500 */  mult       $v0, $a1
    /* 9B54 80019B54 12480000 */  mflo       $t1
    /* 9B58 80019B58 21100901 */  addu       $v0, $t0, $t1
    /* 9B5C 80019B5C 02130200 */  srl        $v0, $v0, 12
    /* 9B60 80019B60 0800E003 */  jr         $ra
    /* 9B64 80019B64 0800BD27 */   addiu     $sp, $sp, 0x8
endlabel _spu_2pitch
