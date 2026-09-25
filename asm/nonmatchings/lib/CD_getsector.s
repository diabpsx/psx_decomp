.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_getsector, 0x100

glabel CD_getsector
    /* C8CC 8001C8CC 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* C8D0 8001C8D0 BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* C8D4 8001C8D4 0200063C */  lui        $a2, (0x20943 >> 16)
    /* C8D8 8001C8D8 000040A0 */  sb         $zero, 0x0($v0)
    /* C8DC 8001C8DC 0B80033C */  lui        $v1, %hi(D_800B61C8)
    /* C8E0 8001C8E0 C861638C */  lw         $v1, %lo(D_800B61C8)($v1)
    /* C8E4 8001C8E4 80000224 */  addiu      $v0, $zero, 0x80
    /* C8E8 8001C8E8 000062A0 */  sb         $v0, 0x0($v1)
    /* C8EC 8001C8EC 0B80023C */  lui        $v0, %hi(D_800B61F0)
    /* C8F0 8001C8F0 F061428C */  lw         $v0, %lo(D_800B61F0)($v0)
    /* C8F4 8001C8F4 4309C634 */  ori        $a2, $a2, (0x20943 & 0xFFFF)
    /* C8F8 8001C8F8 000046AC */  sw         $a2, 0x0($v0)
    /* C8FC 8001C8FC 0B80033C */  lui        $v1, %hi(D_800B61CC)
    /* C900 8001C900 CC61638C */  lw         $v1, %lo(D_800B61CC)($v1)
    /* C904 8001C904 23130224 */  addiu      $v0, $zero, 0x1323
    /* C908 8001C908 000062AC */  sw         $v0, 0x0($v1)
    /* C90C 8001C90C 0B80033C */  lui        $v1, %hi(D_800B61F4)
    /* C910 8001C910 F461638C */  lw         $v1, %lo(D_800B61F4)($v1)
    /* C914 8001C914 00000000 */  nop
    /* C918 8001C918 0000628C */  lw         $v0, 0x0($v1)
    /* C91C 8001C91C 00000000 */  nop
    /* C920 8001C920 00804234 */  ori        $v0, $v0, 0x8000
    /* C924 8001C924 000062AC */  sw         $v0, 0x0($v1)
    /* C928 8001C928 0B80023C */  lui        $v0, %hi(D_800B61F8)
    /* C92C 8001C92C F861428C */  lw         $v0, %lo(D_800B61F8)($v0)
    /* C930 8001C930 00000000 */  nop
    /* C934 8001C934 000044AC */  sw         $a0, 0x0($v0)
    /* C938 8001C938 0100023C */  lui        $v0, (0x10000 >> 16)
    /* C93C 8001C93C 0B80033C */  lui        $v1, %hi(D_800B61FC)
    /* C940 8001C940 FC61638C */  lw         $v1, %lo(D_800B61FC)($v1)
    /* C944 8001C944 2528A200 */  or         $a1, $a1, $v0
    /* C948 8001C948 000065AC */  sw         $a1, 0x0($v1)
    /* C94C 8001C94C 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* C950 8001C950 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* C954 8001C954 00000000 */  nop
  .L8001C958:
    /* C958 8001C958 00006290 */  lbu        $v0, 0x0($v1)
    /* C95C 8001C95C 00000000 */  nop
    /* C960 8001C960 40004230 */  andi       $v0, $v0, 0x40
    /* C964 8001C964 FCFF4010 */  beqz       $v0, .L8001C958
    /* C968 8001C968 0011023C */   lui       $v0, (0x11000000 >> 16)
    /* C96C 8001C96C 0B80033C */  lui        $v1, %hi(D_800B6200)
    /* C970 8001C970 0062638C */  lw         $v1, %lo(D_800B6200)($v1)
    /* C974 8001C974 00000000 */  nop
    /* C978 8001C978 000062AC */  sw         $v0, 0x0($v1)
    /* C97C 8001C97C 0B80043C */  lui        $a0, %hi(D_800B6200)
    /* C980 8001C980 0062848C */  lw         $a0, %lo(D_800B6200)($a0)
    /* C984 8001C984 00000000 */  nop
    /* C988 8001C988 0000828C */  lw         $v0, 0x0($a0)
    /* C98C 8001C98C 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* C990 8001C990 24104300 */  and        $v0, $v0, $v1
    /* C994 8001C994 07004010 */  beqz       $v0, .L8001C9B4
    /* C998 8001C998 21188000 */   addu      $v1, $a0, $zero
    /* C99C 8001C99C 0001043C */  lui        $a0, (0x1000000 >> 16)
  .L8001C9A0:
    /* C9A0 8001C9A0 0000628C */  lw         $v0, 0x0($v1)
    /* C9A4 8001C9A4 00000000 */  nop
    /* C9A8 8001C9A8 24104400 */  and        $v0, $v0, $a0
    /* C9AC 8001C9AC FCFF4014 */  bnez       $v0, .L8001C9A0
    /* C9B0 8001C9B0 00000000 */   nop
  .L8001C9B4:
    /* C9B4 8001C9B4 0B80033C */  lui        $v1, %hi(D_800B61CC)
    /* C9B8 8001C9B8 CC61638C */  lw         $v1, %lo(D_800B61CC)($v1)
    /* C9BC 8001C9BC 25130224 */  addiu      $v0, $zero, 0x1325
    /* C9C0 8001C9C0 000062AC */  sw         $v0, 0x0($v1)
    /* C9C4 8001C9C4 0800E003 */  jr         $ra
    /* C9C8 8001C9C8 21100000 */   addu      $v0, $zero, $zero
endlabel CD_getsector
