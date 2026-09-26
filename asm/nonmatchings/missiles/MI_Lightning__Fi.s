.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Lightning__Fi, 0x100

glabel MI_Lightning__Fi
    /* BCE8 801458E0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* BCEC 801458E4 2400B1AF */  sw         $s1, 0x24($sp)
    /* BCF0 801458E8 21888000 */  addu       $s1, $a0, $zero
    /* BCF4 801458EC FF00043C */  lui        $a0, (0xFFFF00 >> 16)
    /* BCF8 801458F0 80101100 */  sll        $v0, $s1, 2
    /* BCFC 801458F4 21105100 */  addu       $v0, $v0, $s1
    /* BD00 801458F8 80100200 */  sll        $v0, $v0, 2
    /* BD04 801458FC 23105100 */  subu       $v0, $v0, $s1
    /* BD08 80145900 80100200 */  sll        $v0, $v0, 2
    /* BD0C 80145904 1080033C */  lui        $v1, %hi(missile)
    /* BD10 80145908 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* BD14 8014590C 2000B0AF */  sw         $s0, 0x20($sp)
    /* BD18 80145910 21804300 */  addu       $s0, $v0, $v1
    /* BD1C 80145914 00FF8434 */  ori        $a0, $a0, (0xFFFF00 & 0xFFFF)
    /* BD20 80145918 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* BD24 8014591C 2800B2AF */  sw         $s2, 0x28($sp)
    /* BD28 80145920 18000296 */  lhu        $v0, 0x18($s0)
    /* BD2C 80145924 3000038E */  lw         $v1, 0x30($s0)
    /* BD30 80145928 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* BD34 8014592C FFFF5230 */  andi       $s2, $v0, 0xFFFF
    /* BD38 80145930 180002A6 */  sh         $v0, 0x18($s0)
    /* BD3C 80145934 3400028E */  lw         $v0, 0x34($s0)
    /* BD40 80145938 24186400 */  and        $v1, $v1, $a0
    /* BD44 8014593C 24104400 */  and        $v0, $v0, $a0
    /* BD48 80145940 0D006210 */  beq        $v1, $v0, .L80145978
    /* BD4C 80145944 21202002 */   addu      $a0, $s1, $zero
    /* BD50 80145948 31000282 */  lb         $v0, 0x31($s0)
    /* BD54 8014594C 00000000 */  nop
    /* BD58 80145950 1000A2AF */  sw         $v0, 0x10($sp)
    /* BD5C 80145954 32000382 */  lb         $v1, 0x32($s0)
    /* BD60 80145958 01000224 */  addiu      $v0, $zero, 0x1
    /* BD64 8014595C 1800A0AF */  sw         $zero, 0x18($sp)
    /* BD68 80145960 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* BD6C 80145964 1400A3AF */  sw         $v1, 0x14($sp)
    /* BD70 80145968 1000058E */  lw         $a1, 0x10($s0)
    /* BD74 8014596C 01000724 */  addiu      $a3, $zero, 0x1
    /* BD78 80145970 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* BD7C 80145974 2130A000 */   addu      $a2, $a1, $zero
  .L80145978:
    /* BD80 80145978 3D000392 */  lbu        $v1, 0x3D($s0)
    /* BD84 8014597C 01000224 */  addiu      $v0, $zero, 0x1
    /* BD88 80145980 02006214 */  bne        $v1, $v0, .L8014598C
    /* BD8C 80145984 00000000 */   nop
    /* BD90 80145988 180012A6 */  sh         $s2, 0x18($s0)
  .L8014598C:
    /* BD94 8014598C 3E000482 */  lb         $a0, 0x3E($s0)
    /* BD98 80145990 31000582 */  lb         $a1, 0x31($s0)
    /* BD9C 80145994 32000682 */  lb         $a2, 0x32($s0)
    /* BDA0 80145998 F834010C */  jal        ChangeLight__Fiiii
    /* BDA4 8014599C 43020724 */   addiu     $a3, $zero, 0x243
    /* BDA8 801459A0 18000296 */  lhu        $v0, 0x18($s0)
    /* BDAC 801459A4 00000000 */  nop
    /* BDB0 801459A8 04004014 */  bnez       $v0, .L801459BC
    /* BDB4 801459AC 01000224 */   addiu     $v0, $zero, 0x1
    /* BDB8 801459B0 3E000482 */  lb         $a0, 0x3E($s0)
    /* BDBC 801459B4 D034010C */  jal        AddUnLight__Fi
    /* BDC0 801459B8 380002A2 */   sb        $v0, 0x38($s0)
  .L801459BC:
    /* BDC4 801459BC D1EA040C */  jal        PutMissile__Fi
    /* BDC8 801459C0 21202002 */   addu      $a0, $s1, $zero
    /* BDCC 801459C4 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* BDD0 801459C8 2800B28F */  lw         $s2, 0x28($sp)
    /* BDD4 801459CC 2400B18F */  lw         $s1, 0x24($sp)
    /* BDD8 801459D0 2000B08F */  lw         $s0, 0x20($sp)
    /* BDDC 801459D4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* BDE0 801459D8 0800E003 */  jr         $ra
    /* BDE4 801459DC 00000000 */   nop
endlabel MI_Lightning__Fi
