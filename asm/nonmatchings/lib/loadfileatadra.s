.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching loadfileatadra, 0x124

glabel loadfileatadra
    /* 1987C 8002987C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 19880 80029880 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 19884 80029884 21888000 */  addu       $s1, $a0, $zero
    /* 19888 80029888 3400B3AF */  sw         $s3, 0x34($sp)
    /* 1988C 8002988C 2198A000 */  addu       $s3, $a1, $zero
    /* 19890 80029890 3000B2AF */  sw         $s2, 0x30($sp)
    /* 19894 80029894 2190C000 */  addu       $s2, $a2, $zero
    /* 19898 80029898 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1989C 8002989C E7A7000C */  jal        checkcacheadr
    /* 198A0 800298A0 2800B0AF */   sw        $s0, 0x28($sp)
    /* 198A4 800298A4 21804000 */  addu       $s0, $v0, $zero
    /* 198A8 800298A8 0B000012 */  beqz       $s0, .L800298D8
    /* 198AC 800298AC 21202002 */   addu      $a0, $s1, $zero
    /* 198B0 800298B0 E0AD000C */  jal        memsizeadr
    /* 198B4 800298B4 21200002 */   addu      $a0, $s0, $zero
    /* 198B8 800298B8 21200002 */  addu       $a0, $s0, $zero
    /* 198BC 800298BC 21286002 */  addu       $a1, $s3, $zero
    /* 198C0 800298C0 F1B1000C */  jal        blockmove
    /* 198C4 800298C4 21304000 */   addu      $a2, $v0, $zero
    /* 198C8 800298C8 B9AB000C */  jal        purgememadr
    /* 198CC 800298CC 21200002 */   addu      $a0, $s0, $zero
    /* 198D0 800298D0 60A60008 */  j          .L80029980
    /* 198D4 800298D4 21100002 */   addu      $v0, $s0, $zero
  .L800298D8:
    /* 198D8 800298D8 1800A527 */  addiu      $a1, $sp, 0x18
    /* 198DC 800298DC 1C00A627 */  addiu      $a2, $sp, 0x1C
    /* 198E0 800298E0 2000A727 */  addiu      $a3, $sp, 0x20
    /* 198E4 800298E4 86A2000C */  jal        openhandlea
    /* 198E8 800298E8 1000B2AF */   sw        $s2, 0x10($sp)
    /* 198EC 800298EC 2000A28F */  lw         $v0, 0x20($sp)
    /* 198F0 800298F0 00000000 */  nop
    /* 198F4 800298F4 21004010 */  beqz       $v0, .L8002997C
    /* 198F8 800298F8 00000000 */   nop
    /* 198FC 800298FC 1800A48F */  lw         $a0, 0x18($sp)
    /* 19900 80029900 8397000C */  jal        handlesector
    /* 19904 80029904 00000000 */   nop
    /* 19908 80029908 1280043C */  lui        $a0, %hi(asyncsector)
    /* 1990C 8002990C 64CA848C */  lw         $a0, %lo(asyncsector)($a0)
    /* 19910 80029910 98A6000C */  jal        returnseekmsecs
    /* 19914 80029914 21284000 */   addu      $a1, $v0, $zero
    /* 19918 80029918 2000A38F */  lw         $v1, 0x20($sp)
    /* 1991C 8002991C B9F2043C */  lui        $a0, (0xF2B9D649 >> 16)
    /* 19920 80029920 49D68434 */  ori        $a0, $a0, (0xF2B9D649 & 0xFFFF)
    /* 19924 80029924 18006400 */  mult       $v1, $a0
    /* 19928 80029928 10400000 */  mfhi       $t0
    /* 1992C 8002992C 21200301 */  addu       $a0, $t0, $v1
    /* 19930 80029930 03220400 */  sra        $a0, $a0, 8
    /* 19934 80029934 C31F0300 */  sra        $v1, $v1, 31
    /* 19938 80029938 23208300 */  subu       $a0, $a0, $v1
    /* 1993C 8002993C 7FA4000C */  jal        loadfiletopup
    /* 19940 80029940 21208200 */   addu      $a0, $a0, $v0
    /* 19944 80029944 1800A48F */  lw         $a0, 0x18($sp)
    /* 19948 80029948 2000A68F */  lw         $a2, 0x20($sp)
    /* 1994C 8002994C 8EA3000C */  jal        readhandle
    /* 19950 80029950 21286002 */   addu      $a1, $s3, $zero
    /* 19954 80029954 2000A28F */  lw         $v0, 0x20($sp)
    /* 19958 80029958 1800A48F */  lw         $a0, 0x18($sp)
    /* 1995C 8002995C 1280013C */  lui        $at, %hi(loadfilesize)
    /* 19960 80029960 A8C522AC */  sw         $v0, %lo(loadfilesize)($at)
    /* 19964 80029964 76A3000C */  jal        libclosehandle
    /* 19968 80029968 00000000 */   nop
    /* 1996C 8002996C 18A4000C */  jal        reserveioforstream
    /* 19970 80029970 00000000 */   nop
    /* 19974 80029974 60A60008 */  j          .L80029980
    /* 19978 80029978 21106002 */   addu      $v0, $s3, $zero
  .L8002997C:
    /* 1997C 8002997C 21100000 */  addu       $v0, $zero, $zero
  .L80029980:
    /* 19980 80029980 3800BF8F */  lw         $ra, 0x38($sp)
    /* 19984 80029984 3400B38F */  lw         $s3, 0x34($sp)
    /* 19988 80029988 3000B28F */  lw         $s2, 0x30($sp)
    /* 1998C 8002998C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 19990 80029990 2800B08F */  lw         $s0, 0x28($sp)
    /* 19994 80029994 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 19998 80029998 0800E003 */  jr         $ra
    /* 1999C 8002999C 00000000 */   nop
endlabel loadfileatadra
