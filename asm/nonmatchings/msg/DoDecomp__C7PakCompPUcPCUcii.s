.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoDecomp__C7PakCompPUcPCUcii, 0x24

glabel DoDecomp__C7PakCompPUcPCUcii
    /* 42AF4 80052AF4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42AF8 80052AF8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42AFC 80052AFC 2120A000 */  addu       $a0, $a1, $zero
    /* 42B00 80052B00 B1B8020C */  jal        PAK_DoUnpak__FPUcPCUc
    /* 42B04 80052B04 2128C000 */   addu      $a1, $a2, $zero
    /* 42B08 80052B08 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42B0C 80052B0C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42B10 80052B10 0800E003 */  jr         $ra
    /* 42B14 80052B14 00000000 */   nop
endlabel DoDecomp__C7PakCompPUcPCUcii
