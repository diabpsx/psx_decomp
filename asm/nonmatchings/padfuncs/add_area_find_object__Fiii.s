.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching add_area_find_object__Fiii, 0x70

glabel add_area_find_object__Fiii
    /* 936B4 800A36B4 21488000 */  addu       $t1, $a0, $zero
    /* 936B8 800A36B8 1280043C */  lui        $a0, %hi(sel_data)
    /* 936BC 800A36BC 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 936C0 800A36C0 1280023C */  lui        $v0, %hi(_pfind_index)
    /* 936C4 800A36C4 DCBB4224 */  addiu      $v0, $v0, %lo(_pfind_index)
    /* 936C8 800A36C8 21408200 */  addu       $t0, $a0, $v0
    /* 936CC 800A36CC 00000781 */  lb         $a3, 0x0($t0)
    /* 936D0 800A36D0 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 936D4 800A36D4 0A00E228 */  slti       $v0, $a3, 0xA
    /* 936D8 800A36D8 0F004010 */  beqz       $v0, .L800A3718
    /* 936DC 800A36DC 2118E000 */   addu      $v1, $a3, $zero
    /* 936E0 800A36E0 01006224 */  addiu      $v0, $v1, 0x1
    /* 936E4 800A36E4 000002A1 */  sb         $v0, 0x0($t0)
    /* 936E8 800A36E8 00110400 */  sll        $v0, $a0, 4
    /* 936EC 800A36EC 23104400 */  subu       $v0, $v0, $a0
    /* 936F0 800A36F0 40100200 */  sll        $v0, $v0, 1
    /* 936F4 800A36F4 40180700 */  sll        $v1, $a3, 1
    /* 936F8 800A36F8 21186700 */  addu       $v1, $v1, $a3
    /* 936FC 800A36FC 0E80043C */  lui        $a0, %hi(_pfind_list)
    /* 93700 800A3700 A8388424 */  addiu      $a0, $a0, %lo(_pfind_list)
    /* 93704 800A3704 21186400 */  addu       $v1, $v1, $a0
    /* 93708 800A3708 21104300 */  addu       $v0, $v0, $v1
    /* 9370C 800A370C 010045A0 */  sb         $a1, 0x1($v0)
    /* 93710 800A3710 020046A0 */  sb         $a2, 0x2($v0)
    /* 93714 800A3714 000049A0 */  sb         $t1, 0x0($v0)
  .L800A3718:
    /* 93718 800A3718 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 9371C 800A371C 0800E003 */  jr         $ra
    /* 93720 800A3720 00000000 */   nop
endlabel add_area_find_object__Fiii
