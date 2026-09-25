.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostAddObject__Fiii, 0x468

glabel PostAddObject__Fiii
    /* 43C08 80053C08 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 43C0C 80053C0C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 43C10 80053C10 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 43C14 80053C14 21988000 */  addu       $s3, $a0, $zero
    /* 43C18 80053C18 1400B1AF */  sw         $s1, 0x14($sp)
    /* 43C1C 80053C1C 2188A000 */  addu       $s1, $a1, $zero
    /* 43C20 80053C20 1800B2AF */  sw         $s2, 0x18($sp)
    /* 43C24 80053C24 2190C000 */  addu       $s2, $a2, $zero
    /* 43C28 80053C28 2000BFAF */  sw         $ra, 0x20($sp)
    /* 43C2C 80053C2C 7F004228 */  slti       $v0, $v0, 0x7F
    /* 43C30 80053C30 07014010 */  beqz       $v0, .L80054050
    /* 43C34 80053C34 1000B0AF */   sw        $s0, 0x10($sp)
    /* 43C38 80053C38 DC9E010C */  jal        QuestStatus__Fi
    /* 43C3C 80053C3C 09000424 */   addiu     $a0, $zero, 0x9
    /* 43C40 80053C40 FF004230 */  andi       $v0, $v0, 0xFF
    /* 43C44 80053C44 D4004010 */  beqz       $v0, .L80053F98
    /* 43C48 80053C48 C0181200 */   sll       $v1, $s2, 3
    /* 43C4C 80053C4C C0101100 */  sll        $v0, $s1, 3
    /* 43C50 80053C50 23105100 */  subu       $v0, $v0, $s1
    /* 43C54 80053C54 C0110200 */  sll        $v0, $v0, 7
    /* 43C58 80053C58 21186200 */  addu       $v1, $v1, $v0
    /* 43C5C 80053C5C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 43C60 80053C60 21082300 */  addu       $at, $at, $v1
    /* 43C64 80053C64 2B7A3080 */  lb         $s0, %lo(dung_map + 0x3)($at)
    /* 43C68 80053C68 00000000 */  nop
    /* 43C6C 80053C6C CA000012 */  beqz       $s0, .L80053F98
    /* 43C70 80053C70 2A000224 */   addiu     $v0, $zero, 0x2A
    /* 43C74 80053C74 58006216 */  bne        $s3, $v0, .L80053DD8
    /* 43C78 80053C78 FFFF1026 */   addiu     $s0, $s0, -0x1
    /* 43C7C 80053C7C 1280023C */  lui        $v0, %hi(deltaload)
    /* 43C80 80053C80 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 43C84 80053C84 00000000 */  nop
    /* 43C88 80053C88 23004014 */  bnez       $v0, .L80053D18
    /* 43C8C 80053C8C 40101000 */   sll       $v0, $s0, 1
    /* 43C90 80053C90 21105000 */  addu       $v0, $v0, $s0
    /* 43C94 80053C94 80100200 */  sll        $v0, $v0, 2
    /* 43C98 80053C98 23105000 */  subu       $v0, $v0, $s0
    /* 43C9C 80053C9C 80980200 */  sll        $s3, $v0, 2
    /* 43CA0 80053CA0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43CA4 80053CA4 21083300 */  addu       $at, $at, $s3
    /* 43CA8 80053CA8 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 43CAC 80053CAC 01000224 */  addiu      $v0, $zero, 0x1
    /* 43CB0 80053CB0 06006214 */  bne        $v1, $v0, .L80053CCC
    /* 43CB4 80053CB4 21202002 */   addu      $a0, $s1, $zero
    /* 43CB8 80053CB8 01000424 */  addiu      $a0, $zero, 0x1
    /* 43CBC 80053CBC 2C000524 */  addiu      $a1, $zero, 0x2C
    /* 43CC0 80053CC0 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 43CC4 80053CC4 FFFF0632 */   andi      $a2, $s0, 0xFFFF
    /* 43CC8 80053CC8 21202002 */  addu       $a0, $s1, $zero
  .L80053CCC:
    /* 43CCC 80053CCC 21284002 */  addu       $a1, $s2, $zero
    /* 43CD0 80053CD0 D555010C */  jal        ObjSetMicro__Fiii
    /* 43CD4 80053CD4 1A020624 */   addiu     $a2, $zero, 0x21A
    /* 43CD8 80053CD8 F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 43CDC 80053CDC 43100200 */  sra        $v0, $v0, 1
    /* 43CE0 80053CE0 0E80043C */  lui        $a0, %hi(dungeon)
    /* 43CE4 80053CE4 C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 43CE8 80053CE8 40180200 */  sll        $v1, $v0, 1
    /* 43CEC 80053CEC 21186200 */  addu       $v1, $v1, $v0
    /* 43CF0 80053CF0 40190300 */  sll        $v1, $v1, 5
    /* 43CF4 80053CF4 21186400 */  addu       $v1, $v1, $a0
    /* 43CF8 80053CF8 F0FF4226 */  addiu      $v0, $s2, -0x10
    /* 43CFC 80053CFC 43100200 */  sra        $v0, $v0, 1
    /* 43D00 80053D00 40100200 */  sll        $v0, $v0, 1
    /* 43D04 80053D04 21104300 */  addu       $v0, $v0, $v1
    /* 43D08 80053D08 96000324 */  addiu      $v1, $zero, 0x96
    /* 43D0C 80053D0C 000043A4 */  sh         $v1, 0x0($v0)
    /* 43D10 80053D10 9F4F0108 */  j          .L80053E7C
    /* 43D14 80053D14 01000224 */   addiu     $v0, $zero, 0x1
  .L80053D18:
    /* 43D18 80053D18 21105000 */  addu       $v0, $v0, $s0
    /* 43D1C 80053D1C 80100200 */  sll        $v0, $v0, 2
    /* 43D20 80053D20 23105000 */  subu       $v0, $v0, $s0
    /* 43D24 80053D24 80800200 */  sll        $s0, $v0, 2
    /* 43D28 80053D28 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43D2C 80053D2C 21083000 */  addu       $at, $at, $s0
    /* 43D30 80053D30 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 43D34 80053D34 00000000 */  nop
    /* 43D38 80053D38 14004014 */  bnez       $v0, .L80053D8C
    /* 43D3C 80053D3C 21202002 */   addu      $a0, $s1, $zero
    /* 43D40 80053D40 21284002 */  addu       $a1, $s2, $zero
    /* 43D44 80053D44 D555010C */  jal        ObjSetMicro__Fiii
    /* 43D48 80053D48 1A020624 */   addiu     $a2, $zero, 0x21A
    /* 43D4C 80053D4C F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 43D50 80053D50 43100200 */  sra        $v0, $v0, 1
    /* 43D54 80053D54 0E80043C */  lui        $a0, %hi(dungeon)
    /* 43D58 80053D58 C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 43D5C 80053D5C 40180200 */  sll        $v1, $v0, 1
    /* 43D60 80053D60 21186200 */  addu       $v1, $v1, $v0
    /* 43D64 80053D64 40190300 */  sll        $v1, $v1, 5
    /* 43D68 80053D68 21186400 */  addu       $v1, $v1, $a0
    /* 43D6C 80053D6C F0FF4226 */  addiu      $v0, $s2, -0x10
    /* 43D70 80053D70 43100200 */  sra        $v0, $v0, 1
    /* 43D74 80053D74 40100200 */  sll        $v0, $v0, 1
    /* 43D78 80053D78 21104300 */  addu       $v0, $v0, $v1
    /* 43D7C 80053D7C 96000324 */  addiu      $v1, $zero, 0x96
    /* 43D80 80053D80 000043A4 */  sh         $v1, 0x0($v0)
    /* 43D84 80053D84 C34F0108 */  j          .L80053F0C
    /* 43D88 80053D88 01000224 */   addiu     $v0, $zero, 0x1
  .L80053D8C:
    /* 43D8C 80053D8C 21284002 */  addu       $a1, $s2, $zero
    /* 43D90 80053D90 D555010C */  jal        ObjSetMicro__Fiii
    /* 43D94 80053D94 11000624 */   addiu     $a2, $zero, 0x11
    /* 43D98 80053D98 F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 43D9C 80053D9C 43100200 */  sra        $v0, $v0, 1
    /* 43DA0 80053DA0 0E80043C */  lui        $a0, %hi(dungeon)
    /* 43DA4 80053DA4 C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 43DA8 80053DA8 40180200 */  sll        $v1, $v0, 1
    /* 43DAC 80053DAC 21186200 */  addu       $v1, $v1, $v0
    /* 43DB0 80053DB0 40190300 */  sll        $v1, $v1, 5
    /* 43DB4 80053DB4 21186400 */  addu       $v1, $v1, $a0
    /* 43DB8 80053DB8 F0FF4226 */  addiu      $v0, $s2, -0x10
    /* 43DBC 80053DBC 43100200 */  sra        $v0, $v0, 1
    /* 43DC0 80053DC0 40100200 */  sll        $v0, $v0, 1
    /* 43DC4 80053DC4 21104300 */  addu       $v0, $v0, $v1
    /* 43DC8 80053DC8 99000324 */  addiu      $v1, $zero, 0x99
    /* 43DCC 80053DCC 000043A4 */  sh         $v1, 0x0($v0)
    /* 43DD0 80053DD0 DD4F0108 */  j          .L80053F74
    /* 43DD4 80053DD4 04000224 */   addiu     $v0, $zero, 0x4
  .L80053DD8:
    /* 43DD8 80053DD8 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 43DDC 80053DDC 6F006216 */  bne        $s3, $v0, .L80053F9C
    /* 43DE0 80053DE0 21282002 */   addu      $a1, $s1, $zero
    /* 43DE4 80053DE4 1280023C */  lui        $v0, %hi(deltaload)
    /* 43DE8 80053DE8 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 43DEC 80053DEC 00000000 */  nop
    /* 43DF0 80053DF0 2A004014 */  bnez       $v0, .L80053E9C
    /* 43DF4 80053DF4 40101000 */   sll       $v0, $s0, 1
    /* 43DF8 80053DF8 21105000 */  addu       $v0, $v0, $s0
    /* 43DFC 80053DFC 80100200 */  sll        $v0, $v0, 2
    /* 43E00 80053E00 23105000 */  subu       $v0, $v0, $s0
    /* 43E04 80053E04 80980200 */  sll        $s3, $v0, 2
    /* 43E08 80053E08 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43E0C 80053E0C 21083300 */  addu       $at, $at, $s3
    /* 43E10 80053E10 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 43E14 80053E14 01000224 */  addiu      $v0, $zero, 0x1
    /* 43E18 80053E18 06006214 */  bne        $v1, $v0, .L80053E34
    /* 43E1C 80053E1C 21202002 */   addu      $a0, $s1, $zero
    /* 43E20 80053E20 01000424 */  addiu      $a0, $zero, 0x1
    /* 43E24 80053E24 2C000524 */  addiu      $a1, $zero, 0x2C
    /* 43E28 80053E28 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 43E2C 80053E2C FFFF0632 */   andi      $a2, $s0, 0xFFFF
    /* 43E30 80053E30 21202002 */  addu       $a0, $s1, $zero
  .L80053E34:
    /* 43E34 80053E34 21284002 */  addu       $a1, $s2, $zero
    /* 43E38 80053E38 D555010C */  jal        ObjSetMicro__Fiii
    /* 43E3C 80053E3C 1C020624 */   addiu     $a2, $zero, 0x21C
    /* 43E40 80053E40 F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 43E44 80053E44 43100200 */  sra        $v0, $v0, 1
    /* 43E48 80053E48 0E80043C */  lui        $a0, %hi(dungeon)
    /* 43E4C 80053E4C C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 43E50 80053E50 40180200 */  sll        $v1, $v0, 1
    /* 43E54 80053E54 21186200 */  addu       $v1, $v1, $v0
    /* 43E58 80053E58 40190300 */  sll        $v1, $v1, 5
    /* 43E5C 80053E5C 21186400 */  addu       $v1, $v1, $a0
    /* 43E60 80053E60 F0FF4226 */  addiu      $v0, $s2, -0x10
    /* 43E64 80053E64 43100200 */  sra        $v0, $v0, 1
    /* 43E68 80053E68 40100200 */  sll        $v0, $v0, 1
    /* 43E6C 80053E6C 21104300 */  addu       $v0, $v0, $v1
    /* 43E70 80053E70 97000324 */  addiu      $v1, $zero, 0x97
    /* 43E74 80053E74 000043A4 */  sh         $v1, 0x0($v0)
    /* 43E78 80053E78 02000224 */  addiu      $v0, $zero, 0x2
  .L80053E7C:
    /* 43E7C 80053E7C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 43E80 80053E80 21083300 */  addu       $at, $at, $s3
    /* 43E84 80053E84 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 43E88 80053E88 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43E8C 80053E8C 21083300 */  addu       $at, $at, $s3
    /* 43E90 80053E90 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 43E94 80053E94 14500108 */  j          .L80054050
    /* 43E98 80053E98 00000000 */   nop
  .L80053E9C:
    /* 43E9C 80053E9C 21105000 */  addu       $v0, $v0, $s0
    /* 43EA0 80053EA0 80100200 */  sll        $v0, $v0, 2
    /* 43EA4 80053EA4 23105000 */  subu       $v0, $v0, $s0
    /* 43EA8 80053EA8 80800200 */  sll        $s0, $v0, 2
    /* 43EAC 80053EAC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43EB0 80053EB0 21083000 */  addu       $at, $at, $s0
    /* 43EB4 80053EB4 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 43EB8 80053EB8 00000000 */  nop
    /* 43EBC 80053EBC 1B004014 */  bnez       $v0, .L80053F2C
    /* 43EC0 80053EC0 21202002 */   addu      $a0, $s1, $zero
    /* 43EC4 80053EC4 21284002 */  addu       $a1, $s2, $zero
    /* 43EC8 80053EC8 D555010C */  jal        ObjSetMicro__Fiii
    /* 43ECC 80053ECC 1C020624 */   addiu     $a2, $zero, 0x21C
    /* 43ED0 80053ED0 F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 43ED4 80053ED4 43100200 */  sra        $v0, $v0, 1
    /* 43ED8 80053ED8 0E80043C */  lui        $a0, %hi(dungeon)
    /* 43EDC 80053EDC C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 43EE0 80053EE0 40180200 */  sll        $v1, $v0, 1
    /* 43EE4 80053EE4 21186200 */  addu       $v1, $v1, $v0
    /* 43EE8 80053EE8 40190300 */  sll        $v1, $v1, 5
    /* 43EEC 80053EEC 21186400 */  addu       $v1, $v1, $a0
    /* 43EF0 80053EF0 F0FF4226 */  addiu      $v0, $s2, -0x10
    /* 43EF4 80053EF4 43100200 */  sra        $v0, $v0, 1
    /* 43EF8 80053EF8 40100200 */  sll        $v0, $v0, 1
    /* 43EFC 80053EFC 21104300 */  addu       $v0, $v0, $v1
    /* 43F00 80053F00 97000324 */  addiu      $v1, $zero, 0x97
    /* 43F04 80053F04 000043A4 */  sh         $v1, 0x0($v0)
    /* 43F08 80053F08 02000224 */  addiu      $v0, $zero, 0x2
  .L80053F0C:
    /* 43F0C 80053F0C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 43F10 80053F10 21083000 */  addu       $at, $at, $s0
    /* 43F14 80053F14 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 43F18 80053F18 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43F1C 80053F1C 21083000 */  addu       $at, $at, $s0
    /* 43F20 80053F20 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 43F24 80053F24 14500108 */  j          .L80054050
    /* 43F28 80053F28 00000000 */   nop
  .L80053F2C:
    /* 43F2C 80053F2C 21284002 */  addu       $a1, $s2, $zero
    /* 43F30 80053F30 D555010C */  jal        ObjSetMicro__Fiii
    /* 43F34 80053F34 0D000624 */   addiu     $a2, $zero, 0xD
    /* 43F38 80053F38 F0FF2226 */  addiu      $v0, $s1, -0x10
    /* 43F3C 80053F3C 43100200 */  sra        $v0, $v0, 1
    /* 43F40 80053F40 0E80043C */  lui        $a0, %hi(dungeon)
    /* 43F44 80053F44 C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 43F48 80053F48 40180200 */  sll        $v1, $v0, 1
    /* 43F4C 80053F4C 21186200 */  addu       $v1, $v1, $v0
    /* 43F50 80053F50 40190300 */  sll        $v1, $v1, 5
    /* 43F54 80053F54 21186400 */  addu       $v1, $v1, $a0
    /* 43F58 80053F58 F0FF4226 */  addiu      $v0, $s2, -0x10
    /* 43F5C 80053F5C 43100200 */  sra        $v0, $v0, 1
    /* 43F60 80053F60 40100200 */  sll        $v0, $v0, 1
    /* 43F64 80053F64 21104300 */  addu       $v0, $v0, $v1
    /* 43F68 80053F68 98000324 */  addiu      $v1, $zero, 0x98
    /* 43F6C 80053F6C 000043A4 */  sh         $v1, 0x0($v0)
    /* 43F70 80053F70 03000224 */  addiu      $v0, $zero, 0x3
  .L80053F74:
    /* 43F74 80053F74 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 43F78 80053F78 21083000 */  addu       $at, $at, $s0
    /* 43F7C 80053F7C 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 43F80 80053F80 01000224 */  addiu      $v0, $zero, 0x1
    /* 43F84 80053F84 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43F88 80053F88 21083000 */  addu       $at, $at, $s0
    /* 43F8C 80053F8C 608C22A4 */  sh         $v0, %lo(object + 0x14)($at)
    /* 43F90 80053F90 14500108 */  j          .L80054050
    /* 43F94 80053F94 00000000 */   nop
  .L80053F98:
    /* 43F98 80053F98 21282002 */  addu       $a1, $s1, $zero
  .L80053F9C:
    /* 43F9C 80053F9C 21304002 */  addu       $a2, $s2, $zero
    /* 43FA0 80053FA0 21386002 */  addu       $a3, $s3, $zero
    /* 43FA4 80053FA4 0E80033C */  lui        $v1, %hi(objectavail)
    /* 43FA8 80053FA8 A0A26324 */  addiu      $v1, $v1, %lo(objectavail)
    /* 43FAC 80053FAC 7E006224 */  addiu      $v0, $v1, 0x7E
    /* 43FB0 80053FB0 4C12888F */  lw         $t0, %gp_rel(numobjects)($gp)
    /* 43FB4 80053FB4 00007080 */  lb         $s0, 0x0($v1)
    /* 43FB8 80053FB8 23104800 */  subu       $v0, $v0, $t0
    /* 43FBC 80053FBC 00004290 */  lbu        $v0, 0x0($v0)
    /* 43FC0 80053FC0 00000000 */  nop
    /* 43FC4 80053FC4 000062A0 */  sb         $v0, 0x0($v1)
    /* 43FC8 80053FC8 40101000 */  sll        $v0, $s0, 1
    /* 43FCC 80053FCC 21105000 */  addu       $v0, $v0, $s0
    /* 43FD0 80053FD0 80100200 */  sll        $v0, $v0, 2
    /* 43FD4 80053FD4 23105000 */  subu       $v0, $v0, $s0
    /* 43FD8 80053FD8 80100200 */  sll        $v0, $v0, 2
    /* 43FDC 80053FDC FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 43FE0 80053FE0 0E80013C */  lui        $at, %hi(object)
    /* 43FE4 80053FE4 21082200 */  addu       $at, $at, $v0
    /* 43FE8 80053FE8 4C8C23A4 */  sh         $v1, %lo(object)($at)
    /* 43FEC 80053FEC C0181200 */  sll        $v1, $s2, 3
    /* 43FF0 80053FF0 C0101100 */  sll        $v0, $s1, 3
    /* 43FF4 80053FF4 23105100 */  subu       $v0, $v0, $s1
    /* 43FF8 80053FF8 C0110200 */  sll        $v0, $v0, 7
    /* 43FFC 80053FFC 21186200 */  addu       $v1, $v1, $v0
    /* 44000 80054000 01000226 */  addiu      $v0, $s0, 0x1
    /* 44004 80054004 0E80013C */  lui        $at, %hi(objectactive)
    /* 44008 80054008 21082800 */  addu       $at, $at, $t0
    /* 4400C 8005400C 20A230A0 */  sb         $s0, %lo(objectactive)($at)
    /* 44010 80054010 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 44014 80054014 21082300 */  addu       $at, $at, $v1
    /* 44018 80054018 2B7A22A0 */  sb         $v0, %lo(dung_map + 0x3)($at)
    /* 4401C 8005401C FC4D010C */  jal        SetupObject__Fiiii
    /* 44020 80054020 21200002 */   addu      $a0, $s0, $zero
    /* 44024 80054024 53000224 */  addiu      $v0, $zero, 0x53
    /* 44028 80054028 05006212 */  beq        $s3, $v0, .L80054040
    /* 4402C 8005402C 21206002 */   addu      $a0, $s3, $zero
    /* 44030 80054030 21282002 */  addu       $a1, $s1, $zero
    /* 44034 80054034 21304002 */  addu       $a2, $s2, $zero
    /* 44038 80054038 224D010C */  jal        PostObjObjAddSwitch__Fiiii
    /* 4403C 8005403C 21380002 */   addu      $a3, $s0, $zero
  .L80054040:
    /* 44040 80054040 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 44044 80054044 00000000 */  nop
    /* 44048 80054048 01004224 */  addiu      $v0, $v0, 0x1
    /* 4404C 8005404C 4C1282AF */  sw         $v0, %gp_rel(numobjects)($gp)
  .L80054050:
    /* 44050 80054050 2000BF8F */  lw         $ra, 0x20($sp)
    /* 44054 80054054 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 44058 80054058 1800B28F */  lw         $s2, 0x18($sp)
    /* 4405C 8005405C 1400B18F */  lw         $s1, 0x14($sp)
    /* 44060 80054060 1000B08F */  lw         $s0, 0x10($sp)
    /* 44064 80054064 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 44068 80054068 0800E003 */  jr         $ra
    /* 4406C 8005406C 00000000 */   nop
endlabel PostAddObject__Fiii
