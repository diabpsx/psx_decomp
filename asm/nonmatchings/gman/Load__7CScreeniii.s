.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Load__7CScreeniii, 0x314

glabel Load__7CScreeniii
    /* 84890 80094890 D0FDBD27 */  addiu      $sp, $sp, -0x230
    /* 84894 80094894 1C02B1AF */  sw         $s1, 0x21C($sp)
    /* 84898 80094898 21888000 */  addu       $s1, $a0, $zero
    /* 8489C 8009489C 2402B3AF */  sw         $s3, 0x224($sp)
    /* 848A0 800948A0 2198A000 */  addu       $s3, $a1, $zero
    /* 848A4 800948A4 2002B2AF */  sw         $s2, 0x220($sp)
    /* 848A8 800948A8 2190C000 */  addu       $s2, $a2, $zero
    /* 848AC 800948AC 2C02BFAF */  sw         $ra, 0x22C($sp)
    /* 848B0 800948B0 2802B4AF */  sw         $s4, 0x228($sp)
    /* 848B4 800948B4 1802B0AF */  sw         $s0, 0x218($sp)
    /* 848B8 800948B8 7000228E */  lw         $v0, 0x70($s1)
    /* 848BC 800948BC 00000000 */  nop
    /* 848C0 800948C0 AF006212 */  beq        $s3, $v0, .L80094B80
    /* 848C4 800948C4 21A0E000 */   addu      $s4, $a3, $zero
    /* 848C8 800948C8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 848CC 800948CC 03006212 */  beq        $s3, $v0, .L800948DC
    /* 848D0 800948D0 00000000 */   nop
    /* 848D4 800948D4 A14E020C */  jal        DumpData__7TextDat
    /* 848D8 800948D8 00000000 */   nop
  .L800948DC:
    /* 848DC 800948DC 1280023C */  lui        $v0, %hi(FeFlag)
    /* 848E0 800948E0 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 848E4 800948E4 00000000 */  nop
    /* 848E8 800948E8 03004010 */  beqz       $v0, .L800948F8
    /* 848EC 800948EC 01000224 */   addiu     $v0, $zero, 0x1
    /* 848F0 800948F0 1280013C */  lui        $at, %hi(CDWAIT)
    /* 848F4 800948F4 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
  .L800948F8:
    /* 848F8 800948F8 21202002 */  addu       $a0, $s1, $zero
    /* 848FC 800948FC 80101300 */  sll        $v0, $s3, 2
    /* 84900 80094900 0B80013C */  lui        $at, %hi(TX_DatTab)
    /* 84904 80094904 21082200 */  addu       $at, $at, $v0
    /* 84908 80094908 042D258C */  lw         $a1, %lo(TX_DatTab)($at)
    /* 8490C 8009490C CC54020C */  jal        SetFileInfo__7TextDatPC13CTextFileInfoi_80095330
    /* 84910 80094910 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 84914 80094914 21202002 */  addu       $a0, $s1, $zero
    /* 84918 80094918 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 8491C 8009491C 01000624 */  addiu      $a2, $zero, 0x1
    /* 84920 80094920 CC47020C */  jal        Use__7TextDatlbi
    /* 84924 80094924 21380000 */   addu      $a3, $zero, $zero
    /* 84928 80094928 21202002 */  addu       $a0, $s1, $zero
    /* 8492C 8009492C DB54020C */  jal        GetFr__7TextDati_8009536c
    /* 84930 80094930 21280000 */   addu      $a1, $zero, $zero
    /* 84934 80094934 21804000 */  addu       $s0, $v0, $zero
    /* 84938 80094938 0400028E */  lw         $v0, 0x4($s0)
    /* 8493C 8009493C 0004033C */  lui        $v1, (0x4000000 >> 16)
    /* 84940 80094940 24104300 */  and        $v0, $v0, $v1
    /* 84944 80094944 05004010 */  beqz       $v0, .L8009495C
    /* 84948 80094948 21200000 */   addu      $a0, $zero, $zero
    /* 8494C 8009494C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84950 80094950 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84954 80094954 A583000C */  jal        DBG_Error
    /* 84958 80094958 1B070624 */   addiu     $a2, $zero, 0x71B
  .L8009495C:
    /* 8495C 8009495C 21202002 */  addu       $a0, $s1, $zero
    /* 84960 80094960 B04D020C */  jal        DecompFrame__7TextDatP9FRAME_HDR
    /* 84964 80094964 21280002 */   addu      $a1, $s0, $zero
    /* 84968 80094968 0B000224 */  addiu      $v0, $zero, 0xB
    /* 8496C 8009496C 05004216 */  bne        $s2, $v0, .L80094984
    /* 84970 80094970 1000A427 */   addiu     $a0, $sp, 0x10
    /* 84974 80094974 C0020224 */  addiu      $v0, $zero, 0x2C0
    /* 84978 80094978 1000A2A7 */  sh         $v0, 0x10($sp)
    /* 8497C 8009497C 64520208 */  j          .L80094990
    /* 84980 80094980 A0000224 */   addiu     $v0, $zero, 0xA0
  .L80094984:
    /* 84984 80094984 80111200 */  sll        $v0, $s2, 6
    /* 84988 80094988 1000A2A7 */  sh         $v0, 0x10($sp)
    /* 8498C 8009498C 80000224 */  addiu      $v0, $zero, 0x80
  .L80094990:
    /* 84990 80094990 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 84994 80094994 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 84998 80094998 1200B4A7 */  sh         $s4, 0x12($sp)
    /* 8499C 8009499C 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 849A0 800949A0 4C00258E */  lw         $a1, 0x4C($s1)
    /* 849A4 800949A4 590D020C */  jal        GPUQ_LoadImage__FP4RECTli
    /* 849A8 800949A8 21300000 */   addu      $a2, $zero, $zero
    /* 849AC 800949AC FC0C020C */  jal        GPUQ_FlushQ__Fv
    /* 849B0 800949B0 00000000 */   nop
    /* 849B4 800949B4 21202002 */  addu       $a0, $s1, $zero
    /* 849B8 800949B8 D454020C */  jal        GetPal__7TextDati_80095350
    /* 849BC 800949BC 21280000 */   addu      $a1, $zero, $zero
    /* 849C0 800949C0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 849C4 800949C4 21904000 */  addu       $s2, $v0, $zero
    /* 849C8 800949C8 04004526 */  addiu      $a1, $s2, 0x4
    /* 849CC 800949CC F0000224 */  addiu      $v0, $zero, 0xF0
    /* 849D0 800949D0 1200A2A7 */  sh         $v0, 0x12($sp)
    /* 849D4 800949D4 00010224 */  addiu      $v0, $zero, 0x100
    /* 849D8 800949D8 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 849DC 800949DC 01000224 */  addiu      $v0, $zero, 0x1
    /* 849E0 800949E0 1000A0A7 */  sh         $zero, 0x10($sp)
    /* 849E4 800949E4 494F000C */  jal        LoadImage
    /* 849E8 800949E8 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 849EC 800949EC 0000428E */  lw         $v0, 0x0($s2)
    /* 849F0 800949F0 00000000 */  nop
    /* 849F4 800949F4 01004230 */  andi       $v0, $v0, 0x1
    /* 849F8 800949F8 05004010 */  beqz       $v0, .L80094A10
    /* 849FC 800949FC 21200000 */   addu      $a0, $zero, $zero
    /* 84A00 80094A00 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84A04 80094A04 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84A08 80094A08 A583000C */  jal        DBG_Error
    /* 84A0C 80094A0C 30070624 */   addiu     $a2, $zero, 0x730
  .L80094A10:
    /* 84A10 80094A10 21280000 */  addu       $a1, $zero, $zero
    /* 84A14 80094A14 21204002 */  addu       $a0, $s2, $zero
    /* 84A18 80094A18 1000A327 */  addiu      $v1, $sp, 0x10
  .L80094A1C:
    /* 84A1C 80094A1C 04008294 */  lhu        $v0, 0x4($a0)
    /* 84A20 80094A20 02008424 */  addiu      $a0, $a0, 0x2
    /* 84A24 80094A24 0100A524 */  addiu      $a1, $a1, 0x1
    /* 84A28 80094A28 080062A4 */  sh         $v0, 0x8($v1)
    /* 84A2C 80094A2C 0001A228 */  slti       $v0, $a1, 0x100
    /* 84A30 80094A30 FAFF4014 */  bnez       $v0, .L80094A1C
    /* 84A34 80094A34 02006324 */   addiu     $v1, $v1, 0x2
    /* 84A38 80094A38 21800000 */  addu       $s0, $zero, $zero
    /* 84A3C 80094A3C 1000B427 */  addiu      $s4, $sp, 0x10
  .L80094A40:
    /* 84A40 80094A40 1000022A */  slti       $v0, $s0, 0x10
    /* 84A44 80094A44 30004010 */  beqz       $v0, .L80094B08
    /* 84A48 80094A48 21500000 */   addu      $t2, $zero, $zero
    /* 84A4C 80094A4C 0000428E */  lw         $v0, 0x0($s2)
    /* 84A50 80094A50 21488002 */  addu       $t1, $s4, $zero
    /* 84A54 80094A54 42580200 */  srl        $t3, $v0, 1
  .L80094A58:
    /* 84A58 80094A58 2A104B01 */  slt        $v0, $t2, $t3
    /* 84A5C 80094A5C 1F004010 */  beqz       $v0, .L80094ADC
    /* 84A60 80094A60 1000A427 */   addiu     $a0, $sp, 0x10
    /* 84A64 80094A64 08002295 */  lhu        $v0, 0x8($t1)
    /* 84A68 80094A68 00000000 */  nop
    /* 84A6C 80094A6C 1F004730 */  andi       $a3, $v0, 0x1F
    /* 84A70 80094A70 2140E000 */  addu       $t0, $a3, $zero
    /* 84A74 80094A74 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 84A78 80094A78 42190200 */  srl        $v1, $v0, 5
    /* 84A7C 80094A7C 1F006330 */  andi       $v1, $v1, 0x1F
    /* 84A80 80094A80 21286000 */  addu       $a1, $v1, $zero
    /* 84A84 80094A84 82120200 */  srl        $v0, $v0, 10
    /* 84A88 80094A88 1F004430 */  andi       $a0, $v0, 0x1F
    /* 84A8C 80094A8C 02000011 */  beqz       $t0, .L80094A98
    /* 84A90 80094A90 21308000 */   addu      $a2, $a0, $zero
    /* 84A94 80094A94 FFFFE824 */  addiu      $t0, $a3, -0x1
  .L80094A98:
    /* 84A98 80094A98 FF00A230 */  andi       $v0, $a1, 0xFF
    /* 84A9C 80094A9C 02004010 */  beqz       $v0, .L80094AA8
    /* 84AA0 80094AA0 FF00C230 */   andi      $v0, $a2, 0xFF
    /* 84AA4 80094AA4 FFFF6524 */  addiu      $a1, $v1, -0x1
  .L80094AA8:
    /* 84AA8 80094AA8 02004010 */  beqz       $v0, .L80094AB4
    /* 84AAC 80094AAC FF000231 */   andi      $v0, $t0, 0xFF
    /* 84AB0 80094AB0 FFFF8624 */  addiu      $a2, $a0, -0x1
  .L80094AB4:
    /* 84AB4 80094AB4 FF00A330 */  andi       $v1, $a1, 0xFF
    /* 84AB8 80094AB8 40190300 */  sll        $v1, $v1, 5
    /* 84ABC 80094ABC 25104300 */  or         $v0, $v0, $v1
    /* 84AC0 80094AC0 FF00C330 */  andi       $v1, $a2, 0xFF
    /* 84AC4 80094AC4 801A0300 */  sll        $v1, $v1, 10
    /* 84AC8 80094AC8 25104300 */  or         $v0, $v0, $v1
    /* 84ACC 80094ACC 080022A5 */  sh         $v0, 0x8($t1)
    /* 84AD0 80094AD0 02002925 */  addiu      $t1, $t1, 0x2
    /* 84AD4 80094AD4 96520208 */  j          .L80094A58
    /* 84AD8 80094AD8 01004A25 */   addiu     $t2, $t2, 0x1
  .L80094ADC:
    /* 84ADC 80094ADC 1800A527 */  addiu      $a1, $sp, 0x18
    /* 84AE0 80094AE0 F0000226 */  addiu      $v0, $s0, 0xF0
    /* 84AE4 80094AE4 1200A2A7 */  sh         $v0, 0x12($sp)
    /* 84AE8 80094AE8 00010224 */  addiu      $v0, $zero, 0x100
    /* 84AEC 80094AEC 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 84AF0 80094AF0 01000224 */  addiu      $v0, $zero, 0x1
    /* 84AF4 80094AF4 1000A0A7 */  sh         $zero, 0x10($sp)
    /* 84AF8 80094AF8 494F000C */  jal        LoadImage
    /* 84AFC 80094AFC 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 84B00 80094B00 90520208 */  j          .L80094A40
    /* 84B04 80094B04 01001026 */   addiu     $s0, $s0, 0x1
  .L80094B08:
    /* 84B08 80094B08 1000248E */  lw         $a0, 0x10($s1)
    /* 84B0C 80094B0C FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 84B10 80094B10 1280013C */  lui        $at, %hi(CDWAIT)
    /* 84B14 80094B14 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 84B18 80094B18 0B009010 */  beq        $a0, $s0, .L80094B48
    /* 84B1C 80094B1C 700033AE */   sw        $s3, 0x70($s1)
    /* 84B20 80094B20 1886000C */  jal        GAL_Free
    /* 84B24 80094B24 00000000 */   nop
    /* 84B28 80094B28 FF004230 */  andi       $v0, $v0, 0xFF
    /* 84B2C 80094B2C 05004014 */  bnez       $v0, .L80094B44
    /* 84B30 80094B30 21200000 */   addu      $a0, $zero, $zero
    /* 84B34 80094B34 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84B38 80094B38 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84B3C 80094B3C A583000C */  jal        DBG_Error
    /* 84B40 80094B40 51070624 */   addiu     $a2, $zero, 0x751
  .L80094B44:
    /* 84B44 80094B44 100030AE */  sw         $s0, 0x10($s1)
  .L80094B48:
    /* 84B48 80094B48 4C00248E */  lw         $a0, 0x4C($s1)
    /* 84B4C 80094B4C FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 84B50 80094B50 0B009010 */  beq        $a0, $s0, .L80094B80
    /* 84B54 80094B54 00000000 */   nop
    /* 84B58 80094B58 1886000C */  jal        GAL_Free
    /* 84B5C 80094B5C 00000000 */   nop
    /* 84B60 80094B60 FF004230 */  andi       $v0, $v0, 0xFF
    /* 84B64 80094B64 05004014 */  bnez       $v0, .L80094B7C
    /* 84B68 80094B68 21200000 */   addu      $a0, $zero, $zero
    /* 84B6C 80094B6C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84B70 80094B70 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84B74 80094B74 A583000C */  jal        DBG_Error
    /* 84B78 80094B78 58070624 */   addiu     $a2, $zero, 0x758
  .L80094B7C:
    /* 84B7C 80094B7C 4C0030AE */  sw         $s0, 0x4C($s1)
  .L80094B80:
    /* 84B80 80094B80 2C02BF8F */  lw         $ra, 0x22C($sp)
    /* 84B84 80094B84 2802B48F */  lw         $s4, 0x228($sp)
    /* 84B88 80094B88 2402B38F */  lw         $s3, 0x224($sp)
    /* 84B8C 80094B8C 2002B28F */  lw         $s2, 0x220($sp)
    /* 84B90 80094B90 1C02B18F */  lw         $s1, 0x21C($sp)
    /* 84B94 80094B94 1802B08F */  lw         $s0, 0x218($sp)
    /* 84B98 80094B98 3002BD27 */  addiu      $sp, $sp, 0x230
    /* 84B9C 80094B9C 0800E003 */  jr         $ra
    /* 84BA0 80094BA0 00000000 */   nop
endlabel Load__7CScreeniii
