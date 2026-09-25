.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NewMonsterAnim__FiR10AnimStructii, 0x54

glabel NewMonsterAnim__FiR10AnimStructii
    /* 6F4FC 8007F4FC 40100400 */  sll        $v0, $a0, 1
    /* 6F500 8007F500 21104400 */  addu       $v0, $v0, $a0
    /* 6F504 8007F504 80100200 */  sll        $v0, $v0, 2
    /* 6F508 8007F508 21104400 */  addu       $v0, $v0, $a0
    /* 6F50C 8007F50C C0100200 */  sll        $v0, $v0, 3
    /* 6F510 8007F510 1080033C */  lui        $v1, %hi(monster)
    /* 6F514 8007F514 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 6F518 8007F518 21104300 */  addu       $v0, $v0, $v1
    /* 6F51C 8007F51C 0000A490 */  lbu        $a0, 0x0($a1)
    /* 6F520 8007F520 01000324 */  addiu      $v1, $zero, 0x1
    /* 6F524 8007F524 410043A0 */  sb         $v1, 0x41($v0)
    /* 6F528 8007F528 2C004394 */  lhu        $v1, 0x2C($v0)
    /* 6F52C 8007F52C 3F0040A0 */  sb         $zero, 0x3F($v0)
    /* 6F530 8007F530 400044A0 */  sb         $a0, 0x40($v0)
    /* 6F534 8007F534 0100A490 */  lbu        $a0, 0x1($a1)
    /* 6F538 8007F538 F9FF6330 */  andi       $v1, $v1, 0xFFF9
    /* 6F53C 8007F53C 3C0046A0 */  sb         $a2, 0x3C($v0)
    /* 6F540 8007F540 2C0043A4 */  sh         $v1, 0x2C($v0)
    /* 6F544 8007F544 5A0047A0 */  sb         $a3, 0x5A($v0)
    /* 6F548 8007F548 0800E003 */  jr         $ra
    /* 6F54C 8007F54C 3E0044A0 */   sb        $a0, 0x3E($v0)
endlabel NewMonsterAnim__FiR10AnimStructii
