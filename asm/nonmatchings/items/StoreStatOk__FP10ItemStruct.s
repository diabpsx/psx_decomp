.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StoreStatOk__FP10ItemStruct, 0x94

glabel StoreStatOk__FP10ItemStruct
    /* 37D04 80047D04 1280033C */  lui        $v1, %hi(myplr)
    /* 37D08 80047D08 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 37D0C 80047D0C 21388000 */  addu       $a3, $a0, $zero
    /* 37D10 80047D10 40100300 */  sll        $v0, $v1, 1
    /* 37D14 80047D14 21104300 */  addu       $v0, $v0, $v1
    /* 37D18 80047D18 80100200 */  sll        $v0, $v0, 2
    /* 37D1C 80047D1C 21104300 */  addu       $v0, $v0, $v1
    /* 37D20 80047D20 00110200 */  sll        $v0, $v0, 4
    /* 37D24 80047D24 23104300 */  subu       $v0, $v0, $v1
    /* 37D28 80047D28 80100200 */  sll        $v0, $v0, 2
    /* 37D2C 80047D2C 21104300 */  addu       $v0, $v0, $v1
    /* 37D30 80047D30 C0300200 */  sll        $a2, $v0, 3
    /* 37D34 80047D34 0E80013C */  lui        $at, %hi(plr + 0xF8)
    /* 37D38 80047D38 21082600 */  addu       $at, $at, $a2
    /* 37D3C 80047D3C 30A62384 */  lh         $v1, %lo(plr + 0xF8)($at)
    /* 37D40 80047D40 6100E290 */  lbu        $v0, 0x61($a3)
    /* 37D44 80047D44 6400E490 */  lbu        $a0, 0x64($a3)
    /* 37D48 80047D48 2A186200 */  slt        $v1, $v1, $v0
    /* 37D4C 80047D4C 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* 37D50 80047D50 21082600 */  addu       $at, $at, $a2
    /* 37D54 80047D54 34A62284 */  lh         $v0, %lo(plr + 0xFC)($at)
    /* 37D58 80047D58 00000000 */  nop
    /* 37D5C 80047D5C 2A104400 */  slt        $v0, $v0, $a0
    /* 37D60 80047D60 02004010 */  beqz       $v0, .L80047D6C
    /* 37D64 80047D64 01006538 */   xori      $a1, $v1, 0x1
    /* 37D68 80047D68 21280000 */  addu       $a1, $zero, $zero
  .L80047D6C:
    /* 37D6C 80047D6C 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 37D70 80047D70 21082600 */  addu       $at, $at, $a2
    /* 37D74 80047D74 38A62284 */  lh         $v0, %lo(plr + 0x100)($at)
    /* 37D78 80047D78 6200E390 */  lbu        $v1, 0x62($a3)
    /* 37D7C 80047D7C 00000000 */  nop
    /* 37D80 80047D80 2A104300 */  slt        $v0, $v0, $v1
    /* 37D84 80047D84 02004010 */  beqz       $v0, .L80047D90
    /* 37D88 80047D88 00000000 */   nop
    /* 37D8C 80047D8C 21280000 */  addu       $a1, $zero, $zero
  .L80047D90:
    /* 37D90 80047D90 0800E003 */  jr         $ra
    /* 37D94 80047D94 2110A000 */   addu      $v0, $a1, $zero
endlabel StoreStatOk__FP10ItemStruct
