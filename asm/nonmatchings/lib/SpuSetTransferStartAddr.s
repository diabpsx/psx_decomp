.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuSetTransferStartAddr, 0x5C

glabel SpuSetTransferStartAddr
    /* 8EBC 80018EBC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8EC0 80018EC0 21288000 */  addu       $a1, $a0, $zero
    /* 8EC4 80018EC4 0700023C */  lui        $v0, (0x7EFE8 >> 16)
    /* 8EC8 80018EC8 E8EF4234 */  ori        $v0, $v0, (0x7EFE8 & 0xFFFF)
    /* 8ECC 80018ECC F0EFA324 */  addiu      $v1, $a1, -0x1010
    /* 8ED0 80018ED0 2B104300 */  sltu       $v0, $v0, $v1
    /* 8ED4 80018ED4 0B004014 */  bnez       $v0, .L80018F04
    /* 8ED8 80018ED8 1000BFAF */   sw        $ra, 0x10($sp)
    /* 8EDC 80018EDC 4B5C000C */  jal        _spu_FsetRXXa
    /* 8EE0 80018EE0 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 8EE4 80018EE4 0B80013C */  lui        $at, %hi(_spu_tsa)
    /* 8EE8 80018EE8 645A22A4 */  sh         $v0, %lo(_spu_tsa)($at)
    /* 8EEC 80018EEC 0B80033C */  lui        $v1, %hi(_spu_tsa)
    /* 8EF0 80018EF0 645A6394 */  lhu        $v1, %lo(_spu_tsa)($v1)
    /* 8EF4 80018EF4 0B80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
    /* 8EF8 80018EF8 745A428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
    /* 8EFC 80018EFC C2630008 */  j          .L80018F08
    /* 8F00 80018F00 04104300 */   sllv      $v0, $v1, $v0
  .L80018F04:
    /* 8F04 80018F04 21100000 */  addu       $v0, $zero, $zero
  .L80018F08:
    /* 8F08 80018F08 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8F0C 80018F0C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8F10 80018F10 0800E003 */  jr         $ra
    /* 8F14 80018F14 00000000 */   nop
endlabel SpuSetTransferStartAddr
    /* 8F18 80018F18 00000000 */  nop
