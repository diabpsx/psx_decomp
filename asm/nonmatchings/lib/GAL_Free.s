.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_Free, 0xA8

glabel GAL_Free
    /* 11860 80021860 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 11864 80021864 1000B0AF */  sw         $s0, 0x10($sp)
    /* 11868 80021868 21808000 */  addu       $s0, $a0, $zero
    /* 1186C 8002186C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 11870 80021870 B686000C */  jal        IsActiveValidHandle
    /* 11874 80021874 1400B1AF */   sw        $s1, 0x14($sp)
    /* 11878 80021878 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1187C 8002187C 03004014 */  bnez       $v0, .L8002188C
    /* 11880 80021880 C0101000 */   sll       $v0, $s0, 3
    /* 11884 80021884 39860008 */  j          .L800218E4
    /* 11888 80021888 05000434 */   ori       $a0, $zero, 0x5
  .L8002188C:
    /* 1188C 8002188C 23105000 */  subu       $v0, $v0, $s0
    /* 11890 80021890 80100200 */  sll        $v0, $v0, 2
    /* 11894 80021894 1380033C */  lui        $v1, %hi(D_801325D0)
    /* 11898 80021898 D0256324 */  addiu      $v1, $v1, %lo(D_801325D0)
    /* 1189C 8002189C 21884300 */  addu       $s1, $v0, $v1
    /* 118A0 800218A0 12002496 */  lhu        $a0, 0x12($s1)
    /* 118A4 800218A4 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 118A8 800218A8 00000000 */   nop
    /* 118AC 800218AC 21804000 */  addu       $s0, $v0, $zero
    /* 118B0 800218B0 0B000012 */  beqz       $s0, .L800218E0
    /* 118B4 800218B4 24000426 */   addiu     $a0, $s0, 0x24
    /* 118B8 800218B8 0C00228E */  lw         $v0, 0xC($s1)
    /* 118BC 800218BC 1280013C */  lui        $at, %hi(D_8011C9E4)
    /* 118C0 800218C0 E4C922AC */  sw         $v0, %lo(D_8011C9E4)($at)
    /* 118C4 800218C4 A386000C */  jal        DetachHdrFromList
    /* 118C8 800218C8 21282002 */   addu      $a1, $s1, $zero
    /* 118CC 800218CC 21200002 */  addu       $a0, $s0, $zero
    /* 118D0 800218D0 3587000C */  jal        MergeToEmptyList
    /* 118D4 800218D4 21282002 */   addu      $a1, $s1, $zero
    /* 118D8 800218D8 3C860008 */  j          .L800218F0
    /* 118DC 800218DC 01000234 */   ori       $v0, $zero, 0x1
  .L800218E0:
    /* 118E0 800218E0 04000434 */  ori        $a0, $zero, 0x4
  .L800218E4:
    /* 118E4 800218E4 0389000C */  jal        GSetError
    /* 118E8 800218E8 00000000 */   nop
    /* 118EC 800218EC 21100000 */  addu       $v0, $zero, $zero
  .L800218F0:
    /* 118F0 800218F0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 118F4 800218F4 1400B18F */  lw         $s1, 0x14($sp)
    /* 118F8 800218F8 1000B08F */  lw         $s0, 0x10($sp)
    /* 118FC 800218FC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 11900 80021900 0800E003 */  jr         $ra
    /* 11904 80021904 00000000 */   nop
endlabel GAL_Free
