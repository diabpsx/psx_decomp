.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncBreakObj__Fii, 0x7C

glabel SyncBreakObj__Fii
    /* 4ECA4 8005ECA4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4ECA8 8005ECA8 40100500 */  sll        $v0, $a1, 1
    /* 4ECAC 8005ECAC 21104500 */  addu       $v0, $v0, $a1
    /* 4ECB0 8005ECB0 80100200 */  sll        $v0, $v0, 2
    /* 4ECB4 8005ECB4 23104500 */  subu       $v0, $v0, $a1
    /* 4ECB8 8005ECB8 80100200 */  sll        $v0, $v0, 2
    /* 4ECBC 8005ECBC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4ECC0 8005ECC0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4ECC4 8005ECC4 21082200 */  addu       $at, $at, $v0
    /* 4ECC8 8005ECC8 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4ECCC 8005ECCC 00000000 */  nop
    /* 4ECD0 8005ECD0 14006228 */  slti       $v0, $v1, 0x14
    /* 4ECD4 8005ECD4 0E004014 */  bnez       $v0, .L8005ED10
    /* 4ECD8 8005ECD8 17006228 */   slti      $v0, $v1, 0x17
    /* 4ECDC 8005ECDC 05004010 */  beqz       $v0, .L8005ECF4
    /* 4ECE0 8005ECE0 3B006228 */   slti      $v0, $v1, 0x3B
    /* 4ECE4 8005ECE4 ED78010C */  jal        BreakCrux__Fii
    /* 4ECE8 8005ECE8 00000000 */   nop
    /* 4ECEC 8005ECEC 447B0108 */  j          .L8005ED10
    /* 4ECF0 8005ECF0 00000000 */   nop
  .L8005ECF4:
    /* 4ECF4 8005ECF4 06004010 */  beqz       $v0, .L8005ED10
    /* 4ECF8 8005ECF8 39006228 */   slti      $v0, $v1, 0x39
    /* 4ECFC 8005ECFC 04004014 */  bnez       $v0, .L8005ED10
    /* 4ED00 8005ED00 21300000 */   addu      $a2, $zero, $zero
    /* 4ED04 8005ED04 1000A0AF */  sw         $zero, 0x10($sp)
    /* 4ED08 8005ED08 7A79010C */  jal        BreakBarrel__FiiiUcUc
    /* 4ED0C 8005ED0C 01000724 */   addiu     $a3, $zero, 0x1
  .L8005ED10:
    /* 4ED10 8005ED10 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4ED14 8005ED14 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4ED18 8005ED18 0800E003 */  jr         $ra
    /* 4ED1C 8005ED1C 00000000 */   nop
endlabel SyncBreakObj__Fii
