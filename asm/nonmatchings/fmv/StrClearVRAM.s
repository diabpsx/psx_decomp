.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StrClearVRAM, 0xC0

glabel StrClearVRAM
    /* 1E6A0 80158298 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1E6A4 8015829C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1E6A8 801582A0 21280000 */  addu       $a1, $zero, $zero
    /* 1E6AC 801582A4 21300000 */  addu       $a2, $zero, $zero
    /* 1E6B0 801582A8 21380000 */  addu       $a3, $zero, $zero
    /* 1E6B4 801582AC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1E6B8 801582B0 40011124 */  addiu      $s1, $zero, 0x140
    /* 1E6BC 801582B4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1E6C0 801582B8 00011024 */  addiu      $s0, $zero, 0x100
    /* 1E6C4 801582BC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1E6C8 801582C0 1000A0A7 */  sh         $zero, 0x10($sp)
    /* 1E6CC 801582C4 1200A0A7 */  sh         $zero, 0x12($sp)
    /* 1E6D0 801582C8 1400B1A7 */  sh         $s1, 0x14($sp)
    /* 1E6D4 801582CC FF4E000C */  jal        ClearImage
    /* 1E6D8 801582D0 1600B0A7 */   sh        $s0, 0x16($sp)
    /* 1E6DC 801582D4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1E6E0 801582D8 21280000 */  addu       $a1, $zero, $zero
    /* 1E6E4 801582DC 21300000 */  addu       $a2, $zero, $zero
    /* 1E6E8 801582E0 21380000 */  addu       $a3, $zero, $zero
    /* 1E6EC 801582E4 1000B1A7 */  sh         $s1, 0x10($sp)
    /* 1E6F0 801582E8 1200A0A7 */  sh         $zero, 0x12($sp)
    /* 1E6F4 801582EC 1400B1A7 */  sh         $s1, 0x14($sp)
    /* 1E6F8 801582F0 FF4E000C */  jal        ClearImage
    /* 1E6FC 801582F4 1600B0A7 */   sh        $s0, 0x16($sp)
    /* 1E700 801582F8 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1E704 801582FC 21280000 */  addu       $a1, $zero, $zero
    /* 1E708 80158300 21300000 */  addu       $a2, $zero, $zero
    /* 1E70C 80158304 21380000 */  addu       $a3, $zero, $zero
    /* 1E710 80158308 1000A0A7 */  sh         $zero, 0x10($sp)
    /* 1E714 8015830C 1200B0A7 */  sh         $s0, 0x12($sp)
    /* 1E718 80158310 1400B1A7 */  sh         $s1, 0x14($sp)
    /* 1E71C 80158314 FF4E000C */  jal        ClearImage
    /* 1E720 80158318 1600B0A7 */   sh        $s0, 0x16($sp)
    /* 1E724 8015831C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1E728 80158320 21280000 */  addu       $a1, $zero, $zero
    /* 1E72C 80158324 21300000 */  addu       $a2, $zero, $zero
    /* 1E730 80158328 21380000 */  addu       $a3, $zero, $zero
    /* 1E734 8015832C 1000B1A7 */  sh         $s1, 0x10($sp)
    /* 1E738 80158330 1200B0A7 */  sh         $s0, 0x12($sp)
    /* 1E73C 80158334 1400B1A7 */  sh         $s1, 0x14($sp)
    /* 1E740 80158338 FF4E000C */  jal        ClearImage
    /* 1E744 8015833C 1600B0A7 */   sh        $s0, 0x16($sp)
    /* 1E748 80158340 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1E74C 80158344 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1E750 80158348 1800B08F */  lw         $s0, 0x18($sp)
    /* 1E754 8015834C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1E758 80158350 0800E003 */  jr         $ra
    /* 1E75C 80158354 00000000 */   nop
endlabel StrClearVRAM
