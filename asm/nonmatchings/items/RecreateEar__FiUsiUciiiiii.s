.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreateEar__FiUsiUciiiiii, 0x200

glabel RecreateEar__FiUsiUciiiiii
    /* 35008 80045008 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 3500C 8004500C 2118C000 */  addu       $v1, $a2, $zero
    /* 35010 80045010 3000B6AF */  sw         $s6, 0x30($sp)
    /* 35014 80045014 21B0E000 */  addu       $s6, $a3, $zero
    /* 35018 80045018 3800BEAF */  sw         $fp, 0x38($sp)
    /* 3501C 8004501C 21F0A000 */  addu       $fp, $a1, $zero
    /* 35020 80045020 1800B0AF */  sw         $s0, 0x18($sp)
    /* 35024 80045024 C0800400 */  sll        $s0, $a0, 3
    /* 35028 80045028 23800402 */  subu       $s0, $s0, $a0
    /* 3502C 8004502C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 35030 80045030 5000B28F */  lw         $s2, 0x50($sp)
    /* 35034 80045034 80801000 */  sll        $s0, $s0, 2
    /* 35038 80045038 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3503C 8004503C 5400B38F */  lw         $s3, 0x54($sp)
    /* 35040 80045040 23800402 */  subu       $s0, $s0, $a0
    /* 35044 80045044 2800B4AF */  sw         $s4, 0x28($sp)
    /* 35048 80045048 5800B48F */  lw         $s4, 0x58($sp)
    /* 3504C 8004504C 80801000 */  sll        $s0, $s0, 2
    /* 35050 80045050 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 35054 80045054 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 35058 80045058 0D80043C */  lui        $a0, %hi(item)
    /* 3505C 8004505C 541D8424 */  addiu      $a0, $a0, %lo(item)
    /* 35060 80045060 3400B7AF */  sw         $s7, 0x34($sp)
    /* 35064 80045064 6000B78F */  lw         $s7, 0x60($sp)
    /* 35068 80045068 21200402 */  addu       $a0, $s0, $a0
    /* 3506C 8004506C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 35070 80045070 6400B18F */  lw         $s1, 0x64($sp)
    /* 35074 80045074 17000524 */  addiu      $a1, $zero, 0x17
    /* 35078 80045078 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 3507C 8004507C F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 35080 80045080 1000A3AF */   sw        $v1, 0x10($sp)
    /* 35084 80045084 02121E00 */  srl        $v0, $fp, 8
    /* 35088 80045088 7F004230 */  andi       $v0, $v0, 0x7F
    /* 3508C 8004508C 0D80013C */  lui        $at, %hi(tempstr)
    /* 35090 80045090 10EA22A0 */  sb         $v0, %lo(tempstr)($at)
    /* 35094 80045094 7F00C233 */  andi       $v0, $fp, 0x7F
    /* 35098 80045098 1000A38F */  lw         $v1, 0x10($sp)
    /* 3509C 8004509C 7F00D632 */  andi       $s6, $s6, 0x7F
    /* 350A0 800450A0 0D80013C */  lui        $at, %hi(tempstr + 0x1)
    /* 350A4 800450A4 11EA22A0 */  sb         $v0, %lo(tempstr + 0x1)($at)
    /* 350A8 800450A8 0D80013C */  lui        $at, %hi(tempstr + 0x6)
    /* 350AC 800450AC 16EA36A0 */  sb         $s6, %lo(tempstr + 0x6)($at)
    /* 350B0 800450B0 0D80013C */  lui        $at, %hi(tempstr + 0x10)
    /* 350B4 800450B4 20EA20A0 */  sb         $zero, %lo(tempstr + 0x10)($at)
    /* 350B8 800450B8 03160300 */  sra        $v0, $v1, 24
    /* 350BC 800450BC 7F004230 */  andi       $v0, $v0, 0x7F
    /* 350C0 800450C0 0D80013C */  lui        $at, %hi(tempstr + 0x2)
    /* 350C4 800450C4 12EA22A0 */  sb         $v0, %lo(tempstr + 0x2)($at)
    /* 350C8 800450C8 03140300 */  sra        $v0, $v1, 16
    /* 350CC 800450CC 7F004230 */  andi       $v0, $v0, 0x7F
    /* 350D0 800450D0 0D80013C */  lui        $at, %hi(tempstr + 0x3)
    /* 350D4 800450D4 13EA22A0 */  sb         $v0, %lo(tempstr + 0x3)($at)
    /* 350D8 800450D8 03120300 */  sra        $v0, $v1, 8
    /* 350DC 800450DC 7F004230 */  andi       $v0, $v0, 0x7F
    /* 350E0 800450E0 0D80013C */  lui        $at, %hi(tempstr + 0x4)
    /* 350E4 800450E4 14EA22A0 */  sb         $v0, %lo(tempstr + 0x4)($at)
    /* 350E8 800450E8 7F006230 */  andi       $v0, $v1, 0x7F
    /* 350EC 800450EC 7F005232 */  andi       $s2, $s2, 0x7F
    /* 350F0 800450F0 7F007332 */  andi       $s3, $s3, 0x7F
    /* 350F4 800450F4 7F009432 */  andi       $s4, $s4, 0x7F
    /* 350F8 800450F8 7F00B532 */  andi       $s5, $s5, 0x7F
    /* 350FC 800450FC 0D80013C */  lui        $at, %hi(tempstr + 0x5)
    /* 35100 80045100 15EA22A0 */  sb         $v0, %lo(tempstr + 0x5)($at)
    /* 35104 80045104 03121700 */  sra        $v0, $s7, 8
    /* 35108 80045108 7F004230 */  andi       $v0, $v0, 0x7F
    /* 3510C 8004510C 0D80013C */  lui        $at, %hi(tempstr + 0xB)
    /* 35110 80045110 1BEA22A0 */  sb         $v0, %lo(tempstr + 0xB)($at)
    /* 35114 80045114 03161100 */  sra        $v0, $s1, 24
    /* 35118 80045118 7F004230 */  andi       $v0, $v0, 0x7F
    /* 3511C 8004511C 0D80013C */  lui        $at, %hi(tempstr + 0xC)
    /* 35120 80045120 1CEA22A0 */  sb         $v0, %lo(tempstr + 0xC)($at)
    /* 35124 80045124 03141100 */  sra        $v0, $s1, 16
    /* 35128 80045128 7F004230 */  andi       $v0, $v0, 0x7F
    /* 3512C 8004512C 0D80013C */  lui        $at, %hi(tempstr + 0xD)
    /* 35130 80045130 1DEA22A0 */  sb         $v0, %lo(tempstr + 0xD)($at)
    /* 35134 80045134 03121100 */  sra        $v0, $s1, 8
    /* 35138 80045138 7F004230 */  andi       $v0, $v0, 0x7F
    /* 3513C 8004513C 7F003132 */  andi       $s1, $s1, 0x7F
    /* 35140 80045140 0D80013C */  lui        $at, %hi(tempstr + 0xE)
    /* 35144 80045144 1EEA22A0 */  sb         $v0, %lo(tempstr + 0xE)($at)
    /* 35148 80045148 22010224 */  addiu      $v0, $zero, 0x122
    /* 3514C 8004514C 0D80013C */  lui        $at, %hi(tempstr + 0x7)
    /* 35150 80045150 17EA32A0 */  sb         $s2, %lo(tempstr + 0x7)($at)
    /* 35154 80045154 0D80013C */  lui        $at, %hi(tempstr + 0x8)
    /* 35158 80045158 18EA33A0 */  sb         $s3, %lo(tempstr + 0x8)($at)
    /* 3515C 8004515C 0D80013C */  lui        $at, %hi(tempstr + 0x9)
    /* 35160 80045160 19EA34A0 */  sb         $s4, %lo(tempstr + 0x9)($at)
    /* 35164 80045164 0D80013C */  lui        $at, %hi(tempstr + 0xA)
    /* 35168 80045168 1AEA35A0 */  sb         $s5, %lo(tempstr + 0xA)($at)
    /* 3516C 8004516C 0D80013C */  lui        $at, %hi(tempstr + 0xF)
    /* 35170 80045170 1FEA31A0 */  sb         $s1, %lo(tempstr + 0xF)($at)
    /* 35174 80045174 0D80013C */  lui        $at, %hi(item + 0x26)
    /* 35178 80045178 21083000 */  addu       $at, $at, $s0
    /* 3517C 8004517C 7A1D22A4 */  sh         $v0, %lo(item + 0x26)($at)
    /* 35180 80045180 83111700 */  sra        $v0, $s7, 6
    /* 35184 80045184 03004230 */  andi       $v0, $v0, 0x3
    /* 35188 80045188 13004224 */  addiu      $v0, $v0, 0x13
    /* 3518C 8004518C 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 35190 80045190 21083000 */  addu       $at, $at, $s0
    /* 35194 80045194 A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
    /* 35198 80045198 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 3519C 8004519C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 351A0 800451A0 3F00F732 */  andi       $s7, $s7, 0x3F
    /* 351A4 800451A4 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 351A8 800451A8 21083000 */  addu       $at, $at, $s0
    /* 351AC 800451AC 681D37AC */  sw         $s7, %lo(item + 0x14)($at)
    /* 351B0 800451B0 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 351B4 800451B4 21083000 */  addu       $at, $at, $s0
    /* 351B8 800451B8 781D3EA4 */  sh         $fp, %lo(item + 0x24)($at)
    /* 351BC 800451BC 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 351C0 800451C0 21083000 */  addu       $at, $at, $s0
    /* 351C4 800451C4 641D23AC */  sw         $v1, %lo(item + 0x10)($at)
    /* 351C8 800451C8 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 351CC 800451CC 21083000 */  addu       $at, $at, $s0
    /* 351D0 800451D0 B91D22A0 */  sb         $v0, %lo(item + 0x65)($at)
    /* 351D4 800451D4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 351D8 800451D8 3800BE8F */  lw         $fp, 0x38($sp)
    /* 351DC 800451DC 3400B78F */  lw         $s7, 0x34($sp)
    /* 351E0 800451E0 3000B68F */  lw         $s6, 0x30($sp)
    /* 351E4 800451E4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 351E8 800451E8 2800B48F */  lw         $s4, 0x28($sp)
    /* 351EC 800451EC 2400B38F */  lw         $s3, 0x24($sp)
    /* 351F0 800451F0 2000B28F */  lw         $s2, 0x20($sp)
    /* 351F4 800451F4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 351F8 800451F8 1800B08F */  lw         $s0, 0x18($sp)
    /* 351FC 800451FC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 35200 80045200 0800E003 */  jr         $ra
    /* 35204 80045204 00000000 */   nop
endlabel RecreateEar__FiUsiUciiiiii
