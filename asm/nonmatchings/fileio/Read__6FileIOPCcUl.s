.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Read__6FileIOPCcUl, 0x170

glabel Read__6FileIOPCcUl
    /* 75920 80085920 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 75924 80085924 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75928 80085928 21808000 */  addu       $s0, $a0, $zero
    /* 7592C 8008592C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 75930 80085930 2190A000 */  addu       $s2, $a1, $zero
    /* 75934 80085934 2000B4AF */  sw         $s4, 0x20($sp)
    /* 75938 80085938 21A0C000 */  addu       $s4, $a2, $zero
    /* 7593C 8008593C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 75940 80085940 0B80133C */  lui        $s3, %hi(_6FileIO_FileToLoad)
    /* 75944 80085944 70797326 */  addiu      $s3, $s3, %lo(_6FileIO_FileToLoad)
    /* 75948 80085948 21306002 */  addu       $a2, $s3, $zero
    /* 7594C 8008594C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 75950 80085950 7E17020C */  jal        FindFile__6FileIOPCcPc
    /* 75954 80085954 1400B1AF */   sw        $s1, 0x14($sp)
    /* 75958 80085958 01004238 */  xori       $v0, $v0, 0x1
    /* 7595C 8008595C 04004010 */  beqz       $v0, .L80085970
    /* 75960 80085960 00000000 */   nop
    /* 75964 80085964 21200002 */  addu       $a0, $s0, $zero
    /* 75968 80085968 BD16020C */  jal        FileNotFound__6FileIOPCc
    /* 7596C 8008596C 21284002 */   addu      $a1, $s2, $zero
  .L80085970:
    /* 75970 80085970 1000028E */  lw         $v0, 0x10($s0)
    /* 75974 80085974 21286002 */  addu       $a1, $s3, $zero
    /* 75978 80085978 20004484 */  lh         $a0, 0x20($v0)
    /* 7597C 8008597C 2400428C */  lw         $v0, 0x24($v0)
    /* 75980 80085980 00000000 */  nop
    /* 75984 80085984 09F84000 */  jalr       $v0
    /* 75988 80085988 21200402 */   addu      $a0, $s0, $a0
    /* 7598C 8008598C 21884000 */  addu       $s1, $v0, $zero
    /* 75990 80085990 07002016 */  bnez       $s1, .L800859B0
    /* 75994 80085994 21202002 */   addu      $a0, $s1, $zero
    /* 75998 80085998 21200000 */  addu       $a0, $zero, $zero
    /* 7599C 8008599C 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 759A0 800859A0 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 759A4 800859A4 A583000C */  jal        DBG_Error
    /* 759A8 800859A8 59000624 */   addiu     $a2, $zero, 0x59
    /* 759AC 800859AC 21202002 */  addu       $a0, $s1, $zero
  .L800859B0:
    /* 759B0 800859B0 21288002 */  addu       $a1, $s4, $zero
    /* 759B4 800859B4 7785000C */  jal        GAL_Alloc
    /* 759B8 800859B8 21304002 */   addu      $a2, $s2, $zero
    /* 759BC 800859BC 21884000 */  addu       $s1, $v0, $zero
    /* 759C0 800859C0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 759C4 800859C4 05002216 */  bne        $s1, $v0, .L800859DC
    /* 759C8 800859C8 21200000 */   addu      $a0, $zero, $zero
    /* 759CC 800859CC 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 759D0 800859D0 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 759D4 800859D4 A583000C */  jal        DBG_Error
    /* 759D8 800859D8 5C000624 */   addiu     $a2, $zero, 0x5C
  .L800859DC:
    /* 759DC 800859DC DD85000C */  jal        GAL_Lock
    /* 759E0 800859E0 21202002 */   addu      $a0, $s1, $zero
    /* 759E4 800859E4 06002016 */  bnez       $s1, .L80085A00
    /* 759E8 800859E8 21904000 */   addu      $s2, $v0, $zero
    /* 759EC 800859EC 21200000 */  addu       $a0, $zero, $zero
    /* 759F0 800859F0 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 759F4 800859F4 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 759F8 800859F8 A583000C */  jal        DBG_Error
    /* 759FC 800859FC 5F000624 */   addiu     $a2, $zero, 0x5F
  .L80085A00:
    /* 75A00 80085A00 1000028E */  lw         $v0, 0x10($s0)
    /* 75A04 80085A04 21286002 */  addu       $a1, $s3, $zero
    /* 75A08 80085A08 20004484 */  lh         $a0, 0x20($v0)
    /* 75A0C 80085A0C 2400428C */  lw         $v0, 0x24($v0)
    /* 75A10 80085A10 00000000 */  nop
    /* 75A14 80085A14 09F84000 */  jalr       $v0
    /* 75A18 80085A18 21200402 */   addu      $a0, $s0, $a0
    /* 75A1C 80085A1C 21286002 */  addu       $a1, $s3, $zero
    /* 75A20 80085A20 21304002 */  addu       $a2, $s2, $zero
    /* 75A24 80085A24 1000038E */  lw         $v1, 0x10($s0)
    /* 75A28 80085A28 21384000 */  addu       $a3, $v0, $zero
    /* 75A2C 80085A2C 18006484 */  lh         $a0, 0x18($v1)
    /* 75A30 80085A30 1C00638C */  lw         $v1, 0x1C($v1)
    /* 75A34 80085A34 00000000 */  nop
    /* 75A38 80085A38 09F86000 */  jalr       $v1
    /* 75A3C 80085A3C 21200402 */   addu      $a0, $s0, $a0
    /* 75A40 80085A40 F785000C */  jal        GAL_Unlock
    /* 75A44 80085A44 21202002 */   addu      $a0, $s1, $zero
    /* 75A48 80085A48 FF004230 */  andi       $v0, $v0, 0xFF
    /* 75A4C 80085A4C 07004014 */  bnez       $v0, .L80085A6C
    /* 75A50 80085A50 21102002 */   addu      $v0, $s1, $zero
    /* 75A54 80085A54 21200000 */  addu       $a0, $zero, $zero
    /* 75A58 80085A58 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75A5C 80085A5C E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75A60 80085A60 A583000C */  jal        DBG_Error
    /* 75A64 80085A64 64000624 */   addiu     $a2, $zero, 0x64
    /* 75A68 80085A68 21102002 */  addu       $v0, $s1, $zero
  .L80085A6C:
    /* 75A6C 80085A6C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 75A70 80085A70 2000B48F */  lw         $s4, 0x20($sp)
    /* 75A74 80085A74 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 75A78 80085A78 1800B28F */  lw         $s2, 0x18($sp)
    /* 75A7C 80085A7C 1400B18F */  lw         $s1, 0x14($sp)
    /* 75A80 80085A80 1000B08F */  lw         $s0, 0x10($sp)
    /* 75A84 80085A84 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 75A88 80085A88 0800E003 */  jr         $ra
    /* 75A8C 80085A8C 00000000 */   nop
endlabel Read__6FileIOPCcUl
