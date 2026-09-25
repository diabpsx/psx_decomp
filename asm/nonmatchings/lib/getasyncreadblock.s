.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getasyncreadblock, 0xC0

glabel getasyncreadblock
    /* 14EAC 80024EAC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14EB0 80024EB0 21288000 */  addu       $a1, $a0, $zero
    /* 14EB4 80024EB4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 14EB8 80024EB8 21800000 */  addu       $s0, $zero, $zero
    /* 14EBC 80024EBC 0700A004 */  bltz       $a1, .L80024EDC
    /* 14EC0 80024EC0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 14EC4 80024EC4 1380023C */  lui        $v0, %hi(async)
    /* 14EC8 80024EC8 4850428C */  lw         $v0, %lo(async)($v0)
    /* 14ECC 80024ECC 00000000 */  nop
    /* 14ED0 80024ED0 2A10A200 */  slt        $v0, $a1, $v0
    /* 14ED4 80024ED4 0E004014 */  bnez       $v0, .L80024F10
    /* 14ED8 80024ED8 40180500 */   sll       $v1, $a1, 1
  .L80024EDC:
    /* 14EDC 80024EDC 1180043C */  lui        $a0, %hi(D_8010EA30)
    /* 14EE0 80024EE0 30EA8424 */  addiu      $a0, $a0, %lo(D_8010EA30)
    /* 14EE4 80024EE4 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 14EE8 80024EE8 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 14EEC 80024EEC 1280013C */  lui        $at, %hi(abortfile)
    /* 14EF0 80024EF0 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 14EF4 80024EF4 01080224 */  addiu      $v0, $zero, 0x801
    /* 14EF8 80024EF8 1280013C */  lui        $at, %hi(abortline)
    /* 14EFC 80024EFC BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 14F00 80024F00 0F95000C */  jal        abortmessage
    /* 14F04 80024F04 00000000 */   nop
    /* 14F08 80024F08 D6930008 */  j          .L80024F58
    /* 14F0C 80024F0C 21100000 */   addu      $v0, $zero, $zero
  .L80024F10:
    /* 14F10 80024F10 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 14F14 80024F14 4C50848C */  lw         $a0, %lo(D_8013504C)($a0)
    /* 14F18 80024F18 21186500 */  addu       $v1, $v1, $a1
    /* 14F1C 80024F1C 00110300 */  sll        $v0, $v1, 4
    /* 14F20 80024F20 23104300 */  subu       $v0, $v0, $v1
    /* 14F24 80024F24 80100200 */  sll        $v0, $v0, 2
    /* 14F28 80024F28 21204400 */  addu       $a0, $v0, $a0
    /* 14F2C 80024F2C 9C00838C */  lw         $v1, 0x9C($a0)
    /* 14F30 80024F30 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 14F34 80024F34 07006210 */  beq        $v1, $v0, .L80024F54
    /* 14F38 80024F38 00000000 */   nop
    /* 14F3C 80024F3C A800908C */  lw         $s0, 0xA8($a0)
    /* 14F40 80024F40 00000000 */  nop
    /* 14F44 80024F44 04000012 */  beqz       $s0, .L80024F58
    /* 14F48 80024F48 21100002 */   addu      $v0, $s0, $zero
    /* 14F4C 80024F4C 2E94000C */  jal        putasyncblock
    /* 14F50 80024F50 2120A000 */   addu      $a0, $a1, $zero
  .L80024F54:
    /* 14F54 80024F54 21100002 */  addu       $v0, $s0, $zero
  .L80024F58:
    /* 14F58 80024F58 1400BF8F */  lw         $ra, 0x14($sp)
    /* 14F5C 80024F5C 1000B08F */  lw         $s0, 0x10($sp)
    /* 14F60 80024F60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 14F64 80024F64 0800E003 */  jr         $ra
    /* 14F68 80024F68 00000000 */   nop
endlabel getasyncreadblock
