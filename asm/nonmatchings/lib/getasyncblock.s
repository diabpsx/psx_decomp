.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getasyncblock, 0x10C

glabel getasyncblock
    /* 15148 80025148 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1514C 8002514C 1380053C */  lui        $a1, %hi(D_8013505C)
    /* 15150 80025150 5C50A524 */  addiu      $a1, $a1, %lo(D_8013505C)
    /* 15154 80025154 1400BFAF */  sw         $ra, 0x14($sp)
    /* 15158 80025158 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1515C 8002515C 0000B08C */  lw         $s0, 0x0($a1)
    /* 15160 80025160 00000000 */  nop
    /* 15164 80025164 10000106 */  bgez       $s0, .L800251A8
    /* 15168 80025168 00000000 */   nop
    /* 1516C 8002516C CC8D000C */  jal        dumpasync
    /* 15170 80025170 00000000 */   nop
    /* 15174 80025174 1180043C */  lui        $a0, %hi(D_8010EAA0)
    /* 15178 80025178 A0EA8424 */  addiu      $a0, $a0, %lo(D_8010EAA0)
    /* 1517C 8002517C 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 15180 80025180 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 15184 80025184 1280013C */  lui        $at, %hi(abortfile)
    /* 15188 80025188 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1518C 8002518C 7D080224 */  addiu      $v0, $zero, 0x87D
    /* 15190 80025190 1280013C */  lui        $at, %hi(abortline)
    /* 15194 80025194 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 15198 80025198 0F95000C */  jal        abortmessage
    /* 1519C 8002519C 00000000 */   nop
    /* 151A0 800251A0 90940008 */  j          .L80025240
    /* 151A4 800251A4 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L800251A8:
    /* 151A8 800251A8 1380023C */  lui        $v0, %hi(D_8013505C)
    /* 151AC 800251AC 5C50428C */  lw         $v0, %lo(D_8013505C)($v0)
    /* 151B0 800251B0 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 151B4 800251B4 4C50848C */  lw         $a0, %lo(D_8013504C)($a0)
    /* 151B8 800251B8 40180200 */  sll        $v1, $v0, 1
    /* 151BC 800251BC 21186200 */  addu       $v1, $v1, $v0
    /* 151C0 800251C0 00110300 */  sll        $v0, $v1, 4
    /* 151C4 800251C4 23104300 */  subu       $v0, $v0, $v1
    /* 151C8 800251C8 80100200 */  sll        $v0, $v0, 2
    /* 151CC 800251CC 21104400 */  addu       $v0, $v0, $a0
    /* 151D0 800251D0 AC00428C */  lw         $v0, 0xAC($v0)
    /* 151D4 800251D4 00000000 */  nop
    /* 151D8 800251D8 0E004104 */  bgez       $v0, .L80025214
    /* 151DC 800251DC 0000A2AC */   sw        $v0, 0x0($a1)
    /* 151E0 800251E0 CC8D000C */  jal        dumpasync
    /* 151E4 800251E4 00000000 */   nop
    /* 151E8 800251E8 1180043C */  lui        $a0, %hi(D_8010EAC8)
    /* 151EC 800251EC C8EA8424 */  addiu      $a0, $a0, %lo(D_8010EAC8)
    /* 151F0 800251F0 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 151F4 800251F4 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 151F8 800251F8 1280013C */  lui        $at, %hi(abortfile)
    /* 151FC 800251FC B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 15200 80025200 87080224 */  addiu      $v0, $zero, 0x887
    /* 15204 80025204 1280013C */  lui        $at, %hi(abortline)
    /* 15208 80025208 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1520C 8002520C 0F95000C */  jal        abortmessage
    /* 15210 80025210 00000000 */   nop
  .L80025214:
    /* 15214 80025214 40101000 */  sll        $v0, $s0, 1
    /* 15218 80025218 21105000 */  addu       $v0, $v0, $s0
    /* 1521C 8002521C 1380033C */  lui        $v1, %hi(D_8013504C)
    /* 15220 80025220 4C50638C */  lw         $v1, %lo(D_8013504C)($v1)
    /* 15224 80025224 00210200 */  sll        $a0, $v0, 4
    /* 15228 80025228 23208200 */  subu       $a0, $a0, $v0
    /* 1522C 8002522C 80200400 */  sll        $a0, $a0, 2
    /* 15230 80025230 B4000524 */  addiu      $a1, $zero, 0xB4
    /* 15234 80025234 A0B1000C */  jal        blockclear
    /* 15238 80025238 21206400 */   addu      $a0, $v1, $a0
    /* 1523C 8002523C 21100002 */  addu       $v0, $s0, $zero
  .L80025240:
    /* 15240 80025240 1400BF8F */  lw         $ra, 0x14($sp)
    /* 15244 80025244 1000B08F */  lw         $s0, 0x10($sp)
    /* 15248 80025248 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1524C 8002524C 0800E003 */  jr         $ra
    /* 15250 80025250 00000000 */   nop
endlabel getasyncblock
