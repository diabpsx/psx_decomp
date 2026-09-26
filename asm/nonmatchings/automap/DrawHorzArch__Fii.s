.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawHorzArch__Fii, 0x134

glabel DrawHorzArch__Fii
    /* 28FAC 80162BA4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 28FB0 80162BA8 80200400 */  sll        $a0, $a0, 2
    /* 28FB4 80162BAC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28FB8 80162BB0 80800500 */  sll        $s0, $a1, 2
    /* 28FBC 80162BB4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28FC0 80162BB8 23889000 */  subu       $s1, $a0, $s0
    /* 28FC4 80162BBC 40881100 */  sll        $s1, $s1, 1
    /* 28FC8 80162BC0 21800402 */  addu       $s0, $s0, $a0
    /* 28FCC 80162BC4 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 28FD0 80162BC8 38000524 */  addiu      $a1, $zero, 0x38
    /* 28FD4 80162BCC 0C1C828F */  lw         $v0, %gp_rel(AMPlayerX)($gp)
    /* 28FD8 80162BD0 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 28FDC 80162BD4 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 28FE0 80162BD8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 28FE4 80162BDC 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 28FE8 80162BE0 2800B6AF */  sw         $s6, 0x28($sp)
    /* 28FEC 80162BE4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 28FF0 80162BE8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 28FF4 80162BEC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 28FF8 80162BF0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 28FFC 80162BF4 21882202 */  addu       $s1, $s1, $v0
    /* 29000 80162BF8 E81B828F */  lw         $v0, %gp_rel(AutoMapScale)($gp)
    /* 29004 80162BFC 21800302 */  addu       $s0, $s0, $v1
    /* 29008 80162C00 83100200 */  sra        $v0, $v0, 2
    /* 2900C 80162C04 21B02202 */  addu       $s6, $s1, $v0
    /* 29010 80162C08 23B80202 */  subu       $s7, $s0, $v0
    /* 29014 80162C0C 08005324 */  addiu      $s3, $v0, 0x8
    /* 29018 80162C10 21983302 */  addu       $s3, $s1, $s3
    /* 2901C 80162C14 FCFF5224 */  addiu      $s2, $v0, -0x4
    /* 29020 80162C18 23901202 */  subu       $s2, $s0, $s2
    /* 29024 80162C1C F8FF5524 */  addiu      $s5, $v0, -0x8
    /* 29028 80162C20 23A83502 */  subu       $s5, $s1, $s5
    /* 2902C 80162C24 04005424 */  addiu      $s4, $v0, 0x4
    /* 29030 80162C28 21A01402 */  addu       $s4, $s0, $s4
    /* 29034 80162C2C 23882202 */  subu       $s1, $s1, $v0
    /* 29038 80162C30 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 2903C 80162C34 21800202 */   addu      $s0, $s0, $v0
    /* 29040 80162C38 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 29044 80162C3C 38000524 */  addiu      $a1, $zero, 0x38
    /* 29048 80162C40 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 2904C 80162C44 080056A4 */  sh         $s6, 0x8($v0)
    /* 29050 80162C48 0A0057A4 */  sh         $s7, 0xA($v0)
    /* 29054 80162C4C 0C0053A4 */  sh         $s3, 0xC($v0)
    /* 29058 80162C50 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 2905C 80162C54 0E0052A4 */   sh        $s2, 0xE($v0)
    /* 29060 80162C58 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 29064 80162C5C 38000524 */  addiu      $a1, $zero, 0x38
    /* 29068 80162C60 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 2906C 80162C64 080053A4 */  sh         $s3, 0x8($v0)
    /* 29070 80162C68 0A0052A4 */  sh         $s2, 0xA($v0)
    /* 29074 80162C6C 0C0055A4 */  sh         $s5, 0xC($v0)
    /* 29078 80162C70 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 2907C 80162C74 0E0054A4 */   sh        $s4, 0xE($v0)
    /* 29080 80162C78 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 29084 80162C7C 38000524 */  addiu      $a1, $zero, 0x38
    /* 29088 80162C80 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 2908C 80162C84 080055A4 */  sh         $s5, 0x8($v0)
    /* 29090 80162C88 0A0054A4 */  sh         $s4, 0xA($v0)
    /* 29094 80162C8C 0C0051A4 */  sh         $s1, 0xC($v0)
    /* 29098 80162C90 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 2909C 80162C94 0E0050A4 */   sh        $s0, 0xE($v0)
    /* 290A0 80162C98 080051A4 */  sh         $s1, 0x8($v0)
    /* 290A4 80162C9C 0A0050A4 */  sh         $s0, 0xA($v0)
    /* 290A8 80162CA0 0C0056A4 */  sh         $s6, 0xC($v0)
    /* 290AC 80162CA4 0E0057A4 */  sh         $s7, 0xE($v0)
    /* 290B0 80162CA8 3000BF8F */  lw         $ra, 0x30($sp)
    /* 290B4 80162CAC 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 290B8 80162CB0 2800B68F */  lw         $s6, 0x28($sp)
    /* 290BC 80162CB4 2400B58F */  lw         $s5, 0x24($sp)
    /* 290C0 80162CB8 2000B48F */  lw         $s4, 0x20($sp)
    /* 290C4 80162CBC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 290C8 80162CC0 1800B28F */  lw         $s2, 0x18($sp)
    /* 290CC 80162CC4 1400B18F */  lw         $s1, 0x14($sp)
    /* 290D0 80162CC8 1000B08F */  lw         $s0, 0x10($sp)
    /* 290D4 80162CCC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 290D8 80162CD0 0800E003 */  jr         $ra
    /* 290DC 80162CD4 00000000 */   nop
endlabel DrawHorzArch__Fii
