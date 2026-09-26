.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching format_card__Fi, 0xC4

glabel format_card__Fi
    /* 93FC 80142FF4 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 9400 80142FF8 6400B1AF */  sw         $s1, 0x64($sp)
    /* 9404 80142FFC 21888000 */  addu       $s1, $a0, $zero
    /* 9408 80143000 6000B0AF */  sw         $s0, 0x60($sp)
    /* 940C 80143004 80801100 */  sll        $s0, $s1, 2
    /* 9410 80143008 6800BFAF */  sw         $ra, 0x68($sp)
    /* 9414 8014300C 1280013C */  lui        $at, %hi(card_status)
    /* 9418 80143010 21083000 */  addu       $at, $at, $s0
    /* 941C 80143014 DCB3228C */  lw         $v0, %lo(card_status)($at)
    /* 9420 80143018 00000000 */  nop
    /* 9424 8014301C 20004014 */  bnez       $v0, .L801430A0
    /* 9428 80143020 21100000 */   addu      $v0, $zero, $zero
    /* 942C 80143024 1280033C */  lui        $v1, %hi(mem_card_event_handler)
    /* 9430 80143028 74B1638C */  lw         $v1, %lo(mem_card_event_handler)($v1)
    /* 9434 8014302C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9438 80143030 1280013C */  lui        $at, %hi(card_dirty)
    /* 943C 80143034 21083000 */  addu       $at, $at, $s0
    /* 9440 80143038 E8B122AC */  sw         $v0, %lo(card_dirty)($at)
    /* 9444 8014303C 1280013C */  lui        $at, %hi(card_changed)
    /* 9448 80143040 21083000 */  addu       $at, $at, $s0
    /* 944C 80143044 F4B322AC */  sw         $v0, %lo(card_changed)($at)
    /* 9450 80143048 1280013C */  lui        $at, %hi(card_files)
    /* 9454 8014304C 21083000 */  addu       $at, $at, $s0
    /* 9458 80143050 ECB320AC */  sw         $zero, %lo(card_files)($at)
    /* 945C 80143054 04006010 */  beqz       $v1, .L80143068
    /* 9460 80143058 00000000 */   nop
    /* 9464 8014305C 04000424 */  addiu      $a0, $zero, 0x4
    /* 9468 80143060 09F86000 */  jalr       $v1
    /* 946C 80143064 21282002 */   addu      $a1, $s1, $zero
  .L80143068:
    /* 9470 80143068 1000A427 */  addiu      $a0, $sp, 0x10
    /* 9474 8014306C 1280053C */  lui        $a1, %hi(D_8011B3D4)
    /* 9478 80143070 D4B3A524 */  addiu      $a1, $a1, %lo(D_8011B3D4)
    /* 947C 80143074 9767000C */  jal        sprintf
    /* 9480 80143078 21302002 */   addu      $a2, $s1, $zero
    /* 9484 8014307C 7F46000C */  jal        format
    /* 9488 80143080 1000A427 */   addiu     $a0, $sp, 0x10
    /* 948C 80143084 06004010 */  beqz       $v0, .L801430A0
    /* 9490 80143088 21100000 */   addu      $v0, $zero, $zero
    /* 9494 8014308C FD0A050C */  jal        test_card_format__Fi
    /* 9498 80143090 21202002 */   addu      $a0, $s1, $zero
    /* 949C 80143094 1280013C */  lui        $at, %hi(card_usable)
    /* 94A0 80143098 21083000 */  addu       $at, $at, $s0
    /* 94A4 8014309C E4B322AC */  sw         $v0, %lo(card_usable)($at)
  .L801430A0:
    /* 94A8 801430A0 6800BF8F */  lw         $ra, 0x68($sp)
    /* 94AC 801430A4 6400B18F */  lw         $s1, 0x64($sp)
    /* 94B0 801430A8 6000B08F */  lw         $s0, 0x60($sp)
    /* 94B4 801430AC 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 94B8 801430B0 0800E003 */  jr         $ra
    /* 94BC 801430B4 00000000 */   nop
endlabel format_card__Fi
