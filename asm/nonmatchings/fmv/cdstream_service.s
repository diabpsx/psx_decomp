.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cdstream_service, 0xF0

glabel cdstream_service
    /* 1C5C8 801561C0 B00D828F */  lw         $v0, %gp_rel(cdstream_resetting)($gp)
    /* 1C5CC 801561C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C5D0 801561C8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C5D4 801561CC 21800000 */  addu       $s0, $zero, $zero
    /* 1C5D8 801561D0 03004010 */  beqz       $v0, .L801561E0
    /* 1C5DC 801561D4 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1C5E0 801561D8 B457050C */  jal        reset_cdstream
    /* 1C5E4 801561DC 00000000 */   nop
  .L801561E0:
    /* 1C5E8 801561E0 8C0D828F */  lw         $v0, %gp_rel(stream_open)($gp)
    /* 1C5EC 801561E4 00000000 */  nop
    /* 1C5F0 801561E8 19004010 */  beqz       $v0, .L80156250
    /* 1C5F4 801561EC 00000000 */   nop
    /* 1C5F8 801561F0 BC0D828F */  lw         $v0, %gp_rel(first_handler_event)($gp)
    /* 1C5FC 801561F4 00000000 */  nop
    /* 1C600 801561F8 0B004010 */  beqz       $v0, .L80156228
    /* 1C604 801561FC 00000000 */   nop
    /* 1C608 80156200 9C0E828F */  lw         $v0, %gp_rel(last_handler_event)($gp)
    /* 1C60C 80156204 640E838F */  lw         $v1, %gp_rel(time_in_frames)($gp)
    /* 1C610 80156208 F0005024 */  addiu      $s0, $v0, 0xF0
    /* 1C614 8015620C 2A800302 */  slt        $s0, $s0, $v1
    /* 1C618 80156210 22000012 */  beqz       $s0, .L8015629C
    /* 1C61C 80156214 00000000 */   nop
    /* 1C620 80156218 1480043C */  lui        $a0, %hi(D_8013B7EC)
    /* 1C624 8015621C ECB78424 */  addiu      $a0, $a0, %lo(D_8013B7EC)
    /* 1C628 80156220 92580508 */  j          .L80156248
    /* 1C62C 80156224 00000000 */   nop
  .L80156228:
    /* 1C630 80156228 800E828F */  lw         $v0, %gp_rel(stream_opened)($gp)
    /* 1C634 8015622C 640E838F */  lw         $v1, %gp_rel(time_in_frames)($gp)
    /* 1C638 80156230 2C015024 */  addiu      $s0, $v0, 0x12C
    /* 1C63C 80156234 2A800302 */  slt        $s0, $s0, $v1
    /* 1C640 80156238 18000012 */  beqz       $s0, .L8015629C
    /* 1C644 8015623C 00000000 */   nop
    /* 1C648 80156240 1480043C */  lui        $a0, %hi(D_8013B80C)
    /* 1C64C 80156244 0CB88424 */  addiu      $a0, $a0, %lo(D_8013B80C)
  .L80156248:
    /* 1C650 80156248 9367000C */  jal        printf
    /* 1C654 8015624C 00000000 */   nop
  .L80156250:
    /* 1C658 80156250 12000012 */  beqz       $s0, .L8015629C
    /* 1C65C 80156254 00000000 */   nop
    /* 1C660 80156258 C057050C */  jal        kill_stream_handlers
    /* 1C664 8015625C 00000000 */   nop
    /* 1C668 80156260 3A6B000C */  jal        CdReset
    /* 1C66C 80156264 21200000 */   addu      $a0, $zero, $zero
    /* 1C670 80156268 6158050C */  jal        install_stream_handlers
    /* 1C674 8015626C 00000000 */   nop
    /* 1C678 80156270 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1C67C 80156274 00000000 */  nop
    /* 1C680 80156278 980E82AF */  sw         $v0, %gp_rel(cdstream_resetsec)($gp)
    /* 1C684 8015627C B457050C */  jal        reset_cdstream
    /* 1C688 80156280 00000000 */   nop
    /* 1C68C 80156284 640E828F */  lw         $v0, %gp_rel(time_in_frames)($gp)
    /* 1C690 80156288 BC0D80AF */  sw         $zero, %gp_rel(first_handler_event)($gp)
    /* 1C694 8015628C 9C0E82AF */  sw         $v0, %gp_rel(last_handler_event)($gp)
    /* 1C698 80156290 9C0E828F */  lw         $v0, %gp_rel(last_handler_event)($gp)
    /* 1C69C 80156294 00000000 */  nop
    /* 1C6A0 80156298 800E82AF */  sw         $v0, %gp_rel(stream_opened)($gp)
  .L8015629C:
    /* 1C6A4 8015629C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1C6A8 801562A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C6AC 801562A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C6B0 801562A8 0800E003 */  jr         $ra
    /* 1C6B4 801562AC 00000000 */   nop
endlabel cdstream_service
