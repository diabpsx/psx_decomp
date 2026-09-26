.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMushPatch__Fv, 0xF4

glabel AddMushPatch__Fv
    /* 1D794 8015738C 1280023C */  lui        $v0, %hi(numobjects)
    /* 1D798 80157390 CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 1D79C 80157394 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D7A0 80157398 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1D7A4 8015739C 7F004228 */  slti       $v0, $v0, 0x7F
    /* 1D7A8 801573A0 32004010 */  beqz       $v0, .L8015746C
    /* 1D7AC 801573A4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1D7B0 801573A8 05000424 */  addiu      $a0, $zero, 0x5
    /* 1D7B4 801573AC 1000A527 */  addiu      $a1, $sp, 0x10
    /* 1D7B8 801573B0 0E80103C */  lui        $s0, %hi(objectavail)
    /* 1D7BC 801573B4 A0A21082 */  lb         $s0, %lo(objectavail)($s0)
    /* 1D7C0 801573B8 A25C050C */  jal        GetRndObjLoc__FiRiT1
    /* 1D7C4 801573BC 1400A627 */   addiu     $a2, $sp, 0x14
    /* 1D7C8 801573C0 1400A48F */  lw         $a0, 0x14($sp)
    /* 1D7CC 801573C4 1000A38F */  lw         $v1, 0x10($sp)
    /* 1D7D0 801573C8 01008424 */  addiu      $a0, $a0, 0x1
    /* 1D7D4 801573CC C0200400 */  sll        $a0, $a0, 3
    /* 1D7D8 801573D0 01006324 */  addiu      $v1, $v1, 0x1
    /* 1D7DC 801573D4 C0100300 */  sll        $v0, $v1, 3
    /* 1D7E0 801573D8 23104300 */  subu       $v0, $v0, $v1
    /* 1D7E4 801573DC C0110200 */  sll        $v0, $v0, 7
    /* 1D7E8 801573E0 21208200 */  addu       $a0, $a0, $v0
    /* 1D7EC 801573E4 27801000 */  nor        $s0, $zero, $s0
    /* 1D7F0 801573E8 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1D7F4 801573EC 21082400 */  addu       $at, $at, $a0
    /* 1D7F8 801573F0 2B7A30A0 */  sb         $s0, %lo(dung_map + 0x3)($at)
    /* 1D7FC 801573F4 1400A38F */  lw         $v1, 0x14($sp)
    /* 1D800 801573F8 1000A48F */  lw         $a0, 0x10($sp)
    /* 1D804 801573FC 01006324 */  addiu      $v1, $v1, 0x1
    /* 1D808 80157400 C0180300 */  sll        $v1, $v1, 3
    /* 1D80C 80157404 02008424 */  addiu      $a0, $a0, 0x2
    /* 1D810 80157408 C0100400 */  sll        $v0, $a0, 3
    /* 1D814 8015740C 23104400 */  subu       $v0, $v0, $a0
    /* 1D818 80157410 C0110200 */  sll        $v0, $v0, 7
    /* 1D81C 80157414 21186200 */  addu       $v1, $v1, $v0
    /* 1D820 80157418 5E000424 */  addiu      $a0, $zero, 0x5E
    /* 1D824 8015741C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1D828 80157420 21082300 */  addu       $at, $at, $v1
    /* 1D82C 80157424 2B7A30A0 */  sb         $s0, %lo(dung_map + 0x3)($at)
    /* 1D830 80157428 1400A58F */  lw         $a1, 0x14($sp)
    /* 1D834 8015742C 1000A38F */  lw         $v1, 0x10($sp)
    /* 1D838 80157430 0200A524 */  addiu      $a1, $a1, 0x2
    /* 1D83C 80157434 C0280500 */  sll        $a1, $a1, 3
    /* 1D840 80157438 01006324 */  addiu      $v1, $v1, 0x1
    /* 1D844 8015743C C0100300 */  sll        $v0, $v1, 3
    /* 1D848 80157440 23104300 */  subu       $v0, $v0, $v1
    /* 1D84C 80157444 C0110200 */  sll        $v0, $v0, 7
    /* 1D850 80157448 2128A200 */  addu       $a1, $a1, $v0
    /* 1D854 8015744C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1D858 80157450 21082500 */  addu       $at, $at, $a1
    /* 1D85C 80157454 2B7A30A0 */  sb         $s0, %lo(dung_map + 0x3)($at)
    /* 1D860 80157458 1000A58F */  lw         $a1, 0x10($sp)
    /* 1D864 8015745C 1400A68F */  lw         $a2, 0x14($sp)
    /* 1D868 80157460 0200A524 */  addiu      $a1, $a1, 0x2
    /* 1D86C 80157464 BE4E010C */  jal        AddObject__Fiii
    /* 1D870 80157468 0200C624 */   addiu     $a2, $a2, 0x2
  .L8015746C:
    /* 1D874 8015746C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1D878 80157470 1800B08F */  lw         $s0, 0x18($sp)
    /* 1D87C 80157474 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D880 80157478 0800E003 */  jr         $ra
    /* 1D884 8015747C 00000000 */   nop
endlabel AddMushPatch__Fv
