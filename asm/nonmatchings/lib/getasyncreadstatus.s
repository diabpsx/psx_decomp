.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getasyncreadstatus, 0xB4

glabel getasyncreadstatus
    /* 14F6C 80024F6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14F70 80024F70 21288000 */  addu       $a1, $a0, $zero
    /* 14F74 80024F74 0700A004 */  bltz       $a1, .L80024F94
    /* 14F78 80024F78 1000BFAF */   sw        $ra, 0x10($sp)
    /* 14F7C 80024F7C 1380023C */  lui        $v0, %hi(async)
    /* 14F80 80024F80 4850428C */  lw         $v0, %lo(async)($v0)
    /* 14F84 80024F84 00000000 */  nop
    /* 14F88 80024F88 2A10A200 */  slt        $v0, $a1, $v0
    /* 14F8C 80024F8C 0E004014 */  bnez       $v0, .L80024FC8
    /* 14F90 80024F90 40180500 */   sll       $v1, $a1, 1
  .L80024F94:
    /* 14F94 80024F94 1180043C */  lui        $a0, %hi(D_8010EA54)
    /* 14F98 80024F98 54EA8424 */  addiu      $a0, $a0, %lo(D_8010EA54)
    /* 14F9C 80024F9C 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 14FA0 80024FA0 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 14FA4 80024FA4 1280013C */  lui        $at, %hi(abortfile)
    /* 14FA8 80024FA8 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 14FAC 80024FAC 4B080224 */  addiu      $v0, $zero, 0x84B
    /* 14FB0 80024FB0 1280013C */  lui        $at, %hi(abortline)
    /* 14FB4 80024FB4 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 14FB8 80024FB8 0F95000C */  jal        abortmessage
    /* 14FBC 80024FBC 00000000 */   nop
    /* 14FC0 80024FC0 04940008 */  j          .L80025010
    /* 14FC4 80024FC4 21100000 */   addu      $v0, $zero, $zero
  .L80024FC8:
    /* 14FC8 80024FC8 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 14FCC 80024FCC 4C50848C */  lw         $a0, %lo(D_8013504C)($a0)
    /* 14FD0 80024FD0 21186500 */  addu       $v1, $v1, $a1
    /* 14FD4 80024FD4 00110300 */  sll        $v0, $v1, 4
    /* 14FD8 80024FD8 23104300 */  subu       $v0, $v0, $v1
    /* 14FDC 80024FDC 80100200 */  sll        $v0, $v0, 2
    /* 14FE0 80024FE0 21204400 */  addu       $a0, $v0, $a0
    /* 14FE4 80024FE4 9C00838C */  lw         $v1, 0x9C($a0)
    /* 14FE8 80024FE8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 14FEC 80024FEC 08006210 */  beq        $v1, $v0, .L80025010
    /* 14FF0 80024FF0 21100000 */   addu      $v0, $zero, $zero
    /* 14FF4 80024FF4 A800828C */  lw         $v0, 0xA8($a0)
    /* 14FF8 80024FF8 00000000 */  nop
    /* 14FFC 80024FFC 04004010 */  beqz       $v0, .L80025010
    /* 15000 80025000 21100000 */   addu      $v0, $zero, $zero
    /* 15004 80025004 2E94000C */  jal        putasyncblock
    /* 15008 80025008 2120A000 */   addu      $a0, $a1, $zero
    /* 1500C 8002500C 01000224 */  addiu      $v0, $zero, 0x1
  .L80025010:
    /* 15010 80025010 1000BF8F */  lw         $ra, 0x10($sp)
    /* 15014 80025014 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 15018 80025018 0800E003 */  jr         $ra
    /* 1501C 8002501C 00000000 */   nop
endlabel getasyncreadstatus
