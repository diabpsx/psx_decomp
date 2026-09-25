.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checksentinelz, 0x84

glabel checksentinelz
    /* 1C46C 8002C46C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1C470 8002C470 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C474 8002C474 21808000 */  addu       $s0, $a0, $zero
    /* 1C478 8002C478 1280043C */  lui        $a0, %hi(_lv)
    /* 1C47C 8002C47C 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C480 8002C480 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1C484 8002C484 E8BD000C */  jal        locksemaphore
    /* 1C488 8002C488 1400B1AF */   sw        $s1, 0x14($sp)
    /* 1C48C 8002C48C 1800028E */  lw         $v0, 0x18($s0)
    /* 1C490 8002C490 00000000 */  nop
    /* 1C494 8002C494 00404230 */  andi       $v0, $v0, 0x4000
    /* 1C498 8002C498 0A004010 */  beqz       $v0, .L8002C4C4
    /* 1C49C 8002C49C 01001124 */   addiu     $s1, $zero, 0x1
    /* 1C4A0 8002C4A0 0000028E */  lw         $v0, 0x0($s0)
    /* 1C4A4 8002C4A4 1400048E */  lw         $a0, 0x14($s0)
    /* 1C4A8 8002C4A8 04000524 */  addiu      $a1, $zero, 0x4
    /* 1C4AC 8002C4AC B9B2000C */  jal        getm
    /* 1C4B0 8002C4B0 21204400 */   addu      $a0, $v0, $a0
    /* 1C4B4 8002C4B4 4542033C */  lui        $v1, (0x42454E44 >> 16)
    /* 1C4B8 8002C4B8 444E6334 */  ori        $v1, $v1, (0x42454E44 & 0xFFFF)
    /* 1C4BC 8002C4BC 26104300 */  xor        $v0, $v0, $v1
    /* 1C4C0 8002C4C0 0100512C */  sltiu      $s1, $v0, 0x1
  .L8002C4C4:
    /* 1C4C4 8002C4C4 1280043C */  lui        $a0, %hi(_lv)
    /* 1C4C8 8002C4C8 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C4CC 8002C4CC F3BD000C */  jal        unlocksemaphore
    /* 1C4D0 8002C4D0 00000000 */   nop
    /* 1C4D4 8002C4D4 21102002 */  addu       $v0, $s1, $zero
    /* 1C4D8 8002C4D8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1C4DC 8002C4DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C4E0 8002C4E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C4E4 8002C4E4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1C4E8 8002C4E8 0800E003 */  jr         $ra
    /* 1C4EC 8002C4EC 00000000 */   nop
endlabel checksentinelz
