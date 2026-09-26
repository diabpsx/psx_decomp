.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartKill__Fii, 0x108

glabel M_StartKill__Fii
    /* 127E0 8014C3D8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 127E4 8014C3DC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 127E8 8014C3E0 21808000 */  addu       $s0, $a0, $zero
    /* 127EC 8014C3E4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 127F0 8014C3E8 1080033C */  lui        $v1, %hi(monster)
    /* 127F4 8014C3EC 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 127F8 8014C3F0 40101000 */  sll        $v0, $s0, 1
    /* 127FC 8014C3F4 21105000 */  addu       $v0, $v0, $s0
    /* 12800 8014C3F8 80100200 */  sll        $v0, $v0, 2
    /* 12804 8014C3FC 21105000 */  addu       $v0, $v0, $s0
    /* 12808 8014C400 C0100200 */  sll        $v0, $v0, 3
    /* 1280C 8014C404 21184300 */  addu       $v1, $v0, $v1
    /* 12810 8014C408 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 12814 8014C40C 34007180 */  lb         $s1, 0x34($v1)
    /* 12818 8014C410 0F000424 */  addiu      $a0, $zero, 0xF
    /* 1281C 8014C414 2800BFAF */  sw         $ra, 0x28($sp)
    /* 12820 8014C418 2000B2AF */  sw         $s2, 0x20($sp)
    /* 12824 8014C41C 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 12828 8014C420 21082200 */  addu       $at, $at, $v0
    /* 1282C 8014C424 C7532280 */  lb         $v0, %lo(monster + 0x33)($at)
    /* 12830 8014C428 35007280 */  lb         $s2, 0x35($v1)
    /* 12834 8014C42C 07004414 */  bne        $v0, $a0, .L8014C44C
    /* 12838 8014C430 2198A000 */   addu      $s3, $a1, $zero
    /* 1283C 8014C434 657D020C */  jal        MonstPartJump__Fi
    /* 12840 8014C438 21200002 */   addu      $a0, $s0, $zero
    /* 12844 8014C43C 21200002 */  addu       $a0, $s0, $zero
    /* 12848 8014C440 21282002 */  addu       $a1, $s1, $zero
    /* 1284C 8014C444 AE1E050C */  jal        RemoveStoneMissiles__Fiii
    /* 12850 8014C448 21304002 */   addu      $a2, $s2, $zero
  .L8014C44C:
    /* 12854 8014C44C 21200002 */  addu       $a0, $s0, $zero
    /* 12858 8014C450 FF003132 */  andi       $s1, $s1, 0xFF
    /* 1285C 8014C454 21282002 */  addu       $a1, $s1, $zero
    /* 12860 8014C458 1280073C */  lui        $a3, %hi(currlevel)
    /* 12864 8014C45C 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 12868 8014C460 FF005232 */  andi       $s2, $s2, 0xFF
    /* 1286C 8014C464 BD3A010C */  jal        delta_kill_monster__FiUcUcUc
    /* 12870 8014C468 21304002 */   addu      $a2, $s2, $zero
    /* 12874 8014C46C 07001312 */  beq        $s0, $s3, .L8014C48C
    /* 12878 8014C470 FFFF0232 */   andi      $v0, $s0, 0xFFFF
    /* 1287C 8014C474 1000A2AF */  sw         $v0, 0x10($sp)
    /* 12880 8014C478 21200000 */  addu       $a0, $zero, $zero
    /* 12884 8014C47C 24000524 */  addiu      $a1, $zero, 0x24
    /* 12888 8014C480 21302002 */  addu       $a2, $s1, $zero
    /* 1288C 8014C484 2A310508 */  j          .L8014C4A8
    /* 12890 8014C488 21384002 */   addu      $a3, $s2, $zero
  .L8014C48C:
    /* 12894 8014C48C 21200000 */  addu       $a0, $zero, $zero
    /* 12898 8014C490 57000524 */  addiu      $a1, $zero, 0x57
    /* 1289C 8014C494 21302002 */  addu       $a2, $s1, $zero
    /* 128A0 8014C498 1280023C */  lui        $v0, %hi(currlevel)
    /* 128A4 8014C49C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 128A8 8014C4A0 21384002 */  addu       $a3, $s2, $zero
    /* 128AC 8014C4A4 1000A2AF */  sw         $v0, 0x10($sp)
  .L8014C4A8:
    /* 128B0 8014C4A8 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 128B4 8014C4AC 00000000 */   nop
    /* 128B8 8014C4B0 21200002 */  addu       $a0, $s0, $zero
    /* 128BC 8014C4B4 21286002 */  addu       $a1, $s3, $zero
    /* 128C0 8014C4B8 E92E050C */  jal        MonstStartKill__FiiUc
    /* 128C4 8014C4BC 01000624 */   addiu     $a2, $zero, 0x1
    /* 128C8 8014C4C0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 128CC 8014C4C4 2400B38F */  lw         $s3, 0x24($sp)
    /* 128D0 8014C4C8 2000B28F */  lw         $s2, 0x20($sp)
    /* 128D4 8014C4CC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 128D8 8014C4D0 1800B08F */  lw         $s0, 0x18($sp)
    /* 128DC 8014C4D4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 128E0 8014C4D8 0800E003 */  jr         $ra
    /* 128E4 8014C4DC 00000000 */   nop
endlabel M_StartKill__Fii
