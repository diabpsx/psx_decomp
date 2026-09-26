.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddResurrect__Fiiiiiicii, 0x7C

glabel AddResurrect__Fiiiiiicii
    /* 881C 80142414 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8820 80142418 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8824 8014241C 21888000 */  addu       $s1, $a0, $zero
    /* 8828 80142420 1000B0AF */  sw         $s0, 0x10($sp)
    /* 882C 80142424 3C00B08F */  lw         $s0, 0x3C($sp)
    /* 8830 80142428 20000524 */  addiu      $a1, $zero, 0x20
    /* 8834 8014242C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8838 80142430 C2DC010C */  jal        UseMana__Fii
    /* 883C 80142434 21200002 */   addu      $a0, $s0, $zero
    /* 8840 80142438 1280023C */  lui        $v0, %hi(myplr)
    /* 8844 8014243C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 8848 80142440 00000000 */  nop
    /* 884C 80142444 04000216 */  bne        $s0, $v0, .L80142458
    /* 8850 80142448 80101100 */   sll       $v0, $s1, 2
    /* 8854 8014244C 01DE000C */  jal        NewCursor__Fi
    /* 8858 80142450 08000424 */   addiu     $a0, $zero, 0x8
    /* 885C 80142454 80101100 */  sll        $v0, $s1, 2
  .L80142458:
    /* 8860 80142458 21105100 */  addu       $v0, $v0, $s1
    /* 8864 8014245C 80100200 */  sll        $v0, $v0, 2
    /* 8868 80142460 23105100 */  subu       $v0, $v0, $s1
    /* 886C 80142464 80100200 */  sll        $v0, $v0, 2
    /* 8870 80142468 01000324 */  addiu      $v1, $zero, 0x1
    /* 8874 8014246C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 8878 80142470 21082200 */  addu       $at, $at, $v0
    /* 887C 80142474 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 8880 80142478 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8884 8014247C 1400B18F */  lw         $s1, 0x14($sp)
    /* 8888 80142480 1000B08F */  lw         $s0, 0x10($sp)
    /* 888C 80142484 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8890 80142488 0800E003 */  jr         $ra
    /* 8894 8014248C 00000000 */   nop
endlabel AddResurrect__Fiiiiiicii
