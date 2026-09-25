.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSizes__6Dialog, 0x284

glabel GetSizes__6Dialog
    /* 7BC5C 8008BC5C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7BC60 8008BC60 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7BC64 8008BC64 21808000 */  addu       $s0, $a0, $zero
    /* 7BC68 8008BC68 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7BC6C 8008BC6C 044F020C */  jal        GM_UseTexData__Fi
    /* 7BC70 8008BC70 21200000 */   addu      $a0, $zero, $zero
    /* 7BC74 8008BC74 0800058E */  lw         $a1, 0x8($s0)
    /* 7BC78 8008BC78 21204000 */  addu       $a0, $v0, $zero
    /* 7BC7C 8008BC7C 840484AF */  sw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BC80 8008BC80 880485AF */  sw         $a1, %gp_rel(DialogBackGfx)($gp)
    /* 7BC84 8008BC84 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BC88 8008BC88 00000000 */   nop
    /* 7BC8C 8008BC8C 21184000 */  addu       $v1, $v0, $zero
    /* 7BC90 8008BC90 0400058E */  lw         $a1, 0x4($s0)
    /* 7BC94 8008BC94 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BC98 8008BC98 0800628C */  lw         $v0, 0x8($v1)
    /* 7BC9C 8008BC9C 0800638C */  lw         $v1, 0x8($v1)
    /* 7BCA0 8008BCA0 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BCA4 8008BCA4 421A0300 */  srl        $v1, $v1, 9
    /* 7BCA8 8008BCA8 FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BCAC 8008BCAC 8C0482AF */  sw         $v0, %gp_rel(DialogBackW)($gp)
    /* 7BCB0 8008BCB0 900483AF */  sw         $v1, %gp_rel(DialogBackH)($gp)
    /* 7BCB4 8008BCB4 940485AF */  sw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BCB8 8008BCB8 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BCBC 8008BCBC 00000000 */   nop
    /* 7BCC0 8008BCC0 21184000 */  addu       $v1, $v0, $zero
    /* 7BCC4 8008BCC4 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BCC8 8008BCC8 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BCCC 8008BCCC 0800628C */  lw         $v0, 0x8($v1)
    /* 7BCD0 8008BCD0 0800638C */  lw         $v1, 0x8($v1)
    /* 7BCD4 8008BCD4 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BCD8 8008BCD8 421A0300 */  srl        $v1, $v1, 9
    /* 7BCDC 8008BCDC FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BCE0 8008BCE0 980482AF */  sw         $v0, %gp_rel(DialogBorderTLW)($gp)
    /* 7BCE4 8008BCE4 9C0483AF */  sw         $v1, %gp_rel(DialogBorderTLH)($gp)
    /* 7BCE8 8008BCE8 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BCEC 8008BCEC 0200A524 */   addiu     $a1, $a1, 0x2
    /* 7BCF0 8008BCF0 21184000 */  addu       $v1, $v0, $zero
    /* 7BCF4 8008BCF4 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BCF8 8008BCF8 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BCFC 8008BCFC 0800628C */  lw         $v0, 0x8($v1)
    /* 7BD00 8008BD00 0800638C */  lw         $v1, 0x8($v1)
    /* 7BD04 8008BD04 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BD08 8008BD08 421A0300 */  srl        $v1, $v1, 9
    /* 7BD0C 8008BD0C FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BD10 8008BD10 A00482AF */  sw         $v0, %gp_rel(DialogBorderTRW)($gp)
    /* 7BD14 8008BD14 A40483AF */  sw         $v1, %gp_rel(DialogBorderTRH)($gp)
    /* 7BD18 8008BD18 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BD1C 8008BD1C 0500A524 */   addiu     $a1, $a1, 0x5
    /* 7BD20 8008BD20 21184000 */  addu       $v1, $v0, $zero
    /* 7BD24 8008BD24 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BD28 8008BD28 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BD2C 8008BD2C 0800628C */  lw         $v0, 0x8($v1)
    /* 7BD30 8008BD30 0800638C */  lw         $v1, 0x8($v1)
    /* 7BD34 8008BD34 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BD38 8008BD38 421A0300 */  srl        $v1, $v1, 9
    /* 7BD3C 8008BD3C FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BD40 8008BD40 A80482AF */  sw         $v0, %gp_rel(DialogBorderBLW)($gp)
    /* 7BD44 8008BD44 AC0483AF */  sw         $v1, %gp_rel(DialogBorderBLH)($gp)
    /* 7BD48 8008BD48 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BD4C 8008BD4C 0700A524 */   addiu     $a1, $a1, 0x7
    /* 7BD50 8008BD50 21184000 */  addu       $v1, $v0, $zero
    /* 7BD54 8008BD54 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BD58 8008BD58 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BD5C 8008BD5C 0800628C */  lw         $v0, 0x8($v1)
    /* 7BD60 8008BD60 0800638C */  lw         $v1, 0x8($v1)
    /* 7BD64 8008BD64 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BD68 8008BD68 421A0300 */  srl        $v1, $v1, 9
    /* 7BD6C 8008BD6C FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BD70 8008BD70 B00482AF */  sw         $v0, %gp_rel(DialogBorderBRW)($gp)
    /* 7BD74 8008BD74 B40483AF */  sw         $v1, %gp_rel(DialogBorderBRH)($gp)
    /* 7BD78 8008BD78 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BD7C 8008BD7C 0100A524 */   addiu     $a1, $a1, 0x1
    /* 7BD80 8008BD80 21184000 */  addu       $v1, $v0, $zero
    /* 7BD84 8008BD84 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BD88 8008BD88 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BD8C 8008BD8C 0800628C */  lw         $v0, 0x8($v1)
    /* 7BD90 8008BD90 0800638C */  lw         $v1, 0x8($v1)
    /* 7BD94 8008BD94 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BD98 8008BD98 421A0300 */  srl        $v1, $v1, 9
    /* 7BD9C 8008BD9C FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BDA0 8008BDA0 B80482AF */  sw         $v0, %gp_rel(DialogBorderTW)($gp)
    /* 7BDA4 8008BDA4 BC0483AF */  sw         $v1, %gp_rel(DialogBorderTH)($gp)
    /* 7BDA8 8008BDA8 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BDAC 8008BDAC 0600A524 */   addiu     $a1, $a1, 0x6
    /* 7BDB0 8008BDB0 21184000 */  addu       $v1, $v0, $zero
    /* 7BDB4 8008BDB4 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BDB8 8008BDB8 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BDBC 8008BDBC 0800628C */  lw         $v0, 0x8($v1)
    /* 7BDC0 8008BDC0 0800638C */  lw         $v1, 0x8($v1)
    /* 7BDC4 8008BDC4 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BDC8 8008BDC8 421A0300 */  srl        $v1, $v1, 9
    /* 7BDCC 8008BDCC FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BDD0 8008BDD0 C00482AF */  sw         $v0, %gp_rel(DialogBorderBW)($gp)
    /* 7BDD4 8008BDD4 C40483AF */  sw         $v1, %gp_rel(DialogBorderBH)($gp)
    /* 7BDD8 8008BDD8 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BDDC 8008BDDC 0300A524 */   addiu     $a1, $a1, 0x3
    /* 7BDE0 8008BDE0 21184000 */  addu       $v1, $v0, $zero
    /* 7BDE4 8008BDE4 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7BDE8 8008BDE8 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BDEC 8008BDEC 0800628C */  lw         $v0, 0x8($v1)
    /* 7BDF0 8008BDF0 0800638C */  lw         $v1, 0x8($v1)
    /* 7BDF4 8008BDF4 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BDF8 8008BDF8 421A0300 */  srl        $v1, $v1, 9
    /* 7BDFC 8008BDFC FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BE00 8008BE00 C80482AF */  sw         $v0, %gp_rel(DialogBorderLW)($gp)
    /* 7BE04 8008BE04 CC0483AF */  sw         $v1, %gp_rel(DialogBorderLH)($gp)
    /* 7BE08 8008BE08 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BE0C 8008BE0C 0400A524 */   addiu     $a1, $a1, 0x4
    /* 7BE10 8008BE10 21184000 */  addu       $v1, $v0, $zero
    /* 7BE14 8008BE14 0000058E */  lw         $a1, 0x0($s0)
    /* 7BE18 8008BE18 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BE1C 8008BE1C 0800628C */  lw         $v0, 0x8($v1)
    /* 7BE20 8008BE20 0800638C */  lw         $v1, 0x8($v1)
    /* 7BE24 8008BE24 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BE28 8008BE28 421A0300 */  srl        $v1, $v1, 9
    /* 7BE2C 8008BE2C FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BE30 8008BE30 D00482AF */  sw         $v0, %gp_rel(DialogBorderRW)($gp)
    /* 7BE34 8008BE34 D40483AF */  sw         $v1, %gp_rel(DialogBorderRH)($gp)
    /* 7BE38 8008BE38 D80485AF */  sw         $a1, %gp_rel(DialogBevelGfx)($gp)
    /* 7BE3C 8008BE3C 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BE40 8008BE40 00000000 */   nop
    /* 7BE44 8008BE44 21184000 */  addu       $v1, $v0, $zero
    /* 7BE48 8008BE48 D804858F */  lw         $a1, %gp_rel(DialogBevelGfx)($gp)
    /* 7BE4C 8008BE4C 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BE50 8008BE50 0800628C */  lw         $v0, 0x8($v1)
    /* 7BE54 8008BE54 0800638C */  lw         $v1, 0x8($v1)
    /* 7BE58 8008BE58 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BE5C 8008BE5C 421A0300 */  srl        $v1, $v1, 9
    /* 7BE60 8008BE60 FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BE64 8008BE64 DC0482AF */  sw         $v0, %gp_rel(DialogBevelCW)($gp)
    /* 7BE68 8008BE68 E00483AF */  sw         $v1, %gp_rel(DialogBevelCH)($gp)
    /* 7BE6C 8008BE6C 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BE70 8008BE70 0100A524 */   addiu     $a1, $a1, 0x1
    /* 7BE74 8008BE74 21184000 */  addu       $v1, $v0, $zero
    /* 7BE78 8008BE78 D804858F */  lw         $a1, %gp_rel(DialogBevelGfx)($gp)
    /* 7BE7C 8008BE7C 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7BE80 8008BE80 0800628C */  lw         $v0, 0x8($v1)
    /* 7BE84 8008BE84 0800638C */  lw         $v1, 0x8($v1)
    /* 7BE88 8008BE88 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BE8C 8008BE8C 421A0300 */  srl        $v1, $v1, 9
    /* 7BE90 8008BE90 FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BE94 8008BE94 EC0482AF */  sw         $v0, %gp_rel(DialogBevelUDW)($gp)
    /* 7BE98 8008BE98 F00483AF */  sw         $v1, %gp_rel(DialogBevelUDH)($gp)
    /* 7BE9C 8008BE9C 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7BEA0 8008BEA0 0300A524 */   addiu     $a1, $a1, 0x3
    /* 7BEA4 8008BEA4 21184000 */  addu       $v1, $v0, $zero
    /* 7BEA8 8008BEA8 0800628C */  lw         $v0, 0x8($v1)
    /* 7BEAC 8008BEAC 0800638C */  lw         $v1, 0x8($v1)
    /* 7BEB0 8008BEB0 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7BEB4 8008BEB4 421A0300 */  srl        $v1, $v1, 9
    /* 7BEB8 8008BEB8 E40482AF */  sw         $v0, %gp_rel(DialogBevelLRW)($gp)
    /* 7BEBC 8008BEBC 0C00028E */  lw         $v0, 0xC($s0)
    /* 7BEC0 8008BEC0 FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7BEC4 8008BEC4 E80483AF */  sw         $v1, %gp_rel(DialogBevelLRH)($gp)
    /* 7BEC8 8008BEC8 F40482AF */  sw         $v0, %gp_rel(MY_DialogOTpos)($gp)
    /* 7BECC 8008BECC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7BED0 8008BED0 1000B08F */  lw         $s0, 0x10($sp)
    /* 7BED4 8008BED4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7BED8 8008BED8 0800E003 */  jr         $ra
    /* 7BEDC 8008BEDC 00000000 */   nop
endlabel GetSizes__6Dialog
