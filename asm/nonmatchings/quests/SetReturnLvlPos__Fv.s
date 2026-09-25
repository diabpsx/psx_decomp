.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetReturnLvlPos__Fv, 0x110

glabel SetReturnLvlPos__Fv
    /* 581CC 800681CC 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 581D0 800681D0 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 581D4 800681D4 02000224 */  addiu      $v0, $zero, 0x2
    /* 581D8 800681D8 17006210 */  beq        $v1, $v0, .L80068238
    /* 581DC 800681DC 03006228 */   slti      $v0, $v1, 0x3
    /* 581E0 800681E0 05004010 */  beqz       $v0, .L800681F8
    /* 581E4 800681E4 01000224 */   addiu     $v0, $zero, 0x1
    /* 581E8 800681E8 0A006210 */  beq        $v1, $v0, .L80068214
    /* 581EC 800681EC 00000000 */   nop
    /* 581F0 800681F0 B5A00108 */  j          .L800682D4
    /* 581F4 800681F4 00000000 */   nop
  .L800681F8:
    /* 581F8 800681F8 04000424 */  addiu      $a0, $zero, 0x4
    /* 581FC 800681FC 1B006410 */  beq        $v1, $a0, .L8006826C
    /* 58200 80068200 05000224 */   addiu     $v0, $zero, 0x5
    /* 58204 80068204 27006210 */  beq        $v1, $v0, .L800682A4
    /* 58208 80068208 00000000 */   nop
    /* 5820C 8006820C B5A00108 */  j          .L800682D4
    /* 58210 80068210 00000000 */   nop
  .L80068214:
    /* 58214 80068214 0E80023C */  lui        $v0, %hi(quests + 0xF4)
    /* 58218 80068218 34DB428C */  lw         $v0, %lo(quests + 0xF4)($v0)
    /* 5821C 8006821C E01283AF */  sw         $v1, %gp_rel(ReturnLvlT)($gp)
    /* 58220 80068220 0E80033C */  lui        $v1, %hi(quests + 0xF8)
    /* 58224 80068224 38DB638C */  lw         $v1, %lo(quests + 0xF8)($v1)
    /* 58228 80068228 0E80043C */  lui        $a0, %hi(quests + 0xF0)
    /* 5822C 8006822C 30DB8490 */  lbu        $a0, %lo(quests + 0xF0)($a0)
    /* 58230 80068230 96A00108 */  j          .L80068258
    /* 58234 80068234 01004224 */   addiu     $v0, $v0, 0x1
  .L80068238:
    /* 58238 80068238 0E80023C */  lui        $v0, %hi(quests + 0x11C)
    /* 5823C 8006823C 5CDB428C */  lw         $v0, %lo(quests + 0x11C)($v0)
    /* 58240 80068240 E01283AF */  sw         $v1, %gp_rel(ReturnLvlT)($gp)
    /* 58244 80068244 0E80033C */  lui        $v1, %hi(quests + 0x120)
    /* 58248 80068248 60DB638C */  lw         $v1, %lo(quests + 0x120)($v1)
    /* 5824C 8006824C 0E80043C */  lui        $a0, %hi(quests + 0x118)
    /* 58250 80068250 58DB8490 */  lbu        $a0, %lo(quests + 0x118)($a0)
    /* 58254 80068254 01004224 */  addiu      $v0, $v0, 0x1
  .L80068258:
    /* 58258 80068258 D41282AF */  sw         $v0, %gp_rel(ReturnLvlX)($gp)
    /* 5825C 8006825C D81283AF */  sw         $v1, %gp_rel(ReturnLvlY)($gp)
    /* 58260 80068260 DC1284AF */  sw         $a0, %gp_rel(ReturnLvl)($gp)
    /* 58264 80068264 B5A00108 */  j          .L800682D4
    /* 58268 80068268 00000000 */   nop
  .L8006826C:
    /* 5826C 8006826C 0E80033C */  lui        $v1, %hi(quests + 0x108)
    /* 58270 80068270 48DB638C */  lw         $v1, %lo(quests + 0x108)($v1)
    /* 58274 80068274 01000224 */  addiu      $v0, $zero, 0x1
    /* 58278 80068278 E01282AF */  sw         $v0, %gp_rel(ReturnLvlT)($gp)
    /* 5827C 8006827C 0E80023C */  lui        $v0, %hi(quests + 0x10C)
    /* 58280 80068280 4CDB428C */  lw         $v0, %lo(quests + 0x10C)($v0)
    /* 58284 80068284 D41283AF */  sw         $v1, %gp_rel(ReturnLvlX)($gp)
    /* 58288 80068288 0E80033C */  lui        $v1, %hi(quests + 0x104)
    /* 5828C 8006828C 44DB6390 */  lbu        $v1, %lo(quests + 0x104)($v1)
    /* 58290 80068290 01004224 */  addiu      $v0, $v0, 0x1
    /* 58294 80068294 D81282AF */  sw         $v0, %gp_rel(ReturnLvlY)($gp)
    /* 58298 80068298 DC1283AF */  sw         $v1, %gp_rel(ReturnLvl)($gp)
    /* 5829C 8006829C B5A00108 */  j          .L800682D4
    /* 582A0 800682A0 00000000 */   nop
  .L800682A4:
    /* 582A4 800682A4 0E80023C */  lui        $v0, %hi(quests + 0x130)
    /* 582A8 800682A8 70DB428C */  lw         $v0, %lo(quests + 0x130)($v0)
    /* 582AC 800682AC 0E80033C */  lui        $v1, %hi(quests + 0x12C)
    /* 582B0 800682B0 6CDB6390 */  lbu        $v1, %lo(quests + 0x12C)($v1)
    /* 582B4 800682B4 01004224 */  addiu      $v0, $v0, 0x1
    /* 582B8 800682B8 D41282AF */  sw         $v0, %gp_rel(ReturnLvlX)($gp)
    /* 582BC 800682BC 0E80023C */  lui        $v0, %hi(quests + 0x134)
    /* 582C0 800682C0 74DB428C */  lw         $v0, %lo(quests + 0x134)($v0)
    /* 582C4 800682C4 E01284AF */  sw         $a0, %gp_rel(ReturnLvlT)($gp)
    /* 582C8 800682C8 DC1283AF */  sw         $v1, %gp_rel(ReturnLvl)($gp)
    /* 582CC 800682CC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 582D0 800682D0 D81282AF */  sw         $v0, %gp_rel(ReturnLvlY)($gp)
  .L800682D4:
    /* 582D4 800682D4 0800E003 */  jr         $ra
    /* 582D8 800682D8 00000000 */   nop
endlabel SetReturnLvlPos__Fv
