.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcPlrBookVals__Fi, 0x2E4

glabel CalcPlrBookVals__Fi
    /* 2F834 8003F834 1280023C */  lui        $v0, %hi(currlevel)
    /* 2F838 8003F838 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2F83C 8003F83C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 2F840 8003F840 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 2F844 8003F844 21888000 */  addu       $s1, $a0, $zero
    /* 2F848 8003F848 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 2F84C 8003F84C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 2F850 8003F850 2400B3AF */  sw         $s3, 0x24($sp)
    /* 2F854 8003F854 2000B2AF */  sw         $s2, 0x20($sp)
    /* 2F858 8003F858 25004014 */  bnez       $v0, .L8003F8F0
    /* 2F85C 8003F85C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 2F860 8003F860 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 2F864 8003F864 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 2F868 8003F868 00000000 */  nop
    /* 2F86C 8003F86C 00110300 */  sll        $v0, $v1, 4
    /* 2F870 8003F870 21104300 */  addu       $v0, $v0, $v1
    /* 2F874 8003F874 C0100200 */  sll        $v0, $v0, 3
    /* 2F878 8003F878 23104300 */  subu       $v0, $v0, $v1
    /* 2F87C 8003F87C 00110200 */  sll        $v0, $v0, 4
    /* 2F880 8003F880 0E80013C */  lui        $at, %hi(_witchitem + 0x98)
    /* 2F884 8003F884 21082200 */  addu       $at, $at, $v0
    /* 2F888 8003F888 B0FA2384 */  lh         $v1, %lo(_witchitem + 0x98)($at)
    /* 2F88C 8003F88C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2F890 8003F890 17006210 */  beq        $v1, $v0, .L8003F8F0
    /* 2F894 8003F894 01001224 */   addiu     $s2, $zero, 0x1
    /* 2F898 8003F898 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 2F89C 8003F89C 6C001024 */  addiu      $s0, $zero, 0x6C
  .L8003F8A0:
    /* 2F8A0 8003F8A0 1400422A */  slti       $v0, $s2, 0x14
    /* 2F8A4 8003F8A4 13004010 */  beqz       $v0, .L8003F8F4
    /* 2F8A8 8003F8A8 40181100 */   sll       $v1, $s1, 1
    /* 2F8AC 8003F8AC 6B21010C */  jal        WitchBookLevel__Fi
    /* 2F8B0 8003F8B0 21204002 */   addu      $a0, $s2, $zero
    /* 2F8B4 8003F8B4 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 2F8B8 8003F8B8 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 2F8BC 8003F8BC 6C001026 */  addiu      $s0, $s0, 0x6C
    /* 2F8C0 8003F8C0 00190200 */  sll        $v1, $v0, 4
    /* 2F8C4 8003F8C4 21186200 */  addu       $v1, $v1, $v0
    /* 2F8C8 8003F8C8 C0180300 */  sll        $v1, $v1, 3
    /* 2F8CC 8003F8CC 23186200 */  subu       $v1, $v1, $v0
    /* 2F8D0 8003F8D0 00190300 */  sll        $v1, $v1, 4
    /* 2F8D4 8003F8D4 21180302 */  addu       $v1, $s0, $v1
    /* 2F8D8 8003F8D8 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 2F8DC 8003F8DC 21082300 */  addu       $at, $at, $v1
    /* 2F8E0 8003F8E0 44FA2284 */  lh         $v0, %lo(_witchitem + 0x2C)($at)
    /* 2F8E4 8003F8E4 00000000 */  nop
    /* 2F8E8 8003F8E8 EDFF5314 */  bne        $v0, $s3, .L8003F8A0
    /* 2F8EC 8003F8EC 01005226 */   addiu     $s2, $s2, 0x1
  .L8003F8F0:
    /* 2F8F0 8003F8F0 40181100 */  sll        $v1, $s1, 1
  .L8003F8F4:
    /* 2F8F4 8003F8F4 21107100 */  addu       $v0, $v1, $s1
    /* 2F8F8 8003F8F8 80100200 */  sll        $v0, $v0, 2
    /* 2F8FC 8003F8FC 21805100 */  addu       $s0, $v0, $s1
    /* 2F900 8003F900 00111000 */  sll        $v0, $s0, 4
    /* 2F904 8003F904 23105100 */  subu       $v0, $v0, $s1
    /* 2F908 8003F908 80100200 */  sll        $v0, $v0, 2
    /* 2F90C 8003F90C 21105100 */  addu       $v0, $v0, $s1
    /* 2F910 8003F910 C0100200 */  sll        $v0, $v0, 3
    /* 2F914 8003F914 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2F918 8003F918 21082200 */  addu       $at, $at, $v0
    /* 2F91C 8003F91C BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 2F920 8003F920 00000000 */  nop
    /* 2F924 8003F924 73004018 */  blez       $v0, .L8003FAF4
    /* 2F928 8003F928 21900000 */   addu      $s2, $zero, $zero
    /* 2F92C 8003F92C 21A00002 */  addu       $s4, $s0, $zero
    /* 2F930 8003F930 21980000 */  addu       $s3, $zero, $zero
  .L8003F934:
    /* 2F934 8003F934 21107100 */  addu       $v0, $v1, $s1
    /* 2F938 8003F938 80100200 */  sll        $v0, $v0, 2
    /* 2F93C 8003F93C 21105100 */  addu       $v0, $v0, $s1
    /* 2F940 8003F940 00110200 */  sll        $v0, $v0, 4
    /* 2F944 8003F944 23105100 */  subu       $v0, $v0, $s1
    /* 2F948 8003F948 80100200 */  sll        $v0, $v0, 2
    /* 2F94C 8003F94C 21105100 */  addu       $v0, $v0, $s1
    /* 2F950 8003F950 C0280200 */  sll        $a1, $v0, 3
    /* 2F954 8003F954 21206502 */  addu       $a0, $s3, $a1
    /* 2F958 8003F958 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 2F95C 8003F95C 21082400 */  addu       $at, $at, $a0
    /* 2F960 8003F960 08AA2284 */  lh         $v0, %lo(plr + 0x4D0)($at)
    /* 2F964 8003F964 00000000 */  nop
    /* 2F968 8003F968 53004014 */  bnez       $v0, .L8003FAB8
    /* 2F96C 8003F96C 40181100 */   sll       $v1, $s1, 1
    /* 2F970 8003F970 0E80013C */  lui        $at, %hi(plr + 0x4F1)
    /* 2F974 8003F974 21082400 */  addu       $at, $at, $a0
    /* 2F978 8003F978 29AA2390 */  lbu        $v1, %lo(plr + 0x4F1)($at)
    /* 2F97C 8003F97C 18000224 */  addiu      $v0, $zero, 0x18
    /* 2F980 8003F980 4D006214 */  bne        $v1, $v0, .L8003FAB8
    /* 2F984 8003F984 40181100 */   sll       $v1, $s1, 1
    /* 2F988 8003F988 0E80013C */  lui        $at, %hi(plr + 0x4E1)
    /* 2F98C 8003F98C 21082400 */  addu       $at, $at, $a0
    /* 2F990 8003F990 19AA2380 */  lb         $v1, %lo(plr + 0x4E1)($at)
    /* 2F994 8003F994 00000000 */  nop
    /* 2F998 8003F998 40100300 */  sll        $v0, $v1, 1
    /* 2F99C 8003F99C 21104300 */  addu       $v0, $v0, $v1
    /* 2F9A0 8003F9A0 80100200 */  sll        $v0, $v0, 2
    /* 2F9A4 8003F9A4 21104300 */  addu       $v0, $v0, $v1
    /* 2F9A8 8003F9A8 80100200 */  sll        $v0, $v0, 2
    /* 2F9AC 8003F9AC 0E80013C */  lui        $at, %hi(spelldata + 0x18)
    /* 2F9B0 8003F9B0 21082200 */  addu       $at, $at, $v0
    /* 2F9B4 8003F9B4 98DB228C */  lw         $v0, %lo(spelldata + 0x18)($at)
    /* 2F9B8 8003F9B8 0E80013C */  lui        $at, %hi(plr + 0x4E1)
    /* 2F9BC 8003F9BC 21082400 */  addu       $at, $at, $a0
    /* 2F9C0 8003F9C0 19AA2380 */  lb         $v1, %lo(plr + 0x4E1)($at)
    /* 2F9C4 8003F9C4 0E80013C */  lui        $at, %hi(plr + 0x508)
    /* 2F9C8 8003F9C8 21082400 */  addu       $at, $at, $a0
    /* 2F9CC 8003F9CC 40AA22A0 */  sb         $v0, %lo(plr + 0x508)($at)
    /* 2F9D0 8003F9D0 0E80023C */  lui        $v0, %hi(plr + 0x71)
    /* 2F9D4 8003F9D4 A9A54224 */  addiu      $v0, $v0, %lo(plr + 0x71)
    /* 2F9D8 8003F9D8 2110A200 */  addu       $v0, $a1, $v0
    /* 2F9DC 8003F9DC 21104300 */  addu       $v0, $v0, $v1
    /* 2F9E0 8003F9E0 00004680 */  lb         $a2, 0x0($v0)
    /* 2F9E4 8003F9E4 00000000 */  nop
    /* 2F9E8 8003F9E8 2200C010 */  beqz       $a2, .L8003FA74
    /* 2F9EC 8003F9EC 21388000 */   addu      $a3, $a0, $zero
    /* 2F9F0 8003F9F0 6666083C */  lui        $t0, (0x66666667 >> 16)
    /* 2F9F4 8003F9F4 67660835 */  ori        $t0, $t0, (0x66666667 & 0xFFFF)
  .L8003F9F8:
    /* 2F9F8 8003F9F8 0E80013C */  lui        $at, %hi(plr + 0x508)
    /* 2F9FC 8003F9FC 21082700 */  addu       $at, $at, $a3
    /* 2FA00 8003FA00 40AA2590 */  lbu        $a1, %lo(plr + 0x508)($at)
    /* 2FA04 8003FA04 00000000 */  nop
    /* 2FA08 8003FA08 FF00A330 */  andi       $v1, $a1, 0xFF
    /* 2FA0C 8003FA0C 18006800 */  mult       $v1, $t0
    /* 2FA10 8003FA10 C31F0300 */  sra        $v1, $v1, 31
    /* 2FA14 8003FA14 10480000 */  mfhi       $t1
    /* 2FA18 8003FA18 43100900 */  sra        $v0, $t1, 1
    /* 2FA1C 8003FA1C 23104300 */  subu       $v0, $v0, $v1
    /* 2FA20 8003FA20 2128A200 */  addu       $a1, $a1, $v0
    /* 2FA24 8003FA24 FF00A430 */  andi       $a0, $a1, 0xFF
    /* 2FA28 8003FA28 18008800 */  mult       $a0, $t0
    /* 2FA2C 8003FA2C C31F0400 */  sra        $v1, $a0, 31
    /* 2FA30 8003FA30 0E80013C */  lui        $at, %hi(plr + 0x508)
    /* 2FA34 8003FA34 21082700 */  addu       $at, $at, $a3
    /* 2FA38 8003FA38 40AA25A0 */  sb         $a1, %lo(plr + 0x508)($at)
    /* 2FA3C 8003FA3C 10480000 */  mfhi       $t1
    /* 2FA40 8003FA40 43100900 */  sra        $v0, $t1, 1
    /* 2FA44 8003FA44 23104300 */  subu       $v0, $v0, $v1
    /* 2FA48 8003FA48 21208200 */  addu       $a0, $a0, $v0
    /* 2FA4C 8003FA4C 00018428 */  slti       $a0, $a0, 0x100
    /* 2FA50 8003FA50 06008014 */  bnez       $a0, .L8003FA6C
    /* 2FA54 8003FA54 FFFFC624 */   addiu     $a2, $a2, -0x1
    /* 2FA58 8003FA58 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 2FA5C 8003FA5C 0E80013C */  lui        $at, %hi(plr + 0x508)
    /* 2FA60 8003FA60 21082700 */  addu       $at, $at, $a3
    /* 2FA64 8003FA64 40AA22A0 */  sb         $v0, %lo(plr + 0x508)($at)
    /* 2FA68 8003FA68 21300000 */  addu       $a2, $zero, $zero
  .L8003FA6C:
    /* 2FA6C 8003FA6C E2FFC014 */  bnez       $a2, .L8003F9F8
    /* 2FA70 8003FA70 00000000 */   nop
  .L8003FA74:
    /* 2FA74 8003FA74 00811400 */  sll        $s0, $s4, 4
    /* 2FA78 8003FA78 23801102 */  subu       $s0, $s0, $s1
    /* 2FA7C 8003FA7C 80801000 */  sll        $s0, $s0, 2
    /* 2FA80 8003FA80 21801102 */  addu       $s0, $s0, $s1
    /* 2FA84 8003FA84 C0801000 */  sll        $s0, $s0, 3
    /* 2FA88 8003FA88 0E80053C */  lui        $a1, %hi(plr)
    /* 2FA8C 8003FA8C 38A5A524 */  addiu      $a1, $a1, %lo(plr)
    /* 2FA90 8003FA90 21200502 */  addu       $a0, $s0, $a1
    /* 2FA94 8003FA94 A404A524 */  addiu      $a1, $a1, 0x4A4
    /* 2FA98 8003FA98 21280502 */  addu       $a1, $s0, $a1
    /* 2FA9C 8003FA9C B7FD000C */  jal        ItemMinStats__FPC12PlayerStructPC10ItemStruct
    /* 2FAA0 8003FAA0 2128B300 */   addu      $a1, $a1, $s3
    /* 2FAA4 8003FAA4 21807002 */  addu       $s0, $s3, $s0
    /* 2FAA8 8003FAA8 0E80013C */  lui        $at, %hi(plr + 0x50A)
    /* 2FAAC 8003FAAC 21083000 */  addu       $at, $at, $s0
    /* 2FAB0 8003FAB0 42AA22A0 */  sb         $v0, %lo(plr + 0x50A)($at)
    /* 2FAB4 8003FAB4 40181100 */  sll        $v1, $s1, 1
  .L8003FAB8:
    /* 2FAB8 8003FAB8 21107100 */  addu       $v0, $v1, $s1
    /* 2FABC 8003FABC 80100200 */  sll        $v0, $v0, 2
    /* 2FAC0 8003FAC0 21105100 */  addu       $v0, $v0, $s1
    /* 2FAC4 8003FAC4 00110200 */  sll        $v0, $v0, 4
    /* 2FAC8 8003FAC8 23105100 */  subu       $v0, $v0, $s1
    /* 2FACC 8003FACC 80100200 */  sll        $v0, $v0, 2
    /* 2FAD0 8003FAD0 21105100 */  addu       $v0, $v0, $s1
    /* 2FAD4 8003FAD4 C0100200 */  sll        $v0, $v0, 3
    /* 2FAD8 8003FAD8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2FADC 8003FADC 21082200 */  addu       $at, $at, $v0
    /* 2FAE0 8003FAE0 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 2FAE4 8003FAE4 01005226 */  addiu      $s2, $s2, 0x1
    /* 2FAE8 8003FAE8 2A104202 */  slt        $v0, $s2, $v0
    /* 2FAEC 8003FAEC 91FF4014 */  bnez       $v0, .L8003F934
    /* 2FAF0 8003FAF0 6C007326 */   addiu     $s3, $s3, 0x6C
  .L8003FAF4:
    /* 2FAF4 8003FAF4 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 2FAF8 8003FAF8 2800B48F */  lw         $s4, 0x28($sp)
    /* 2FAFC 8003FAFC 2400B38F */  lw         $s3, 0x24($sp)
    /* 2FB00 8003FB00 2000B28F */  lw         $s2, 0x20($sp)
    /* 2FB04 8003FB04 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2FB08 8003FB08 1800B08F */  lw         $s0, 0x18($sp)
    /* 2FB0C 8003FB0C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 2FB10 8003FB10 0800E003 */  jr         $ra
    /* 2FB14 8003FB14 00000000 */   nop
endlabel CalcPlrBookVals__Fi
