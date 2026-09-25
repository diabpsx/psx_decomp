.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTownerInfo__FilUciiici, 0x158

glabel InitTownerInfo__FilUciiici
    /* 2A04C 8003A04C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 2A050 8003A050 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2A054 8003A054 21A08000 */  addu       $s4, $a0, $zero
    /* 2A058 8003A058 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2A05C 8003A05C 2190A000 */  addu       $s2, $a1, $zero
    /* 2A060 8003A060 3000BEAF */  sw         $fp, 0x30($sp)
    /* 2A064 8003A064 21F0E000 */  addu       $fp, $a3, $zero
    /* 2A068 8003A068 2400B5AF */  sw         $s5, 0x24($sp)
    /* 2A06C 8003A06C 21A8C000 */  addu       $s5, $a2, $zero
    /* 2A070 8003A070 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2A074 8003A074 40801400 */  sll        $s0, $s4, 1
    /* 2A078 8003A078 21801402 */  addu       $s0, $s0, $s4
    /* 2A07C 8003A07C 00811000 */  sll        $s0, $s0, 4
    /* 2A080 8003A080 21801402 */  addu       $s0, $s0, $s4
    /* 2A084 8003A084 80801000 */  sll        $s0, $s0, 2
    /* 2A088 8003A088 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2A08C 8003A08C 4800B38F */  lw         $s3, 0x48($sp)
    /* 2A090 8003A090 0D80043C */  lui        $a0, %hi(towner)
    /* 2A094 8003A094 80FE8424 */  addiu      $a0, $a0, %lo(towner)
    /* 2A098 8003A098 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2A09C 8003A09C 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 2A0A0 8003A0A0 21200402 */  addu       $a0, $s0, $a0
    /* 2A0A4 8003A0A4 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 2A0A8 8003A0A8 5400B78F */  lw         $s7, 0x54($sp)
    /* 2A0AC 8003A0AC 21280000 */  addu       $a1, $zero, $zero
    /* 2A0B0 8003A0B0 2800B6AF */  sw         $s6, 0x28($sp)
    /* 2A0B4 8003A0B4 5000B693 */  lbu        $s6, 0x50($sp)
    /* 2A0B8 8003A0B8 3400BFAF */  sw         $ra, 0x34($sp)
    /* 2A0BC 8003A0BC E940000C */  jal        memset
    /* 2A0C0 8003A0C0 C4000624 */   addiu     $a2, $zero, 0xC4
    /* 2A0C4 8003A0C4 0D80013C */  lui        $at, %hi(towner + 0x3C)
    /* 2A0C8 8003A0C8 21083000 */  addu       $at, $at, $s0
    /* 2A0CC 8003A0CC BCFE32AC */  sw         $s2, %lo(towner + 0x3C)($at)
    /* 2A0D0 8003A0D0 C0FF5226 */  addiu      $s2, $s2, -0x40
    /* 2A0D4 8003A0D4 43901200 */  sra        $s2, $s2, 1
    /* 2A0D8 8003A0D8 01009426 */  addiu      $s4, $s4, 0x1
    /* 2A0DC 8003A0DC 0D80013C */  lui        $at, %hi(towner + 0x50)
    /* 2A0E0 8003A0E0 21083000 */  addu       $at, $at, $s0
    /* 2A0E4 8003A0E4 D0FE35A0 */  sb         $s5, %lo(towner + 0x50)($at)
    /* 2A0E8 8003A0E8 0D80013C */  lui        $at, %hi(towner + 0x40)
    /* 2A0EC 8003A0EC 21083000 */  addu       $at, $at, $s0
    /* 2A0F0 8003A0F0 C0FE32AC */  sw         $s2, %lo(towner + 0x40)($at)
    /* 2A0F4 8003A0F4 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2A0F8 8003A0F8 21083000 */  addu       $at, $at, $s0
    /* 2A0FC 8003A0FC D1FE20A0 */  sb         $zero, %lo(towner + 0x51)($at)
    /* 2A100 8003A100 0D80013C */  lui        $at, %hi(towner + 0x4)
    /* 2A104 8003A104 21083000 */  addu       $at, $at, $s0
    /* 2A108 8003A108 84FE3EAC */  sw         $fp, %lo(towner + 0x4)($at)
    /* 2A10C 8003A10C 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2A110 8003A110 21083000 */  addu       $at, $at, $s0
    /* 2A114 8003A114 8CFE31AC */  sw         $s1, %lo(towner + 0xC)($at)
    /* 2A118 8003A118 C0881100 */  sll        $s1, $s1, 3
    /* 2A11C 8003A11C C0101300 */  sll        $v0, $s3, 3
    /* 2A120 8003A120 23105300 */  subu       $v0, $v0, $s3
    /* 2A124 8003A124 C0110200 */  sll        $v0, $v0, 7
    /* 2A128 8003A128 21882202 */  addu       $s1, $s1, $v0
    /* 2A12C 8003A12C 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2A130 8003A130 21083000 */  addu       $at, $at, $s0
    /* 2A134 8003A134 88FE33AC */  sw         $s3, %lo(towner + 0x8)($at)
    /* 2A138 8003A138 0E80013C */  lui        $at, %hi(dung_map)
    /* 2A13C 8003A13C 21083100 */  addu       $at, $at, $s1
    /* 2A140 8003A140 287A34A4 */  sh         $s4, %lo(dung_map)($at)
    /* 2A144 8003A144 0D80013C */  lui        $at, %hi(towner + 0x38)
    /* 2A148 8003A148 21083000 */  addu       $at, $at, $s0
    /* 2A14C 8003A14C B8FE36A0 */  sb         $s6, %lo(towner + 0x38)($at)
    /* 2A150 8003A150 0D80013C */  lui        $at, %hi(towner + 0x44)
    /* 2A154 8003A154 21083000 */  addu       $at, $at, $s0
    /* 2A158 8003A158 C4FE37AC */  sw         $s7, %lo(towner + 0x44)($at)
    /* 2A15C 8003A15C B7F6000C */  jal        GetRndSeed__Fv
    /* 2A160 8003A160 00000000 */   nop
    /* 2A164 8003A164 0D80013C */  lui        $at, %hi(towner + 0x84)
    /* 2A168 8003A168 21083000 */  addu       $at, $at, $s0
    /* 2A16C 8003A16C 04FF22AC */  sw         $v0, %lo(towner + 0x84)($at)
    /* 2A170 8003A170 3400BF8F */  lw         $ra, 0x34($sp)
    /* 2A174 8003A174 3000BE8F */  lw         $fp, 0x30($sp)
    /* 2A178 8003A178 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 2A17C 8003A17C 2800B68F */  lw         $s6, 0x28($sp)
    /* 2A180 8003A180 2400B58F */  lw         $s5, 0x24($sp)
    /* 2A184 8003A184 2000B48F */  lw         $s4, 0x20($sp)
    /* 2A188 8003A188 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 2A18C 8003A18C 1800B28F */  lw         $s2, 0x18($sp)
    /* 2A190 8003A190 1400B18F */  lw         $s1, 0x14($sp)
    /* 2A194 8003A194 1000B08F */  lw         $s0, 0x10($sp)
    /* 2A198 8003A198 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 2A19C 8003A19C 0800E003 */  jr         $ra
    /* 2A1A0 8003A1A0 00000000 */   nop
endlabel InitTownerInfo__FilUciiici
