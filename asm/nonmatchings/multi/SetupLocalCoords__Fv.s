.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetupLocalCoords__Fv, 0x160

glabel SetupLocalCoords__Fv
    /* 42C1C 80052C1C 1280023C */  lui        $v0, %hi(leveldebug)
    /* 42C20 80052C20 98B74290 */  lbu        $v0, %lo(leveldebug)($v0)
    /* 42C24 80052C24 00000000 */  nop
    /* 42C28 80052C28 06004010 */  beqz       $v0, .L80052C44
    /* 42C2C 80052C2C 00000000 */   nop
    /* 42C30 80052C30 22128293 */  lbu        $v0, %gp_rel(gbMaxPlayers)($gp)
    /* 42C34 80052C34 00000000 */  nop
    /* 42C38 80052C38 0200422C */  sltiu      $v0, $v0, 0x2
    /* 42C3C 80052C3C 07004014 */  bnez       $v0, .L80052C5C
    /* 42C40 80052C40 00000000 */   nop
  .L80052C44:
    /* 42C44 80052C44 1280013C */  lui        $at, %hi(currlevel)
    /* 42C48 80052C48 0CC120A0 */  sb         $zero, %lo(currlevel)($at)
    /* 42C4C 80052C4C 1280013C */  lui        $at, %hi(leveltype)
    /* 42C50 80052C50 0DC120A0 */  sb         $zero, %lo(leveltype)($at)
    /* 42C54 80052C54 1280013C */  lui        $at, %hi(setlevel)
    /* 42C58 80052C58 0EC120A0 */  sb         $zero, %lo(setlevel)($at)
  .L80052C5C:
    /* 42C5C 80052C5C 1280033C */  lui        $v1, %hi(myplr)
    /* 42C60 80052C60 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 42C64 80052C64 00000000 */  nop
    /* 42C68 80052C68 80280300 */  sll        $a1, $v1, 2
    /* 42C6C 80052C6C 40100300 */  sll        $v0, $v1, 1
    /* 42C70 80052C70 21104300 */  addu       $v0, $v0, $v1
    /* 42C74 80052C74 80100200 */  sll        $v0, $v0, 2
    /* 42C78 80052C78 21104300 */  addu       $v0, $v0, $v1
    /* 42C7C 80052C7C 00110200 */  sll        $v0, $v0, 4
    /* 42C80 80052C80 23104300 */  subu       $v0, $v0, $v1
    /* 42C84 80052C84 80100200 */  sll        $v0, $v0, 2
    /* 42C88 80052C88 21104300 */  addu       $v0, $v0, $v1
    /* 42C8C 80052C8C 0E80013C */  lui        $at, %hi(plrxoff)
    /* 42C90 80052C90 21082500 */  addu       $at, $at, $a1
    /* 42C94 80052C94 48A3248C */  lw         $a0, %lo(plrxoff)($at)
    /* 42C98 80052C98 0E80013C */  lui        $at, %hi(plryoff)
    /* 42C9C 80052C9C 21082500 */  addu       $at, $at, $a1
    /* 42CA0 80052CA0 6CA3258C */  lw         $a1, %lo(plryoff)($at)
    /* 42CA4 80052CA4 1280033C */  lui        $v1, %hi(currlevel)
    /* 42CA8 80052CA8 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 42CAC 80052CAC C0100200 */  sll        $v0, $v0, 3
    /* 42CB0 80052CB0 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 42CB4 80052CB4 21082200 */  addu       $at, $at, $v0
    /* 42CB8 80052CB8 5CA523AC */  sw         $v1, %lo(plr + 0x24)($at)
    /* 42CBC 80052CBC 01000324 */  addiu      $v1, $zero, 0x1
    /* 42CC0 80052CC0 4B008424 */  addiu      $a0, $a0, 0x4B
    /* 42CC4 80052CC4 0E80013C */  lui        $at, %hi(plr + 0xD5)
    /* 42CC8 80052CC8 21082200 */  addu       $at, $at, $v0
    /* 42CCC 80052CCC 0DA623A0 */  sb         $v1, %lo(plr + 0xD5)($at)
    /* 42CD0 80052CD0 1280033C */  lui        $v1, %hi(myplr)
    /* 42CD4 80052CD4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 42CD8 80052CD8 4400A524 */  addiu      $a1, $a1, 0x44
    /* 42CDC 80052CDC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 42CE0 80052CE0 21082200 */  addu       $at, $at, $v0
    /* 42CE4 80052CE4 68A524A4 */  sh         $a0, %lo(plr + 0x30)($at)
    /* 42CE8 80052CE8 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 42CEC 80052CEC 21082200 */  addu       $at, $at, $v0
    /* 42CF0 80052CF0 6AA525A4 */  sh         $a1, %lo(plr + 0x32)($at)
    /* 42CF4 80052CF4 40100300 */  sll        $v0, $v1, 1
    /* 42CF8 80052CF8 21104300 */  addu       $v0, $v0, $v1
    /* 42CFC 80052CFC 80100200 */  sll        $v0, $v0, 2
    /* 42D00 80052D00 21104300 */  addu       $v0, $v0, $v1
    /* 42D04 80052D04 00110200 */  sll        $v0, $v0, 4
    /* 42D08 80052D08 23104300 */  subu       $v0, $v0, $v1
    /* 42D0C 80052D0C 80100200 */  sll        $v0, $v0, 2
    /* 42D10 80052D10 21104300 */  addu       $v0, $v0, $v1
    /* 42D14 80052D14 C0100200 */  sll        $v0, $v0, 3
    /* 42D18 80052D18 0E80013C */  lui        $at, %hi(plr + 0x19E2)
    /* 42D1C 80052D1C 21082200 */  addu       $at, $at, $v0
    /* 42D20 80052D20 1ABF20A0 */  sb         $zero, %lo(plr + 0x19E2)($at)
    /* 42D24 80052D24 1280033C */  lui        $v1, %hi(myplr)
    /* 42D28 80052D28 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 42D2C 80052D2C 00000000 */  nop
    /* 42D30 80052D30 40100300 */  sll        $v0, $v1, 1
    /* 42D34 80052D34 21104300 */  addu       $v0, $v0, $v1
    /* 42D38 80052D38 80100200 */  sll        $v0, $v0, 2
    /* 42D3C 80052D3C 21104300 */  addu       $v0, $v0, $v1
    /* 42D40 80052D40 00110200 */  sll        $v0, $v0, 4
    /* 42D44 80052D44 23104300 */  subu       $v0, $v0, $v1
    /* 42D48 80052D48 80100200 */  sll        $v0, $v0, 2
    /* 42D4C 80052D4C 21104300 */  addu       $v0, $v0, $v1
    /* 42D50 80052D50 C0100200 */  sll        $v0, $v0, 3
    /* 42D54 80052D54 0A000324 */  addiu      $v1, $zero, 0xA
    /* 42D58 80052D58 0E80013C */  lui        $at, %hi(plr)
    /* 42D5C 80052D5C 21082200 */  addu       $at, $at, $v0
    /* 42D60 80052D60 38A523AC */  sw         $v1, %lo(plr)($at)
    /* 42D64 80052D64 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 42D68 80052D68 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 42D6C 80052D6C 21082200 */  addu       $at, $at, $v0
    /* 42D70 80052D70 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 42D74 80052D74 0800E003 */  jr         $ra
    /* 42D78 80052D78 00000000 */   nop
endlabel SetupLocalCoords__Fv
