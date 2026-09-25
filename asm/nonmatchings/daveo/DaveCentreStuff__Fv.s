.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DaveCentreStuff__Fv, 0x148

glabel DaveCentreStuff__Fv
    /* 747D4 800847D4 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 747D8 800847D8 5400B1AF */  sw         $s1, 0x54($sp)
    /* 747DC 800847DC 0C80113C */  lui        $s1, %hi(MediumFont)
    /* 747E0 800847E0 D8823126 */  addiu      $s1, $s1, %lo(MediumFont)
    /* 747E4 800847E4 21202002 */  addu       $a0, $s1, $zero
    /* 747E8 800847E8 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 747EC 800847EC 7F000624 */  addiu      $a2, $zero, 0x7F
    /* 747F0 800847F0 6000BFAF */  sw         $ra, 0x60($sp)
    /* 747F4 800847F4 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 747F8 800847F8 5800B2AF */  sw         $s2, 0x58($sp)
    /* 747FC 800847FC C82A020C */  jal        SetChar__5CFontiUs
    /* 74800 80084800 5000B0AF */   sw        $s0, 0x50($sp)
    /* 74804 80084804 21202002 */  addu       $a0, $s1, $zero
    /* 74808 80084808 9B000524 */  addiu      $a1, $zero, 0x9B
    /* 7480C 8008480C 69000624 */  addiu      $a2, $zero, 0x69
    /* 74810 80084810 1280123C */  lui        $s2, %hi(D_8011AB10)
    /* 74814 80084814 10AB5226 */  addiu      $s2, $s2, %lo(D_8011AB10)
    /* 74818 80084818 1280133C */  lui        $s3, %hi(WHITER)
    /* 7481C 8008481C D1AB7392 */  lbu        $s3, %lo(WHITER)($s3)
    /* 74820 80084820 1280103C */  lui        $s0, %hi(WHITEG)
    /* 74824 80084824 D2AB1092 */  lbu        $s0, %lo(WHITEG)($s0)
    /* 74828 80084828 21384002 */  addu       $a3, $s2, $zero
    /* 7482C 8008482C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 74830 80084830 1400A0AF */  sw         $zero, 0x14($sp)
    /* 74834 80084834 1800B3AF */  sw         $s3, 0x18($sp)
    /* 74838 80084838 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 7483C 8008483C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 74840 80084840 2000B0AF */   sw        $s0, 0x20($sp)
    /* 74844 80084844 21202002 */  addu       $a0, $s1, $zero
    /* 74848 80084848 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 7484C 8008484C C82A020C */  jal        SetChar__5CFontiUs
    /* 74850 80084850 80000624 */   addiu     $a2, $zero, 0x80
    /* 74854 80084854 21202002 */  addu       $a0, $s1, $zero
    /* 74858 80084858 9B000524 */  addiu      $a1, $zero, 0x9B
    /* 7485C 8008485C 8E000624 */  addiu      $a2, $zero, 0x8E
    /* 74860 80084860 21384002 */  addu       $a3, $s2, $zero
    /* 74864 80084864 1000A0AF */  sw         $zero, 0x10($sp)
    /* 74868 80084868 1400A0AF */  sw         $zero, 0x14($sp)
    /* 7486C 8008486C 1800B3AF */  sw         $s3, 0x18($sp)
    /* 74870 80084870 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 74874 80084874 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 74878 80084878 2000B0AF */   sw        $s0, 0x20($sp)
    /* 7487C 8008487C 21202002 */  addu       $a0, $s1, $zero
    /* 74880 80084880 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 74884 80084884 C82A020C */  jal        SetChar__5CFontiUs
    /* 74888 80084888 81000624 */   addiu     $a2, $zero, 0x81
    /* 7488C 8008488C 21202002 */  addu       $a0, $s1, $zero
    /* 74890 80084890 8B000524 */  addiu      $a1, $zero, 0x8B
    /* 74894 80084894 7E000624 */  addiu      $a2, $zero, 0x7E
    /* 74898 80084898 21384002 */  addu       $a3, $s2, $zero
    /* 7489C 8008489C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 748A0 800848A0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 748A4 800848A4 1800B3AF */  sw         $s3, 0x18($sp)
    /* 748A8 800848A8 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 748AC 800848AC 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 748B0 800848B0 2000B0AF */   sw        $s0, 0x20($sp)
    /* 748B4 800848B4 21202002 */  addu       $a0, $s1, $zero
    /* 748B8 800848B8 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 748BC 800848BC C82A020C */  jal        SetChar__5CFontiUs
    /* 748C0 800848C0 82000624 */   addiu     $a2, $zero, 0x82
    /* 748C4 800848C4 21202002 */  addu       $a0, $s1, $zero
    /* 748C8 800848C8 B0000524 */  addiu      $a1, $zero, 0xB0
    /* 748CC 800848CC 7D000624 */  addiu      $a2, $zero, 0x7D
    /* 748D0 800848D0 21384002 */  addu       $a3, $s2, $zero
    /* 748D4 800848D4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 748D8 800848D8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 748DC 800848DC 1800B3AF */  sw         $s3, 0x18($sp)
    /* 748E0 800848E0 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 748E4 800848E4 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 748E8 800848E8 2000B0AF */   sw        $s0, 0x20($sp)
    /* 748EC 800848EC 21202002 */  addu       $a0, $s1, $zero
    /* 748F0 800848F0 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 748F4 800848F4 C82A020C */  jal        SetChar__5CFontiUs
    /* 748F8 800848F8 6D000624 */   addiu     $a2, $zero, 0x6D
    /* 748FC 800848FC 6000BF8F */  lw         $ra, 0x60($sp)
    /* 74900 80084900 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 74904 80084904 5800B28F */  lw         $s2, 0x58($sp)
    /* 74908 80084908 5400B18F */  lw         $s1, 0x54($sp)
    /* 7490C 8008490C 5000B08F */  lw         $s0, 0x50($sp)
    /* 74910 80084910 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 74914 80084914 0800E003 */  jr         $ra
    /* 74918 80084918 00000000 */   nop
endlabel DaveCentreStuff__Fv
