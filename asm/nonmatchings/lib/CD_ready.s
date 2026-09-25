.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_ready, 0x2C8

glabel CD_ready
    /* BC18 8001BC18 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* BC1C 8001BC1C 3400B7AF */  sw         $s7, 0x34($sp)
    /* BC20 8001BC20 21B88000 */  addu       $s7, $a0, $zero
    /* BC24 8001BC24 2400B3AF */  sw         $s3, 0x24($sp)
    /* BC28 8001BC28 2198A000 */  addu       $s3, $a1, $zero
    /* BC2C 8001BC2C FFFF0424 */  addiu      $a0, $zero, -0x1
    /* BC30 8001BC30 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* BC34 8001BC34 3800BEAF */  sw         $fp, 0x38($sp)
    /* BC38 8001BC38 3000B6AF */  sw         $s6, 0x30($sp)
    /* BC3C 8001BC3C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* BC40 8001BC40 2800B4AF */  sw         $s4, 0x28($sp)
    /* BC44 8001BC44 2000B2AF */  sw         $s2, 0x20($sp)
    /* BC48 8001BC48 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* BC4C 8001BC4C 1748000C */  jal        VSync
    /* BC50 8001BC50 1800B0AF */   sw        $s0, 0x18($sp)
    /* BC54 8001BC54 0B801E3C */  lui        $fp, %hi(CD_comstr)
    /* BC58 8001BC58 1C5FDE27 */  addiu      $fp, $fp, %lo(CD_comstr)
    /* BC5C 8001BC5C 0B80153C */  lui        $s5, %hi(CD_intstr)
    /* BC60 8001BC60 9C5FB526 */  addiu      $s5, $s5, %lo(CD_intstr)
    /* BC64 8001BC64 0B80123C */  lui        $s2, %hi(D_800B61D4)
    /* BC68 8001BC68 D4615226 */  addiu      $s2, $s2, %lo(D_800B61D4)
    /* BC6C 8001BC6C 01005626 */  addiu      $s6, $s2, 0x1
    /* BC70 8001BC70 02005426 */  addiu      $s4, $s2, 0x2
    /* BC74 8001BC74 C0034224 */  addiu      $v0, $v0, 0x3C0
    /* BC78 8001BC78 1380013C */  lui        $at, %hi(D_80130158)
    /* BC7C 8001BC7C 580122AC */  sw         $v0, %lo(D_80130158)($at)
    /* BC80 8001BC80 1180023C */  lui        $v0, %hi(D_8010E444)
    /* BC84 8001BC84 44E44224 */  addiu      $v0, $v0, %lo(D_8010E444)
    /* BC88 8001BC88 1380013C */  lui        $at, %hi(D_8013015C)
    /* BC8C 8001BC8C 5C0120AC */  sw         $zero, %lo(D_8013015C)($at)
    /* BC90 8001BC90 1380013C */  lui        $at, %hi(D_80130160)
    /* BC94 8001BC94 600122AC */  sw         $v0, %lo(D_80130160)($at)
  .L8001BC98:
    /* BC98 8001BC98 1748000C */  jal        VSync
    /* BC9C 8001BC9C FFFF0424 */   addiu     $a0, $zero, -0x1
    /* BCA0 8001BCA0 1380033C */  lui        $v1, %hi(D_80130158)
    /* BCA4 8001BCA4 5801638C */  lw         $v1, %lo(D_80130158)($v1)
    /* BCA8 8001BCA8 00000000 */  nop
    /* BCAC 8001BCAC 2A186200 */  slt        $v1, $v1, $v0
    /* BCB0 8001BCB0 0C006014 */  bnez       $v1, .L8001BCE4
    /* BCB4 8001BCB4 00000000 */   nop
    /* BCB8 8001BCB8 1380023C */  lui        $v0, %hi(D_8013015C)
    /* BCBC 8001BCBC 5C01428C */  lw         $v0, %lo(D_8013015C)($v0)
    /* BCC0 8001BCC0 00000000 */  nop
    /* BCC4 8001BCC4 21184000 */  addu       $v1, $v0, $zero
    /* BCC8 8001BCC8 01004224 */  addiu      $v0, $v0, 0x1
    /* BCCC 8001BCCC 1380013C */  lui        $at, %hi(D_8013015C)
    /* BCD0 8001BCD0 5C0122AC */  sw         $v0, %lo(D_8013015C)($at)
    /* BCD4 8001BCD4 3C00023C */  lui        $v0, (0x3C0000 >> 16)
    /* BCD8 8001BCD8 2A104300 */  slt        $v0, $v0, $v1
    /* BCDC 8001BCDC 1B004010 */  beqz       $v0, .L8001BD4C
    /* BCE0 8001BCE0 00000000 */   nop
  .L8001BCE4:
    /* BCE4 8001BCE4 1180043C */  lui        $a0, %hi(D_8010E3B4)
    /* BCE8 8001BCE8 7567000C */  jal        puts
    /* BCEC 8001BCEC B4E38424 */   addiu     $a0, $a0, %lo(D_8010E3B4)
    /* BCF0 8001BCF0 00004492 */  lbu        $a0, 0x0($s2)
    /* BCF4 8001BCF4 01004292 */  lbu        $v0, 0x1($s2)
    /* BCF8 8001BCF8 1380053C */  lui        $a1, %hi(D_80130160)
    /* BCFC 8001BCFC 6001A58C */  lw         $a1, %lo(D_80130160)($a1)
    /* BD00 8001BD00 80100200 */  sll        $v0, $v0, 2
    /* BD04 8001BD04 21105500 */  addu       $v0, $v0, $s5
    /* BD08 8001BD08 80200400 */  sll        $a0, $a0, 2
    /* BD0C 8001BD0C 0000438C */  lw         $v1, 0x0($v0)
    /* BD10 8001BD10 0B80023C */  lui        $v0, %hi(CD_com)
    /* BD14 8001BD14 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* BD18 8001BD18 21209500 */  addu       $a0, $a0, $s5
    /* BD1C 8001BD1C 80100200 */  sll        $v0, $v0, 2
    /* BD20 8001BD20 21105E00 */  addu       $v0, $v0, $fp
    /* BD24 8001BD24 1000A3AF */  sw         $v1, 0x10($sp)
    /* BD28 8001BD28 0000468C */  lw         $a2, 0x0($v0)
    /* BD2C 8001BD2C 0000878C */  lw         $a3, 0x0($a0)
    /* BD30 8001BD30 1180043C */  lui        $a0, %hi(D_8010E3C4)
    /* BD34 8001BD34 9367000C */  jal        printf
    /* BD38 8001BD38 C4E38424 */   addiu     $a0, $a0, %lo(D_8010E3C4)
    /* BD3C 8001BD3C DD70000C */  jal        CD_flush
    /* BD40 8001BD40 00000000 */   nop
    /* BD44 8001BD44 546F0008 */  j          .L8001BD50
    /* BD48 8001BD48 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8001BD4C:
    /* BD4C 8001BD4C 21100000 */  addu       $v0, $zero, $zero
  .L8001BD50:
    /* BD50 8001BD50 57004014 */  bnez       $v0, .L8001BEB0
    /* BD54 8001BD54 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* BD58 8001BD58 F448000C */  jal        CheckCallback
    /* BD5C 8001BD5C 00000000 */   nop
    /* BD60 8001BD60 29004010 */  beqz       $v0, .L8001BE08
    /* BD64 8001BD64 00000000 */   nop
    /* BD68 8001BD68 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* BD6C 8001BD6C BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* BD70 8001BD70 00000000 */  nop
    /* BD74 8001BD74 00004290 */  lbu        $v0, 0x0($v0)
    /* BD78 8001BD78 00000000 */  nop
    /* BD7C 8001BD7C 03005130 */  andi       $s1, $v0, 0x3
  .L8001BD80:
    /* BD80 8001BD80 0F6D000C */  jal        func_8001B43C
    /* BD84 8001BD84 00000000 */   nop
    /* BD88 8001BD88 21804000 */  addu       $s0, $v0, $zero
    /* BD8C 8001BD8C 1A000012 */  beqz       $s0, .L8001BDF8
    /* BD90 8001BD90 04000232 */   andi      $v0, $s0, 0x4
    /* BD94 8001BD94 0B004010 */  beqz       $v0, .L8001BDC4
    /* BD98 8001BD98 02000232 */   andi      $v0, $s0, 0x2
    /* BD9C 8001BD9C 0B80023C */  lui        $v0, %hi(CD_cbready)
    /* BDA0 8001BDA0 F85E428C */  lw         $v0, %lo(CD_cbready)($v0)
    /* BDA4 8001BDA4 00000000 */  nop
    /* BDA8 8001BDA8 05004010 */  beqz       $v0, .L8001BDC0
    /* BDAC 8001BDAC 00000000 */   nop
    /* BDB0 8001BDB0 0000C492 */  lbu        $a0, 0x0($s6)
    /* BDB4 8001BDB4 1380053C */  lui        $a1, %hi(D_80130148)
    /* BDB8 8001BDB8 09F84000 */  jalr       $v0
    /* BDBC 8001BDBC 4801A524 */   addiu     $a1, $a1, %lo(D_80130148)
  .L8001BDC0:
    /* BDC0 8001BDC0 02000232 */  andi       $v0, $s0, 0x2
  .L8001BDC4:
    /* BDC4 8001BDC4 EEFF4010 */  beqz       $v0, .L8001BD80
    /* BDC8 8001BDC8 00000000 */   nop
    /* BDCC 8001BDCC 0B80023C */  lui        $v0, %hi(CD_cbsync)
    /* BDD0 8001BDD0 F45E428C */  lw         $v0, %lo(CD_cbsync)($v0)
    /* BDD4 8001BDD4 00000000 */  nop
    /* BDD8 8001BDD8 E9FF4010 */  beqz       $v0, .L8001BD80
    /* BDDC 8001BDDC 00000000 */   nop
    /* BDE0 8001BDE0 00004492 */  lbu        $a0, 0x0($s2)
    /* BDE4 8001BDE4 1380053C */  lui        $a1, %hi(D_80130140)
    /* BDE8 8001BDE8 09F84000 */  jalr       $v0
    /* BDEC 8001BDEC 4001A524 */   addiu     $a1, $a1, %lo(D_80130140)
    /* BDF0 8001BDF0 606F0008 */  j          .L8001BD80
    /* BDF4 8001BDF4 00000000 */   nop
  .L8001BDF8:
    /* BDF8 8001BDF8 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* BDFC 8001BDFC BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* BE00 8001BE00 00000000 */  nop
    /* BE04 8001BE04 000051A0 */  sb         $s1, 0x0($v0)
  .L8001BE08:
    /* BE08 8001BE08 00008292 */  lbu        $v0, 0x0($s4)
    /* BE0C 8001BE0C 00000000 */  nop
    /* BE10 8001BE10 FF004630 */  andi       $a2, $v0, 0xFF
    /* BE14 8001BE14 1000C010 */  beqz       $a2, .L8001BE58
    /* BE18 8001BE18 00000000 */   nop
    /* BE1C 8001BE1C 020040A2 */  sb         $zero, 0x2($s2)
    /* BE20 8001BE20 1380043C */  lui        $a0, %hi(D_80130150)
    /* BE24 8001BE24 50018424 */  addiu      $a0, $a0, %lo(D_80130150)
    /* BE28 8001BE28 1D006012 */  beqz       $s3, .L8001BEA0
    /* BE2C 8001BE2C 21286002 */   addu      $a1, $s3, $zero
    /* BE30 8001BE30 07000324 */  addiu      $v1, $zero, 0x7
    /* BE34 8001BE34 FFFF0724 */  addiu      $a3, $zero, -0x1
  .L8001BE38:
    /* BE38 8001BE38 00008290 */  lbu        $v0, 0x0($a0)
    /* BE3C 8001BE3C 01008424 */  addiu      $a0, $a0, 0x1
    /* BE40 8001BE40 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* BE44 8001BE44 0000A2A0 */  sb         $v0, 0x0($a1)
    /* BE48 8001BE48 FBFF6714 */  bne        $v1, $a3, .L8001BE38
    /* BE4C 8001BE4C 0100A524 */   addiu     $a1, $a1, 0x1
    /* BE50 8001BE50 AC6F0008 */  j          .L8001BEB0
    /* BE54 8001BE54 2110C000 */   addu      $v0, $a2, $zero
  .L8001BE58:
    /* BE58 8001BE58 FFFF8292 */  lbu        $v0, -0x1($s4)
    /* BE5C 8001BE5C 00000000 */  nop
    /* BE60 8001BE60 FF004630 */  andi       $a2, $v0, 0xFF
    /* BE64 8001BE64 1000C010 */  beqz       $a2, .L8001BEA8
    /* BE68 8001BE68 00000000 */   nop
    /* BE6C 8001BE6C 010040A2 */  sb         $zero, 0x1($s2)
    /* BE70 8001BE70 21286002 */  addu       $a1, $s3, $zero
    /* BE74 8001BE74 1380043C */  lui        $a0, %hi(D_80130148)
    /* BE78 8001BE78 48018424 */  addiu      $a0, $a0, %lo(D_80130148)
    /* BE7C 8001BE7C 0800A010 */  beqz       $a1, .L8001BEA0
    /* BE80 8001BE80 07000324 */   addiu     $v1, $zero, 0x7
    /* BE84 8001BE84 FFFF0724 */  addiu      $a3, $zero, -0x1
  .L8001BE88:
    /* BE88 8001BE88 00008290 */  lbu        $v0, 0x0($a0)
    /* BE8C 8001BE8C 01008424 */  addiu      $a0, $a0, 0x1
    /* BE90 8001BE90 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* BE94 8001BE94 0000A2A0 */  sb         $v0, 0x0($a1)
    /* BE98 8001BE98 FBFF6714 */  bne        $v1, $a3, .L8001BE88
    /* BE9C 8001BE9C 0100A524 */   addiu     $a1, $a1, 0x1
  .L8001BEA0:
    /* BEA0 8001BEA0 AC6F0008 */  j          .L8001BEB0
    /* BEA4 8001BEA4 2110C000 */   addu      $v0, $a2, $zero
  .L8001BEA8:
    /* BEA8 8001BEA8 7BFFE012 */  beqz       $s7, .L8001BC98
    /* BEAC 8001BEAC 21100000 */   addu      $v0, $zero, $zero
  .L8001BEB0:
    /* BEB0 8001BEB0 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* BEB4 8001BEB4 3800BE8F */  lw         $fp, 0x38($sp)
    /* BEB8 8001BEB8 3400B78F */  lw         $s7, 0x34($sp)
    /* BEBC 8001BEBC 3000B68F */  lw         $s6, 0x30($sp)
    /* BEC0 8001BEC0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* BEC4 8001BEC4 2800B48F */  lw         $s4, 0x28($sp)
    /* BEC8 8001BEC8 2400B38F */  lw         $s3, 0x24($sp)
    /* BECC 8001BECC 2000B28F */  lw         $s2, 0x20($sp)
    /* BED0 8001BED0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* BED4 8001BED4 1800B08F */  lw         $s0, 0x18($sp)
    /* BED8 8001BED8 0800E003 */  jr         $ra
    /* BEDC 8001BEDC 4000BD27 */   addiu     $sp, $sp, 0x40
endlabel CD_ready
