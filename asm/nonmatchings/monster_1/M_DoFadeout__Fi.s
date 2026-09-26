.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoFadeout__Fi, 0x12C

glabel M_DoFadeout__Fi
    /* 1453C 8014E134 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14540 8014E138 40100400 */  sll        $v0, $a0, 1
    /* 14544 8014E13C 21104400 */  addu       $v0, $v0, $a0
    /* 14548 8014E140 80100200 */  sll        $v0, $v0, 2
    /* 1454C 8014E144 21104400 */  addu       $v0, $v0, $a0
    /* 14550 8014E148 C0280200 */  sll        $a1, $v0, 3
    /* 14554 8014E14C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 14558 8014E150 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1455C 8014E154 21082500 */  addu       $at, $at, $a1
    /* 14560 8014E158 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14564 8014E15C 00000000 */  nop
    /* 14568 8014E160 02004230 */  andi       $v0, $v0, 0x2
    /* 1456C 8014E164 09004010 */  beqz       $v0, .L8014E18C
    /* 14570 8014E168 01000224 */   addiu     $v0, $zero, 0x1
    /* 14574 8014E16C 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 14578 8014E170 21082500 */  addu       $at, $at, $a1
    /* 1457C 8014E174 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 14580 8014E178 00000000 */  nop
    /* 14584 8014E17C 0D006210 */  beq        $v1, $v0, .L8014E1B4
    /* 14588 8014E180 40100400 */   sll       $v0, $a0, 1
    /* 1458C 8014E184 94380508 */  j          .L8014E250
    /* 14590 8014E188 21100000 */   addu      $v0, $zero, $zero
  .L8014E18C:
    /* 14594 8014E18C 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 14598 8014E190 21082500 */  addu       $at, $at, $a1
    /* 1459C 8014E194 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 145A0 8014E198 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 145A4 8014E19C 21082500 */  addu       $at, $at, $a1
    /* 145A8 8014E1A0 D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 145AC 8014E1A4 00000000 */  nop
    /* 145B0 8014E1A8 29006214 */  bne        $v1, $v0, .L8014E250
    /* 145B4 8014E1AC 21100000 */   addu      $v0, $zero, $zero
    /* 145B8 8014E1B0 40100400 */  sll        $v0, $a0, 1
  .L8014E1B4:
    /* 145BC 8014E1B4 21104400 */  addu       $v0, $v0, $a0
    /* 145C0 8014E1B8 80100200 */  sll        $v0, $v0, 2
    /* 145C4 8014E1BC 21104400 */  addu       $v0, $v0, $a0
    /* 145C8 8014E1C0 C0180200 */  sll        $v1, $v0, 3
    /* 145CC 8014E1C4 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 145D0 8014E1C8 21082300 */  addu       $at, $at, $v1
    /* 145D4 8014E1CC F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 145D8 8014E1D0 00000000 */  nop
    /* 145DC 8014E1D4 12004290 */  lbu        $v0, 0x12($v0)
    /* 145E0 8014E1D8 00000000 */  nop
    /* 145E4 8014E1DC B8FF4224 */  addiu      $v0, $v0, -0x48
    /* 145E8 8014E1E0 0400422C */  sltiu      $v0, $v0, 0x4
    /* 145EC 8014E1E4 06004010 */  beqz       $v0, .L8014E200
    /* 145F0 8014E1E8 00000000 */   nop
    /* 145F4 8014E1EC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 145F8 8014E1F0 21082300 */  addu       $at, $at, $v1
    /* 145FC 8014E1F4 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14600 8014E1F8 86380508 */  j          .L8014E218
    /* 14604 8014E1FC FDFF4230 */   andi      $v0, $v0, 0xFFFD
  .L8014E200:
    /* 14608 8014E200 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1460C 8014E204 21082300 */  addu       $at, $at, $v1
    /* 14610 8014E208 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14614 8014E20C 00000000 */  nop
    /* 14618 8014E210 FDFF4230 */  andi       $v0, $v0, 0xFFFD
    /* 1461C 8014E214 01004234 */  ori        $v0, $v0, 0x1
  .L8014E218:
    /* 14620 8014E218 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14624 8014E21C 21082300 */  addu       $at, $at, $v1
    /* 14628 8014E220 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 1462C 8014E224 40100400 */  sll        $v0, $a0, 1
    /* 14630 8014E228 21104400 */  addu       $v0, $v0, $a0
    /* 14634 8014E22C 80100200 */  sll        $v0, $v0, 2
    /* 14638 8014E230 21104400 */  addu       $v0, $v0, $a0
    /* 1463C 8014E234 C0100200 */  sll        $v0, $v0, 3
    /* 14640 8014E238 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 14644 8014E23C 21082200 */  addu       $at, $at, $v0
    /* 14648 8014E240 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 1464C 8014E244 9CFF010C */  jal        M_StartStand__Fii
    /* 14650 8014E248 00000000 */   nop
    /* 14654 8014E24C 01000224 */  addiu      $v0, $zero, 0x1
  .L8014E250:
    /* 14658 8014E250 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1465C 8014E254 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 14660 8014E258 0800E003 */  jr         $ra
    /* 14664 8014E25C 00000000 */   nop
endlabel M_DoFadeout__Fi
