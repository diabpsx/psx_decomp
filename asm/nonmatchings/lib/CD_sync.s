.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_sync, 0x280

glabel CD_sync
    /* B998 8001B998 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* B99C 8001B99C 3000B6AF */  sw         $s6, 0x30($sp)
    /* B9A0 8001B9A0 21B08000 */  addu       $s6, $a0, $zero
    /* B9A4 8001B9A4 3400B7AF */  sw         $s7, 0x34($sp)
    /* B9A8 8001B9A8 21B8A000 */  addu       $s7, $a1, $zero
    /* B9AC 8001B9AC FFFF0424 */  addiu      $a0, $zero, -0x1
    /* B9B0 8001B9B0 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* B9B4 8001B9B4 3800BEAF */  sw         $fp, 0x38($sp)
    /* B9B8 8001B9B8 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* B9BC 8001B9BC 2800B4AF */  sw         $s4, 0x28($sp)
    /* B9C0 8001B9C0 2400B3AF */  sw         $s3, 0x24($sp)
    /* B9C4 8001B9C4 2000B2AF */  sw         $s2, 0x20($sp)
    /* B9C8 8001B9C8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* B9CC 8001B9CC 1748000C */  jal        VSync
    /* B9D0 8001B9D0 1800B0AF */   sw        $s0, 0x18($sp)
    /* B9D4 8001B9D4 0B801E3C */  lui        $fp, %hi(CD_comstr)
    /* B9D8 8001B9D8 1C5FDE27 */  addiu      $fp, $fp, %lo(CD_comstr)
    /* B9DC 8001B9DC 0B80143C */  lui        $s4, %hi(CD_intstr)
    /* B9E0 8001B9E0 9C5F9426 */  addiu      $s4, $s4, %lo(CD_intstr)
    /* B9E4 8001B9E4 0B80123C */  lui        $s2, %hi(D_800B61D4)
    /* B9E8 8001B9E8 D4615226 */  addiu      $s2, $s2, %lo(D_800B61D4)
    /* B9EC 8001B9EC 01005526 */  addiu      $s5, $s2, 0x1
    /* B9F0 8001B9F0 02001324 */  addiu      $s3, $zero, 0x2
    /* B9F4 8001B9F4 C0034224 */  addiu      $v0, $v0, 0x3C0
    /* B9F8 8001B9F8 1380013C */  lui        $at, %hi(D_80130158)
    /* B9FC 8001B9FC 580122AC */  sw         $v0, %lo(D_80130158)($at)
    /* BA00 8001BA00 1180023C */  lui        $v0, %hi(D_8010E43C)
    /* BA04 8001BA04 3CE44224 */  addiu      $v0, $v0, %lo(D_8010E43C)
    /* BA08 8001BA08 1380013C */  lui        $at, %hi(D_8013015C)
    /* BA0C 8001BA0C 5C0120AC */  sw         $zero, %lo(D_8013015C)($at)
    /* BA10 8001BA10 1380013C */  lui        $at, %hi(D_80130160)
    /* BA14 8001BA14 600122AC */  sw         $v0, %lo(D_80130160)($at)
  .L8001BA18:
    /* BA18 8001BA18 1748000C */  jal        VSync
    /* BA1C 8001BA1C FFFF0424 */   addiu     $a0, $zero, -0x1
    /* BA20 8001BA20 1380033C */  lui        $v1, %hi(D_80130158)
    /* BA24 8001BA24 5801638C */  lw         $v1, %lo(D_80130158)($v1)
    /* BA28 8001BA28 00000000 */  nop
    /* BA2C 8001BA2C 2A186200 */  slt        $v1, $v1, $v0
    /* BA30 8001BA30 0C006014 */  bnez       $v1, .L8001BA64
    /* BA34 8001BA34 00000000 */   nop
    /* BA38 8001BA38 1380023C */  lui        $v0, %hi(D_8013015C)
    /* BA3C 8001BA3C 5C01428C */  lw         $v0, %lo(D_8013015C)($v0)
    /* BA40 8001BA40 00000000 */  nop
    /* BA44 8001BA44 21184000 */  addu       $v1, $v0, $zero
    /* BA48 8001BA48 01004224 */  addiu      $v0, $v0, 0x1
    /* BA4C 8001BA4C 1380013C */  lui        $at, %hi(D_8013015C)
    /* BA50 8001BA50 5C0122AC */  sw         $v0, %lo(D_8013015C)($at)
    /* BA54 8001BA54 3C00023C */  lui        $v0, (0x3C0000 >> 16)
    /* BA58 8001BA58 2A104300 */  slt        $v0, $v0, $v1
    /* BA5C 8001BA5C 1B004010 */  beqz       $v0, .L8001BACC
    /* BA60 8001BA60 00000000 */   nop
  .L8001BA64:
    /* BA64 8001BA64 1180043C */  lui        $a0, %hi(D_8010E3B4)
    /* BA68 8001BA68 7567000C */  jal        puts
    /* BA6C 8001BA6C B4E38424 */   addiu     $a0, $a0, %lo(D_8010E3B4)
    /* BA70 8001BA70 00004492 */  lbu        $a0, 0x0($s2)
    /* BA74 8001BA74 01004292 */  lbu        $v0, 0x1($s2)
    /* BA78 8001BA78 1380053C */  lui        $a1, %hi(D_80130160)
    /* BA7C 8001BA7C 6001A58C */  lw         $a1, %lo(D_80130160)($a1)
    /* BA80 8001BA80 80100200 */  sll        $v0, $v0, 2
    /* BA84 8001BA84 21105400 */  addu       $v0, $v0, $s4
    /* BA88 8001BA88 80200400 */  sll        $a0, $a0, 2
    /* BA8C 8001BA8C 0000438C */  lw         $v1, 0x0($v0)
    /* BA90 8001BA90 0B80023C */  lui        $v0, %hi(CD_com)
    /* BA94 8001BA94 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* BA98 8001BA98 21209400 */  addu       $a0, $a0, $s4
    /* BA9C 8001BA9C 80100200 */  sll        $v0, $v0, 2
    /* BAA0 8001BAA0 21105E00 */  addu       $v0, $v0, $fp
    /* BAA4 8001BAA4 1000A3AF */  sw         $v1, 0x10($sp)
    /* BAA8 8001BAA8 0000468C */  lw         $a2, 0x0($v0)
    /* BAAC 8001BAAC 0000878C */  lw         $a3, 0x0($a0)
    /* BAB0 8001BAB0 1180043C */  lui        $a0, %hi(D_8010E3C4)
    /* BAB4 8001BAB4 9367000C */  jal        printf
    /* BAB8 8001BAB8 C4E38424 */   addiu     $a0, $a0, %lo(D_8010E3C4)
    /* BABC 8001BABC DD70000C */  jal        CD_flush
    /* BAC0 8001BAC0 00000000 */   nop
    /* BAC4 8001BAC4 B46E0008 */  j          .L8001BAD0
    /* BAC8 8001BAC8 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8001BACC:
    /* BACC 8001BACC 21100000 */  addu       $v0, $zero, $zero
  .L8001BAD0:
    /* BAD0 8001BAD0 45004014 */  bnez       $v0, .L8001BBE8
    /* BAD4 8001BAD4 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* BAD8 8001BAD8 F448000C */  jal        CheckCallback
    /* BADC 8001BADC 00000000 */   nop
    /* BAE0 8001BAE0 29004010 */  beqz       $v0, .L8001BB88
    /* BAE4 8001BAE4 00000000 */   nop
    /* BAE8 8001BAE8 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* BAEC 8001BAEC BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* BAF0 8001BAF0 00000000 */  nop
    /* BAF4 8001BAF4 00004290 */  lbu        $v0, 0x0($v0)
    /* BAF8 8001BAF8 00000000 */  nop
    /* BAFC 8001BAFC 03005130 */  andi       $s1, $v0, 0x3
  .L8001BB00:
    /* BB00 8001BB00 0F6D000C */  jal        func_8001B43C
    /* BB04 8001BB04 00000000 */   nop
    /* BB08 8001BB08 21804000 */  addu       $s0, $v0, $zero
    /* BB0C 8001BB0C 1A000012 */  beqz       $s0, .L8001BB78
    /* BB10 8001BB10 04000232 */   andi      $v0, $s0, 0x4
    /* BB14 8001BB14 0B004010 */  beqz       $v0, .L8001BB44
    /* BB18 8001BB18 02000232 */   andi      $v0, $s0, 0x2
    /* BB1C 8001BB1C 0B80023C */  lui        $v0, %hi(CD_cbready)
    /* BB20 8001BB20 F85E428C */  lw         $v0, %lo(CD_cbready)($v0)
    /* BB24 8001BB24 00000000 */  nop
    /* BB28 8001BB28 05004010 */  beqz       $v0, .L8001BB40
    /* BB2C 8001BB2C 00000000 */   nop
    /* BB30 8001BB30 0000A492 */  lbu        $a0, 0x0($s5)
    /* BB34 8001BB34 1380053C */  lui        $a1, %hi(D_80130148)
    /* BB38 8001BB38 09F84000 */  jalr       $v0
    /* BB3C 8001BB3C 4801A524 */   addiu     $a1, $a1, %lo(D_80130148)
  .L8001BB40:
    /* BB40 8001BB40 02000232 */  andi       $v0, $s0, 0x2
  .L8001BB44:
    /* BB44 8001BB44 EEFF4010 */  beqz       $v0, .L8001BB00
    /* BB48 8001BB48 00000000 */   nop
    /* BB4C 8001BB4C 0B80023C */  lui        $v0, %hi(CD_cbsync)
    /* BB50 8001BB50 F45E428C */  lw         $v0, %lo(CD_cbsync)($v0)
    /* BB54 8001BB54 00000000 */  nop
    /* BB58 8001BB58 E9FF4010 */  beqz       $v0, .L8001BB00
    /* BB5C 8001BB5C 00000000 */   nop
    /* BB60 8001BB60 00004492 */  lbu        $a0, 0x0($s2)
    /* BB64 8001BB64 1380053C */  lui        $a1, %hi(D_80130140)
    /* BB68 8001BB68 09F84000 */  jalr       $v0
    /* BB6C 8001BB6C 4001A524 */   addiu     $a1, $a1, %lo(D_80130140)
    /* BB70 8001BB70 C06E0008 */  j          .L8001BB00
    /* BB74 8001BB74 00000000 */   nop
  .L8001BB78:
    /* BB78 8001BB78 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* BB7C 8001BB7C BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* BB80 8001BB80 00000000 */  nop
    /* BB84 8001BB84 000051A0 */  sb         $s1, 0x0($v0)
  .L8001BB88:
    /* BB88 8001BB88 00004292 */  lbu        $v0, 0x0($s2)
    /* BB8C 8001BB8C 00000000 */  nop
    /* BB90 8001BB90 FF004630 */  andi       $a2, $v0, 0xFF
    /* BB94 8001BB94 0300D310 */  beq        $a2, $s3, .L8001BBA4
    /* BB98 8001BB98 05000224 */   addiu     $v0, $zero, 0x5
    /* BB9C 8001BB9C 1000C214 */  bne        $a2, $v0, .L8001BBE0
    /* BBA0 8001BBA0 00000000 */   nop
  .L8001BBA4:
    /* BBA4 8001BBA4 000053A2 */  sb         $s3, 0x0($s2)
    /* BBA8 8001BBA8 2128E002 */  addu       $a1, $s7, $zero
    /* BBAC 8001BBAC 1380043C */  lui        $a0, %hi(D_80130140)
    /* BBB0 8001BBB0 40018424 */  addiu      $a0, $a0, %lo(D_80130140)
    /* BBB4 8001BBB4 0800A010 */  beqz       $a1, .L8001BBD8
    /* BBB8 8001BBB8 07000324 */   addiu     $v1, $zero, 0x7
    /* BBBC 8001BBBC FFFF0724 */  addiu      $a3, $zero, -0x1
  .L8001BBC0:
    /* BBC0 8001BBC0 00008290 */  lbu        $v0, 0x0($a0)
    /* BBC4 8001BBC4 01008424 */  addiu      $a0, $a0, 0x1
    /* BBC8 8001BBC8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* BBCC 8001BBCC 0000A2A0 */  sb         $v0, 0x0($a1)
    /* BBD0 8001BBD0 FBFF6714 */  bne        $v1, $a3, .L8001BBC0
    /* BBD4 8001BBD4 0100A524 */   addiu     $a1, $a1, 0x1
  .L8001BBD8:
    /* BBD8 8001BBD8 FA6E0008 */  j          .L8001BBE8
    /* BBDC 8001BBDC 2110C000 */   addu      $v0, $a2, $zero
  .L8001BBE0:
    /* BBE0 8001BBE0 8DFFC012 */  beqz       $s6, .L8001BA18
    /* BBE4 8001BBE4 21100000 */   addu      $v0, $zero, $zero
  .L8001BBE8:
    /* BBE8 8001BBE8 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* BBEC 8001BBEC 3800BE8F */  lw         $fp, 0x38($sp)
    /* BBF0 8001BBF0 3400B78F */  lw         $s7, 0x34($sp)
    /* BBF4 8001BBF4 3000B68F */  lw         $s6, 0x30($sp)
    /* BBF8 8001BBF8 2C00B58F */  lw         $s5, 0x2C($sp)
    /* BBFC 8001BBFC 2800B48F */  lw         $s4, 0x28($sp)
    /* BC00 8001BC00 2400B38F */  lw         $s3, 0x24($sp)
    /* BC04 8001BC04 2000B28F */  lw         $s2, 0x20($sp)
    /* BC08 8001BC08 1C00B18F */  lw         $s1, 0x1C($sp)
    /* BC0C 8001BC0C 1800B08F */  lw         $s0, 0x18($sp)
    /* BC10 8001BC10 0800E003 */  jr         $ra
    /* BC14 8001BC14 4000BD27 */   addiu     $sp, $sp, 0x40
endlabel CD_sync
