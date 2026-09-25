.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ApocInit__11SPELLFX_DATP12PlayerStruct, 0x1E8

glabel ApocInit__11SPELLFX_DATP12PlayerStruct
    /* 90498 800A0498 A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 9049C 800A049C 4800B2AF */  sw         $s2, 0x48($sp)
    /* 904A0 800A04A0 21908000 */  addu       $s2, $a0, $zero
    /* 904A4 800A04A4 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 904A8 800A04A8 2198A000 */  addu       $s3, $a1, $zero
    /* 904AC 800A04AC 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 904B0 800A04B0 5800B6AF */  sw         $s6, 0x58($sp)
    /* 904B4 800A04B4 5400B5AF */  sw         $s5, 0x54($sp)
    /* 904B8 800A04B8 5000B4AF */  sw         $s4, 0x50($sp)
    /* 904BC 800A04BC 4400B1AF */  sw         $s1, 0x44($sp)
    /* 904C0 800A04C0 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 904C4 800A04C4 4000B0AF */   sw        $s0, 0x40($sp)
    /* 904C8 800A04C8 6210063C */  lui        $a2, (0x10624DD3 >> 16)
    /* 904CC 800A04CC 3C006382 */  lb         $v1, 0x3C($s3)
    /* 904D0 800A04D0 D34DC634 */  ori        $a2, $a2, (0x10624DD3 & 0xFFFF)
    /* 904D4 800A04D4 80280300 */  sll        $a1, $v1, 2
    /* 904D8 800A04D8 2128A300 */  addu       $a1, $a1, $v1
    /* 904DC 800A04DC C0280500 */  sll        $a1, $a1, 3
    /* 904E0 800A04E0 2328A300 */  subu       $a1, $a1, $v1
    /* 904E4 800A04E4 00290500 */  sll        $a1, $a1, 4
    /* 904E8 800A04E8 2128A300 */  addu       $a1, $a1, $v1
    /* 904EC 800A04EC 1800A600 */  mult       $a1, $a2
    /* 904F0 800A04F0 21B04000 */  addu       $s6, $v0, $zero
    /* 904F4 800A04F4 3D006482 */  lb         $a0, 0x3D($s3)
    /* 904F8 800A04F8 30006286 */  lh         $v0, 0x30($s3)
    /* 904FC 800A04FC 80180400 */  sll        $v1, $a0, 2
    /* 90500 800A0500 21186400 */  addu       $v1, $v1, $a0
    /* 90504 800A0504 C0180300 */  sll        $v1, $v1, 3
    /* 90508 800A0508 23186400 */  subu       $v1, $v1, $a0
    /* 9050C 800A050C 00190300 */  sll        $v1, $v1, 4
    /* 90510 800A0510 21186400 */  addu       $v1, $v1, $a0
    /* 90514 800A0514 0E80043C */  lui        $a0, %hi(plr)
    /* 90518 800A0518 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 9051C 800A051C 10380000 */  mfhi       $a3
    /* 90520 800A0520 26206402 */  xor        $a0, $s3, $a0
    /* 90524 800A0524 2B200400 */  sltu       $a0, $zero, $a0
    /* 90528 800A0528 18006600 */  mult       $v1, $a2
    /* 9052C 800A052C C32F0500 */  sra        $a1, $a1, 31
    /* 90530 800A0530 80880200 */  sll        $s1, $v0, 2
    /* 90534 800A0534 21882202 */  addu       $s1, $s1, $v0
    /* 90538 800A0538 32006286 */  lh         $v0, 0x32($s3)
    /* 9053C 800A053C 80881100 */  sll        $s1, $s1, 2
    /* 90540 800A0540 80800200 */  sll        $s0, $v0, 2
    /* 90544 800A0544 21800202 */  addu       $s0, $s0, $v0
    /* 90548 800A0548 80801000 */  sll        $s0, $s0, 2
    /* 9054C 800A054C 83A90700 */  sra        $s5, $a3, 6
    /* 90550 800A0550 23A8A502 */  subu       $s5, $s5, $a1
    /* 90554 800A0554 C31F0300 */  sra        $v1, $v1, 31
    /* 90558 800A0558 10480000 */  mfhi       $t1
    /* 9055C 800A055C 83A10900 */  sra        $s4, $t1, 6
    /* 90560 800A0560 4A82020C */  jal        GetPlayer__7CPlayeri_800a0928
    /* 90564 800A0564 23A08302 */   subu      $s4, $s4, $v1
    /* 90568 800A0568 5E82020C */  jal        GetLastOtPos__C7CPlayer_800a0978
    /* 9056C 800A056C 21204000 */   addu      $a0, $v0, $zero
    /* 90570 800A0570 2120C002 */  addu       $a0, $s6, $zero
    /* 90574 800A0574 30006386 */  lh         $v1, 0x30($s3)
    /* 90578 800A0578 0A003126 */  addiu      $s1, $s1, 0xA
    /* 9057C 800A057C 2C0043AE */  sw         $v1, 0x2C($s2)
    /* 90580 800A0580 32006586 */  lh         $a1, 0x32($s3)
    /* 90584 800A0584 0A001026 */  addiu      $s0, $s0, 0xA
    /* 90588 800A0588 1C0055AE */  sw         $s5, 0x1C($s2)
    /* 9058C 800A058C 1C00438E */  lw         $v1, 0x1C($s2)
    /* 90590 800A0590 01001324 */  addiu      $s3, $zero, 0x1
    /* 90594 800A0594 140051AE */  sw         $s1, 0x14($s2)
    /* 90598 800A0598 180050AE */  sw         $s0, 0x18($s2)
    /* 9059C 800A059C 200054AE */  sw         $s4, 0x20($s2)
    /* 905A0 800A05A0 000053AE */  sw         $s3, 0x0($s2)
    /* 905A4 800A05A4 300045AE */  sw         $a1, 0x30($s2)
    /* 905A8 800A05A8 1000A3AF */  sw         $v1, 0x10($sp)
    /* 905AC 800A05AC 2000438E */  lw         $v1, 0x20($s2)
    /* 905B0 800A05B0 21884000 */  addu       $s1, $v0, $zero
    /* 905B4 800A05B4 1400A3AF */  sw         $v1, 0x14($sp)
    /* 905B8 800A05B8 1400468E */  lw         $a2, 0x14($s2)
    /* 905BC 800A05BC 1800478E */  lw         $a3, 0x18($s2)
    /* 905C0 800A05C0 1746020C */  jal        GetScrXY__7CBlocksR4RECTiiii
    /* 905C4 800A05C4 3800A527 */   addiu     $a1, $sp, 0x38
    /* 905C8 800A05C8 FF000624 */  addiu      $a2, $zero, 0xFF
    /* 905CC 800A05CC FF000724 */  addiu      $a3, $zero, 0xFF
    /* 905D0 800A05D0 40001024 */  addiu      $s0, $zero, 0x40
    /* 905D4 800A05D4 3800A287 */  lh         $v0, 0x38($sp)
    /* 905D8 800A05D8 02003126 */  addiu      $s1, $s1, 0x2
    /* 905DC 800A05DC 240042AE */  sw         $v0, 0x24($s2)
    /* 905E0 800A05E0 2400448E */  lw         $a0, 0x24($s2)
    /* 905E4 800A05E4 3A00A287 */  lh         $v0, 0x3A($sp)
    /* 905E8 800A05E8 FEFF8424 */  addiu      $a0, $a0, -0x2
    /* 905EC 800A05EC E2FF4524 */  addiu      $a1, $v0, -0x1E
    /* 905F0 800A05F0 E0FF4224 */  addiu      $v0, $v0, -0x20
    /* 905F4 800A05F4 280042AE */  sw         $v0, 0x28($s2)
    /* 905F8 800A05F8 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 905FC 800A05FC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 90600 800A0600 20000224 */  addiu      $v0, $zero, 0x20
    /* 90604 800A0604 1400A2AF */  sw         $v0, 0x14($sp)
    /* 90608 800A0608 08000224 */  addiu      $v0, $zero, 0x8
    /* 9060C 800A060C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 90610 800A0610 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 90614 800A0614 2000A0AF */  sw         $zero, 0x20($sp)
    /* 90618 800A0618 2400B1AF */  sw         $s1, 0x24($sp)
    /* 9061C 800A061C 2800B3AF */  sw         $s3, 0x28($sp)
    /* 90620 800A0620 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 90624 800A0624 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 90628 800A0628 3000A2AF */   sw        $v0, 0x30($sp)
    /* 9062C 800A062C 000A0624 */  addiu      $a2, $zero, 0xA00
    /* 90630 800A0630 000A0224 */  addiu      $v0, $zero, 0xA00
    /* 90634 800A0634 1000A2AF */  sw         $v0, 0x10($sp)
    /* 90638 800A0638 1400B0AF */  sw         $s0, 0x14($sp)
    /* 9063C 800A063C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 90640 800A0640 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 90644 800A0644 2C00448E */  lw         $a0, 0x2C($s2)
    /* 90648 800A0648 3000458E */  lw         $a1, 0x30($s2)
    /* 9064C 800A064C 502F010C */  jal        SetLightFX__FiisssUcUcUc
    /* 90650 800A0650 000A0724 */   addiu     $a3, $zero, 0xA00
    /* 90654 800A0654 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 90658 800A0658 5800B68F */  lw         $s6, 0x58($sp)
    /* 9065C 800A065C 5400B58F */  lw         $s5, 0x54($sp)
    /* 90660 800A0660 5000B48F */  lw         $s4, 0x50($sp)
    /* 90664 800A0664 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 90668 800A0668 4800B28F */  lw         $s2, 0x48($sp)
    /* 9066C 800A066C 4400B18F */  lw         $s1, 0x44($sp)
    /* 90670 800A0670 4000B08F */  lw         $s0, 0x40($sp)
    /* 90674 800A0674 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 90678 800A0678 0800E003 */  jr         $ra
    /* 9067C 800A067C 00000000 */   nop
endlabel ApocInit__11SPELLFX_DATP12PlayerStruct
