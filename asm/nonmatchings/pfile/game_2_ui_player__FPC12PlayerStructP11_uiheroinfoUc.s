.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching game_2_ui_player__FPC12PlayerStructP11_uiheroinfoUc, 0xB4

glabel game_2_ui_player__FPC12PlayerStructP11_uiheroinfoUc
    /* 4FC4C 8005FC4C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4FC50 8005FC50 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4FC54 8005FC54 21888000 */  addu       $s1, $a0, $zero
    /* 4FC58 8005FC58 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4FC5C 8005FC5C 2180A000 */  addu       $s0, $a1, $zero
    /* 4FC60 8005FC60 21200002 */  addu       $a0, $s0, $zero
    /* 4FC64 8005FC64 21280000 */  addu       $a1, $zero, $zero
    /* 4FC68 8005FC68 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4FC6C 8005FC6C 2190C000 */  addu       $s2, $a2, $zero
    /* 4FC70 8005FC70 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 4FC74 8005FC74 E940000C */  jal        memset
    /* 4FC78 8005FC78 28000624 */   addiu     $a2, $zero, 0x28
    /* 4FC7C 8005FC7C 04000426 */  addiu      $a0, $s0, 0x4
    /* 4FC80 8005FC80 D6002526 */  addiu      $a1, $s1, 0xD6
    /* 4FC84 8005FC84 8367000C */  jal        strncpy
    /* 4FC88 8005FC88 0F000624 */   addiu     $a2, $zero, 0xF
    /* 4FC8C 8005FC8C 3C012292 */  lbu        $v0, 0x13C($s1)
    /* 4FC90 8005FC90 21202002 */  addu       $a0, $s1, $zero
    /* 4FC94 8005FC94 130000A2 */  sb         $zero, 0x13($s0)
    /* 4FC98 8005FC98 00160200 */  sll        $v0, $v0, 24
    /* 4FC9C 8005FC9C 03160200 */  sra        $v0, $v0, 24
    /* 4FCA0 8005FCA0 087F010C */  jal        game_2_ui_class__FPC12PlayerStruct
    /* 4FCA4 8005FCA4 140002A6 */   sh        $v0, 0x14($s0)
    /* 4FCA8 8005FCA8 F8002396 */  lhu        $v1, 0xF8($s1)
    /* 4FCAC 8005FCAC FC002496 */  lhu        $a0, 0xFC($s1)
    /* 4FCB0 8005FCB0 00012596 */  lhu        $a1, 0x100($s1)
    /* 4FCB4 8005FCB4 04012696 */  lhu        $a2, 0x104($s1)
    /* 4FCB8 8005FCB8 5001278E */  lw         $a3, 0x150($s1)
    /* 4FCBC 8005FCBC E419288E */  lw         $t0, 0x19E4($s1)
    /* 4FCC0 8005FCC0 160002A2 */  sb         $v0, 0x16($s0)
    /* 4FCC4 8005FCC4 240012A2 */  sb         $s2, 0x24($s0)
    /* 4FCC8 8005FCC8 250000A2 */  sb         $zero, 0x25($s0)
    /* 4FCCC 8005FCCC 180003A6 */  sh         $v1, 0x18($s0)
    /* 4FCD0 8005FCD0 1A0004A6 */  sh         $a0, 0x1A($s0)
    /* 4FCD4 8005FCD4 1C0005A6 */  sh         $a1, 0x1C($s0)
    /* 4FCD8 8005FCD8 1E0006A6 */  sh         $a2, 0x1E($s0)
    /* 4FCDC 8005FCDC 200007AE */  sw         $a3, 0x20($s0)
    /* 4FCE0 8005FCE0 170008A2 */  sb         $t0, 0x17($s0)
    /* 4FCE4 8005FCE4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 4FCE8 8005FCE8 1800B28F */  lw         $s2, 0x18($sp)
    /* 4FCEC 8005FCEC 1400B18F */  lw         $s1, 0x14($sp)
    /* 4FCF0 8005FCF0 1000B08F */  lw         $s0, 0x10($sp)
    /* 4FCF4 8005FCF4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4FCF8 8005FCF8 0800E003 */  jr         $ra
    /* 4FCFC 8005FCFC 00000000 */   nop
endlabel game_2_ui_player__FPC12PlayerStructP11_uiheroinfoUc
