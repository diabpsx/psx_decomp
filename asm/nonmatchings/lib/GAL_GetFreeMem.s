.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetFreeMem, 0x74

glabel GAL_GetFreeMem
    /* 11908 80021908 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1190C 8002190C FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 11910 80021910 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 11914 80021914 1000B0AF */  sw         $s0, 0x10($sp)
    /* 11918 80021918 21800000 */  addu       $s0, $zero, $zero
    /* 1191C 8002191C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 11920 80021920 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 11924 80021924 24208200 */   and       $a0, $a0, $v0
    /* 11928 80021928 0C004010 */  beqz       $v0, .L8002195C
    /* 1192C 8002192C 00000000 */   nop
    /* 11930 80021930 2000438C */  lw         $v1, 0x20($v0)
    /* 11934 80021934 00000000 */  nop
    /* 11938 80021938 0B006010 */  beqz       $v1, .L80021968
    /* 1193C 8002193C 21100002 */   addu      $v0, $s0, $zero
  .L80021940:
    /* 11940 80021940 0C00628C */  lw         $v0, 0xC($v1)
    /* 11944 80021944 0400638C */  lw         $v1, 0x4($v1)
    /* 11948 80021948 00000000 */  nop
    /* 1194C 8002194C FCFF6014 */  bnez       $v1, .L80021940
    /* 11950 80021950 21800202 */   addu      $s0, $s0, $v0
    /* 11954 80021954 5A860008 */  j          .L80021968
    /* 11958 80021958 21100002 */   addu      $v0, $s0, $zero
  .L8002195C:
    /* 1195C 8002195C 0389000C */  jal        GSetError
    /* 11960 80021960 04000434 */   ori       $a0, $zero, 0x4
    /* 11964 80021964 21100002 */  addu       $v0, $s0, $zero
  .L80021968:
    /* 11968 80021968 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1196C 8002196C 1000B08F */  lw         $s0, 0x10($sp)
    /* 11970 80021970 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 11974 80021974 0800E003 */  jr         $ra
    /* 11978 80021978 00000000 */   nop
endlabel GAL_GetFreeMem
