.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetAutomapView__Fii, 0x450

glabel SetAutomapView__Fii
    /* 70AA8 80080AA8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 70AAC 80080AAC F0FF8324 */  addiu      $v1, $a0, -0x10
    /* 70AB0 80080AB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 70AB4 80080AB4 43800300 */  sra        $s0, $v1, 1
    /* 70AB8 80080AB8 F0FFA524 */  addiu      $a1, $a1, -0x10
    /* 70ABC 80080ABC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 70AC0 80080AC0 43880500 */  sra        $s1, $a1, 1
    /* 70AC4 80080AC4 2800022E */  sltiu      $v0, $s0, 0x28
    /* 70AC8 80080AC8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 70ACC 80080ACC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 70AD0 80080AD0 01014010 */  beqz       $v0, .L80080ED8
    /* 70AD4 80080AD4 1800B2AF */   sw        $s2, 0x18($sp)
    /* 70AD8 80080AD8 2800222E */  sltiu      $v0, $s1, 0x28
    /* 70ADC 80080ADC FE004010 */  beqz       $v0, .L80080ED8
    /* 70AE0 80080AE0 21200002 */   addu      $a0, $s0, $zero
    /* 70AE4 80080AE4 21282002 */  addu       $a1, $s1, $zero
    /* 70AE8 80080AE8 21300000 */  addu       $a2, $zero, $zero
    /* 70AEC 80080AEC 03190300 */  sra        $v1, $v1, 4
    /* 70AF0 80080AF0 1180073C */  lui        $a3, %hi(automapview)
    /* 70AF4 80080AF4 E4D6E724 */  addiu      $a3, $a3, %lo(automapview)
    /* 70AF8 80080AF8 80100300 */  sll        $v0, $v1, 2
    /* 70AFC 80080AFC 21104300 */  addu       $v0, $v0, $v1
    /* 70B00 80080B00 C0100200 */  sll        $v0, $v0, 3
    /* 70B04 80080B04 21104700 */  addu       $v0, $v0, $a3
    /* 70B08 80080B08 21105100 */  addu       $v0, $v0, $s1
    /* 70B0C 80080B0C 07000832 */  andi       $t0, $s0, 0x7
    /* 70B10 80080B10 01000324 */  addiu      $v1, $zero, 0x1
    /* 70B14 80080B14 00004790 */  lbu        $a3, 0x0($v0)
    /* 70B18 80080B18 04180301 */  sllv       $v1, $v1, $t0
    /* 70B1C 80080B1C 2538E300 */  or         $a3, $a3, $v1
    /* 70B20 80080B20 7502020C */  jal        GetAutomapType__FiiUc
    /* 70B24 80080B24 000047A0 */   sb        $a3, 0x0($v0)
    /* 70B28 80080B28 00404330 */  andi       $v1, $v0, 0x4000
    /* 70B2C 80080B2C 0F004230 */  andi       $v0, $v0, 0xF
    /* 70B30 80080B30 FEFF4424 */  addiu      $a0, $v0, -0x2
    /* 70B34 80080B34 0500822C */  sltiu      $v0, $a0, 0x5
    /* 70B38 80080B38 E7004010 */  beqz       $v0, .L80080ED8
    /* 70B3C 80080B3C 80100400 */   sll       $v0, $a0, 2
    /* 70B40 80080B40 1280013C */  lui        $at, %hi(jtbl_80118E10)
    /* 70B44 80080B44 21082200 */  addu       $at, $at, $v0
    /* 70B48 80080B48 108E228C */  lw         $v0, %lo(jtbl_80118E10)($at)
    /* 70B4C 80080B4C 00000000 */  nop
    /* 70B50 80080B50 08004000 */  jr         $v0
    /* 70B54 80080B54 00000000 */   nop
  jlabel .L80080B58
    /* 70B58 80080B58 7F006014 */  bnez       $v1, .L80080D58
    /* 70B5C 80080B5C 21200002 */   addu      $a0, $s0, $zero
    /* 70B60 80080B60 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 70B64 80080B64 21200002 */  addu       $a0, $s0, $zero
    /* 70B68 80080B68 21282002 */  addu       $a1, $s1, $zero
    /* 70B6C 80080B6C 7502020C */  jal        GetAutomapType__FiiUc
    /* 70B70 80080B70 21300000 */   addu      $a2, $zero, $zero
    /* 70B74 80080B74 00404230 */  andi       $v0, $v0, 0x4000
    /* 70B78 80080B78 D7004010 */  beqz       $v0, .L80080ED8
    /* 70B7C 80080B7C C3181000 */   sra       $v1, $s0, 3
    /* 70B80 80080B80 94030208 */  j          .L80080E50
    /* 70B84 80080B84 00000000 */   nop
  jlabel .L80080B88
    /* 70B88 80080B88 A8006014 */  bnez       $v1, .L80080E2C
    /* 70B8C 80080B8C 21200002 */   addu      $a0, $s0, $zero
    /* 70B90 80080B90 A3030208 */  j          .L80080E8C
    /* 70B94 80080B94 00000000 */   nop
  jlabel .L80080B98
    /* 70B98 80080B98 1F006010 */  beqz       $v1, .L80080C18
    /* 70B9C 80080B9C 21200002 */   addu      $a0, $s0, $zero
    /* 70BA0 80080BA0 01002526 */  addiu      $a1, $s1, 0x1
    /* 70BA4 80080BA4 7502020C */  jal        GetAutomapType__FiiUc
    /* 70BA8 80080BA8 21300000 */   addu      $a2, $zero, $zero
    /* 70BAC 80080BAC FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 70BB0 80080BB0 07401224 */  addiu      $s2, $zero, 0x4007
    /* 70BB4 80080BB4 0E005214 */  bne        $v0, $s2, .L80080BF0
    /* 70BB8 80080BB8 C3181000 */   sra       $v1, $s0, 3
    /* 70BBC 80080BBC 1180043C */  lui        $a0, %hi(automapview)
    /* 70BC0 80080BC0 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70BC4 80080BC4 80100300 */  sll        $v0, $v1, 2
    /* 70BC8 80080BC8 21104300 */  addu       $v0, $v0, $v1
    /* 70BCC 80080BCC C0100200 */  sll        $v0, $v0, 3
    /* 70BD0 80080BD0 21104400 */  addu       $v0, $v0, $a0
    /* 70BD4 80080BD4 21105100 */  addu       $v0, $v0, $s1
    /* 70BD8 80080BD8 07000532 */  andi       $a1, $s0, 0x7
    /* 70BDC 80080BDC 01000324 */  addiu      $v1, $zero, 0x1
    /* 70BE0 80080BE0 01004490 */  lbu        $a0, 0x1($v0)
    /* 70BE4 80080BE4 0418A300 */  sllv       $v1, $v1, $a1
    /* 70BE8 80080BE8 25208300 */  or         $a0, $a0, $v1
    /* 70BEC 80080BEC 010044A0 */  sb         $a0, 0x1($v0)
  .L80080BF0:
    /* 70BF0 80080BF0 01001026 */  addiu      $s0, $s0, 0x1
    /* 70BF4 80080BF4 21200002 */  addu       $a0, $s0, $zero
    /* 70BF8 80080BF8 21282002 */  addu       $a1, $s1, $zero
    /* 70BFC 80080BFC 7502020C */  jal        GetAutomapType__FiiUc
    /* 70C00 80080C00 21300000 */   addu      $a2, $zero, $zero
    /* 70C04 80080C04 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 70C08 80080C08 B3005214 */  bne        $v0, $s2, .L80080ED8
    /* 70C0C 80080C0C C3181000 */   sra       $v1, $s0, 3
    /* 70C10 80080C10 94030208 */  j          .L80080E50
    /* 70C14 80080C14 00000000 */   nop
  .L80080C18:
    /* 70C18 80080C18 FFFF1226 */  addiu      $s2, $s0, -0x1
    /* 70C1C 80080C1C 21204002 */  addu       $a0, $s2, $zero
    /* 70C20 80080C20 21282002 */  addu       $a1, $s1, $zero
    /* 70C24 80080C24 7502020C */  jal        GetAutomapType__FiiUc
    /* 70C28 80080C28 21300000 */   addu      $a2, $zero, $zero
    /* 70C2C 80080C2C 00404230 */  andi       $v0, $v0, 0x4000
    /* 70C30 80080C30 0E004010 */  beqz       $v0, .L80080C6C
    /* 70C34 80080C34 C3181200 */   sra       $v1, $s2, 3
    /* 70C38 80080C38 1180043C */  lui        $a0, %hi(automapview)
    /* 70C3C 80080C3C E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70C40 80080C40 80100300 */  sll        $v0, $v1, 2
    /* 70C44 80080C44 21104300 */  addu       $v0, $v0, $v1
    /* 70C48 80080C48 C0100200 */  sll        $v0, $v0, 3
    /* 70C4C 80080C4C 21104400 */  addu       $v0, $v0, $a0
    /* 70C50 80080C50 21105100 */  addu       $v0, $v0, $s1
    /* 70C54 80080C54 07004532 */  andi       $a1, $s2, 0x7
    /* 70C58 80080C58 01000324 */  addiu      $v1, $zero, 0x1
    /* 70C5C 80080C5C 00004490 */  lbu        $a0, 0x0($v0)
    /* 70C60 80080C60 0418A300 */  sllv       $v1, $v1, $a1
    /* 70C64 80080C64 25208300 */  or         $a0, $a0, $v1
    /* 70C68 80080C68 000044A0 */  sb         $a0, 0x0($v0)
  .L80080C6C:
    /* 70C6C 80080C6C 21200002 */  addu       $a0, $s0, $zero
    /* 70C70 80080C70 FFFF3326 */  addiu      $s3, $s1, -0x1
    /* 70C74 80080C74 21286002 */  addu       $a1, $s3, $zero
    /* 70C78 80080C78 7502020C */  jal        GetAutomapType__FiiUc
    /* 70C7C 80080C7C 21300000 */   addu      $a2, $zero, $zero
    /* 70C80 80080C80 00404230 */  andi       $v0, $v0, 0x4000
    /* 70C84 80080C84 0E004010 */  beqz       $v0, .L80080CC0
    /* 70C88 80080C88 C3181000 */   sra       $v1, $s0, 3
    /* 70C8C 80080C8C 1180043C */  lui        $a0, %hi(automapview)
    /* 70C90 80080C90 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70C94 80080C94 80100300 */  sll        $v0, $v1, 2
    /* 70C98 80080C98 21104300 */  addu       $v0, $v0, $v1
    /* 70C9C 80080C9C C0100200 */  sll        $v0, $v0, 3
    /* 70CA0 80080CA0 21104400 */  addu       $v0, $v0, $a0
    /* 70CA4 80080CA4 21105100 */  addu       $v0, $v0, $s1
    /* 70CA8 80080CA8 07000532 */  andi       $a1, $s0, 0x7
    /* 70CAC 80080CAC 01000324 */  addiu      $v1, $zero, 0x1
    /* 70CB0 80080CB0 FFFF4490 */  lbu        $a0, -0x1($v0)
    /* 70CB4 80080CB4 0418A300 */  sllv       $v1, $v1, $a1
    /* 70CB8 80080CB8 25208300 */  or         $a0, $a0, $v1
    /* 70CBC 80080CBC FFFF44A0 */  sb         $a0, -0x1($v0)
  .L80080CC0:
    /* 70CC0 80080CC0 21204002 */  addu       $a0, $s2, $zero
    /* 70CC4 80080CC4 21286002 */  addu       $a1, $s3, $zero
    /* 70CC8 80080CC8 7502020C */  jal        GetAutomapType__FiiUc
    /* 70CCC 80080CCC 21300000 */   addu      $a2, $zero, $zero
    /* 70CD0 80080CD0 00404230 */  andi       $v0, $v0, 0x4000
    /* 70CD4 80080CD4 80004010 */  beqz       $v0, .L80080ED8
    /* 70CD8 80080CD8 C3181200 */   sra       $v1, $s2, 3
    /* 70CDC 80080CDC 1180043C */  lui        $a0, %hi(automapview)
    /* 70CE0 80080CE0 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70CE4 80080CE4 80100300 */  sll        $v0, $v1, 2
    /* 70CE8 80080CE8 21104300 */  addu       $v0, $v0, $v1
    /* 70CEC 80080CEC C0100200 */  sll        $v0, $v0, 3
    /* 70CF0 80080CF0 21104400 */  addu       $v0, $v0, $a0
    /* 70CF4 80080CF4 21105100 */  addu       $v0, $v0, $s1
    /* 70CF8 80080CF8 B1030208 */  j          .L80080EC4
    /* 70CFC 80080CFC 07004532 */   andi      $a1, $s2, 0x7
  jlabel .L80080D00
    /* 70D00 80080D00 2A006010 */  beqz       $v1, .L80080DAC
    /* 70D04 80080D04 21200002 */   addu      $a0, $s0, $zero
    /* 70D08 80080D08 FFFF2526 */  addiu      $a1, $s1, -0x1
    /* 70D0C 80080D0C 7502020C */  jal        GetAutomapType__FiiUc
    /* 70D10 80080D10 21300000 */   addu      $a2, $zero, $zero
    /* 70D14 80080D14 00404230 */  andi       $v0, $v0, 0x4000
    /* 70D18 80080D18 0E004010 */  beqz       $v0, .L80080D54
    /* 70D1C 80080D1C C3181000 */   sra       $v1, $s0, 3
    /* 70D20 80080D20 1180043C */  lui        $a0, %hi(automapview)
    /* 70D24 80080D24 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70D28 80080D28 80100300 */  sll        $v0, $v1, 2
    /* 70D2C 80080D2C 21104300 */  addu       $v0, $v0, $v1
    /* 70D30 80080D30 C0100200 */  sll        $v0, $v0, 3
    /* 70D34 80080D34 21104400 */  addu       $v0, $v0, $a0
    /* 70D38 80080D38 21105100 */  addu       $v0, $v0, $s1
    /* 70D3C 80080D3C 07000532 */  andi       $a1, $s0, 0x7
    /* 70D40 80080D40 01000324 */  addiu      $v1, $zero, 0x1
    /* 70D44 80080D44 FFFF4490 */  lbu        $a0, -0x1($v0)
    /* 70D48 80080D48 0418A300 */  sllv       $v1, $v1, $a1
    /* 70D4C 80080D4C 25208300 */  or         $a0, $a0, $v1
    /* 70D50 80080D50 FFFF44A0 */  sb         $a0, -0x1($v0)
  .L80080D54:
    /* 70D54 80080D54 21200002 */  addu       $a0, $s0, $zero
  .L80080D58:
    /* 70D58 80080D58 01002526 */  addiu      $a1, $s1, 0x1
    /* 70D5C 80080D5C 7502020C */  jal        GetAutomapType__FiiUc
    /* 70D60 80080D60 21300000 */   addu      $a2, $zero, $zero
    /* 70D64 80080D64 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 70D68 80080D68 07400324 */  addiu      $v1, $zero, 0x4007
    /* 70D6C 80080D6C 5A004314 */  bne        $v0, $v1, .L80080ED8
    /* 70D70 80080D70 C3181000 */   sra       $v1, $s0, 3
    /* 70D74 80080D74 1180043C */  lui        $a0, %hi(automapview)
    /* 70D78 80080D78 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70D7C 80080D7C 80100300 */  sll        $v0, $v1, 2
    /* 70D80 80080D80 21104300 */  addu       $v0, $v0, $v1
    /* 70D84 80080D84 C0100200 */  sll        $v0, $v0, 3
    /* 70D88 80080D88 21104400 */  addu       $v0, $v0, $a0
    /* 70D8C 80080D8C 21105100 */  addu       $v0, $v0, $s1
    /* 70D90 80080D90 07000532 */  andi       $a1, $s0, 0x7
    /* 70D94 80080D94 01000324 */  addiu      $v1, $zero, 0x1
    /* 70D98 80080D98 01004490 */  lbu        $a0, 0x1($v0)
    /* 70D9C 80080D9C 0418A300 */  sllv       $v1, $v1, $a1
    /* 70DA0 80080DA0 25208300 */  or         $a0, $a0, $v1
    /* 70DA4 80080DA4 B6030208 */  j          .L80080ED8
    /* 70DA8 80080DA8 010044A0 */   sb        $a0, 0x1($v0)
  .L80080DAC:
    /* 70DAC 80080DAC FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 70DB0 80080DB0 21200002 */  addu       $a0, $s0, $zero
    /* 70DB4 80080DB4 21282002 */  addu       $a1, $s1, $zero
    /* 70DB8 80080DB8 7502020C */  jal        GetAutomapType__FiiUc
    /* 70DBC 80080DBC 21300000 */   addu      $a2, $zero, $zero
    /* 70DC0 80080DC0 00404230 */  andi       $v0, $v0, 0x4000
    /* 70DC4 80080DC4 44004010 */  beqz       $v0, .L80080ED8
    /* 70DC8 80080DC8 C3181000 */   sra       $v1, $s0, 3
    /* 70DCC 80080DCC 94030208 */  j          .L80080E50
    /* 70DD0 80080DD0 00000000 */   nop
  jlabel .L80080DD4
    /* 70DD4 80080DD4 2C006010 */  beqz       $v1, .L80080E88
    /* 70DD8 80080DD8 FFFF1226 */   addiu     $s2, $s0, -0x1
    /* 70DDC 80080DDC 21204002 */  addu       $a0, $s2, $zero
    /* 70DE0 80080DE0 21282002 */  addu       $a1, $s1, $zero
    /* 70DE4 80080DE4 7502020C */  jal        GetAutomapType__FiiUc
    /* 70DE8 80080DE8 21300000 */   addu      $a2, $zero, $zero
    /* 70DEC 80080DEC 00404230 */  andi       $v0, $v0, 0x4000
    /* 70DF0 80080DF0 0E004010 */  beqz       $v0, .L80080E2C
    /* 70DF4 80080DF4 C3181200 */   sra       $v1, $s2, 3
    /* 70DF8 80080DF8 1180043C */  lui        $a0, %hi(automapview)
    /* 70DFC 80080DFC E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70E00 80080E00 80100300 */  sll        $v0, $v1, 2
    /* 70E04 80080E04 21104300 */  addu       $v0, $v0, $v1
    /* 70E08 80080E08 C0100200 */  sll        $v0, $v0, 3
    /* 70E0C 80080E0C 21104400 */  addu       $v0, $v0, $a0
    /* 70E10 80080E10 21105100 */  addu       $v0, $v0, $s1
    /* 70E14 80080E14 07004532 */  andi       $a1, $s2, 0x7
    /* 70E18 80080E18 01000324 */  addiu      $v1, $zero, 0x1
    /* 70E1C 80080E1C 00004490 */  lbu        $a0, 0x0($v0)
    /* 70E20 80080E20 0418A300 */  sllv       $v1, $v1, $a1
    /* 70E24 80080E24 25208300 */  or         $a0, $a0, $v1
    /* 70E28 80080E28 000044A0 */  sb         $a0, 0x0($v0)
  .L80080E2C:
    /* 70E2C 80080E2C 01001026 */  addiu      $s0, $s0, 0x1
    /* 70E30 80080E30 21200002 */  addu       $a0, $s0, $zero
    /* 70E34 80080E34 21282002 */  addu       $a1, $s1, $zero
    /* 70E38 80080E38 7502020C */  jal        GetAutomapType__FiiUc
    /* 70E3C 80080E3C 21300000 */   addu      $a2, $zero, $zero
    /* 70E40 80080E40 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 70E44 80080E44 07400324 */  addiu      $v1, $zero, 0x4007
    /* 70E48 80080E48 23004314 */  bne        $v0, $v1, .L80080ED8
    /* 70E4C 80080E4C C3181000 */   sra       $v1, $s0, 3
  .L80080E50:
    /* 70E50 80080E50 1180043C */  lui        $a0, %hi(automapview)
    /* 70E54 80080E54 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70E58 80080E58 80100300 */  sll        $v0, $v1, 2
    /* 70E5C 80080E5C 21104300 */  addu       $v0, $v0, $v1
    /* 70E60 80080E60 C0100200 */  sll        $v0, $v0, 3
    /* 70E64 80080E64 21104400 */  addu       $v0, $v0, $a0
    /* 70E68 80080E68 21105100 */  addu       $v0, $v0, $s1
    /* 70E6C 80080E6C 07000532 */  andi       $a1, $s0, 0x7
    /* 70E70 80080E70 01000324 */  addiu      $v1, $zero, 0x1
    /* 70E74 80080E74 00004490 */  lbu        $a0, 0x0($v0)
    /* 70E78 80080E78 0418A300 */  sllv       $v1, $v1, $a1
    /* 70E7C 80080E7C 25208300 */  or         $a0, $a0, $v1
    /* 70E80 80080E80 B6030208 */  j          .L80080ED8
    /* 70E84 80080E84 000044A0 */   sb        $a0, 0x0($v0)
  .L80080E88:
    /* 70E88 80080E88 21200002 */  addu       $a0, $s0, $zero
  .L80080E8C:
    /* 70E8C 80080E8C FFFF2526 */  addiu      $a1, $s1, -0x1
    /* 70E90 80080E90 7502020C */  jal        GetAutomapType__FiiUc
    /* 70E94 80080E94 21300000 */   addu      $a2, $zero, $zero
    /* 70E98 80080E98 00404230 */  andi       $v0, $v0, 0x4000
    /* 70E9C 80080E9C 0E004010 */  beqz       $v0, .L80080ED8
    /* 70EA0 80080EA0 C3181000 */   sra       $v1, $s0, 3
    /* 70EA4 80080EA4 1180043C */  lui        $a0, %hi(automapview)
    /* 70EA8 80080EA8 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 70EAC 80080EAC 80100300 */  sll        $v0, $v1, 2
    /* 70EB0 80080EB0 21104300 */  addu       $v0, $v0, $v1
    /* 70EB4 80080EB4 C0100200 */  sll        $v0, $v0, 3
    /* 70EB8 80080EB8 21104400 */  addu       $v0, $v0, $a0
    /* 70EBC 80080EBC 21105100 */  addu       $v0, $v0, $s1
    /* 70EC0 80080EC0 07000532 */  andi       $a1, $s0, 0x7
  .L80080EC4:
    /* 70EC4 80080EC4 01000324 */  addiu      $v1, $zero, 0x1
    /* 70EC8 80080EC8 FFFF4490 */  lbu        $a0, -0x1($v0)
    /* 70ECC 80080ECC 0418A300 */  sllv       $v1, $v1, $a1
    /* 70ED0 80080ED0 25208300 */  or         $a0, $a0, $v1
    /* 70ED4 80080ED4 FFFF44A0 */  sb         $a0, -0x1($v0)
  .L80080ED8:
    /* 70ED8 80080ED8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 70EDC 80080EDC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 70EE0 80080EE0 1800B28F */  lw         $s2, 0x18($sp)
    /* 70EE4 80080EE4 1400B18F */  lw         $s1, 0x14($sp)
    /* 70EE8 80080EE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 70EEC 80080EEC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 70EF0 80080EF0 0800E003 */  jr         $ra
    /* 70EF4 80080EF4 00000000 */   nop
endlabel SetAutomapView__Fii
