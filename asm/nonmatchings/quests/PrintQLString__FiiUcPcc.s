.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintQLString__FiiUcPcc, 0x254

glabel PrintQLString__FiiUcPcc
    /* 5881C 8006881C A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 58820 80068820 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 58824 80068824 2188E000 */  addu       $s1, $a3, $zero
    /* 58828 80068828 21500000 */  addu       $t2, $zero, $zero
    /* 5882C 8006882C 21480000 */  addu       $t1, $zero, $zero
    /* 58830 80068830 21400000 */  addu       $t0, $zero, $zero
    /* 58834 80068834 5400B7AF */  sw         $s7, 0x54($sp)
    /* 58838 80068838 C0B80500 */  sll        $s7, $a1, 3
    /* 5883C 8006883C 7000A383 */  lb         $v1, 0x70($sp)
    /* 58840 80068840 01000224 */  addiu      $v0, $zero, 0x1
    /* 58844 80068844 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 58848 80068848 5800BEAF */  sw         $fp, 0x58($sp)
    /* 5884C 8006884C 5000B6AF */  sw         $s6, 0x50($sp)
    /* 58850 80068850 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 58854 80068854 4800B4AF */  sw         $s4, 0x48($sp)
    /* 58858 80068858 4400B3AF */  sw         $s3, 0x44($sp)
    /* 5885C 8006885C 4000B2AF */  sw         $s2, 0x40($sp)
    /* 58860 80068860 18006210 */  beq        $v1, $v0, .L800688C4
    /* 58864 80068864 3800B0AF */   sw        $s0, 0x38($sp)
    /* 58868 80068868 02006228 */  slti       $v0, $v1, 0x2
    /* 5886C 8006886C 05004010 */  beqz       $v0, .L80068884
    /* 58870 80068870 00000000 */   nop
    /* 58874 80068874 0B006010 */  beqz       $v1, .L800688A4
    /* 58878 80068878 00000000 */   nop
    /* 5887C 8006887C 47A20108 */  j          .L8006891C
    /* 58880 80068880 00000000 */   nop
  .L80068884:
    /* 58884 80068884 02000224 */  addiu      $v0, $zero, 0x2
    /* 58888 80068888 16006210 */  beq        $v1, $v0, .L800688E4
    /* 5888C 8006888C 00000000 */   nop
    /* 58890 80068890 03000224 */  addiu      $v0, $zero, 0x3
    /* 58894 80068894 1B006210 */  beq        $v1, $v0, .L80068904
    /* 58898 80068898 00000000 */   nop
    /* 5889C 8006889C 47A20108 */  j          .L8006891C
    /* 588A0 800688A0 00000000 */   nop
  .L800688A4:
    /* 588A4 800688A4 12800A3C */  lui        $t2, %hi(WHITER)
    /* 588A8 800688A8 D1AB4A91 */  lbu        $t2, %lo(WHITER)($t2)
    /* 588AC 800688AC 1280093C */  lui        $t1, %hi(WHITEG)
    /* 588B0 800688B0 D2AB2991 */  lbu        $t1, %lo(WHITEG)($t1)
    /* 588B4 800688B4 1280083C */  lui        $t0, %hi(WHITEB)
    /* 588B8 800688B8 D3AB0891 */  lbu        $t0, %lo(WHITEB)($t0)
    /* 588BC 800688BC 47A20108 */  j          .L8006891C
    /* 588C0 800688C0 00000000 */   nop
  .L800688C4:
    /* 588C4 800688C4 12800A3C */  lui        $t2, %hi(BLUER)
    /* 588C8 800688C8 D4AB4A91 */  lbu        $t2, %lo(BLUER)($t2)
    /* 588CC 800688CC 1280093C */  lui        $t1, %hi(BLUEG)
    /* 588D0 800688D0 D5AB2991 */  lbu        $t1, %lo(BLUEG)($t1)
    /* 588D4 800688D4 1280083C */  lui        $t0, %hi(BLUEB)
    /* 588D8 800688D8 D6AB0891 */  lbu        $t0, %lo(BLUEB)($t0)
    /* 588DC 800688DC 47A20108 */  j          .L8006891C
    /* 588E0 800688E0 00000000 */   nop
  .L800688E4:
    /* 588E4 800688E4 12800A3C */  lui        $t2, %hi(REDR)
    /* 588E8 800688E8 D7AB4A91 */  lbu        $t2, %lo(REDR)($t2)
    /* 588EC 800688EC 1280093C */  lui        $t1, %hi(REDG)
    /* 588F0 800688F0 D8AB2991 */  lbu        $t1, %lo(REDG)($t1)
    /* 588F4 800688F4 1280083C */  lui        $t0, %hi(REDB)
    /* 588F8 800688F8 D9AB0891 */  lbu        $t0, %lo(REDB)($t0)
    /* 588FC 800688FC 47A20108 */  j          .L8006891C
    /* 58900 80068900 00000000 */   nop
  .L80068904:
    /* 58904 80068904 12800A3C */  lui        $t2, %hi(GOLDR)
    /* 58908 80068908 DAAB4A91 */  lbu        $t2, %lo(GOLDR)($t2)
    /* 5890C 8006890C 1280093C */  lui        $t1, %hi(GOLDG)
    /* 58910 80068910 DBAB2991 */  lbu        $t1, %lo(GOLDG)($t1)
    /* 58914 80068914 1280083C */  lui        $t0, %hi(GOLDB)
    /* 58918 80068918 DCAB0891 */  lbu        $t0, %lo(GOLDB)($t0)
  .L8006891C:
    /* 5891C 8006891C 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 58920 80068920 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 58924 80068924 21200002 */  addu       $a0, $s0, $zero
    /* 58928 80068928 21280000 */  addu       $a1, $zero, $zero
    /* 5892C 8006892C 0300E636 */  ori        $a2, $s7, 0x3
    /* 58930 80068930 21382002 */  addu       $a3, $s1, $zero
    /* 58934 80068934 01001E24 */  addiu      $fp, $zero, 0x1
    /* 58938 80068938 1280023C */  lui        $v0, %hi(D_8011C87C)
    /* 5893C 8006893C 7CC84224 */  addiu      $v0, $v0, %lo(D_8011C87C)
    /* 58940 80068940 1000BEAF */  sw         $fp, 0x10($sp)
    /* 58944 80068944 1400A2AF */  sw         $v0, 0x14($sp)
    /* 58948 80068948 1800AAAF */  sw         $t2, 0x18($sp)
    /* 5894C 8006894C 1C00A9AF */  sw         $t1, 0x1C($sp)
    /* 58950 80068950 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 58954 80068954 2000A8AF */   sw        $t0, 0x20($sp)
    /* 58958 80068958 0200E106 */  bgez       $s7, .L80068964
    /* 5895C 8006895C 2110E002 */   addu      $v0, $s7, $zero
    /* 58960 80068960 0700E226 */  addiu      $v0, $s7, 0x7
  .L80068964:
    /* 58964 80068964 E812838F */  lw         $v1, %gp_rel(qline)($gp)
    /* 58968 80068968 C3100200 */  sra        $v0, $v0, 3
    /* 5896C 8006896C 33006214 */  bne        $v1, $v0, .L80068A3C
    /* 58970 80068970 21200002 */   addu      $a0, $s0, $zero
    /* 58974 80068974 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 58978 80068978 21282002 */   addu      $a1, $s1, $zero
    /* 5897C 8006897C A0000624 */  addiu      $a2, $zero, 0xA0
    /* 58980 80068980 40000724 */  addiu      $a3, $zero, 0x40
    /* 58984 80068984 F0001624 */  addiu      $s6, $zero, 0xF0
    /* 58988 80068988 20001524 */  addiu      $s5, $zero, 0x20
    /* 5898C 8006898C 40001424 */  addiu      $s4, $zero, 0x40
    /* 58990 80068990 FFFF1334 */  ori        $s3, $zero, 0xFFFF
    /* 58994 80068994 08001224 */  addiu      $s2, $zero, 0x8
    /* 58998 80068998 C012908F */  lw         $s0, %gp_rel(D_8011BA40)($gp)
    /* 5899C 8006899C B812848F */  lw         $a0, %gp_rel(D_8011BA38)($gp)
    /* 589A0 800689A0 BC12858F */  lw         $a1, %gp_rel(D_8011BA3C)($gp)
    /* 589A4 800689A4 21884000 */  addu       $s1, $v0, $zero
    /* 589A8 800689A8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 589AC 800689AC 1400B5AF */  sw         $s5, 0x14($sp)
    /* 589B0 800689B0 1800B4AF */  sw         $s4, 0x18($sp)
    /* 589B4 800689B4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 589B8 800689B8 2000BEAF */  sw         $fp, 0x20($sp)
    /* 589BC 800689BC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 589C0 800689C0 2800BEAF */  sw         $fp, 0x28($sp)
    /* 589C4 800689C4 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 589C8 800689C8 3000B2AF */  sw         $s2, 0x30($sp)
    /* 589CC 800689CC 23801102 */  subu       $s0, $s0, $s1
    /* 589D0 800689D0 C2171000 */  srl        $v0, $s0, 31
    /* 589D4 800689D4 21800202 */  addu       $s0, $s0, $v0
    /* 589D8 800689D8 43801000 */  sra        $s0, $s0, 1
    /* 589DC 800689DC 21200402 */  addu       $a0, $s0, $a0
    /* 589E0 800689E0 F5FF8424 */  addiu      $a0, $a0, -0xB
    /* 589E4 800689E4 2128E502 */  addu       $a1, $s7, $a1
    /* 589E8 800689E8 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 589EC 800689EC 0300A524 */   addiu     $a1, $a1, 0x3
    /* 589F0 800689F0 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 589F4 800689F4 40000724 */  addiu      $a3, $zero, 0x40
    /* 589F8 800689F8 B812828F */  lw         $v0, %gp_rel(D_8011BA38)($gp)
    /* 589FC 800689FC BC12858F */  lw         $a1, %gp_rel(D_8011BA3C)($gp)
    /* 58A00 80068A00 21801102 */  addu       $s0, $s0, $s1
    /* 58A04 80068A04 1000B6AF */  sw         $s6, 0x10($sp)
    /* 58A08 80068A08 1400B5AF */  sw         $s5, 0x14($sp)
    /* 58A0C 80068A0C 1800B4AF */  sw         $s4, 0x18($sp)
    /* 58A10 80068A10 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 58A14 80068A14 2000BEAF */  sw         $fp, 0x20($sp)
    /* 58A18 80068A18 2400B3AF */  sw         $s3, 0x24($sp)
    /* 58A1C 80068A1C 2800BEAF */  sw         $fp, 0x28($sp)
    /* 58A20 80068A20 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 58A24 80068A24 3000B2AF */  sw         $s2, 0x30($sp)
    /* 58A28 80068A28 21800202 */  addu       $s0, $s0, $v0
    /* 58A2C 80068A2C 03000426 */  addiu      $a0, $s0, 0x3
    /* 58A30 80068A30 2128E502 */  addu       $a1, $s7, $a1
    /* 58A34 80068A34 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 58A38 80068A38 0300A524 */   addiu     $a1, $a1, 0x3
  .L80068A3C:
    /* 58A3C 80068A3C 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 58A40 80068A40 5800BE8F */  lw         $fp, 0x58($sp)
    /* 58A44 80068A44 5400B78F */  lw         $s7, 0x54($sp)
    /* 58A48 80068A48 5000B68F */  lw         $s6, 0x50($sp)
    /* 58A4C 80068A4C 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 58A50 80068A50 4800B48F */  lw         $s4, 0x48($sp)
    /* 58A54 80068A54 4400B38F */  lw         $s3, 0x44($sp)
    /* 58A58 80068A58 4000B28F */  lw         $s2, 0x40($sp)
    /* 58A5C 80068A5C 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 58A60 80068A60 3800B08F */  lw         $s0, 0x38($sp)
    /* 58A64 80068A64 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 58A68 80068A68 0800E003 */  jr         $ra
    /* 58A6C 80068A6C 00000000 */   nop
endlabel PrintQLString__FiiUcPcc
