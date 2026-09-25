.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_getsector2, 0xEC

glabel CD_getsector2
    /* C9CC 8001C9CC 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* C9D0 8001C9D0 BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* C9D4 8001C9D4 0221063C */  lui        $a2, (0x21020843 >> 16)
    /* C9D8 8001C9D8 000040A0 */  sb         $zero, 0x0($v0)
    /* C9DC 8001C9DC 0B80033C */  lui        $v1, %hi(D_800B61C8)
    /* C9E0 8001C9E0 C861638C */  lw         $v1, %lo(D_800B61C8)($v1)
    /* C9E4 8001C9E4 80000224 */  addiu      $v0, $zero, 0x80
    /* C9E8 8001C9E8 000062A0 */  sb         $v0, 0x0($v1)
    /* C9EC 8001C9EC 0B80023C */  lui        $v0, %hi(D_800B61F0)
    /* C9F0 8001C9F0 F061428C */  lw         $v0, %lo(D_800B61F0)($v0)
    /* C9F4 8001C9F4 4308C634 */  ori        $a2, $a2, (0x21020843 & 0xFFFF)
    /* C9F8 8001C9F8 000046AC */  sw         $a2, 0x0($v0)
    /* C9FC 8001C9FC 0B80033C */  lui        $v1, %hi(D_800B61CC)
    /* CA00 8001CA00 CC61638C */  lw         $v1, %lo(D_800B61CC)($v1)
    /* CA04 8001CA04 25130224 */  addiu      $v0, $zero, 0x1325
    /* CA08 8001CA08 000062AC */  sw         $v0, 0x0($v1)
    /* CA0C 8001CA0C 0B80033C */  lui        $v1, %hi(D_800B61F4)
    /* CA10 8001CA10 F461638C */  lw         $v1, %lo(D_800B61F4)($v1)
    /* CA14 8001CA14 00000000 */  nop
    /* CA18 8001CA18 0000628C */  lw         $v0, 0x0($v1)
    /* CA1C 8001CA1C 00000000 */  nop
    /* CA20 8001CA20 00804234 */  ori        $v0, $v0, 0x8000
    /* CA24 8001CA24 000062AC */  sw         $v0, 0x0($v1)
    /* CA28 8001CA28 0B80023C */  lui        $v0, %hi(D_800B61F8)
    /* CA2C 8001CA2C F861428C */  lw         $v0, %lo(D_800B61F8)($v0)
    /* CA30 8001CA30 00000000 */  nop
    /* CA34 8001CA34 000044AC */  sw         $a0, 0x0($v0)
    /* CA38 8001CA38 0100023C */  lui        $v0, (0x10000 >> 16)
    /* CA3C 8001CA3C 0B80033C */  lui        $v1, %hi(D_800B61FC)
    /* CA40 8001CA40 FC61638C */  lw         $v1, %lo(D_800B61FC)($v1)
    /* CA44 8001CA44 2528A200 */  or         $a1, $a1, $v0
    /* CA48 8001CA48 000065AC */  sw         $a1, 0x0($v1)
    /* CA4C 8001CA4C 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* CA50 8001CA50 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* CA54 8001CA54 00000000 */  nop
    /* CA58 8001CA58 00006290 */  lbu        $v0, 0x0($v1)
    /* CA5C 8001CA5C 00000000 */  nop
    /* CA60 8001CA60 40004230 */  andi       $v0, $v0, 0x40
    /* CA64 8001CA64 06004014 */  bnez       $v0, .L8001CA80
    /* CA68 8001CA68 F8FFBD27 */   addiu     $sp, $sp, -0x8
  .L8001CA6C:
    /* CA6C 8001CA6C 00006290 */  lbu        $v0, 0x0($v1)
    /* CA70 8001CA70 00000000 */  nop
    /* CA74 8001CA74 40004230 */  andi       $v0, $v0, 0x40
    /* CA78 8001CA78 FCFF4010 */  beqz       $v0, .L8001CA6C
    /* CA7C 8001CA7C 00000000 */   nop
  .L8001CA80:
    /* CA80 8001CA80 4011033C */  lui        $v1, (0x11400100 >> 16)
    /* CA84 8001CA84 0B80023C */  lui        $v0, %hi(D_800B6200)
    /* CA88 8001CA88 0062428C */  lw         $v0, %lo(D_800B6200)($v0)
    /* CA8C 8001CA8C 00016334 */  ori        $v1, $v1, (0x11400100 & 0xFFFF)
    /* CA90 8001CA90 000043AC */  sw         $v1, 0x0($v0)
    /* CA94 8001CA94 0B80023C */  lui        $v0, %hi(D_800B6200)
    /* CA98 8001CA98 0062428C */  lw         $v0, %lo(D_800B6200)($v0)
    /* CA9C 8001CA9C 00000000 */  nop
    /* CAA0 8001CAA0 0000428C */  lw         $v0, 0x0($v0)
    /* CAA4 8001CAA4 00000000 */  nop
    /* CAA8 8001CAA8 0000A2AF */  sw         $v0, 0x0($sp)
    /* CAAC 8001CAAC 21100000 */  addu       $v0, $zero, $zero
    /* CAB0 8001CAB0 0800E003 */  jr         $ra
    /* CAB4 8001CAB4 0800BD27 */   addiu     $sp, $sp, 0x8
endlabel CD_getsector2
