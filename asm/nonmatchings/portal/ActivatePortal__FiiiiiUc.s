.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ActivatePortal__FiiiiiUc, 0x8C

glabel ActivatePortal__FiiiiiUc
    /* 7113C 8008113C 40100400 */  sll        $v0, $a0, 1
    /* 71140 80081140 21104400 */  addu       $v0, $v0, $a0
    /* 71144 80081144 80180200 */  sll        $v1, $v0, 2
    /* 71148 80081148 1000A88F */  lw         $t0, 0x10($sp)
    /* 7114C 8008114C 1400A493 */  lbu        $a0, 0x14($sp)
    /* 71150 80081150 01000224 */  addiu      $v0, $zero, 0x1
    /* 71154 80081154 0E80013C */  lui        $at, %hi(portal + 0x8)
    /* 71158 80081158 21082300 */  addu       $at, $at, $v1
    /* 7115C 8008115C F43B22A0 */  sb         $v0, %lo(portal + 0x8)($at)
    /* 71160 80081160 1700E010 */  beqz       $a3, .L800811C0
    /* 71164 80081164 00000000 */   nop
    /* 71168 80081168 0E80013C */  lui        $at, %hi(portal + 0x4)
    /* 7116C 8008116C 21082300 */  addu       $at, $at, $v1
    /* 71170 80081170 F03B25A0 */  sb         $a1, %lo(portal + 0x4)($at)
    /* 71174 80081174 0E80013C */  lui        $at, %hi(portal + 0x5)
    /* 71178 80081178 21082300 */  addu       $at, $at, $v1
    /* 7117C 8008117C F13B26A0 */  sb         $a2, %lo(portal + 0x5)($at)
    /* 71180 80081180 1280023C */  lui        $v0, %hi(currlevel)
    /* 71184 80081184 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 71188 80081188 0E80013C */  lui        $at, %hi(portal + 0x9)
    /* 7118C 8008118C 21082300 */  addu       $at, $at, $v1
    /* 71190 80081190 F53B24A0 */  sb         $a0, %lo(portal + 0x9)($at)
    /* 71194 80081194 0E80013C */  lui        $at, %hi(portal + 0x6)
    /* 71198 80081198 21082300 */  addu       $at, $at, $v1
    /* 7119C 8008119C F23B22A0 */  sb         $v0, %lo(portal + 0x6)($at)
    /* 711A0 800811A0 1280023C */  lui        $v0, %hi(setlvlnum)
    /* 711A4 800811A4 0FC14290 */  lbu        $v0, %lo(setlvlnum)($v0)
    /* 711A8 800811A8 0E80013C */  lui        $at, %hi(portal)
    /* 711AC 800811AC 21082300 */  addu       $at, $at, $v1
    /* 711B0 800811B0 EC3B28AC */  sw         $t0, %lo(portal)($at)
    /* 711B4 800811B4 0E80013C */  lui        $at, %hi(portal + 0x7)
    /* 711B8 800811B8 21082300 */  addu       $at, $at, $v1
    /* 711BC 800811BC F33B22A0 */  sb         $v0, %lo(portal + 0x7)($at)
  .L800811C0:
    /* 711C0 800811C0 0800E003 */  jr         $ra
    /* 711C4 800811C4 00000000 */   nop
endlabel ActivatePortal__FiiiiiUc
