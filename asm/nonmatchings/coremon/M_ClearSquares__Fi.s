.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_ClearSquares__Fi, 0x140

glabel M_ClearSquares__Fi
    /* 6F35C 8007F35C 27580400 */  nor        $t3, $zero, $a0
    /* 6F360 8007F360 40100400 */  sll        $v0, $a0, 1
    /* 6F364 8007F364 21104400 */  addu       $v0, $v0, $a0
    /* 6F368 8007F368 80100200 */  sll        $v0, $v0, 2
    /* 6F36C 8007F36C 21104400 */  addu       $v0, $v0, $a0
    /* 6F370 8007F370 C0100200 */  sll        $v0, $v0, 3
    /* 6F374 8007F374 01008424 */  addiu      $a0, $a0, 0x1
    /* 6F378 8007F378 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 6F37C 8007F37C 21082200 */  addu       $at, $at, $v0
    /* 6F380 8007F380 CD532A80 */  lb         $t2, %lo(monster + 0x39)($at)
    /* 6F384 8007F384 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 6F388 8007F388 21082200 */  addu       $at, $at, $v0
    /* 6F38C 8007F38C CC532780 */  lb         $a3, %lo(monster + 0x38)($at)
    /* 6F390 8007F390 FFFF4625 */  addiu      $a2, $t2, -0x1
    /* 6F394 8007F394 01004D25 */  addiu      $t5, $t2, 0x1
    /* 6F398 8007F398 0100EC24 */  addiu      $t4, $a3, 0x1
  .L8007F39C:
    /* 6F39C 8007F39C 2A10A601 */  slt        $v0, $t5, $a2
    /* 6F3A0 8007F3A0 20004014 */  bnez       $v0, .L8007F424
    /* 6F3A4 8007F3A4 FFFFE524 */   addiu     $a1, $a3, -0x1
    /* 6F3A8 8007F3A8 2A108501 */  slt        $v0, $t4, $a1
    /* 6F3AC 8007F3AC 1B004014 */  bnez       $v0, .L8007F41C
    /* 6F3B0 8007F3B0 6000C928 */   slti      $t1, $a2, 0x60
    /* 6F3B4 8007F3B4 0100E824 */  addiu      $t0, $a3, 0x1
    /* 6F3B8 8007F3B8 C0180600 */  sll        $v1, $a2, 3
    /* 6F3BC 8007F3BC C0100500 */  sll        $v0, $a1, 3
    /* 6F3C0 8007F3C0 23104500 */  subu       $v0, $v0, $a1
    /* 6F3C4 8007F3C4 C0110200 */  sll        $v0, $v0, 7
    /* 6F3C8 8007F3C8 21184300 */  addu       $v1, $v0, $v1
  .L8007F3CC:
    /* 6F3CC 8007F3CC 6000A228 */  slti       $v0, $a1, 0x60
    /* 6F3D0 8007F3D0 0E004010 */  beqz       $v0, .L8007F40C
    /* 6F3D4 8007F3D4 00000000 */   nop
    /* 6F3D8 8007F3D8 0C002011 */  beqz       $t1, .L8007F40C
    /* 6F3DC 8007F3DC 00000000 */   nop
    /* 6F3E0 8007F3E0 0E80013C */  lui        $at, %hi(dung_map)
    /* 6F3E4 8007F3E4 21082300 */  addu       $at, $at, $v1
    /* 6F3E8 8007F3E8 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 6F3EC 8007F3EC 00000000 */  nop
    /* 6F3F0 8007F3F0 03004B10 */  beq        $v0, $t3, .L8007F400
    /* 6F3F4 8007F3F4 00000000 */   nop
    /* 6F3F8 8007F3F8 04004414 */  bne        $v0, $a0, .L8007F40C
    /* 6F3FC 8007F3FC 00000000 */   nop
  .L8007F400:
    /* 6F400 8007F400 0E80013C */  lui        $at, %hi(dung_map)
    /* 6F404 8007F404 21082300 */  addu       $at, $at, $v1
    /* 6F408 8007F408 287A20A4 */  sh         $zero, %lo(dung_map)($at)
  .L8007F40C:
    /* 6F40C 8007F40C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 6F410 8007F410 2A100501 */  slt        $v0, $t0, $a1
    /* 6F414 8007F414 EDFF4010 */  beqz       $v0, .L8007F3CC
    /* 6F418 8007F418 80036324 */   addiu     $v1, $v1, 0x380
  .L8007F41C:
    /* 6F41C 8007F41C E7FC0108 */  j          .L8007F39C
    /* 6F420 8007F420 0100C624 */   addiu     $a2, $a2, 0x1
  .L8007F424:
    /* 6F424 8007F424 C0200A00 */  sll        $a0, $t2, 3
    /* 6F428 8007F428 0100E324 */  addiu      $v1, $a3, 0x1
    /* 6F42C 8007F42C C0100300 */  sll        $v0, $v1, 3
    /* 6F430 8007F430 23104300 */  subu       $v0, $v0, $v1
    /* 6F434 8007F434 C0110200 */  sll        $v0, $v0, 7
    /* 6F438 8007F438 21208200 */  addu       $a0, $a0, $v0
    /* 6F43C 8007F43C EFFF0524 */  addiu      $a1, $zero, -0x11
    /* 6F440 8007F440 01004325 */  addiu      $v1, $t2, 0x1
    /* 6F444 8007F444 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 6F448 8007F448 21082400 */  addu       $at, $at, $a0
    /* 6F44C 8007F44C 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 6F450 8007F450 C0180300 */  sll        $v1, $v1, 3
    /* 6F454 8007F454 24104500 */  and        $v0, $v0, $a1
    /* 6F458 8007F458 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 6F45C 8007F45C 21082400 */  addu       $at, $at, $a0
    /* 6F460 8007F460 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 6F464 8007F464 C0100700 */  sll        $v0, $a3, 3
    /* 6F468 8007F468 23104700 */  subu       $v0, $v0, $a3
    /* 6F46C 8007F46C C0110200 */  sll        $v0, $v0, 7
    /* 6F470 8007F470 21186200 */  addu       $v1, $v1, $v0
    /* 6F474 8007F474 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 6F478 8007F478 21082300 */  addu       $at, $at, $v1
    /* 6F47C 8007F47C 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 6F480 8007F480 00000000 */  nop
    /* 6F484 8007F484 24104500 */  and        $v0, $v0, $a1
    /* 6F488 8007F488 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 6F48C 8007F48C 21082300 */  addu       $at, $at, $v1
    /* 6F490 8007F490 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 6F494 8007F494 0800E003 */  jr         $ra
    /* 6F498 8007F498 00000000 */   nop
endlabel M_ClearSquares__Fi
