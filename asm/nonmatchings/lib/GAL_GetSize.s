.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetSize, 0x5C

glabel GAL_GetSize
    /* 1292C 8002292C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12930 80022930 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12934 80022934 1400BFAF */  sw         $ra, 0x14($sp)
    /* 12938 80022938 B686000C */  jal        IsActiveValidHandle
    /* 1293C 8002293C 21808000 */   addu      $s0, $a0, $zero
    /* 12940 80022940 FF004230 */  andi       $v0, $v0, 0xFF
    /* 12944 80022944 08004010 */  beqz       $v0, .L80022968
    /* 12948 80022948 C0101000 */   sll       $v0, $s0, 3
    /* 1294C 8002294C 23105000 */  subu       $v0, $v0, $s0
    /* 12950 80022950 80100200 */  sll        $v0, $v0, 2
    /* 12954 80022954 1380013C */  lui        $at, %hi(D_801325DC)
    /* 12958 80022958 21082200 */  addu       $at, $at, $v0
    /* 1295C 8002295C DC25228C */  lw         $v0, %lo(D_801325DC)($at)
    /* 12960 80022960 5D8A0008 */  j          .L80022974
    /* 12964 80022964 00000000 */   nop
  .L80022968:
    /* 12968 80022968 0389000C */  jal        GSetError
    /* 1296C 8002296C 05000434 */   ori       $a0, $zero, 0x5
    /* 12970 80022970 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80022974:
    /* 12974 80022974 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12978 80022978 1000B08F */  lw         $s0, 0x10($sp)
    /* 1297C 8002297C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12980 80022980 0800E003 */  jr         $ra
    /* 12984 80022984 00000000 */   nop
endlabel GAL_GetSize
