.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching addsentinel, 0x6C

glabel addsentinel
    /* 1C400 8002C400 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C404 8002C404 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C408 8002C408 21808000 */  addu       $s0, $a0, $zero
    /* 1C40C 8002C40C 1280043C */  lui        $a0, %hi(_lv)
    /* 1C410 8002C410 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C414 8002C414 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1C418 8002C418 E8BD000C */  jal        locksemaphore
    /* 1C41C 8002C41C 00000000 */   nop
    /* 1C420 8002C420 0000038E */  lw         $v1, 0x0($s0)
    /* 1C424 8002C424 1400048E */  lw         $a0, 0x14($s0)
    /* 1C428 8002C428 1800028E */  lw         $v0, 0x18($s0)
    /* 1C42C 8002C42C 4542053C */  lui        $a1, (0x42454E44 >> 16)
    /* 1C430 8002C430 444EA534 */  ori        $a1, $a1, (0x42454E44 & 0xFFFF)
    /* 1C434 8002C434 04000624 */  addiu      $a2, $zero, 0x4
    /* 1C438 8002C438 21206400 */  addu       $a0, $v1, $a0
    /* 1C43C 8002C43C 00404234 */  ori        $v0, $v0, 0x4000
    /* 1C440 8002C440 DBB2000C */  jal        putm
    /* 1C444 8002C444 180002AE */   sw        $v0, 0x18($s0)
    /* 1C448 8002C448 1280043C */  lui        $a0, %hi(_lv)
    /* 1C44C 8002C44C 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C450 8002C450 F3BD000C */  jal        unlocksemaphore
    /* 1C454 8002C454 00000000 */   nop
    /* 1C458 8002C458 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1C45C 8002C45C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C460 8002C460 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C464 8002C464 0800E003 */  jr         $ra
    /* 1C468 8002C468 00000000 */   nop
endlabel addsentinel
