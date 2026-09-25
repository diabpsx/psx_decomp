.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetKanjiFrm__FUs, 0x28C

glabel GetKanjiFrm__FUs
    /* 9DC2C 800ADC2C A8FEBD27 */  addiu      $sp, $sp, -0x158
    /* 9DC30 800ADC30 4401B1AF */  sw         $s1, 0x144($sp)
    /* 9DC34 800ADC34 21888000 */  addu       $s1, $a0, $zero
    /* 9DC38 800ADC38 5001BFAF */  sw         $ra, 0x150($sp)
    /* 9DC3C 800ADC3C 4C01B3AF */  sw         $s3, 0x14C($sp)
    /* 9DC40 800ADC40 4801B2AF */  sw         $s2, 0x148($sp)
    /* 9DC44 800ADC44 08B7020C */  jal        GetKanjiCacheFrm__Fv
    /* 9DC48 800ADC48 4001B0AF */   sw        $s0, 0x140($sp)
    /* 9DC4C 800ADC4C 0C80103C */  lui        $s0, %hi(AllDats)
    /* 9DC50 800ADC50 5494108E */  lw         $s0, %lo(AllDats)($s0)
    /* 9DC54 800ADC54 AEB7020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_800adeb8
    /* 9DC58 800ADC58 3801A427 */   addiu     $a0, $sp, 0x138
    /* 9DC5C 800ADC5C 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DC60 800ADC60 00000000 */  nop
    /* 9DC64 800ADC64 06004014 */  bnez       $v0, .L800ADC80
    /* 9DC68 800ADC68 21982002 */   addu      $s3, $s1, $zero
    /* 9DC6C 800ADC6C 21200000 */  addu       $a0, $zero, $zero
    /* 9DC70 800ADC70 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9DC74 800ADC74 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9DC78 800ADC78 A583000C */  jal        DBG_Error
    /* 9DC7C 800ADC7C 2A020624 */   addiu     $a2, $zero, 0x22A
  .L800ADC80:
    /* 9DC80 800ADC80 3801A38F */  lw         $v1, 0x138($sp)
    /* 9DC84 800ADC84 09000224 */  addiu      $v0, $zero, 0x9
    /* 9DC88 800ADC88 030062A0 */  sb         $v0, 0x3($v1)
    /* 9DC8C 800ADC8C 3801A38F */  lw         $v1, 0x138($sp)
    /* 9DC90 800ADC90 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 9DC94 800ADC94 06000016 */  bnez       $s0, .L800ADCB0
    /* 9DC98 800ADC98 070062A0 */   sb        $v0, 0x7($v1)
    /* 9DC9C 800ADC9C 21200000 */  addu       $a0, $zero, $zero
    /* 9DCA0 800ADCA0 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9DCA4 800ADCA4 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9DCA8 800ADCA8 A583000C */  jal        DBG_Error
    /* 9DCAC 800ADCAC 33020624 */   addiu     $a2, $zero, 0x233
  .L800ADCB0:
    /* 9DCB0 800ADCB0 B81F828F */  lw         $v0, %gp_rel(D_8011C738)($gp)
    /* 9DCB4 800ADCB4 00000000 */  nop
    /* 9DCB8 800ADCB8 06004014 */  bnez       $v0, .L800ADCD4
    /* 9DCBC 800ADCBC 00000000 */   nop
    /* 9DCC0 800ADCC0 21200000 */  addu       $a0, $zero, $zero
    /* 9DCC4 800ADCC4 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9DCC8 800ADCC8 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9DCCC 800ADCCC A583000C */  jal        DBG_Error
    /* 9DCD0 800ADCD0 34020624 */   addiu     $a2, $zero, 0x234
  .L800ADCD4:
    /* 9DCD4 800ADCD4 B81F858F */  lw         $a1, %gp_rel(D_8011C738)($gp)
    /* 9DCD8 800ADCD8 3801A68F */  lw         $a2, 0x138($sp)
    /* 9DCDC 800ADCDC 754F020C */  jal        SetPal__7TextDatP9FRAME_HDRP8POLY_FT4
    /* 9DCE0 800ADCE0 21200002 */   addu      $a0, $s0, $zero
    /* 9DCE4 800ADCE4 00241100 */  sll        $a0, $s1, 16
    /* 9DCE8 800ADCE8 FDB5020C */  jal        inmem__Fs
    /* 9DCEC 800ADCEC 03240400 */   sra       $a0, $a0, 16
    /* 9DCF0 800ADCF0 21884000 */  addu       $s1, $v0, $zero
    /* 9DCF4 800ADCF4 11002012 */  beqz       $s1, .L800ADD3C
    /* 9DCF8 800ADCF8 FFFF3126 */   addiu     $s1, $s1, -0x1
    /* 9DCFC 800ADCFC 480B828F */  lw         $v0, %gp_rel(D_8011B2C8)($gp)
    /* 9DD00 800ADD00 80181100 */  sll        $v1, $s1, 2
    /* 9DD04 800ADD04 21184300 */  addu       $v1, $v0, $v1
    /* 9DD08 800ADD08 02006490 */  lbu        $a0, 0x2($v1)
    /* 9DD0C 800ADD0C 00000000 */  nop
    /* 9DD10 800ADD10 FF00822C */  sltiu      $v0, $a0, 0xFF
    /* 9DD14 800ADD14 02004010 */  beqz       $v0, .L800ADD20
    /* 9DD18 800ADD18 01008224 */   addiu     $v0, $a0, 0x1
    /* 9DD1C 800ADD1C 020062A0 */  sb         $v0, 0x2($v1)
  .L800ADD20:
    /* 9DD20 800ADD20 B41F828F */  lw         $v0, %gp_rel(D_8011C734)($gp)
    /* 9DD24 800ADD24 C0181100 */  sll        $v1, $s1, 3
    /* 9DD28 800ADD28 21104300 */  addu       $v0, $v0, $v1
    /* 9DD2C 800ADD2C 0400518C */  lw         $s1, 0x4($v0)
    /* 9DD30 800ADD30 0800508C */  lw         $s0, 0x8($v0)
    /* 9DD34 800ADD34 84B70208 */  j          .L800ADE10
    /* 9DD38 800ADD38 00010332 */   andi      $v1, $s0, 0x100
  .L800ADD3C:
    /* 9DD3C 800ADD3C DAB6020C */  jal        getfreekan__Fv
    /* 9DD40 800ADD40 00000000 */   nop
    /* 9DD44 800ADD44 21884000 */  addu       $s1, $v0, $zero
    /* 9DD48 800ADD48 80181100 */  sll        $v1, $s1, 2
    /* 9DD4C 800ADD4C 480B828F */  lw         $v0, %gp_rel(D_8011B2C8)($gp)
    /* 9DD50 800ADD50 1280123C */  lui        $s2, %hi(D_8011D398)
    /* 9DD54 800ADD54 98D35226 */  addiu      $s2, $s2, %lo(D_8011D398)
    /* 9DD58 800ADD58 21184300 */  addu       $v1, $v0, $v1
    /* 9DD5C 800ADD5C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9DD60 800ADD60 000073A4 */  sh         $s3, 0x0($v1)
    /* 9DD64 800ADD64 06004016 */  bnez       $s2, .L800ADD80
    /* 9DD68 800ADD68 020062A0 */   sb        $v0, 0x2($v1)
    /* 9DD6C 800ADD6C 21200000 */  addu       $a0, $zero, $zero
    /* 9DD70 800ADD70 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9DD74 800ADD74 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9DD78 800ADD78 A583000C */  jal        DBG_Error
    /* 9DD7C 800ADD7C 50020624 */   addiu     $a2, $zero, 0x250
  .L800ADD80:
    /* 9DD80 800ADD80 1800B027 */  addiu      $s0, $sp, 0x18
    /* 9DD84 800ADD84 21200002 */  addu       $a0, $s0, $zero
    /* 9DD88 800ADD88 FFFF6532 */  andi       $a1, $s3, 0xFFFF
    /* 9DD8C 800ADD8C AAB6020C */  jal        _get_font__FPUcUsT0
    /* 9DD90 800ADD90 21304002 */   addu      $a2, $s2, $zero
    /* 9DD94 800ADD94 21200002 */  addu       $a0, $s0, $zero
    /* 9DD98 800ADD98 07000524 */  addiu      $a1, $zero, 0x7
    /* 9DD9C 800ADD9C 23B6020C */  jal        ShadeBuff__FPUcii
    /* 9DDA0 800ADDA0 02000624 */   addiu     $a2, $zero, 0x2
    /* 9DDA4 800ADDA4 21200002 */  addu       $a0, $s0, $zero
    /* 9DDA8 800ADDA8 02000524 */  addiu      $a1, $zero, 0x2
    /* 9DDAC 800ADDAC 23B6020C */  jal        ShadeBuff__FPUcii
    /* 9DDB0 800ADDB0 01000624 */   addiu     $a2, $zero, 0x1
    /* 9DDB4 800ADDB4 21200002 */  addu       $a0, $s0, $zero
    /* 9DDB8 800ADDB8 A800B027 */  addiu      $s0, $sp, 0xA8
    /* 9DDBC 800ADDBC 8DB6020C */  jal        Crunch__FPUcT0
    /* 9DDC0 800ADDC0 21280002 */   addu      $a1, $s0, $zero
    /* 9DDC4 800ADDC4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 9DDC8 800ADDC8 B41F838F */  lw         $v1, %gp_rel(D_8011C734)($gp)
    /* 9DDCC 800ADDCC C0101100 */  sll        $v0, $s1, 3
    /* 9DDD0 800ADDD0 21186200 */  addu       $v1, $v1, $v0
    /* 9DDD4 800ADDD4 0400668C */  lw         $a2, 0x4($v1)
    /* 9DDD8 800ADDD8 21280002 */  addu       $a1, $s0, $zero
    /* 9DDDC 800ADDDC 00140600 */  sll        $v0, $a2, 16
    /* 9DDE0 800ADDE0 038C0200 */  sra        $s1, $v0, 16
    /* 9DDE4 800ADDE4 1000A6A7 */  sh         $a2, 0x10($sp)
    /* 9DDE8 800ADDE8 0800638C */  lw         $v1, 0x8($v1)
    /* 9DDEC 800ADDEC 03000224 */  addiu      $v0, $zero, 0x3
    /* 9DDF0 800ADDF0 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 9DDF4 800ADDF4 0C000224 */  addiu      $v0, $zero, 0xC
    /* 9DDF8 800ADDF8 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 9DDFC 800ADDFC 00140300 */  sll        $v0, $v1, 16
    /* 9DE00 800ADE00 03840200 */  sra        $s0, $v0, 16
    /* 9DE04 800ADE04 7758000C */  jal        LoadImage2
    /* 9DE08 800ADE08 1200A3A7 */   sh        $v1, 0x12($sp)
    /* 9DE0C 800ADE0C 00010332 */  andi       $v1, $s0, 0x100
  .L800ADE10:
    /* 9DE10 800ADE10 03190300 */  sra        $v1, $v1, 4
    /* 9DE14 800ADE14 FF032232 */  andi       $v0, $s1, 0x3FF
    /* 9DE18 800ADE18 83110200 */  sra        $v0, $v0, 6
    /* 9DE1C 800ADE1C 25186200 */  or         $v1, $v1, $v0
    /* 9DE20 800ADE20 00020232 */  andi       $v0, $s0, 0x200
    /* 9DE24 800ADE24 80100200 */  sll        $v0, $v0, 2
    /* 9DE28 800ADE28 3801A48F */  lw         $a0, 0x138($sp)
    /* 9DE2C 800ADE2C 25186200 */  or         $v1, $v1, $v0
    /* 9DE30 800ADE30 160083A4 */  sh         $v1, 0x16($a0)
    /* 9DE34 800ADE34 80181100 */  sll        $v1, $s1, 2
    /* 9DE38 800ADE38 FF006330 */  andi       $v1, $v1, 0xFF
    /* 9DE3C 800ADE3C 0C0083A0 */  sb         $v1, 0xC($a0)
    /* 9DE40 800ADE40 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE44 800ADE44 FF000432 */  andi       $a0, $s0, 0xFF
    /* 9DE48 800ADE48 0D0044A0 */  sb         $a0, 0xD($v0)
    /* 9DE4C 800ADE4C 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE50 800ADE50 0C006524 */  addiu      $a1, $v1, 0xC
    /* 9DE54 800ADE54 140045A0 */  sb         $a1, 0x14($v0)
    /* 9DE58 800ADE58 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE5C 800ADE5C 00000000 */  nop
    /* 9DE60 800ADE60 150044A0 */  sb         $a0, 0x15($v0)
    /* 9DE64 800ADE64 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE68 800ADE68 00000000 */  nop
    /* 9DE6C 800ADE6C 1C0043A0 */  sb         $v1, 0x1C($v0)
    /* 9DE70 800ADE70 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE74 800ADE74 0C008424 */  addiu      $a0, $a0, 0xC
    /* 9DE78 800ADE78 1D0044A0 */  sb         $a0, 0x1D($v0)
    /* 9DE7C 800ADE7C 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE80 800ADE80 00000000 */  nop
    /* 9DE84 800ADE84 240045A0 */  sb         $a1, 0x24($v0)
    /* 9DE88 800ADE88 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE8C 800ADE8C 00000000 */  nop
    /* 9DE90 800ADE90 250044A0 */  sb         $a0, 0x25($v0)
    /* 9DE94 800ADE94 3801A28F */  lw         $v0, 0x138($sp)
    /* 9DE98 800ADE98 5001BF8F */  lw         $ra, 0x150($sp)
    /* 9DE9C 800ADE9C 4C01B38F */  lw         $s3, 0x14C($sp)
    /* 9DEA0 800ADEA0 4801B28F */  lw         $s2, 0x148($sp)
    /* 9DEA4 800ADEA4 4401B18F */  lw         $s1, 0x144($sp)
    /* 9DEA8 800ADEA8 4001B08F */  lw         $s0, 0x140($sp)
    /* 9DEAC 800ADEAC 5801BD27 */  addiu      $sp, $sp, 0x158
    /* 9DEB0 800ADEB0 0800E003 */  jr         $ra
    /* 9DEB4 800ADEB4 00000000 */   nop
endlabel GetKanjiFrm__FUs
