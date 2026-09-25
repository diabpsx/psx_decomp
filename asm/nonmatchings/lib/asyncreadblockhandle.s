.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncreadblockhandle, 0x288

glabel asyncreadblockhandle
    /* 16C8C 80026C8C 581C838F */  lw         $v1, %gp_rel(asyncblockstatus)($gp)
    /* 16C90 80026C90 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 16C94 80026C94 1800B2AF */  sw         $s2, 0x18($sp)
    /* 16C98 80026C98 21908000 */  addu       $s2, $a0, $zero
    /* 16C9C 80026C9C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 16CA0 80026CA0 2198A000 */  addu       $s3, $a1, $zero
    /* 16CA4 80026CA4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 16CA8 80026CA8 2180C000 */  addu       $s0, $a2, $zero
    /* 16CAC 80026CAC 01000224 */  addiu      $v0, $zero, 0x1
    /* 16CB0 80026CB0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 16CB4 80026CB4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 16CB8 80026CB8 18006214 */  bne        $v1, $v0, .L80026D1C
    /* 16CBC 80026CBC 1400B1AF */   sw        $s1, 0x14($sp)
    /* 16CC0 80026CC0 1180043C */  lui        $a0, %hi(D_8010EEAC)
    /* 16CC4 80026CC4 ACEE8424 */  addiu      $a0, $a0, %lo(D_8010EEAC)
    /* 16CC8 80026CC8 80281200 */  sll        $a1, $s2, 2
    /* 16CCC 80026CCC 2128B200 */  addu       $a1, $a1, $s2
    /* 16CD0 80026CD0 C0280500 */  sll        $a1, $a1, 3
    /* 16CD4 80026CD4 D022838F */  lw         $v1, %gp_rel(asyncblockhandle)($gp)
    /* 16CD8 80026CD8 0B80073C */  lui        $a3, %hi(libblockhandle)
    /* 16CDC 80026CDC F463E724 */  addiu      $a3, $a3, %lo(libblockhandle)
    /* 16CE0 80026CE0 2128A700 */  addu       $a1, $a1, $a3
    /* 16CE4 80026CE4 1180023C */  lui        $v0, %hi(D_8010ED58)
    /* 16CE8 80026CE8 58ED4224 */  addiu      $v0, $v0, %lo(D_8010ED58)
    /* 16CEC 80026CEC 1280013C */  lui        $at, %hi(abortfile)
    /* 16CF0 80026CF0 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 16CF4 80026CF4 D1020224 */  addiu      $v0, $zero, 0x2D1
    /* 16CF8 80026CF8 1280013C */  lui        $at, %hi(abortline)
    /* 16CFC 80026CFC BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 16D00 80026D00 80300300 */  sll        $a2, $v1, 2
    /* 16D04 80026D04 2130C300 */  addu       $a2, $a2, $v1
    /* 16D08 80026D08 C0300600 */  sll        $a2, $a2, 3
    /* 16D0C 80026D0C 0F95000C */  jal        abortmessage
    /* 16D10 80026D10 2130C700 */   addu      $a2, $a2, $a3
    /* 16D14 80026D14 BC9B0008 */  j          .L80026EF0
    /* 16D18 80026D18 21100000 */   addu      $v0, $zero, $zero
  .L80026D1C:
    /* 16D1C 80026D1C 80101200 */  sll        $v0, $s2, 2
    /* 16D20 80026D20 21105200 */  addu       $v0, $v0, $s2
    /* 16D24 80026D24 C0880200 */  sll        $s1, $v0, 3
    /* 16D28 80026D28 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 16D2C 80026D2C 21083100 */  addu       $at, $at, $s1
    /* 16D30 80026D30 0064238C */  lw         $v1, %lo(D_800B6400)($at)
    /* 16D34 80026D34 02000224 */  addiu      $v0, $zero, 0x2
    /* 16D38 80026D38 0F006214 */  bne        $v1, $v0, .L80026D78
    /* 16D3C 80026D3C 00000000 */   nop
    /* 16D40 80026D40 0B80013C */  lui        $at, %hi(D_800B6404)
    /* 16D44 80026D44 21083100 */  addu       $at, $at, $s1
    /* 16D48 80026D48 0464248C */  lw         $a0, %lo(D_800B6404)($at)
    /* 16D4C 80026D4C 21286002 */  addu       $a1, $s3, $zero
    /* 16D50 80026D50 8EA3000C */  jal        readhandle
    /* 16D54 80026D54 21300002 */   addu      $a2, $s0, $zero
    /* 16D58 80026D58 FC22828F */  lw         $v0, %gp_rel(asyncblockcallbackfunc)($gp)
    /* 16D5C 80026D5C 00000000 */  nop
    /* 16D60 80026D60 62004010 */  beqz       $v0, .L80026EEC
    /* 16D64 80026D64 00000000 */   nop
    /* 16D68 80026D68 09F84000 */  jalr       $v0
    /* 16D6C 80026D6C 00000000 */   nop
    /* 16D70 80026D70 BC9B0008 */  j          .L80026EF0
    /* 16D74 80026D74 01000224 */   addiu     $v0, $zero, 0x1
  .L80026D78:
    /* 16D78 80026D78 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16D7C 80026D7C 21083100 */  addu       $at, $at, $s1
    /* 16D80 80026D80 1064228C */  lw         $v0, %lo(D_800B6410)($at)
    /* 16D84 80026D84 00000000 */  nop
    /* 16D88 80026D88 FF074230 */  andi       $v0, $v0, 0x7FF
    /* 16D8C 80026D8C F02282AF */  sw         $v0, %gp_rel(asyncblockoffset)($gp)
    /* 16D90 80026D90 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16D94 80026D94 21083100 */  addu       $at, $at, $s1
    /* 16D98 80026D98 1064228C */  lw         $v0, %lo(D_800B6410)($at)
    /* 16D9C 80026D9C 0B80013C */  lui        $at, %hi(D_800B6414)
    /* 16DA0 80026DA0 21083100 */  addu       $at, $at, $s1
    /* 16DA4 80026DA4 1464238C */  lw         $v1, %lo(D_800B6414)($at)
    /* 16DA8 80026DA8 F022848F */  lw         $a0, %gp_rel(asyncblockoffset)($gp)
    /* 16DAC 80026DAC C3120200 */  sra        $v0, $v0, 11
    /* 16DB0 80026DB0 2D008010 */  beqz       $a0, .L80026E68
    /* 16DB4 80026DB4 21A06200 */   addu      $s4, $v1, $v0
    /* 16DB8 80026DB8 F022828F */  lw         $v0, %gp_rel(asyncblockoffset)($gp)
    /* 16DBC 80026DBC 00080324 */  addiu      $v1, $zero, 0x800
    /* 16DC0 80026DC0 23186200 */  subu       $v1, $v1, $v0
    /* 16DC4 80026DC4 C82283AF */  sw         $v1, %gp_rel(asyncstartbytes)($gp)
    /* 16DC8 80026DC8 C822828F */  lw         $v0, %gp_rel(asyncstartbytes)($gp)
    /* 16DCC 80026DCC 00000000 */  nop
    /* 16DD0 80026DD0 2A100202 */  slt        $v0, $s0, $v0
    /* 16DD4 80026DD4 02004010 */  beqz       $v0, .L80026DE0
    /* 16DD8 80026DD8 00000000 */   nop
    /* 16DDC 80026DDC C82290AF */  sw         $s0, %gp_rel(asyncstartbytes)($gp)
  .L80026DE0:
    /* 16DE0 80026DE0 2423828F */  lw         $v0, %gp_rel(blockiosector)($gp)
    /* 16DE4 80026DE4 00000000 */  nop
    /* 16DE8 80026DE8 20008216 */  bne        $s4, $v0, .L80026E6C
    /* 16DEC 80026DEC 00000000 */   nop
    /* 16DF0 80026DF0 F022828F */  lw         $v0, %gp_rel(asyncblockoffset)($gp)
    /* 16DF4 80026DF4 C822868F */  lw         $a2, %gp_rel(asyncstartbytes)($gp)
    /* 16DF8 80026DF8 21286002 */  addu       $a1, $s3, $zero
    /* 16DFC 80026DFC 1380043C */  lui        $a0, %hi(blockiobuffer)
    /* 16E00 80026E00 B07B8424 */  addiu      $a0, $a0, %lo(blockiobuffer)
    /* 16E04 80026E04 F1B1000C */  jal        blockmove
    /* 16E08 80026E08 21204400 */   addu      $a0, $v0, $a0
    /* 16E0C 80026E0C C822848F */  lw         $a0, %gp_rel(asyncstartbytes)($gp)
    /* 16E10 80026E10 C822858F */  lw         $a1, %gp_rel(asyncstartbytes)($gp)
    /* 16E14 80026E14 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16E18 80026E18 21083100 */  addu       $at, $at, $s1
    /* 16E1C 80026E1C 1064228C */  lw         $v0, %lo(D_800B6410)($at)
    /* 16E20 80026E20 C822838F */  lw         $v1, %gp_rel(asyncstartbytes)($gp)
    /* 16E24 80026E24 21986402 */  addu       $s3, $s3, $a0
    /* 16E28 80026E28 23800502 */  subu       $s0, $s0, $a1
    /* 16E2C 80026E2C 21104300 */  addu       $v0, $v0, $v1
    /* 16E30 80026E30 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16E34 80026E34 21083100 */  addu       $at, $at, $s1
    /* 16E38 80026E38 106422AC */  sw         $v0, %lo(D_800B6410)($at)
    /* 16E3C 80026E3C 0900001E */  bgtz       $s0, .L80026E64
    /* 16E40 80026E40 00000000 */   nop
    /* 16E44 80026E44 FC22828F */  lw         $v0, %gp_rel(asyncblockcallbackfunc)($gp)
    /* 16E48 80026E48 00000000 */  nop
    /* 16E4C 80026E4C 28004010 */  beqz       $v0, .L80026EF0
    /* 16E50 80026E50 00000000 */   nop
    /* 16E54 80026E54 09F84000 */  jalr       $v0
    /* 16E58 80026E58 00000000 */   nop
    /* 16E5C 80026E5C BC9B0008 */  j          .L80026EF0
    /* 16E60 80026E60 00000000 */   nop
  .L80026E64:
    /* 16E64 80026E64 F02280AF */  sw         $zero, %gp_rel(asyncblockoffset)($gp)
  .L80026E68:
    /* 16E68 80026E68 C82280AF */  sw         $zero, %gp_rel(asyncstartbytes)($gp)
  .L80026E6C:
    /* 16E6C 80026E6C C822828F */  lw         $v0, %gp_rel(asyncstartbytes)($gp)
    /* 16E70 80026E70 D02292AF */  sw         $s2, %gp_rel(asyncblockhandle)($gp)
    /* 16E74 80026E74 23800202 */  subu       $s0, $s0, $v0
    /* 16E78 80026E78 00F80224 */  addiu      $v0, $zero, -0x800
    /* 16E7C 80026E7C 24100202 */  and        $v0, $s0, $v0
    /* 16E80 80026E80 BC2282AF */  sw         $v0, %gp_rel(asyncblockbytes)($gp)
    /* 16E84 80026E84 BC22828F */  lw         $v0, %gp_rel(asyncblockbytes)($gp)
    /* 16E88 80026E88 0280043C */  lui        $a0, %hi(blockreadcallback)
    /* 16E8C 80026E8C 84698424 */  addiu      $a0, $a0, %lo(blockreadcallback)
    /* 16E90 80026E90 DC2293AF */  sw         $s3, %gp_rel(asyncblockmemadr)($gp)
    /* 16E94 80026E94 681C92AF */  sw         $s2, %gp_rel(D_8011C3E8)($gp)
    /* 16E98 80026E98 23800202 */  subu       $s0, $s0, $v0
    /* 16E9C 80026E9C 01000224 */  addiu      $v0, $zero, 0x1
    /* 16EA0 80026EA0 2C2390AF */  sw         $s0, %gp_rel(asyncendbytes)($gp)
    /* 16EA4 80026EA4 581C82AF */  sw         $v0, %gp_rel(asyncblockstatus)($gp)
    /* 16EA8 80026EA8 582380AF */  sw         $zero, %gp_rel(asyncblockmove)($gp)
    /* 16EAC 80026EAC 539D000C */  jal        setasyncreadcallback
    /* 16EB0 80026EB0 00000000 */   nop
    /* 16EB4 80026EB4 F022828F */  lw         $v0, %gp_rel(asyncblockoffset)($gp)
    /* 16EB8 80026EB8 00000000 */  nop
    /* 16EBC 80026EBC 09004010 */  beqz       $v0, .L80026EE4
    /* 16EC0 80026EC0 00000000 */   nop
    /* 16EC4 80026EC4 229D000C */  jal        psxcdromasyncseek
    /* 16EC8 80026EC8 21208002 */   addu      $a0, $s4, $zero
    /* 16ECC 80026ECC 1380043C */  lui        $a0, %hi(blockiobuffer)
    /* 16ED0 80026ED0 B07B8424 */  addiu      $a0, $a0, %lo(blockiobuffer)
    /* 16ED4 80026ED4 B29E000C */  jal        psxcdromasyncread
    /* 16ED8 80026ED8 01000524 */   addiu     $a1, $zero, 0x1
    /* 16EDC 80026EDC BC9B0008 */  j          .L80026EF0
    /* 16EE0 80026EE0 01000224 */   addiu     $v0, $zero, 0x1
  .L80026EE4:
    /* 16EE4 80026EE4 619A000C */  jal        blockreadcallback
    /* 16EE8 80026EE8 21200000 */   addu      $a0, $zero, $zero
  .L80026EEC:
    /* 16EEC 80026EEC 01000224 */  addiu      $v0, $zero, 0x1
  .L80026EF0:
    /* 16EF0 80026EF0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 16EF4 80026EF4 2000B48F */  lw         $s4, 0x20($sp)
    /* 16EF8 80026EF8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 16EFC 80026EFC 1800B28F */  lw         $s2, 0x18($sp)
    /* 16F00 80026F00 1400B18F */  lw         $s1, 0x14($sp)
    /* 16F04 80026F04 1000B08F */  lw         $s0, 0x10($sp)
    /* 16F08 80026F08 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 16F0C 80026F0C 0800E003 */  jr         $ra
    /* 16F10 80026F10 00000000 */   nop
endlabel asyncreadblockhandle
