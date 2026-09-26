.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Acidpud__Fi, 0x12C

glabel MI_Acidpud__Fi
    /* AB6C 80144764 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* AB70 80144768 2800B2AF */  sw         $s2, 0x28($sp)
    /* AB74 8014476C 21908000 */  addu       $s2, $a0, $zero
    /* AB78 80144770 80101200 */  sll        $v0, $s2, 2
    /* AB7C 80144774 21105200 */  addu       $v0, $v0, $s2
    /* AB80 80144778 80100200 */  sll        $v0, $v0, 2
    /* AB84 8014477C 23105200 */  subu       $v0, $v0, $s2
    /* AB88 80144780 2400B1AF */  sw         $s1, 0x24($sp)
    /* AB8C 80144784 80880200 */  sll        $s1, $v0, 2
    /* AB90 80144788 01000724 */  addiu      $a3, $zero, 0x1
    /* AB94 8014478C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* AB98 80144790 2000B0AF */  sw         $s0, 0x20($sp)
    /* AB9C 80144794 1080013C */  lui        $at, %hi(missile + 0x18)
    /* ABA0 80144798 21083100 */  addu       $at, $at, $s1
    /* ABA4 8014479C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* ABA8 801447A0 1080013C */  lui        $at, %hi(missile + 0x10)
    /* ABAC 801447A4 21083100 */  addu       $at, $at, $s1
    /* ABB0 801447A8 682C258C */  lw         $a1, %lo(missile + 0x10)($at)
    /* ABB4 801447AC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* ABB8 801447B0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* ABBC 801447B4 21083100 */  addu       $at, $at, $s1
    /* ABC0 801447B8 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* ABC4 801447BC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* ABC8 801447C0 21083100 */  addu       $at, $at, $s1
    /* ABCC 801447C4 702C3094 */  lhu        $s0, %lo(missile + 0x18)($at)
    /* ABD0 801447C8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* ABD4 801447CC 21083100 */  addu       $at, $at, $s1
    /* ABD8 801447D0 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* ABDC 801447D4 2130A000 */  addu       $a2, $a1, $zero
    /* ABE0 801447D8 1000A2AF */  sw         $v0, 0x10($sp)
    /* ABE4 801447DC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* ABE8 801447E0 21083100 */  addu       $at, $at, $s1
    /* ABEC 801447E4 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* ABF0 801447E8 01000224 */  addiu      $v0, $zero, 0x1
    /* ABF4 801447EC 1800A0AF */  sw         $zero, 0x18($sp)
    /* ABF8 801447F0 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* ABFC 801447F4 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* AC00 801447F8 1400A3AF */   sw        $v1, 0x14($sp)
    /* AC04 801447FC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AC08 80144800 21083100 */  addu       $at, $at, $s1
    /* AC0C 80144804 702C30A4 */  sh         $s0, %lo(missile + 0x18)($at)
    /* AC10 80144808 18000016 */  bnez       $s0, .L8014486C
    /* AC14 8014480C 00000000 */   nop
    /* AC18 80144810 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* AC1C 80144814 21083100 */  addu       $at, $at, $s1
    /* AC20 80144818 972C2280 */  lb         $v0, %lo(missile + 0x3F)($at)
    /* AC24 8014481C 00000000 */  nop
    /* AC28 80144820 06004010 */  beqz       $v0, .L8014483C
    /* AC2C 80144824 01000224 */   addiu     $v0, $zero, 0x1
    /* AC30 80144828 1080013C */  lui        $at, %hi(missile + 0x38)
    /* AC34 8014482C 21083100 */  addu       $at, $at, $s1
    /* AC38 80144830 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* AC3C 80144834 1B120508 */  j          .L8014486C
    /* AC40 80144838 00000000 */   nop
  .L8014483C:
    /* AC44 8014483C 21204002 */  addu       $a0, $s2, $zero
    /* AC48 80144840 09F5040C */  jal        SetMissDir__Fii
    /* AC4C 80144844 01000524 */   addiu     $a1, $zero, 0x1
    /* AC50 80144848 1080013C */  lui        $at, %hi(missile + 0x42)
    /* AC54 8014484C 21083100 */  addu       $at, $at, $s1
    /* AC58 80144850 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* AC5C 80144854 00000000 */  nop
    /* AC60 80144858 00160200 */  sll        $v0, $v0, 24
    /* AC64 8014485C 03160200 */  sra        $v0, $v0, 24
    /* AC68 80144860 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AC6C 80144864 21083100 */  addu       $at, $at, $s1
    /* AC70 80144868 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L8014486C:
    /* AC74 8014486C D1EA040C */  jal        PutMissile__Fi
    /* AC78 80144870 21204002 */   addu      $a0, $s2, $zero
    /* AC7C 80144874 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* AC80 80144878 2800B28F */  lw         $s2, 0x28($sp)
    /* AC84 8014487C 2400B18F */  lw         $s1, 0x24($sp)
    /* AC88 80144880 2000B08F */  lw         $s0, 0x20($sp)
    /* AC8C 80144884 3000BD27 */  addiu      $sp, $sp, 0x30
    /* AC90 80144888 0800E003 */  jr         $ra
    /* AC94 8014488C 00000000 */   nop
endlabel MI_Acidpud__Fi
