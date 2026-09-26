.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delete_card_file__Fii, 0xF8

glabel delete_card_file__Fii
    /* 9128 80142D20 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 912C 80142D24 6000B0AF */  sw         $s0, 0x60($sp)
    /* 9130 80142D28 21808000 */  addu       $s0, $a0, $zero
    /* 9134 80142D2C 6800B2AF */  sw         $s2, 0x68($sp)
    /* 9138 80142D30 80901000 */  sll        $s2, $s0, 2
    /* 913C 80142D34 6C00BFAF */  sw         $ra, 0x6C($sp)
    /* 9140 80142D38 6400B1AF */  sw         $s1, 0x64($sp)
    /* 9144 80142D3C 1280013C */  lui        $at, %hi(card_usable)
    /* 9148 80142D40 21083200 */  addu       $at, $at, $s2
    /* 914C 80142D44 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 9150 80142D48 00000000 */  nop
    /* 9154 80142D4C 2A004010 */  beqz       $v0, .L80142DF8
    /* 9158 80142D50 2188A000 */   addu      $s1, $a1, $zero
    /* 915C 80142D54 1280013C */  lui        $at, %hi(card_files)
    /* 9160 80142D58 21083200 */  addu       $at, $at, $s2
    /* 9164 80142D5C ECB3228C */  lw         $v0, %lo(card_files)($at)
    /* 9168 80142D60 00000000 */  nop
    /* 916C 80142D64 2A102202 */  slt        $v0, $s1, $v0
    /* 9170 80142D68 24004010 */  beqz       $v0, .L80142DFC
    /* 9174 80142D6C 21100000 */   addu      $v0, $zero, $zero
    /* 9178 80142D70 1280023C */  lui        $v0, %hi(mem_card_event_handler)
    /* 917C 80142D74 74B1428C */  lw         $v0, %lo(mem_card_event_handler)($v0)
    /* 9180 80142D78 00000000 */  nop
    /* 9184 80142D7C 04004010 */  beqz       $v0, .L80142D90
    /* 9188 80142D80 00000000 */   nop
    /* 918C 80142D84 05000424 */  addiu      $a0, $zero, 0x5
    /* 9190 80142D88 09F84000 */  jalr       $v0
    /* 9194 80142D8C 21280002 */   addu      $a1, $s0, $zero
  .L80142D90:
    /* 9198 80142D90 1000A427 */  addiu      $a0, $sp, 0x10
    /* 919C 80142D94 1480053C */  lui        $a1, %hi(D_8013E1EC)
    /* 91A0 80142D98 ECE1A524 */  addiu      $a1, $a1, %lo(D_8013E1EC)
    /* 91A4 80142D9C 21105002 */  addu       $v0, $s2, $s0
    /* 91A8 80142DA0 C0110200 */  sll        $v0, $v0, 7
    /* 91AC 80142DA4 80381100 */  sll        $a3, $s1, 2
    /* 91B0 80142DA8 2138F100 */  addu       $a3, $a3, $s1
    /* 91B4 80142DAC C0380700 */  sll        $a3, $a3, 3
    /* 91B8 80142DB0 1480033C */  lui        $v1, %hi(card_dir)
    /* 91BC 80142DB4 F8E16324 */  addiu      $v1, $v1, %lo(card_dir)
    /* 91C0 80142DB8 2138E300 */  addu       $a3, $a3, $v1
    /* 91C4 80142DBC 21300002 */  addu       $a2, $s0, $zero
    /* 91C8 80142DC0 9767000C */  jal        sprintf
    /* 91CC 80142DC4 21384700 */   addu      $a3, $v0, $a3
    /* 91D0 80142DC8 8B46000C */  jal        erase
    /* 91D4 80142DCC 1000A427 */   addiu     $a0, $sp, 0x10
    /* 91D8 80142DD0 09004010 */  beqz       $v0, .L80142DF8
    /* 91DC 80142DD4 01000324 */   addiu     $v1, $zero, 0x1
    /* 91E0 80142DD8 1280013C */  lui        $at, %hi(card_dirty)
    /* 91E4 80142DDC 21083200 */  addu       $at, $at, $s2
    /* 91E8 80142DE0 E8B123AC */  sw         $v1, %lo(card_dirty)($at)
    /* 91EC 80142DE4 1280013C */  lui        $at, %hi(card_changed)
    /* 91F0 80142DE8 21083200 */  addu       $at, $at, $s2
    /* 91F4 80142DEC F4B323AC */  sw         $v1, %lo(card_changed)($at)
    /* 91F8 80142DF0 7F0B0508 */  j          .L80142DFC
    /* 91FC 80142DF4 01000224 */   addiu     $v0, $zero, 0x1
  .L80142DF8:
    /* 9200 80142DF8 21100000 */  addu       $v0, $zero, $zero
  .L80142DFC:
    /* 9204 80142DFC 6C00BF8F */  lw         $ra, 0x6C($sp)
    /* 9208 80142E00 6800B28F */  lw         $s2, 0x68($sp)
    /* 920C 80142E04 6400B18F */  lw         $s1, 0x64($sp)
    /* 9210 80142E08 6000B08F */  lw         $s0, 0x60($sp)
    /* 9214 80142E0C 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 9218 80142E10 0800E003 */  jr         $ra
    /* 921C 80142E14 00000000 */   nop
endlabel delete_card_file__Fii
