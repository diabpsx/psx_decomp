.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartGoldDrop__Fv, 0x104

glabel StartGoldDrop__Fv
    /* 26774 8016036C 1280023C */  lui        $v0, %hi(sel_data)
    /* 26778 80160370 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 2677C 80160374 1280033C */  lui        $v1, %hi(_pcursinvitem)
    /* 26780 80160378 68B76324 */  addiu      $v1, $v1, %lo(_pcursinvitem)
    /* 26784 8016037C 21104300 */  addu       $v0, $v0, $v1
    /* 26788 80160380 00004380 */  lb         $v1, 0x0($v0)
    /* 2678C 80160384 1280013C */  lui        $at, %hi(initialDropGoldIndex)
    /* 26790 80160388 D0B623AC */  sw         $v1, %lo(initialDropGoldIndex)($at)
    /* 26794 8016038C 00004380 */  lb         $v1, 0x0($v0)
    /* 26798 80160390 00000000 */  nop
    /* 2679C 80160394 2F006228 */  slti       $v0, $v1, 0x2F
    /* 267A0 80160398 17004010 */  beqz       $v0, .L801603F8
    /* 267A4 8016039C F9FF6224 */   addiu     $v0, $v1, -0x7
    /* 267A8 801603A0 C0180200 */  sll        $v1, $v0, 3
    /* 267AC 801603A4 23186200 */  subu       $v1, $v1, $v0
    /* 267B0 801603A8 80180300 */  sll        $v1, $v1, 2
    /* 267B4 801603AC 23186200 */  subu       $v1, $v1, $v0
    /* 267B8 801603B0 1280043C */  lui        $a0, %hi(myplr)
    /* 267BC 801603B4 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 267C0 801603B8 80180300 */  sll        $v1, $v1, 2
    /* 267C4 801603BC 40100400 */  sll        $v0, $a0, 1
    /* 267C8 801603C0 21104400 */  addu       $v0, $v0, $a0
    /* 267CC 801603C4 80100200 */  sll        $v0, $v0, 2
    /* 267D0 801603C8 21104400 */  addu       $v0, $v0, $a0
    /* 267D4 801603CC 00110200 */  sll        $v0, $v0, 4
    /* 267D8 801603D0 23104400 */  subu       $v0, $v0, $a0
    /* 267DC 801603D4 80100200 */  sll        $v0, $v0, 2
    /* 267E0 801603D8 21104400 */  addu       $v0, $v0, $a0
    /* 267E4 801603DC C0100200 */  sll        $v0, $v0, 3
    /* 267E8 801603E0 21186200 */  addu       $v1, $v1, $v0
    /* 267EC 801603E4 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 267F0 801603E8 21082300 */  addu       $at, $at, $v1
    /* 267F4 801603EC F0A9228C */  lw         $v0, %lo(plr + 0x4B8)($at)
    /* 267F8 801603F0 13810508 */  j          .L8016044C
    /* 267FC 801603F4 00000000 */   nop
  .L801603F8:
    /* 26800 801603F8 D1FF6224 */  addiu      $v0, $v1, -0x2F
    /* 26804 801603FC C0180200 */  sll        $v1, $v0, 3
    /* 26808 80160400 23186200 */  subu       $v1, $v1, $v0
    /* 2680C 80160404 80180300 */  sll        $v1, $v1, 2
    /* 26810 80160408 23186200 */  subu       $v1, $v1, $v0
    /* 26814 8016040C 1280043C */  lui        $a0, %hi(myplr)
    /* 26818 80160410 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 2681C 80160414 80180300 */  sll        $v1, $v1, 2
    /* 26820 80160418 40100400 */  sll        $v0, $a0, 1
    /* 26824 8016041C 21104400 */  addu       $v0, $v0, $a0
    /* 26828 80160420 80100200 */  sll        $v0, $v0, 2
    /* 2682C 80160424 21104400 */  addu       $v0, $v0, $a0
    /* 26830 80160428 00110200 */  sll        $v0, $v0, 4
    /* 26834 8016042C 23104400 */  subu       $v0, $v0, $a0
    /* 26838 80160430 80100200 */  sll        $v0, $v0, 2
    /* 2683C 80160434 21104400 */  addu       $v0, $v0, $a0
    /* 26840 80160438 C0100200 */  sll        $v0, $v0, 3
    /* 26844 8016043C 21186200 */  addu       $v1, $v1, $v0
    /* 26848 80160440 0E80013C */  lui        $at, %hi(plr + 0x15C4)
    /* 2684C 80160444 21082300 */  addu       $at, $at, $v1
    /* 26850 80160448 FCBA228C */  lw         $v0, %lo(plr + 0x15C4)($at)
  .L8016044C:
    /* 26854 8016044C 1280013C */  lui        $at, %hi(initialDropGoldValue)
    /* 26858 80160450 CCB622AC */  sw         $v0, %lo(initialDropGoldValue)($at)
    /* 2685C 80160454 01000224 */  addiu      $v0, $zero, 0x1
    /* 26860 80160458 1280013C */  lui        $at, %hi(dropGoldFlag)
    /* 26864 8016045C B4B622A0 */  sb         $v0, %lo(dropGoldFlag)($at)
    /* 26868 80160460 1280013C */  lui        $at, %hi(dropGoldValue)
    /* 2686C 80160464 C8B620AC */  sw         $zero, %lo(dropGoldValue)($at)
    /* 26870 80160468 0800E003 */  jr         $ra
    /* 26874 8016046C 00000000 */   nop
endlabel StartGoldDrop__Fv
