.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_TotalMem, 0x54

glabel GAL_TotalMem
    /* 122E0 800222E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 122E4 800222E4 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 122E8 800222E8 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 122EC 800222EC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 122F0 800222F0 21800000 */  addu       $s0, $zero, $zero
    /* 122F4 800222F4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 122F8 800222F8 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 122FC 800222FC 24208200 */   and       $a0, $a0, $v0
    /* 12300 80022300 04004010 */  beqz       $v0, .L80022314
    /* 12304 80022304 00000000 */   nop
    /* 12308 80022308 0400508C */  lw         $s0, 0x4($v0)
    /* 1230C 8002230C C8880008 */  j          .L80022320
    /* 12310 80022310 21100002 */   addu      $v0, $s0, $zero
  .L80022314:
    /* 12314 80022314 0389000C */  jal        GSetError
    /* 12318 80022318 04000434 */   ori       $a0, $zero, 0x4
    /* 1231C 8002231C 21100002 */  addu       $v0, $s0, $zero
  .L80022320:
    /* 12320 80022320 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12324 80022324 1000B08F */  lw         $s0, 0x10($sp)
    /* 12328 80022328 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1232C 8002232C 0800E003 */  jr         $ra
    /* 12330 80022330 00000000 */   nop
endlabel GAL_TotalMem
