.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPortalLevel__Fv, 0x164

glabel GetPortalLevel__Fv
    /* 713F0 800813F0 1280023C */  lui        $v0, %hi(currlevel)
    /* 713F4 800813F4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 713F8 800813F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 713FC 800813FC 19004010 */  beqz       $v0, .L80081464
    /* 71400 80081400 1000BFAF */   sw        $ra, 0x10($sp)
    /* 71404 80081404 1280033C */  lui        $v1, %hi(myplr)
    /* 71408 80081408 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 7140C 8008140C 1280013C */  lui        $at, %hi(setlevel)
    /* 71410 80081410 0EC120A0 */  sb         $zero, %lo(setlevel)($at)
    /* 71414 80081414 1280013C */  lui        $at, %hi(setlvlnum)
    /* 71418 80081418 0FC120A0 */  sb         $zero, %lo(setlvlnum)($at)
    /* 7141C 8008141C 1280013C */  lui        $at, %hi(currlevel)
    /* 71420 80081420 0CC120A0 */  sb         $zero, %lo(currlevel)($at)
    /* 71424 80081424 1280013C */  lui        $at, %hi(leveltype)
    /* 71428 80081428 0DC120A0 */  sb         $zero, %lo(leveltype)($at)
    /* 7142C 8008142C 40100300 */  sll        $v0, $v1, 1
    /* 71430 80081430 21104300 */  addu       $v0, $v0, $v1
    /* 71434 80081434 80100200 */  sll        $v0, $v0, 2
    /* 71438 80081438 21104300 */  addu       $v0, $v0, $v1
    /* 7143C 8008143C 00110200 */  sll        $v0, $v0, 4
    /* 71440 80081440 23104300 */  subu       $v0, $v0, $v1
    /* 71444 80081444 80100200 */  sll        $v0, $v0, 2
    /* 71448 80081448 21104300 */  addu       $v0, $v0, $v1
    /* 7144C 8008144C C0100200 */  sll        $v0, $v0, 3
    /* 71450 80081450 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 71454 80081454 21082200 */  addu       $at, $at, $v0
    /* 71458 80081458 5CA520AC */  sw         $zero, %lo(plr + 0x24)($at)
    /* 7145C 8008145C 51050208 */  j          .L80081544
    /* 71460 80081460 00000000 */   nop
  .L80081464:
    /* 71464 80081464 5021828F */  lw         $v0, %gp_rel(D_8011C8D0)($gp)
    /* 71468 80081468 00000000 */  nop
    /* 7146C 8008146C 40180200 */  sll        $v1, $v0, 1
    /* 71470 80081470 21186200 */  addu       $v1, $v1, $v0
    /* 71474 80081474 80200300 */  sll        $a0, $v1, 2
    /* 71478 80081478 0E80013C */  lui        $at, %hi(portal + 0x9)
    /* 7147C 8008147C 21082400 */  addu       $at, $at, $a0
    /* 71480 80081480 F53B2290 */  lbu        $v0, %lo(portal + 0x9)($at)
    /* 71484 80081484 00000000 */  nop
    /* 71488 80081488 0C004010 */  beqz       $v0, .L800814BC
    /* 7148C 8008148C 01000224 */   addiu     $v0, $zero, 0x1
    /* 71490 80081490 1280013C */  lui        $at, %hi(setlevel)
    /* 71494 80081494 0EC122A0 */  sb         $v0, %lo(setlevel)($at)
    /* 71498 80081498 0E80013C */  lui        $at, %hi(portal + 0x7)
    /* 7149C 8008149C 21082400 */  addu       $at, $at, $a0
    /* 714A0 800814A0 F33B2290 */  lbu        $v0, %lo(portal + 0x7)($at)
    /* 714A4 800814A4 1280033C */  lui        $v1, %hi(myplr)
    /* 714A8 800814A8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 714AC 800814AC 1280013C */  lui        $at, %hi(setlvlnum)
    /* 714B0 800814B0 0FC122A0 */  sb         $v0, %lo(setlvlnum)($at)
    /* 714B4 800814B4 36050208 */  j          .L800814D8
    /* 714B8 800814B8 40100300 */   sll       $v0, $v1, 1
  .L800814BC:
    /* 714BC 800814BC 1280033C */  lui        $v1, %hi(myplr)
    /* 714C0 800814C0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 714C4 800814C4 1280013C */  lui        $at, %hi(setlevel)
    /* 714C8 800814C8 0EC120A0 */  sb         $zero, %lo(setlevel)($at)
    /* 714CC 800814CC 1280013C */  lui        $at, %hi(setlvlnum)
    /* 714D0 800814D0 0FC120A0 */  sb         $zero, %lo(setlvlnum)($at)
    /* 714D4 800814D4 40100300 */  sll        $v0, $v1, 1
  .L800814D8:
    /* 714D8 800814D8 21104300 */  addu       $v0, $v0, $v1
    /* 714DC 800814DC 80100200 */  sll        $v0, $v0, 2
    /* 714E0 800814E0 21104300 */  addu       $v0, $v0, $v1
    /* 714E4 800814E4 00110200 */  sll        $v0, $v0, 4
    /* 714E8 800814E8 23104300 */  subu       $v0, $v0, $v1
    /* 714EC 800814EC 80100200 */  sll        $v0, $v0, 2
    /* 714F0 800814F0 21104300 */  addu       $v0, $v0, $v1
    /* 714F4 800814F4 0E80013C */  lui        $at, %hi(portal + 0x6)
    /* 714F8 800814F8 21082400 */  addu       $at, $at, $a0
    /* 714FC 800814FC F23B2390 */  lbu        $v1, %lo(portal + 0x6)($at)
    /* 71500 80081500 C0100200 */  sll        $v0, $v0, 3
    /* 71504 80081504 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 71508 80081508 21082200 */  addu       $at, $at, $v0
    /* 7150C 8008150C 5CA523AC */  sw         $v1, %lo(plr + 0x24)($at)
    /* 71510 80081510 0E80013C */  lui        $at, %hi(portal)
    /* 71514 80081514 21082400 */  addu       $at, $at, $a0
    /* 71518 80081518 EC3B228C */  lw         $v0, %lo(portal)($at)
    /* 7151C 8008151C 1280013C */  lui        $at, %hi(currlevel)
    /* 71520 80081520 0CC123A0 */  sb         $v1, %lo(currlevel)($at)
    /* 71524 80081524 1280013C */  lui        $at, %hi(leveltype)
    /* 71528 80081528 0DC122A0 */  sb         $v0, %lo(leveltype)($at)
    /* 7152C 8008152C 01000424 */  addiu      $a0, $zero, 0x1
    /* 71530 80081530 B43D010C */  jal        NetSendCmd__FUcUc
    /* 71534 80081534 39000524 */   addiu     $a1, $zero, 0x39
    /* 71538 80081538 5021848F */  lw         $a0, %gp_rel(D_8011C8D0)($gp)
    /* 7153C 8008153C 7204020C */  jal        DeactivatePortal__Fi
    /* 71540 80081540 00000000 */   nop
  .L80081544:
    /* 71544 80081544 1000BF8F */  lw         $ra, 0x10($sp)
    /* 71548 80081548 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7154C 8008154C 0800E003 */  jr         $ra
    /* 71550 80081550 00000000 */   nop
endlabel GetPortalLevel__Fv
