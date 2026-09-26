.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLevelMonsters__Fv, 0x84

glabel InitLevelMonsters__Fv
    /* 26088 8015FC80 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2608C 8015FC84 A4010224 */  addiu      $v0, $zero, 0x1A4
    /* 26090 8015FC88 1000BFAF */  sw         $ra, 0x10($sp)
    /* 26094 8015FC8C 1280013C */  lui        $at, %hi(nummtypes)
    /* 26098 8015FC90 9CC220AC */  sw         $zero, %lo(nummtypes)($at)
    /* 2609C 8015FC94 1280013C */  lui        $at, %hi(monstimgtot)
    /* 260A0 8015FC98 D0C220AC */  sw         $zero, %lo(monstimgtot)($at)
  .L8015FC9C:
    /* 260A4 8015FC9C 1180013C */  lui        $at, %hi(Monsters + 0x13)
    /* 260A8 8015FCA0 21082200 */  addu       $at, $at, $v0
    /* 260AC 8015FCA4 CFA320A0 */  sb         $zero, %lo(Monsters + 0x13)($at)
    /* 260B0 8015FCA8 E4FF4224 */  addiu      $v0, $v0, -0x1C
    /* 260B4 8015FCAC FBFF4104 */  bgez       $v0, .L8015FC9C
    /* 260B8 8015FCB0 00000000 */   nop
    /* 260BC 8015FCB4 D27E050C */  jal        ClrAllMonsters__Fv
    /* 260C0 8015FCB8 00000000 */   nop
    /* 260C4 8015FCBC BD000324 */  addiu      $v1, $zero, 0xBD
    /* 260C8 8015FCC0 1180043C */  lui        $a0, %hi(monstactive + 0x17A)
    /* 260CC 8015FCC4 3EA28424 */  addiu      $a0, $a0, %lo(monstactive + 0x17A)
    /* 260D0 8015FCC8 BE000224 */  addiu      $v0, $zero, 0xBE
    /* 260D4 8015FCCC 1280013C */  lui        $at, %hi(nummonsters)
    /* 260D8 8015FCD0 CCC220AC */  sw         $zero, %lo(nummonsters)($at)
    /* 260DC 8015FCD4 1280013C */  lui        $at, %hi(totalmonsters)
    /* 260E0 8015FCD8 D4C222A0 */  sb         $v0, %lo(totalmonsters)($at)
  .L8015FCDC:
    /* 260E4 8015FCDC 000083A4 */  sh         $v1, 0x0($a0)
    /* 260E8 8015FCE0 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 260EC 8015FCE4 FDFF6104 */  bgez       $v1, .L8015FCDC
    /* 260F0 8015FCE8 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* 260F4 8015FCEC 1280013C */  lui        $at, %hi(uniquetrans)
    /* 260F8 8015FCF0 D8C220AC */  sw         $zero, %lo(uniquetrans)($at)
    /* 260FC 8015FCF4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 26100 8015FCF8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 26104 8015FCFC 0800E003 */  jr         $ra
    /* 26108 8015FD00 00000000 */   nop
endlabel InitLevelMonsters__Fv
