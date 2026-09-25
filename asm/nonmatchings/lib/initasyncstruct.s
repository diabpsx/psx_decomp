.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initasyncstruct, 0x134

glabel initasyncstruct
    /* 13798 80023798 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1379C 8002379C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 137A0 800237A0 1380113C */  lui        $s1, %hi(D_8013504C)
    /* 137A4 800237A4 4C503126 */  addiu      $s1, $s1, %lo(D_8013504C)
    /* 137A8 800237A8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 137AC 800237AC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 137B0 800237B0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 137B4 800237B4 0000228E */  lw         $v0, 0x0($s1)
    /* 137B8 800237B8 2180A000 */  addu       $s0, $a1, $zero
    /* 137BC 800237BC 0E004010 */  beqz       $v0, .L800237F8
    /* 137C0 800237C0 2190C000 */   addu      $s2, $a2, $zero
    /* 137C4 800237C4 1180043C */  lui        $a0, %hi(D_8010E95C)
    /* 137C8 800237C8 5CE98424 */  addiu      $a0, $a0, %lo(D_8010E95C)
    /* 137CC 800237CC 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 137D0 800237D0 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 137D4 800237D4 1280013C */  lui        $at, %hi(abortfile)
    /* 137D8 800237D8 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 137DC 800237DC E9010224 */  addiu      $v0, $zero, 0x1E9
    /* 137E0 800237E0 1280013C */  lui        $at, %hi(abortline)
    /* 137E4 800237E4 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 137E8 800237E8 0F95000C */  jal        abortmessage
    /* 137EC 800237EC 00000000 */   nop
    /* 137F0 800237F0 2C8E0008 */  j          .L800238B0
    /* 137F4 800237F4 00000000 */   nop
  .L800237F8:
    /* 137F8 800237F8 40101000 */  sll        $v0, $s0, 1
    /* 137FC 800237FC 21105000 */  addu       $v0, $v0, $s0
    /* 13800 80023800 00290200 */  sll        $a1, $v0, 4
    /* 13804 80023804 2328A200 */  subu       $a1, $a1, $v0
    /* 13808 80023808 80280500 */  sll        $a1, $a1, 2
    /* 1380C 8002380C A0B1000C */  jal        blockclear
    /* 13810 80023810 000024AE */   sw        $a0, 0x0($s1)
    /* 13814 80023814 0000248E */  lw         $a0, 0x0($s1)
    /* 13818 80023818 21280002 */  addu       $a1, $s0, $zero
    /* 1381C 8002381C 1380013C */  lui        $at, %hi(async)
    /* 13820 80023820 485025AC */  sw         $a1, %lo(async)($at)
    /* 13824 80023824 0894000C */  jal        initasyncblocks
    /* 13828 80023828 00000000 */   nop
    /* 1382C 8002382C FF0F033C */  lui        $v1, (0xFFFF800 >> 16)
    /* 13830 80023830 00F86334 */  ori        $v1, $v1, (0xFFFF800 & 0xFFFF)
    /* 13834 80023834 0280043C */  lui        $a0, %hi(D_80024E68)
    /* 13838 80023838 684E8424 */  addiu      $a0, $a0, %lo(D_80024E68)
    /* 1383C 8002383C 0280053C */  lui        $a1, %hi(getasyncstatus)
    /* 13840 80023840 5842A524 */  addiu      $a1, $a1, %lo(getasyncstatus)
    /* 13844 80023844 01000224 */  addiu      $v0, $zero, 0x1
    /* 13848 80023848 24184302 */  and        $v1, $s2, $v1
    /* 1384C 8002384C 1380013C */  lui        $at, %hi(D_8013518C)
    /* 13850 80023850 8C5122AC */  sw         $v0, %lo(D_8013518C)($at)
    /* 13854 80023854 0E010224 */  addiu      $v0, $zero, 0x10E
    /* 13858 80023858 1380013C */  lui        $at, %hi(D_801351CC)
    /* 1385C 8002385C CC5122AC */  sw         $v0, %lo(D_801351CC)($at)
    /* 13860 80023860 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 13864 80023864 1380013C */  lui        $at, %hi(D_80135194)
    /* 13868 80023868 945123AC */  sw         $v1, %lo(D_80135194)($at)
    /* 1386C 8002386C 1380013C */  lui        $at, %hi(D_80135054)
    /* 13870 80023870 545022AC */  sw         $v0, %lo(D_80135054)($at)
    /* 13874 80023874 1380013C */  lui        $at, %hi(D_80135058)
    /* 13878 80023878 585022AC */  sw         $v0, %lo(D_80135058)($at)
    /* 1387C 8002387C 1380013C */  lui        $at, %hi(D_80135050)
    /* 13880 80023880 505022AC */  sw         $v0, %lo(D_80135050)($at)
    /* 13884 80023884 1380013C */  lui        $at, %hi(D_80135064)
    /* 13888 80023888 645020A0 */  sb         $zero, %lo(D_80135064)($at)
    /* 1388C 8002388C 1380013C */  lui        $at, %hi(D_801350F3)
    /* 13890 80023890 F35020A0 */  sb         $zero, %lo(D_801350F3)($at)
    /* 13894 80023894 1380013C */  lui        $at, %hi(D_80135184)
    /* 13898 80023898 845122AC */  sw         $v0, %lo(D_80135184)($at)
    /* 1389C 8002389C 1380013C */  lui        $at, %hi(D_80135190)
    /* 138A0 800238A0 905120AC */  sw         $zero, %lo(D_80135190)($at)
    /* 138A4 800238A4 241C80AF */  sw         $zero, %gp_rel(curcancel)($gp)
    /* 138A8 800238A8 41A5000C */  jal        setasynciofuncs
    /* 138AC 800238AC 00000000 */   nop
  .L800238B0:
    /* 138B0 800238B0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 138B4 800238B4 1800B28F */  lw         $s2, 0x18($sp)
    /* 138B8 800238B8 1400B18F */  lw         $s1, 0x14($sp)
    /* 138BC 800238BC 1000B08F */  lw         $s0, 0x10($sp)
    /* 138C0 800238C0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 138C4 800238C4 0800E003 */  jr         $ra
    /* 138C8 800238C8 00000000 */   nop
endlabel initasyncstruct
