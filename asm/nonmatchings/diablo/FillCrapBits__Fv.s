.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FillCrapBits__Fv, 0x1A0

glabel FillCrapBits__Fv
    /* 28FD4 80038FD4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28FD8 80038FD8 1280033C */  lui        $v1, %hi(currlevel)
    /* 28FDC 80038FDC 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 28FE0 80038FE0 03000224 */  addiu      $v0, $zero, 0x3
    /* 28FE4 80038FE4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 28FE8 80038FE8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 28FEC 80038FEC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28FF0 80038FF0 06006210 */  beq        $v1, $v0, .L8003900C
    /* 28FF4 80038FF4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 28FF8 80038FF8 0F000224 */  addiu      $v0, $zero, 0xF
    /* 28FFC 80038FFC 1A006210 */  beq        $v1, $v0, .L80039068
    /* 29000 80039000 00000000 */   nop
    /* 29004 80039004 56E40008 */  j          .L80039158
    /* 29008 80039008 00000000 */   nop
  .L8003900C:
    /* 2900C 8003900C 1280023C */  lui        $v0, %hi(setlevel)
    /* 29010 80039010 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 29014 80039014 00000000 */  nop
    /* 29018 80039018 4F004014 */  bnez       $v0, .L80039158
    /* 2901C 8003901C 00000000 */   nop
    /* 29020 80039020 0E80023C */  lui        $v0, %hi(quests + 0xF2)
    /* 29024 80039024 32DB4290 */  lbu        $v0, %lo(quests + 0xF2)($v0)
    /* 29028 80039028 00000000 */  nop
    /* 2902C 8003902C 4A004010 */  beqz       $v0, .L80039158
    /* 29030 80039030 00000000 */   nop
    /* 29034 80039034 0E80043C */  lui        $a0, %hi(quests + 0xF4)
    /* 29038 80039038 34DB848C */  lw         $a0, %lo(quests + 0xF4)($a0)
    /* 2903C 8003903C 0E80053C */  lui        $a1, %hi(quests + 0xF8)
    /* 29040 80039040 38DBA58C */  lw         $a1, %lo(quests + 0xF8)($a1)
    /* 29044 80039044 E5E3000C */  jal        AllSolid__Fii
    /* 29048 80039048 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 2904C 8003904C 0E80043C */  lui        $a0, %hi(quests + 0xF4)
    /* 29050 80039050 34DB848C */  lw         $a0, %lo(quests + 0xF4)($a0)
    /* 29054 80039054 0E80053C */  lui        $a1, %hi(quests + 0xF8)
    /* 29058 80039058 38DBA58C */  lw         $a1, %lo(quests + 0xF8)($a1)
    /* 2905C 8003905C FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 29060 80039060 54E40008 */  j          .L80039150
    /* 29064 80039064 FEFFA524 */   addiu     $a1, $a1, -0x2
  .L80039068:
    /* 29068 80039068 1280023C */  lui        $v0, %hi(setlevel)
    /* 2906C 8003906C 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 29070 80039070 0E80123C */  lui        $s2, %hi(quests + 0x12C)
    /* 29074 80039074 6CDB5226 */  addiu      $s2, $s2, %lo(quests + 0x12C)
    /* 29078 80039078 37004010 */  beqz       $v0, .L80039158
    /* 2907C 8003907C 00000000 */   nop
    /* 29080 80039080 0E80023C */  lui        $v0, %hi(quests + 0x12E)
    /* 29084 80039084 6EDB4290 */  lbu        $v0, %lo(quests + 0x12E)($v0)
    /* 29088 80039088 00000000 */  nop
    /* 2908C 8003908C 32004010 */  beqz       $v0, .L80039158
    /* 29090 80039090 00000000 */   nop
    /* 29094 80039094 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 29098 80039098 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 2909C 8003909C 0E80023C */  lui        $v0, %hi(quests + 0x138)
    /* 290A0 800390A0 78DB4290 */  lbu        $v0, %lo(quests + 0x138)($v0)
    /* 290A4 800390A4 00000000 */  nop
    /* 290A8 800390A8 2B006214 */  bne        $v1, $v0, .L80039158
    /* 290AC 800390AC 12001124 */   addiu     $s1, $zero, 0x12
    /* 290B0 800390B0 38001024 */  addiu      $s0, $zero, 0x38
  .L800390B4:
    /* 290B4 800390B4 21200002 */  addu       $a0, $s0, $zero
  .L800390B8:
    /* 290B8 800390B8 E5E3000C */  jal        AllSolid__Fii
    /* 290BC 800390BC 21282002 */   addu      $a1, $s1, $zero
    /* 290C0 800390C0 01001026 */  addiu      $s0, $s0, 0x1
    /* 290C4 800390C4 3A00022A */  slti       $v0, $s0, 0x3A
    /* 290C8 800390C8 FBFF4014 */  bnez       $v0, .L800390B8
    /* 290CC 800390CC 21200002 */   addu      $a0, $s0, $zero
    /* 290D0 800390D0 01003126 */  addiu      $s1, $s1, 0x1
    /* 290D4 800390D4 3E00222A */  slti       $v0, $s1, 0x3E
    /* 290D8 800390D8 F6FF4014 */  bnez       $v0, .L800390B4
    /* 290DC 800390DC 38001024 */   addiu     $s0, $zero, 0x38
    /* 290E0 800390E0 3C001124 */  addiu      $s1, $zero, 0x3C
  .L800390E4:
    /* 290E4 800390E4 28001024 */  addiu      $s0, $zero, 0x28
    /* 290E8 800390E8 21200002 */  addu       $a0, $s0, $zero
  .L800390EC:
    /* 290EC 800390EC E5E3000C */  jal        AllSolid__Fii
    /* 290F0 800390F0 21282002 */   addu      $a1, $s1, $zero
    /* 290F4 800390F4 01001026 */  addiu      $s0, $s0, 0x1
    /* 290F8 800390F8 2E00022A */  slti       $v0, $s0, 0x2E
    /* 290FC 800390FC FBFF4014 */  bnez       $v0, .L800390EC
    /* 29100 80039100 21200002 */   addu      $a0, $s0, $zero
    /* 29104 80039104 01003126 */  addiu      $s1, $s1, 0x1
    /* 29108 80039108 3E00222A */  slti       $v0, $s1, 0x3E
    /* 2910C 8003910C F5FF4014 */  bnez       $v0, .L800390E4
    /* 29110 80039110 00000000 */   nop
    /* 29114 80039114 0F004292 */  lbu        $v0, 0xF($s2)
    /* 29118 80039118 00000000 */  nop
    /* 2911C 8003911C 0400422C */  sltiu      $v0, $v0, 0x4
    /* 29120 80039120 0D004010 */  beqz       $v0, .L80039158
    /* 29124 80039124 20000424 */   addiu     $a0, $zero, 0x20
    /* 29128 80039128 E5E3000C */  jal        AllSolid__Fii
    /* 2912C 8003912C 30000524 */   addiu     $a1, $zero, 0x30
    /* 29130 80039130 21000424 */  addiu      $a0, $zero, 0x21
    /* 29134 80039134 E5E3000C */  jal        AllSolid__Fii
    /* 29138 80039138 30000524 */   addiu     $a1, $zero, 0x30
    /* 2913C 8003913C 20000424 */  addiu      $a0, $zero, 0x20
    /* 29140 80039140 E5E3000C */  jal        AllSolid__Fii
    /* 29144 80039144 31000524 */   addiu     $a1, $zero, 0x31
    /* 29148 80039148 21000424 */  addiu      $a0, $zero, 0x21
    /* 2914C 8003914C 31000524 */  addiu      $a1, $zero, 0x31
  .L80039150:
    /* 29150 80039150 E5E3000C */  jal        AllSolid__Fii
    /* 29154 80039154 00000000 */   nop
  .L80039158:
    /* 29158 80039158 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 2915C 8003915C 1800B28F */  lw         $s2, 0x18($sp)
    /* 29160 80039160 1400B18F */  lw         $s1, 0x14($sp)
    /* 29164 80039164 1000B08F */  lw         $s0, 0x10($sp)
    /* 29168 80039168 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2916C 8003916C 0800E003 */  jr         $ra
    /* 29170 80039170 00000000 */   nop
endlabel FillCrapBits__Fv
