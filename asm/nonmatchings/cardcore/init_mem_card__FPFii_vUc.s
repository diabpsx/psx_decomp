.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_mem_card__FPFii_vUc, 0x238

glabel init_mem_card__FPFii_vUc
    /* 95004 800A5004 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 95008 800A5008 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9500C 800A500C 21888000 */  addu       $s1, $a0, $zero
    /* 95010 800A5010 1000B0AF */  sw         $s0, 0x10($sp)
    /* 95014 800A5014 1800BFAF */  sw         $ra, 0x18($sp)
    /* 95018 800A5018 9F48000C */  jal        ResetCallback
    /* 9501C 800A501C 2180A000 */   addu      $s0, $a1, $zero
    /* 95020 800A5020 F009828F */  lw         $v0, %gp_rel(D_8011B170)($gp)
    /* 95024 800A5024 00000000 */  nop
    /* 95028 800A5028 44004010 */  beqz       $v0, .L800A513C
    /* 9502C 800A502C 00000000 */   nop
    /* 95030 800A5030 6346000C */  jal        EnterCriticalSection
    /* 95034 800A5034 00000000 */   nop
    /* 95038 800A5038 00F4043C */  lui        $a0, (0xF4000001 >> 16)
    /* 9503C 800A503C 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
    /* 95040 800A5040 04000524 */  addiu      $a1, $zero, 0x4
    /* 95044 800A5044 00200624 */  addiu      $a2, $zero, 0x2000
    /* 95048 800A5048 5746000C */  jal        OpenEvent
    /* 9504C 800A504C 21380000 */   addu      $a3, $zero, $zero
    /* 95050 800A5050 00F4043C */  lui        $a0, (0xF4000001 >> 16)
    /* 95054 800A5054 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
    /* 95058 800A5058 00800534 */  ori        $a1, $zero, 0x8000
    /* 9505C 800A505C 00200624 */  addiu      $a2, $zero, 0x2000
    /* 95060 800A5060 480A82AF */  sw         $v0, %gp_rel(card_ev0)($gp)
    /* 95064 800A5064 5746000C */  jal        OpenEvent
    /* 95068 800A5068 21380000 */   addu      $a3, $zero, $zero
    /* 9506C 800A506C 00F4043C */  lui        $a0, (0xF4000001 >> 16)
    /* 95070 800A5070 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
    /* 95074 800A5074 00010524 */  addiu      $a1, $zero, 0x100
    /* 95078 800A5078 00200624 */  addiu      $a2, $zero, 0x2000
    /* 9507C 800A507C 4C0A82AF */  sw         $v0, %gp_rel(card_ev1)($gp)
    /* 95080 800A5080 5746000C */  jal        OpenEvent
    /* 95084 800A5084 21380000 */   addu      $a3, $zero, $zero
    /* 95088 800A5088 00F4043C */  lui        $a0, (0xF4000001 >> 16)
    /* 9508C 800A508C 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
    /* 95090 800A5090 00200524 */  addiu      $a1, $zero, 0x2000
    /* 95094 800A5094 00200624 */  addiu      $a2, $zero, 0x2000
    /* 95098 800A5098 500A82AF */  sw         $v0, %gp_rel(card_ev2)($gp)
    /* 9509C 800A509C 5746000C */  jal        OpenEvent
    /* 950A0 800A50A0 21380000 */   addu      $a3, $zero, $zero
    /* 950A4 800A50A4 00F0043C */  lui        $a0, (0xF0000011 >> 16)
    /* 950A8 800A50A8 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
    /* 950AC 800A50AC 04000524 */  addiu      $a1, $zero, 0x4
    /* 950B0 800A50B0 00200624 */  addiu      $a2, $zero, 0x2000
    /* 950B4 800A50B4 540A82AF */  sw         $v0, %gp_rel(card_ev3)($gp)
    /* 950B8 800A50B8 5746000C */  jal        OpenEvent
    /* 950BC 800A50BC 21380000 */   addu      $a3, $zero, $zero
    /* 950C0 800A50C0 00F0043C */  lui        $a0, (0xF0000011 >> 16)
    /* 950C4 800A50C4 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
    /* 950C8 800A50C8 00800534 */  ori        $a1, $zero, 0x8000
    /* 950CC 800A50CC 00200624 */  addiu      $a2, $zero, 0x2000
    /* 950D0 800A50D0 580A82AF */  sw         $v0, %gp_rel(card_ev10)($gp)
    /* 950D4 800A50D4 5746000C */  jal        OpenEvent
    /* 950D8 800A50D8 21380000 */   addu      $a3, $zero, $zero
    /* 950DC 800A50DC 00F0043C */  lui        $a0, (0xF0000011 >> 16)
    /* 950E0 800A50E0 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
    /* 950E4 800A50E4 00010524 */  addiu      $a1, $zero, 0x100
    /* 950E8 800A50E8 00200624 */  addiu      $a2, $zero, 0x2000
    /* 950EC 800A50EC 5C0A82AF */  sw         $v0, %gp_rel(card_ev11)($gp)
    /* 950F0 800A50F0 5746000C */  jal        OpenEvent
    /* 950F4 800A50F4 21380000 */   addu      $a3, $zero, $zero
    /* 950F8 800A50F8 00F0043C */  lui        $a0, (0xF0000011 >> 16)
    /* 950FC 800A50FC 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
    /* 95100 800A5100 00200524 */  addiu      $a1, $zero, 0x2000
    /* 95104 800A5104 00200624 */  addiu      $a2, $zero, 0x2000
    /* 95108 800A5108 600A82AF */  sw         $v0, %gp_rel(card_ev12)($gp)
    /* 9510C 800A510C 5746000C */  jal        OpenEvent
    /* 95110 800A5110 21380000 */   addu      $a3, $zero, $zero
    /* 95114 800A5114 640A82AF */  sw         $v0, %gp_rel(card_ev13)($gp)
    /* 95118 800A5118 6746000C */  jal        ExitCriticalSection
    /* 9511C 800A511C 00000000 */   nop
    /* 95120 800A5120 176A000C */  jal        InitCARD
    /* 95124 800A5124 01000424 */   addiu     $a0, $zero, 0x1
    /* 95128 800A5128 326A000C */  jal        StartCARD
    /* 9512C 800A512C 00000000 */   nop
    /* 95130 800A5130 9346000C */  jal        ChangeClearPAD
    /* 95134 800A5134 21200000 */   addu      $a0, $zero, $zero
    /* 95138 800A5138 F00980AF */  sw         $zero, %gp_rel(D_8011B170)($gp)
  .L800A513C:
    /* 9513C 800A513C 5346000C */  jal        _bu_init
    /* 95140 800A5140 00000000 */   nop
    /* 95144 800A5144 480A848F */  lw         $a0, %gp_rel(card_ev0)($gp)
    /* 95148 800A5148 5F46000C */  jal        EnableEvent
    /* 9514C 800A514C 00000000 */   nop
    /* 95150 800A5150 4C0A848F */  lw         $a0, %gp_rel(card_ev1)($gp)
    /* 95154 800A5154 5F46000C */  jal        EnableEvent
    /* 95158 800A5158 00000000 */   nop
    /* 9515C 800A515C 500A848F */  lw         $a0, %gp_rel(card_ev2)($gp)
    /* 95160 800A5160 5F46000C */  jal        EnableEvent
    /* 95164 800A5164 00000000 */   nop
    /* 95168 800A5168 540A848F */  lw         $a0, %gp_rel(card_ev3)($gp)
    /* 9516C 800A516C 5F46000C */  jal        EnableEvent
    /* 95170 800A5170 00000000 */   nop
    /* 95174 800A5174 580A848F */  lw         $a0, %gp_rel(card_ev10)($gp)
    /* 95178 800A5178 5F46000C */  jal        EnableEvent
    /* 9517C 800A517C 00000000 */   nop
    /* 95180 800A5180 5C0A848F */  lw         $a0, %gp_rel(card_ev11)($gp)
    /* 95184 800A5184 5F46000C */  jal        EnableEvent
    /* 95188 800A5188 00000000 */   nop
    /* 9518C 800A518C 600A848F */  lw         $a0, %gp_rel(card_ev12)($gp)
    /* 95190 800A5190 5F46000C */  jal        EnableEvent
    /* 95194 800A5194 00000000 */   nop
    /* 95198 800A5198 640A848F */  lw         $a0, %gp_rel(card_ev13)($gp)
    /* 9519C 800A519C 5F46000C */  jal        EnableEvent
    /* 951A0 800A51A0 00000000 */   nop
    /* 951A4 800A51A4 03000224 */  addiu      $v0, $zero, 0x3
    /* 951A8 800A51A8 1280013C */  lui        $at, %hi(card_status + 0x4)
    /* 951AC 800A51AC E0B322AC */  sw         $v0, %lo(card_status + 0x4)($at)
    /* 951B0 800A51B0 1280013C */  lui        $at, %hi(card_status)
    /* 951B4 800A51B4 DCB322AC */  sw         $v0, %lo(card_status)($at)
    /* 951B8 800A51B8 01000224 */  addiu      $v0, $zero, 0x1
    /* 951BC 800A51BC 1280013C */  lui        $at, %hi(card_usable + 0x4)
    /* 951C0 800A51C0 E8B320AC */  sw         $zero, %lo(card_usable + 0x4)($at)
    /* 951C4 800A51C4 1280013C */  lui        $at, %hi(card_usable)
    /* 951C8 800A51C8 E4B320AC */  sw         $zero, %lo(card_usable)($at)
    /* 951CC 800A51CC 1280013C */  lui        $at, %hi(card_files + 0x4)
    /* 951D0 800A51D0 F0B320AC */  sw         $zero, %lo(card_files + 0x4)($at)
    /* 951D4 800A51D4 1280013C */  lui        $at, %hi(card_files)
    /* 951D8 800A51D8 ECB320AC */  sw         $zero, %lo(card_files)($at)
    /* 951DC 800A51DC 1280013C */  lui        $at, %hi(card_changed + 0x4)
    /* 951E0 800A51E0 F8B322AC */  sw         $v0, %lo(card_changed + 0x4)($at)
    /* 951E4 800A51E4 1280013C */  lui        $at, %hi(card_changed)
    /* 951E8 800A51E8 F4B322AC */  sw         $v0, %lo(card_changed)($at)
    /* 951EC 800A51EC 03002012 */  beqz       $s1, .L800A51FC
    /* 951F0 800A51F0 07000424 */   addiu     $a0, $zero, 0x7
    /* 951F4 800A51F4 09F82002 */  jalr       $s1
    /* 951F8 800A51F8 21280000 */   addu      $a1, $zero, $zero
  .L800A51FC:
    /* 951FC 800A51FC 21200000 */  addu       $a0, $zero, $zero
    /* 95200 800A5200 FF001032 */  andi       $s0, $s0, 0xFF
    /* 95204 800A5204 2B801000 */  sltu       $s0, $zero, $s0
    /* 95208 800A5208 F40980AF */  sw         $zero, %gp_rel(mem_card_event_handler)($gp)
    /* 9520C 800A520C 9D94020C */  jal        init_card__Fib
    /* 95210 800A5210 21280002 */   addu      $a1, $s0, $zero
    /* 95214 800A5214 01000424 */  addiu      $a0, $zero, 0x1
    /* 95218 800A5218 9D94020C */  jal        init_card__Fib
    /* 9521C 800A521C 21280002 */   addu      $a1, $s0, $zero
    /* 95220 800A5220 F40991AF */  sw         $s1, %gp_rel(mem_card_event_handler)($gp)
    /* 95224 800A5224 1800BF8F */  lw         $ra, 0x18($sp)
    /* 95228 800A5228 1400B18F */  lw         $s1, 0x14($sp)
    /* 9522C 800A522C 1000B08F */  lw         $s0, 0x10($sp)
    /* 95230 800A5230 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 95234 800A5234 0800E003 */  jr         $ra
    /* 95238 800A5238 00000000 */   nop
endlabel init_mem_card__FPFii_vUc
