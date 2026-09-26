.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawAutoMapStairs__Fii, 0x178

glabel DrawAutoMapStairs__Fii
    /* 290E0 80162CD8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 290E4 80162CDC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 290E8 80162CE0 E81B908F */  lw         $s0, %gp_rel(AutoMapScale)($gp)
    /* 290EC 80162CE4 00000000 */  nop
    /* 290F0 80162CE8 18009000 */  mult       $a0, $s0
    /* 290F4 80162CEC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 290F8 80162CF0 12880000 */  mflo       $s1
    /* 290FC 80162CF4 00000000 */  nop
    /* 29100 80162CF8 00000000 */  nop
    /* 29104 80162CFC 1800B000 */  mult       $a1, $s0
    /* 29108 80162D00 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 2910C 80162D04 38000624 */  addiu      $a2, $zero, 0x38
    /* 29110 80162D08 2800BFAF */  sw         $ra, 0x28($sp)
    /* 29114 80162D0C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 29118 80162D10 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2911C 80162D14 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 29120 80162D18 1800B2AF */  sw         $s2, 0x18($sp)
    /* 29124 80162D1C 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 29128 80162D20 58000524 */  addiu      $a1, $zero, 0x58
    /* 2912C 80162D24 12100000 */  mflo       $v0
    /* 29130 80162D28 21985100 */  addu       $s3, $v0, $s1
    /* 29134 80162D2C 21986302 */  addu       $s3, $s3, $v1
    /* 29138 80162D30 23882202 */  subu       $s1, $s1, $v0
    /* 2913C 80162D34 40881100 */  sll        $s1, $s1, 1
    /* 29140 80162D38 0C1C828F */  lw         $v0, %gp_rel(AMPlayerX)($gp)
    /* 29144 80162D3C 21A87002 */  addu       $s5, $s3, $s0
    /* 29148 80162D40 21882202 */  addu       $s1, $s1, $v0
    /* 2914C 80162D44 40101000 */  sll        $v0, $s0, 1
    /* 29150 80162D48 23A02202 */  subu       $s4, $s1, $v0
    /* 29154 80162D4C FA87050C */  jal        AMGetLine__FUcUcUc
    /* 29158 80162D50 21986202 */   addu      $s3, $s3, $v0
    /* 2915C 80162D54 21184000 */  addu       $v1, $v0, $zero
    /* 29160 80162D58 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 29164 80162D5C 58000524 */  addiu      $a1, $zero, 0x58
    /* 29168 80162D60 38000624 */  addiu      $a2, $zero, 0x38
    /* 2916C 80162D64 080074A4 */  sh         $s4, 0x8($v1)
    /* 29170 80162D68 0A0075A4 */  sh         $s5, 0xA($v1)
    /* 29174 80162D6C 0C0071A4 */  sh         $s1, 0xC($v1)
    /* 29178 80162D70 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 2917C 80162D74 0E0073A4 */   sh        $s3, 0xE($v1)
    /* 29180 80162D78 21184000 */  addu       $v1, $v0, $zero
    /* 29184 80162D7C 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 29188 80162D80 58000524 */  addiu      $a1, $zero, 0x58
    /* 2918C 80162D84 38000624 */  addiu      $a2, $zero, 0x38
    /* 29190 80162D88 43901000 */  sra        $s2, $s0, 1
    /* 29194 80162D8C 21109202 */  addu       $v0, $s4, $s2
    /* 29198 80162D90 C2871000 */  srl        $s0, $s0, 31
    /* 2919C 80162D94 21805002 */  addu       $s0, $s2, $s0
    /* 291A0 80162D98 43801000 */  sra        $s0, $s0, 1
    /* 291A4 80162D9C 080062A4 */  sh         $v0, 0x8($v1)
    /* 291A8 80162DA0 2310B002 */  subu       $v0, $s5, $s0
    /* 291AC 80162DA4 0A0062A4 */  sh         $v0, 0xA($v1)
    /* 291B0 80162DA8 21103202 */  addu       $v0, $s1, $s2
    /* 291B4 80162DAC 23807002 */  subu       $s0, $s3, $s0
    /* 291B8 80162DB0 0C0062A4 */  sh         $v0, 0xC($v1)
    /* 291BC 80162DB4 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 291C0 80162DB8 0E0070A4 */   sh        $s0, 0xE($v1)
    /* 291C4 80162DBC 21184000 */  addu       $v1, $v0, $zero
    /* 291C8 80162DC0 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 291CC 80162DC4 58000524 */  addiu      $a1, $zero, 0x58
    /* 291D0 80162DC8 38000624 */  addiu      $a2, $zero, 0x38
    /* 291D4 80162DCC 40801200 */  sll        $s0, $s2, 1
    /* 291D8 80162DD0 21109002 */  addu       $v0, $s4, $s0
    /* 291DC 80162DD4 080062A4 */  sh         $v0, 0x8($v1)
    /* 291E0 80162DD8 2310B202 */  subu       $v0, $s5, $s2
    /* 291E4 80162DDC 0A0062A4 */  sh         $v0, 0xA($v1)
    /* 291E8 80162DE0 21103002 */  addu       $v0, $s1, $s0
    /* 291EC 80162DE4 0C0062A4 */  sh         $v0, 0xC($v1)
    /* 291F0 80162DE8 23107202 */  subu       $v0, $s3, $s2
    /* 291F4 80162DEC FA87050C */  jal        AMGetLine__FUcUcUc
    /* 291F8 80162DF0 0E0062A4 */   sh        $v0, 0xE($v1)
    /* 291FC 80162DF4 21184000 */  addu       $v1, $v0, $zero
    /* 29200 80162DF8 21801202 */  addu       $s0, $s0, $s2
    /* 29204 80162DFC 21A09002 */  addu       $s4, $s4, $s0
    /* 29208 80162E00 C2171000 */  srl        $v0, $s0, 31
    /* 2920C 80162E04 21100202 */  addu       $v0, $s0, $v0
    /* 29210 80162E08 43100200 */  sra        $v0, $v0, 1
    /* 29214 80162E0C 23A8A202 */  subu       $s5, $s5, $v0
    /* 29218 80162E10 21883002 */  addu       $s1, $s1, $s0
    /* 2921C 80162E14 23986202 */  subu       $s3, $s3, $v0
    /* 29220 80162E18 080074A4 */  sh         $s4, 0x8($v1)
    /* 29224 80162E1C 0A0075A4 */  sh         $s5, 0xA($v1)
    /* 29228 80162E20 0C0071A4 */  sh         $s1, 0xC($v1)
    /* 2922C 80162E24 0E0073A4 */  sh         $s3, 0xE($v1)
    /* 29230 80162E28 2800BF8F */  lw         $ra, 0x28($sp)
    /* 29234 80162E2C 2400B58F */  lw         $s5, 0x24($sp)
    /* 29238 80162E30 2000B48F */  lw         $s4, 0x20($sp)
    /* 2923C 80162E34 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 29240 80162E38 1800B28F */  lw         $s2, 0x18($sp)
    /* 29244 80162E3C 1400B18F */  lw         $s1, 0x14($sp)
    /* 29248 80162E40 1000B08F */  lw         $s0, 0x10($sp)
    /* 2924C 80162E44 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 29250 80162E48 0800E003 */  jr         $ra
    /* 29254 80162E4C 00000000 */   nop
endlabel DrawAutoMapStairs__Fii
