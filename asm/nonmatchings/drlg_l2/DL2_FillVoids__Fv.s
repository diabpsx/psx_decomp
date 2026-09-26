.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DL2_FillVoids__Fv, 0x97C

glabel DL2_FillVoids__Fv
    /* BD70 80145968 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* BD74 8014596C 20000A24 */  addiu      $t2, $zero, 0x20
    /* BD78 80145970 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* BD7C 80145974 4800BEAF */  sw         $fp, 0x48($sp)
    /* BD80 80145978 4400B7AF */  sw         $s7, 0x44($sp)
    /* BD84 8014597C 4000B6AF */  sw         $s6, 0x40($sp)
    /* BD88 80145980 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* BD8C 80145984 3800B4AF */  sw         $s4, 0x38($sp)
    /* BD90 80145988 3400B3AF */  sw         $s3, 0x34($sp)
    /* BD94 8014598C 3000B2AF */  sw         $s2, 0x30($sp)
    /* BD98 80145990 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* BD9C 80145994 2800B0AF */  sw         $s0, 0x28($sp)
    /* BDA0 80145998 1000A0AF */  sw         $zero, 0x10($sp)
  .L8014599C:
    /* BDA4 8014599C 8E15050C */  jal        DL2_NumNoChar__Fv
    /* BDA8 801459A0 2400AAAF */   sw        $t2, 0x24($sp)
    /* BDAC 801459A4 BD024228 */  slti       $v0, $v0, 0x2BD
    /* BDB0 801459A8 2400AA8F */  lw         $t2, 0x24($sp)
    /* BDB4 801459AC 3D024014 */  bnez       $v0, .L801462A4
    /* BDB8 801459B0 00000000 */   nop
    /* BDBC 801459B4 1000AB8F */  lw         $t3, 0x10($sp)
    /* BDC0 801459B8 00000000 */  nop
    /* BDC4 801459BC 64006229 */  slti       $v0, $t3, 0x64
    /* BDC8 801459C0 38024010 */  beqz       $v0, .L801462A4
    /* BDCC 801459C4 26000424 */   addiu     $a0, $zero, 0x26
    /* BDD0 801459C8 C9F6000C */  jal        ENG_random__Fl
    /* BDD4 801459CC 2400AAAF */   sw        $t2, 0x24($sp)
    /* BDD8 801459D0 26000424 */  addiu      $a0, $zero, 0x26
    /* BDDC 801459D4 C9F6000C */  jal        ENG_random__Fl
    /* BDE0 801459D8 01005124 */   addiu     $s1, $v0, 0x1
    /* BDE4 801459DC 01005324 */  addiu      $s3, $v0, 0x1
    /* BDE8 801459E0 80101100 */  sll        $v0, $s1, 2
    /* BDEC 801459E4 21105100 */  addu       $v0, $v0, $s1
    /* BDF0 801459E8 C0200200 */  sll        $a0, $v0, 3
    /* BDF4 801459EC 14800B3C */  lui        $t3, %hi(predungeon)
    /* BDF8 801459F0 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* BDFC 801459F4 21108B00 */  addu       $v0, $a0, $t3
    /* BE00 801459F8 21105300 */  addu       $v0, $v0, $s3
    /* BE04 801459FC 00004390 */  lbu        $v1, 0x0($v0)
    /* BE08 80145A00 23000224 */  addiu      $v0, $zero, 0x23
    /* BE0C 80145A04 2400AA8F */  lw         $t2, 0x24($sp)
    /* BE10 80145A08 E4FF6214 */  bne        $v1, $v0, .L8014599C
    /* BE14 80145A0C 21400000 */   addu      $t0, $zero, $zero
    /* BE18 80145A10 21F00000 */  addu       $fp, $zero, $zero
    /* BE1C 80145A14 21480000 */  addu       $t1, $zero, $zero
    /* BE20 80145A18 D8FF6225 */  addiu      $v0, $t3, -0x28
    /* BE24 80145A1C 21108200 */  addu       $v0, $a0, $v0
    /* BE28 80145A20 21305300 */  addu       $a2, $v0, $s3
    /* BE2C 80145A24 0000C290 */  lbu        $v0, 0x0($a2)
    /* BE30 80145A28 00000000 */  nop
    /* BE34 80145A2C 1D004A14 */  bne        $v0, $t2, .L80145AA4
    /* BE38 80145A30 21B80000 */   addu      $s7, $zero, $zero
    /* BE3C 80145A34 14800B3C */  lui        $t3, %hi(predungeon + 0x28)
    /* BE40 80145A38 F02D6B25 */  addiu      $t3, $t3, %lo(predungeon + 0x28)
    /* BE44 80145A3C 21108B00 */  addu       $v0, $a0, $t3
    /* BE48 80145A40 21185300 */  addu       $v1, $v0, $s3
    /* BE4C 80145A44 00006590 */  lbu        $a1, 0x0($v1)
    /* BE50 80145A48 2E000224 */  addiu      $v0, $zero, 0x2E
    /* BE54 80145A4C 1500A214 */  bne        $a1, $v0, .L80145AA4
    /* BE58 80145A50 00000000 */   nop
    /* BE5C 80145A54 FFFF6490 */  lbu        $a0, -0x1($v1)
    /* BE60 80145A58 00000000 */  nop
    /* BE64 80145A5C 89008514 */  bne        $a0, $a1, .L80145C84
    /* BE68 80145A60 00000000 */   nop
    /* BE6C 80145A64 01006290 */  lbu        $v0, 0x1($v1)
    /* BE70 80145A68 00000000 */  nop
    /* BE74 80145A6C 85004414 */  bne        $v0, $a0, .L80145C84
    /* BE78 80145A70 00000000 */   nop
    /* BE7C 80145A74 FFFFC290 */  lbu        $v0, -0x1($a2)
    /* BE80 80145A78 00000000 */  nop
    /* BE84 80145A7C 81004A14 */  bne        $v0, $t2, .L80145C84
    /* BE88 80145A80 00000000 */   nop
    /* BE8C 80145A84 0100C290 */  lbu        $v0, 0x1($a2)
    /* BE90 80145A88 00000000 */  nop
    /* BE94 80145A8C 7E004A14 */  bne        $v0, $t2, .L80145C88
    /* BE98 80145A90 FF00E332 */   andi      $v1, $s7, 0xFF
    /* BE9C 80145A94 01000824 */  addiu      $t0, $zero, 0x1
    /* BEA0 80145A98 01001E24 */  addiu      $fp, $zero, 0x1
    /* BEA4 80145A9C 21170508 */  j          .L80145C84
    /* BEA8 80145AA0 01001724 */   addiu     $s7, $zero, 0x1
  .L80145AA4:
    /* BEAC 80145AA4 80101100 */  sll        $v0, $s1, 2
    /* BEB0 80145AA8 21105100 */  addu       $v0, $v0, $s1
    /* BEB4 80145AAC C0180200 */  sll        $v1, $v0, 3
    /* BEB8 80145AB0 14800B3C */  lui        $t3, %hi(predungeon + 0x28)
    /* BEBC 80145AB4 F02D6B25 */  addiu      $t3, $t3, %lo(predungeon + 0x28)
    /* BEC0 80145AB8 21106B00 */  addu       $v0, $v1, $t3
    /* BEC4 80145ABC 21305300 */  addu       $a2, $v0, $s3
    /* BEC8 80145AC0 0000C290 */  lbu        $v0, 0x0($a2)
    /* BECC 80145AC4 00000000 */  nop
    /* BED0 80145AC8 1D004A14 */  bne        $v0, $t2, .L80145B40
    /* BED4 80145ACC 80101100 */   sll       $v0, $s1, 2
    /* BED8 80145AD0 B0FF6225 */  addiu      $v0, $t3, -0x50
    /* BEDC 80145AD4 21106200 */  addu       $v0, $v1, $v0
    /* BEE0 80145AD8 21185300 */  addu       $v1, $v0, $s3
    /* BEE4 80145ADC 00006590 */  lbu        $a1, 0x0($v1)
    /* BEE8 80145AE0 2E000224 */  addiu      $v0, $zero, 0x2E
    /* BEEC 80145AE4 1500A214 */  bne        $a1, $v0, .L80145B3C
    /* BEF0 80145AE8 00000000 */   nop
    /* BEF4 80145AEC FFFF6490 */  lbu        $a0, -0x1($v1)
    /* BEF8 80145AF0 00000000 */  nop
    /* BEFC 80145AF4 63008514 */  bne        $a0, $a1, .L80145C84
    /* BF00 80145AF8 00000000 */   nop
    /* BF04 80145AFC 01006290 */  lbu        $v0, 0x1($v1)
    /* BF08 80145B00 00000000 */  nop
    /* BF0C 80145B04 5F004414 */  bne        $v0, $a0, .L80145C84
    /* BF10 80145B08 00000000 */   nop
    /* BF14 80145B0C FFFFC290 */  lbu        $v0, -0x1($a2)
    /* BF18 80145B10 00000000 */  nop
    /* BF1C 80145B14 5B004A14 */  bne        $v0, $t2, .L80145C84
    /* BF20 80145B18 00000000 */   nop
    /* BF24 80145B1C 0100C290 */  lbu        $v0, 0x1($a2)
    /* BF28 80145B20 00000000 */  nop
    /* BF2C 80145B24 58004A14 */  bne        $v0, $t2, .L80145C88
    /* BF30 80145B28 FF00E332 */   andi      $v1, $s7, 0xFF
    /* BF34 80145B2C 01000824 */  addiu      $t0, $zero, 0x1
    /* BF38 80145B30 01001E24 */  addiu      $fp, $zero, 0x1
    /* BF3C 80145B34 22170508 */  j          .L80145C88
    /* BF40 80145B38 01000924 */   addiu     $t1, $zero, 0x1
  .L80145B3C:
    /* BF44 80145B3C 80101100 */  sll        $v0, $s1, 2
  .L80145B40:
    /* BF48 80145B40 21105100 */  addu       $v0, $v0, $s1
    /* BF4C 80145B44 C0200200 */  sll        $a0, $v0, 3
    /* BF50 80145B48 14800B3C */  lui        $t3, %hi(predungeon)
    /* BF54 80145B4C C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* BF58 80145B50 21108B00 */  addu       $v0, $a0, $t3
    /* BF5C 80145B54 21185300 */  addu       $v1, $v0, $s3
    /* BF60 80145B58 FFFF6290 */  lbu        $v0, -0x1($v1)
    /* BF64 80145B5C 00000000 */  nop
    /* BF68 80145B60 20004A14 */  bne        $v0, $t2, .L80145BE4
    /* BF6C 80145B64 80101100 */   sll       $v0, $s1, 2
    /* BF70 80145B68 01006590 */  lbu        $a1, 0x1($v1)
    /* BF74 80145B6C 2E000224 */  addiu      $v0, $zero, 0x2E
    /* BF78 80145B70 1C00A214 */  bne        $a1, $v0, .L80145BE4
    /* BF7C 80145B74 80101100 */   sll       $v0, $s1, 2
    /* BF80 80145B78 D8FF6225 */  addiu      $v0, $t3, -0x28
    /* BF84 80145B7C 21108200 */  addu       $v0, $a0, $v0
    /* BF88 80145B80 21305300 */  addu       $a2, $v0, $s3
    /* BF8C 80145B84 0100C390 */  lbu        $v1, 0x1($a2)
    /* BF90 80145B88 00000000 */  nop
    /* BF94 80145B8C 3D006514 */  bne        $v1, $a1, .L80145C84
    /* BF98 80145B90 00000000 */   nop
    /* BF9C 80145B94 14800B3C */  lui        $t3, %hi(predungeon + 0x28)
    /* BFA0 80145B98 F02D6B25 */  addiu      $t3, $t3, %lo(predungeon + 0x28)
    /* BFA4 80145B9C 21108B00 */  addu       $v0, $a0, $t3
    /* BFA8 80145BA0 21205300 */  addu       $a0, $v0, $s3
    /* BFAC 80145BA4 01008290 */  lbu        $v0, 0x1($a0)
    /* BFB0 80145BA8 00000000 */  nop
    /* BFB4 80145BAC 35004314 */  bne        $v0, $v1, .L80145C84
    /* BFB8 80145BB0 00000000 */   nop
    /* BFBC 80145BB4 FFFFC290 */  lbu        $v0, -0x1($a2)
    /* BFC0 80145BB8 00000000 */  nop
    /* BFC4 80145BBC 31004A14 */  bne        $v0, $t2, .L80145C84
    /* BFC8 80145BC0 00000000 */   nop
    /* BFCC 80145BC4 FFFF8290 */  lbu        $v0, -0x1($a0)
    /* BFD0 80145BC8 00000000 */  nop
    /* BFD4 80145BCC 2E004A14 */  bne        $v0, $t2, .L80145C88
    /* BFD8 80145BD0 FF00E332 */   andi      $v1, $s7, 0xFF
    /* BFDC 80145BD4 01000924 */  addiu      $t1, $zero, 0x1
    /* BFE0 80145BD8 01001724 */  addiu      $s7, $zero, 0x1
    /* BFE4 80145BDC 21170508 */  j          .L80145C84
    /* BFE8 80145BE0 01001E24 */   addiu     $fp, $zero, 0x1
  .L80145BE4:
    /* BFEC 80145BE4 21105100 */  addu       $v0, $v0, $s1
    /* BFF0 80145BE8 C0200200 */  sll        $a0, $v0, 3
    /* BFF4 80145BEC 14800B3C */  lui        $t3, %hi(predungeon)
    /* BFF8 80145BF0 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* BFFC 80145BF4 21108B00 */  addu       $v0, $a0, $t3
    /* C000 80145BF8 21185300 */  addu       $v1, $v0, $s3
    /* C004 80145BFC 01006290 */  lbu        $v0, 0x1($v1)
    /* C008 80145C00 00000000 */  nop
    /* C00C 80145C04 1F004A14 */  bne        $v0, $t2, .L80145C84
    /* C010 80145C08 2E000224 */   addiu     $v0, $zero, 0x2E
    /* C014 80145C0C FFFF6590 */  lbu        $a1, -0x1($v1)
    /* C018 80145C10 00000000 */  nop
    /* C01C 80145C14 1C00A214 */  bne        $a1, $v0, .L80145C88
    /* C020 80145C18 FF00E332 */   andi      $v1, $s7, 0xFF
    /* C024 80145C1C D8FF6225 */  addiu      $v0, $t3, -0x28
    /* C028 80145C20 21108200 */  addu       $v0, $a0, $v0
    /* C02C 80145C24 21305300 */  addu       $a2, $v0, $s3
    /* C030 80145C28 FFFFC390 */  lbu        $v1, -0x1($a2)
    /* C034 80145C2C 00000000 */  nop
    /* C038 80145C30 14006514 */  bne        $v1, $a1, .L80145C84
    /* C03C 80145C34 00000000 */   nop
    /* C040 80145C38 14800B3C */  lui        $t3, %hi(predungeon + 0x28)
    /* C044 80145C3C F02D6B25 */  addiu      $t3, $t3, %lo(predungeon + 0x28)
    /* C048 80145C40 21108B00 */  addu       $v0, $a0, $t3
    /* C04C 80145C44 21205300 */  addu       $a0, $v0, $s3
    /* C050 80145C48 FFFF8290 */  lbu        $v0, -0x1($a0)
    /* C054 80145C4C 00000000 */  nop
    /* C058 80145C50 0C004314 */  bne        $v0, $v1, .L80145C84
    /* C05C 80145C54 00000000 */   nop
    /* C060 80145C58 0100C290 */  lbu        $v0, 0x1($a2)
    /* C064 80145C5C 00000000 */  nop
    /* C068 80145C60 08004A14 */  bne        $v0, $t2, .L80145C84
    /* C06C 80145C64 00000000 */   nop
    /* C070 80145C68 01008290 */  lbu        $v0, 0x1($a0)
    /* C074 80145C6C 00000000 */  nop
    /* C078 80145C70 05004A14 */  bne        $v0, $t2, .L80145C88
    /* C07C 80145C74 FF00E332 */   andi      $v1, $s7, 0xFF
    /* C080 80145C78 01000924 */  addiu      $t1, $zero, 0x1
    /* C084 80145C7C 01001724 */  addiu      $s7, $zero, 0x1
    /* C088 80145C80 01000824 */  addiu      $t0, $zero, 0x1
  .L80145C84:
    /* C08C 80145C84 FF00E332 */  andi       $v1, $s7, 0xFF
  .L80145C88:
    /* C090 80145C88 21206000 */  addu       $a0, $v1, $zero
    /* C094 80145C8C FF00D533 */  andi       $s5, $fp, 0xFF
    /* C098 80145C90 2128A002 */  addu       $a1, $s5, $zero
    /* C09C 80145C94 FF003631 */  andi       $s6, $t1, 0xFF
    /* C0A0 80145C98 2130C002 */  addu       $a2, $s6, $zero
    /* C0A4 80145C9C FF001431 */  andi       $s4, $t0, 0xFF
    /* C0A8 80145CA0 21388002 */  addu       $a3, $s4, $zero
    /* C0AC 80145CA4 1800A3AF */  sw         $v1, 0x18($sp)
    /* C0B0 80145CA8 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* C0B4 80145CAC 2000A9AF */  sw         $t1, 0x20($sp)
    /* C0B8 80145CB0 6E15050C */  jal        DL2_Cont__FUcUcUcUc
    /* C0BC 80145CB4 2400AAAF */   sw        $t2, 0x24($sp)
    /* C0C0 80145CB8 FF004230 */  andi       $v0, $v0, 0xFF
    /* C0C4 80145CBC 1800A38F */  lw         $v1, 0x18($sp)
    /* C0C8 80145CC0 1C00A88F */  lw         $t0, 0x1C($sp)
    /* C0CC 80145CC4 2000A98F */  lw         $t1, 0x20($sp)
    /* C0D0 80145CC8 2400AA8F */  lw         $t2, 0x24($sp)
    /* C0D4 80145CCC 70014010 */  beqz       $v0, .L80146290
    /* C0D8 80145CD0 00000000 */   nop
    /* C0DC 80145CD4 02006010 */  beqz       $v1, .L80145CE0
    /* C0E0 80145CD8 21802002 */   addu      $s0, $s1, $zero
    /* C0E4 80145CDC FFFF1026 */  addiu      $s0, $s0, -0x1
  .L80145CE0:
    /* C0E8 80145CE0 0200C012 */  beqz       $s6, .L80145CEC
    /* C0EC 80145CE4 21902002 */   addu      $s2, $s1, $zero
    /* C0F0 80145CE8 01005226 */  addiu      $s2, $s2, 0x1
  .L80145CEC:
    /* C0F4 80145CEC 0200A012 */  beqz       $s5, .L80145CF8
    /* C0F8 80145CF0 21886002 */   addu      $s1, $s3, $zero
    /* C0FC 80145CF4 FFFF3126 */  addiu      $s1, $s1, -0x1
  .L80145CF8:
    /* C100 80145CF8 02008012 */  beqz       $s4, .L80145D04
    /* C104 80145CFC 00000000 */   nop
    /* C108 80145D00 01007326 */  addiu      $s3, $s3, 0x1
  .L80145D04:
    /* C10C 80145D04 55006014 */  bnez       $v1, .L80145E5C
    /* C110 80145D08 00000000 */   nop
    /* C114 80145D0C 0300A016 */  bnez       $s5, .L80145D1C
    /* C118 80145D10 00000000 */   nop
    /* C11C 80145D14 27008012 */  beqz       $s4, .L80145DB4
    /* C120 80145D18 00000000 */   nop
  .L80145D1C:
    /* C124 80145D1C 02002016 */  bnez       $s1, .L80145D28
    /* C128 80145D20 27000B24 */   addiu     $t3, $zero, 0x27
    /* C12C 80145D24 21F00000 */  addu       $fp, $zero, $zero
  .L80145D28:
    /* C130 80145D28 02006B16 */  bne        $s3, $t3, .L80145D34
    /* C134 80145D2C 23107102 */   subu      $v0, $s3, $s1
    /* C138 80145D30 21400000 */  addu       $t0, $zero, $zero
  .L80145D34:
    /* C13C 80145D34 0E004228 */  slti       $v0, $v0, 0xE
    /* C140 80145D38 04004014 */  bnez       $v0, .L80145D4C
    /* C144 80145D3C FF00C233 */   andi      $v0, $fp, 0xFF
    /* C148 80145D40 21F00000 */  addu       $fp, $zero, $zero
    /* C14C 80145D44 21400000 */  addu       $t0, $zero, $zero
    /* C150 80145D48 FF00C233 */  andi       $v0, $fp, 0xFF
  .L80145D4C:
    /* C154 80145D4C 02004010 */  beqz       $v0, .L80145D58
    /* C158 80145D50 FF000231 */   andi      $v0, $t0, 0xFF
    /* C15C 80145D54 FFFF3126 */  addiu      $s1, $s1, -0x1
  .L80145D58:
    /* C160 80145D58 02004010 */  beqz       $v0, .L80145D64
    /* C164 80145D5C 80101200 */   sll       $v0, $s2, 2
    /* C168 80145D60 01007326 */  addiu      $s3, $s3, 0x1
  .L80145D64:
    /* C16C 80145D64 21105200 */  addu       $v0, $v0, $s2
    /* C170 80145D68 C0100200 */  sll        $v0, $v0, 3
    /* C174 80145D6C 14800B3C */  lui        $t3, %hi(predungeon)
    /* C178 80145D70 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C17C 80145D74 21184B00 */  addu       $v1, $v0, $t3
    /* C180 80145D78 21107100 */  addu       $v0, $v1, $s1
    /* C184 80145D7C 00004290 */  lbu        $v0, 0x0($v0)
    /* C188 80145D80 00000000 */  nop
    /* C18C 80145D84 02004A10 */  beq        $v0, $t2, .L80145D90
    /* C190 80145D88 21107300 */   addu      $v0, $v1, $s3
    /* C194 80145D8C 21F00000 */  addu       $fp, $zero, $zero
  .L80145D90:
    /* C198 80145D90 00004290 */  lbu        $v0, 0x0($v0)
    /* C19C 80145D94 00000000 */  nop
    /* C1A0 80145D98 02004A10 */  beq        $v0, $t2, .L80145DA4
    /* C1A4 80145D9C FF00C233 */   andi      $v0, $fp, 0xFF
    /* C1A8 80145DA0 21400000 */  addu       $t0, $zero, $zero
  .L80145DA4:
    /* C1AC 80145DA4 DDFF4014 */  bnez       $v0, .L80145D1C
    /* C1B0 80145DA8 FF000231 */   andi      $v0, $t0, 0xFF
    /* C1B4 80145DAC DBFF4014 */  bnez       $v0, .L80145D1C
    /* C1B8 80145DB0 00000000 */   nop
  .L80145DB4:
    /* C1BC 80145DB4 02003126 */  addiu      $s1, $s1, 0x2
    /* C1C0 80145DB8 FEFF7326 */  addiu      $s3, $s3, -0x2
    /* C1C4 80145DBC 23107102 */  subu       $v0, $s3, $s1
    /* C1C8 80145DC0 06004228 */  slti       $v0, $v0, 0x6
    /* C1CC 80145DC4 32014014 */  bnez       $v0, .L80146290
    /* C1D0 80145DC8 FF002231 */   andi      $v0, $t1, 0xFF
    /* C1D4 80145DCC 20004010 */  beqz       $v0, .L80145E50
    /* C1D8 80145DD0 2A307102 */   slt       $a2, $s3, $s1
    /* C1DC 80145DD4 80101200 */  sll        $v0, $s2, 2
    /* C1E0 80145DD8 21105200 */  addu       $v0, $v0, $s2
    /* C1E4 80145DDC C0100200 */  sll        $v0, $v0, 3
    /* C1E8 80145DE0 14800B3C */  lui        $t3, %hi(predungeon)
    /* C1EC 80145DE4 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C1F0 80145DE8 21284B00 */  addu       $a1, $v0, $t3
  .L80145DEC:
    /* C1F4 80145DEC 27000B24 */  addiu      $t3, $zero, 0x27
    /* C1F8 80145DF0 02004B16 */  bne        $s2, $t3, .L80145DFC
    /* C1FC 80145DF4 23105002 */   subu      $v0, $s2, $s0
    /* C200 80145DF8 21480000 */  addu       $t1, $zero, $zero
  .L80145DFC:
    /* C204 80145DFC 0C004228 */  slti       $v0, $v0, 0xC
    /* C208 80145E00 02004014 */  bnez       $v0, .L80145E0C
    /* C20C 80145E04 00000000 */   nop
    /* C210 80145E08 21480000 */  addu       $t1, $zero, $zero
  .L80145E0C:
    /* C214 80145E0C 0B00C014 */  bnez       $a2, .L80145E3C
    /* C218 80145E10 21182002 */   addu      $v1, $s1, $zero
    /* C21C 80145E14 21202502 */  addu       $a0, $s1, $a1
  .L80145E18:
    /* C220 80145E18 00008290 */  lbu        $v0, 0x0($a0)
    /* C224 80145E1C 00000000 */  nop
    /* C228 80145E20 02004A10 */  beq        $v0, $t2, .L80145E2C
    /* C22C 80145E24 00000000 */   nop
    /* C230 80145E28 21480000 */  addu       $t1, $zero, $zero
  .L80145E2C:
    /* C234 80145E2C 01006324 */  addiu      $v1, $v1, 0x1
    /* C238 80145E30 2A106302 */  slt        $v0, $s3, $v1
    /* C23C 80145E34 F8FF4010 */  beqz       $v0, .L80145E18
    /* C240 80145E38 01008424 */   addiu     $a0, $a0, 0x1
  .L80145E3C:
    /* C244 80145E3C FF002231 */  andi       $v0, $t1, 0xFF
    /* C248 80145E40 03004010 */  beqz       $v0, .L80145E50
    /* C24C 80145E44 2800A524 */   addiu     $a1, $a1, 0x28
    /* C250 80145E48 7B170508 */  j          .L80145DEC
    /* C254 80145E4C 01005226 */   addiu     $s2, $s2, 0x1
  .L80145E50:
    /* C258 80145E50 FEFF5226 */  addiu      $s2, $s2, -0x2
    /* C25C 80145E54 96180508 */  j          .L80146258
    /* C260 80145E58 23105002 */   subu      $v0, $s2, $s0
  .L80145E5C:
    /* C264 80145E5C 5400C016 */  bnez       $s6, .L80145FB0
    /* C268 80145E60 00000000 */   nop
    /* C26C 80145E64 0300A016 */  bnez       $s5, .L80145E74
    /* C270 80145E68 00000000 */   nop
    /* C274 80145E6C 27008012 */  beqz       $s4, .L80145F0C
    /* C278 80145E70 00000000 */   nop
  .L80145E74:
    /* C27C 80145E74 02002016 */  bnez       $s1, .L80145E80
    /* C280 80145E78 27000B24 */   addiu     $t3, $zero, 0x27
    /* C284 80145E7C 21F00000 */  addu       $fp, $zero, $zero
  .L80145E80:
    /* C288 80145E80 02006B16 */  bne        $s3, $t3, .L80145E8C
    /* C28C 80145E84 23107102 */   subu      $v0, $s3, $s1
    /* C290 80145E88 21400000 */  addu       $t0, $zero, $zero
  .L80145E8C:
    /* C294 80145E8C 0E004228 */  slti       $v0, $v0, 0xE
    /* C298 80145E90 04004014 */  bnez       $v0, .L80145EA4
    /* C29C 80145E94 FF00C233 */   andi      $v0, $fp, 0xFF
    /* C2A0 80145E98 21F00000 */  addu       $fp, $zero, $zero
    /* C2A4 80145E9C 21400000 */  addu       $t0, $zero, $zero
    /* C2A8 80145EA0 FF00C233 */  andi       $v0, $fp, 0xFF
  .L80145EA4:
    /* C2AC 80145EA4 02004010 */  beqz       $v0, .L80145EB0
    /* C2B0 80145EA8 FF000231 */   andi      $v0, $t0, 0xFF
    /* C2B4 80145EAC FFFF3126 */  addiu      $s1, $s1, -0x1
  .L80145EB0:
    /* C2B8 80145EB0 02004010 */  beqz       $v0, .L80145EBC
    /* C2BC 80145EB4 80101000 */   sll       $v0, $s0, 2
    /* C2C0 80145EB8 01007326 */  addiu      $s3, $s3, 0x1
  .L80145EBC:
    /* C2C4 80145EBC 21105000 */  addu       $v0, $v0, $s0
    /* C2C8 80145EC0 C0100200 */  sll        $v0, $v0, 3
    /* C2CC 80145EC4 14800B3C */  lui        $t3, %hi(predungeon)
    /* C2D0 80145EC8 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C2D4 80145ECC 21184B00 */  addu       $v1, $v0, $t3
    /* C2D8 80145ED0 21107100 */  addu       $v0, $v1, $s1
    /* C2DC 80145ED4 00004290 */  lbu        $v0, 0x0($v0)
    /* C2E0 80145ED8 00000000 */  nop
    /* C2E4 80145EDC 02004A10 */  beq        $v0, $t2, .L80145EE8
    /* C2E8 80145EE0 21107300 */   addu      $v0, $v1, $s3
    /* C2EC 80145EE4 21F00000 */  addu       $fp, $zero, $zero
  .L80145EE8:
    /* C2F0 80145EE8 00004290 */  lbu        $v0, 0x0($v0)
    /* C2F4 80145EEC 00000000 */  nop
    /* C2F8 80145EF0 02004A10 */  beq        $v0, $t2, .L80145EFC
    /* C2FC 80145EF4 FF00C233 */   andi      $v0, $fp, 0xFF
    /* C300 80145EF8 21400000 */  addu       $t0, $zero, $zero
  .L80145EFC:
    /* C304 80145EFC DDFF4014 */  bnez       $v0, .L80145E74
    /* C308 80145F00 FF000231 */   andi      $v0, $t0, 0xFF
    /* C30C 80145F04 DBFF4014 */  bnez       $v0, .L80145E74
    /* C310 80145F08 00000000 */   nop
  .L80145F0C:
    /* C314 80145F0C 02003126 */  addiu      $s1, $s1, 0x2
    /* C318 80145F10 FEFF7326 */  addiu      $s3, $s3, -0x2
    /* C31C 80145F14 23107102 */  subu       $v0, $s3, $s1
    /* C320 80145F18 06004228 */  slti       $v0, $v0, 0x6
    /* C324 80145F1C DC004014 */  bnez       $v0, .L80146290
    /* C328 80145F20 FF00E232 */   andi      $v0, $s7, 0xFF
    /* C32C 80145F24 1F004010 */  beqz       $v0, .L80145FA4
    /* C330 80145F28 2A307102 */   slt       $a2, $s3, $s1
    /* C334 80145F2C 80101000 */  sll        $v0, $s0, 2
    /* C338 80145F30 21105000 */  addu       $v0, $v0, $s0
    /* C33C 80145F34 C0100200 */  sll        $v0, $v0, 3
    /* C340 80145F38 14800B3C */  lui        $t3, %hi(predungeon)
    /* C344 80145F3C C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C348 80145F40 21284B00 */  addu       $a1, $v0, $t3
  .L80145F44:
    /* C34C 80145F44 02000016 */  bnez       $s0, .L80145F50
    /* C350 80145F48 23105002 */   subu      $v0, $s2, $s0
    /* C354 80145F4C 21B80000 */  addu       $s7, $zero, $zero
  .L80145F50:
    /* C358 80145F50 0C004228 */  slti       $v0, $v0, 0xC
    /* C35C 80145F54 02004014 */  bnez       $v0, .L80145F60
    /* C360 80145F58 00000000 */   nop
    /* C364 80145F5C 21B80000 */  addu       $s7, $zero, $zero
  .L80145F60:
    /* C368 80145F60 0B00C014 */  bnez       $a2, .L80145F90
    /* C36C 80145F64 21182002 */   addu      $v1, $s1, $zero
    /* C370 80145F68 21202502 */  addu       $a0, $s1, $a1
  .L80145F6C:
    /* C374 80145F6C 00008290 */  lbu        $v0, 0x0($a0)
    /* C378 80145F70 00000000 */  nop
    /* C37C 80145F74 02004A10 */  beq        $v0, $t2, .L80145F80
    /* C380 80145F78 00000000 */   nop
    /* C384 80145F7C 21B80000 */  addu       $s7, $zero, $zero
  .L80145F80:
    /* C388 80145F80 01006324 */  addiu      $v1, $v1, 0x1
    /* C38C 80145F84 2A106302 */  slt        $v0, $s3, $v1
    /* C390 80145F88 F8FF4010 */  beqz       $v0, .L80145F6C
    /* C394 80145F8C 01008424 */   addiu     $a0, $a0, 0x1
  .L80145F90:
    /* C398 80145F90 FF00E232 */  andi       $v0, $s7, 0xFF
    /* C39C 80145F94 03004010 */  beqz       $v0, .L80145FA4
    /* C3A0 80145F98 D8FFA524 */   addiu     $a1, $a1, -0x28
    /* C3A4 80145F9C D1170508 */  j          .L80145F44
    /* C3A8 80145FA0 FFFF1026 */   addiu     $s0, $s0, -0x1
  .L80145FA4:
    /* C3AC 80145FA4 02001026 */  addiu      $s0, $s0, 0x2
    /* C3B0 80145FA8 96180508 */  j          .L80146258
    /* C3B4 80145FAC 23105002 */   subu      $v0, $s2, $s0
  .L80145FB0:
    /* C3B8 80145FB0 5500A016 */  bnez       $s5, .L80146108
    /* C3BC 80145FB4 80101200 */   sll       $v0, $s2, 2
    /* C3C0 80145FB8 21105200 */  addu       $v0, $v0, $s2
    /* C3C4 80145FBC C0100200 */  sll        $v0, $v0, 3
    /* C3C8 80145FC0 14800B3C */  lui        $t3, %hi(predungeon)
    /* C3CC 80145FC4 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C3D0 80145FC8 21204B00 */  addu       $a0, $v0, $t3
    /* C3D4 80145FCC 80101000 */  sll        $v0, $s0, 2
    /* C3D8 80145FD0 21105000 */  addu       $v0, $v0, $s0
    /* C3DC 80145FD4 C0100200 */  sll        $v0, $v0, 3
    /* C3E0 80145FD8 21184B00 */  addu       $v1, $v0, $t3
  .L80145FDC:
    /* C3E4 80145FDC 02000016 */  bnez       $s0, .L80145FE8
    /* C3E8 80145FE0 27000B24 */   addiu     $t3, $zero, 0x27
    /* C3EC 80145FE4 21B80000 */  addu       $s7, $zero, $zero
  .L80145FE8:
    /* C3F0 80145FE8 02004B16 */  bne        $s2, $t3, .L80145FF4
    /* C3F4 80145FEC 23105002 */   subu      $v0, $s2, $s0
    /* C3F8 80145FF0 21480000 */  addu       $t1, $zero, $zero
  .L80145FF4:
    /* C3FC 80145FF4 0E004228 */  slti       $v0, $v0, 0xE
    /* C400 80145FF8 04004014 */  bnez       $v0, .L8014600C
    /* C404 80145FFC FF00E232 */   andi      $v0, $s7, 0xFF
    /* C408 80146000 21B80000 */  addu       $s7, $zero, $zero
    /* C40C 80146004 21480000 */  addu       $t1, $zero, $zero
    /* C410 80146008 FF00E232 */  andi       $v0, $s7, 0xFF
  .L8014600C:
    /* C414 8014600C 03004010 */  beqz       $v0, .L8014601C
    /* C418 80146010 FF002231 */   andi      $v0, $t1, 0xFF
    /* C41C 80146014 D8FF6324 */  addiu      $v1, $v1, -0x28
    /* C420 80146018 FFFF1026 */  addiu      $s0, $s0, -0x1
  .L8014601C:
    /* C424 8014601C 03004010 */  beqz       $v0, .L8014602C
    /* C428 80146020 21107300 */   addu      $v0, $v1, $s3
    /* C42C 80146024 28008424 */  addiu      $a0, $a0, 0x28
    /* C430 80146028 01005226 */  addiu      $s2, $s2, 0x1
  .L8014602C:
    /* C434 8014602C 00004290 */  lbu        $v0, 0x0($v0)
    /* C438 80146030 00000000 */  nop
    /* C43C 80146034 02004A10 */  beq        $v0, $t2, .L80146040
    /* C440 80146038 21109300 */   addu      $v0, $a0, $s3
    /* C444 8014603C 21B80000 */  addu       $s7, $zero, $zero
  .L80146040:
    /* C448 80146040 00004290 */  lbu        $v0, 0x0($v0)
    /* C44C 80146044 00000000 */  nop
    /* C450 80146048 02004A10 */  beq        $v0, $t2, .L80146054
    /* C454 8014604C FF00E232 */   andi      $v0, $s7, 0xFF
    /* C458 80146050 21480000 */  addu       $t1, $zero, $zero
  .L80146054:
    /* C45C 80146054 E1FF4014 */  bnez       $v0, .L80145FDC
    /* C460 80146058 FF002231 */   andi      $v0, $t1, 0xFF
    /* C464 8014605C DFFF4014 */  bnez       $v0, .L80145FDC
    /* C468 80146060 00000000 */   nop
    /* C46C 80146064 02001026 */  addiu      $s0, $s0, 0x2
    /* C470 80146068 FEFF5226 */  addiu      $s2, $s2, -0x2
    /* C474 8014606C 23105002 */  subu       $v0, $s2, $s0
    /* C478 80146070 06004228 */  slti       $v0, $v0, 0x6
    /* C47C 80146074 86004014 */  bnez       $v0, .L80146290
    /* C480 80146078 FF000231 */   andi      $v0, $t0, 0xFF
    /* C484 8014607C 20004010 */  beqz       $v0, .L80146100
    /* C488 80146080 2A285002 */   slt       $a1, $s2, $s0
  .L80146084:
    /* C48C 80146084 27000B24 */  addiu      $t3, $zero, 0x27
    /* C490 80146088 02006B16 */  bne        $s3, $t3, .L80146094
    /* C494 8014608C 23107102 */   subu      $v0, $s3, $s1
    /* C498 80146090 21400000 */  addu       $t0, $zero, $zero
  .L80146094:
    /* C49C 80146094 0C004228 */  slti       $v0, $v0, 0xC
    /* C4A0 80146098 02004014 */  bnez       $v0, .L801460A4
    /* C4A4 8014609C 00000000 */   nop
    /* C4A8 801460A0 21400000 */  addu       $t0, $zero, $zero
  .L801460A4:
    /* C4AC 801460A4 1100A014 */  bnez       $a1, .L801460EC
    /* C4B0 801460A8 21200002 */   addu      $a0, $s0, $zero
    /* C4B4 801460AC 80101000 */  sll        $v0, $s0, 2
    /* C4B8 801460B0 21105000 */  addu       $v0, $v0, $s0
    /* C4BC 801460B4 C0100200 */  sll        $v0, $v0, 3
    /* C4C0 801460B8 14800B3C */  lui        $t3, %hi(predungeon)
    /* C4C4 801460BC C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C4C8 801460C0 21184B00 */  addu       $v1, $v0, $t3
  .L801460C4:
    /* C4CC 801460C4 21107300 */  addu       $v0, $v1, $s3
    /* C4D0 801460C8 00004290 */  lbu        $v0, 0x0($v0)
    /* C4D4 801460CC 00000000 */  nop
    /* C4D8 801460D0 02004A10 */  beq        $v0, $t2, .L801460DC
    /* C4DC 801460D4 00000000 */   nop
    /* C4E0 801460D8 21400000 */  addu       $t0, $zero, $zero
  .L801460DC:
    /* C4E4 801460DC 01008424 */  addiu      $a0, $a0, 0x1
    /* C4E8 801460E0 2A104402 */  slt        $v0, $s2, $a0
    /* C4EC 801460E4 F7FF4010 */  beqz       $v0, .L801460C4
    /* C4F0 801460E8 28006324 */   addiu     $v1, $v1, 0x28
  .L801460EC:
    /* C4F4 801460EC FF000231 */  andi       $v0, $t0, 0xFF
    /* C4F8 801460F0 03004010 */  beqz       $v0, .L80146100
    /* C4FC 801460F4 00000000 */   nop
    /* C500 801460F8 21180508 */  j          .L80146084
    /* C504 801460FC 01007326 */   addiu     $s3, $s3, 0x1
  .L80146100:
    /* C508 80146100 95180508 */  j          .L80146254
    /* C50C 80146104 FEFF7326 */   addiu     $s3, $s3, -0x2
  .L80146108:
    /* C510 80146108 61008016 */  bnez       $s4, .L80146290
    /* C514 8014610C 21105200 */   addu      $v0, $v0, $s2
    /* C518 80146110 C0100200 */  sll        $v0, $v0, 3
    /* C51C 80146114 14800B3C */  lui        $t3, %hi(predungeon)
    /* C520 80146118 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C524 8014611C 21204B00 */  addu       $a0, $v0, $t3
    /* C528 80146120 80101000 */  sll        $v0, $s0, 2
    /* C52C 80146124 21105000 */  addu       $v0, $v0, $s0
    /* C530 80146128 C0100200 */  sll        $v0, $v0, 3
    /* C534 8014612C 21184B00 */  addu       $v1, $v0, $t3
  .L80146130:
    /* C538 80146130 02000016 */  bnez       $s0, .L8014613C
    /* C53C 80146134 27000B24 */   addiu     $t3, $zero, 0x27
    /* C540 80146138 21B80000 */  addu       $s7, $zero, $zero
  .L8014613C:
    /* C544 8014613C 02004B16 */  bne        $s2, $t3, .L80146148
    /* C548 80146140 23105002 */   subu      $v0, $s2, $s0
    /* C54C 80146144 21480000 */  addu       $t1, $zero, $zero
  .L80146148:
    /* C550 80146148 0E004228 */  slti       $v0, $v0, 0xE
    /* C554 8014614C 04004014 */  bnez       $v0, .L80146160
    /* C558 80146150 FF00E232 */   andi      $v0, $s7, 0xFF
    /* C55C 80146154 21B80000 */  addu       $s7, $zero, $zero
    /* C560 80146158 21480000 */  addu       $t1, $zero, $zero
    /* C564 8014615C FF00E232 */  andi       $v0, $s7, 0xFF
  .L80146160:
    /* C568 80146160 03004010 */  beqz       $v0, .L80146170
    /* C56C 80146164 FF002231 */   andi      $v0, $t1, 0xFF
    /* C570 80146168 D8FF6324 */  addiu      $v1, $v1, -0x28
    /* C574 8014616C FFFF1026 */  addiu      $s0, $s0, -0x1
  .L80146170:
    /* C578 80146170 03004010 */  beqz       $v0, .L80146180
    /* C57C 80146174 21107100 */   addu      $v0, $v1, $s1
    /* C580 80146178 28008424 */  addiu      $a0, $a0, 0x28
    /* C584 8014617C 01005226 */  addiu      $s2, $s2, 0x1
  .L80146180:
    /* C588 80146180 00004290 */  lbu        $v0, 0x0($v0)
    /* C58C 80146184 00000000 */  nop
    /* C590 80146188 02004A10 */  beq        $v0, $t2, .L80146194
    /* C594 8014618C 21109100 */   addu      $v0, $a0, $s1
    /* C598 80146190 21B80000 */  addu       $s7, $zero, $zero
  .L80146194:
    /* C59C 80146194 00004290 */  lbu        $v0, 0x0($v0)
    /* C5A0 80146198 00000000 */  nop
    /* C5A4 8014619C 02004A10 */  beq        $v0, $t2, .L801461A8
    /* C5A8 801461A0 FF00E232 */   andi      $v0, $s7, 0xFF
    /* C5AC 801461A4 21480000 */  addu       $t1, $zero, $zero
  .L801461A8:
    /* C5B0 801461A8 E1FF4014 */  bnez       $v0, .L80146130
    /* C5B4 801461AC FF002231 */   andi      $v0, $t1, 0xFF
    /* C5B8 801461B0 DFFF4014 */  bnez       $v0, .L80146130
    /* C5BC 801461B4 00000000 */   nop
    /* C5C0 801461B8 02001026 */  addiu      $s0, $s0, 0x2
    /* C5C4 801461BC FEFF5226 */  addiu      $s2, $s2, -0x2
    /* C5C8 801461C0 23105002 */  subu       $v0, $s2, $s0
    /* C5CC 801461C4 06004228 */  slti       $v0, $v0, 0x6
    /* C5D0 801461C8 31004014 */  bnez       $v0, .L80146290
    /* C5D4 801461CC FF00C233 */   andi      $v0, $fp, 0xFF
    /* C5D8 801461D0 1F004010 */  beqz       $v0, .L80146250
    /* C5DC 801461D4 2A285002 */   slt       $a1, $s2, $s0
  .L801461D8:
    /* C5E0 801461D8 02002016 */  bnez       $s1, .L801461E4
    /* C5E4 801461DC 23107102 */   subu      $v0, $s3, $s1
    /* C5E8 801461E0 21F00000 */  addu       $fp, $zero, $zero
  .L801461E4:
    /* C5EC 801461E4 0C004228 */  slti       $v0, $v0, 0xC
    /* C5F0 801461E8 02004014 */  bnez       $v0, .L801461F4
    /* C5F4 801461EC 00000000 */   nop
    /* C5F8 801461F0 21F00000 */  addu       $fp, $zero, $zero
  .L801461F4:
    /* C5FC 801461F4 1100A014 */  bnez       $a1, .L8014623C
    /* C600 801461F8 21200002 */   addu      $a0, $s0, $zero
    /* C604 801461FC 80101000 */  sll        $v0, $s0, 2
    /* C608 80146200 21105000 */  addu       $v0, $v0, $s0
    /* C60C 80146204 C0100200 */  sll        $v0, $v0, 3
    /* C610 80146208 14800B3C */  lui        $t3, %hi(predungeon)
    /* C614 8014620C C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* C618 80146210 21184B00 */  addu       $v1, $v0, $t3
  .L80146214:
    /* C61C 80146214 21107100 */  addu       $v0, $v1, $s1
    /* C620 80146218 00004290 */  lbu        $v0, 0x0($v0)
    /* C624 8014621C 00000000 */  nop
    /* C628 80146220 02004A10 */  beq        $v0, $t2, .L8014622C
    /* C62C 80146224 00000000 */   nop
    /* C630 80146228 21F00000 */  addu       $fp, $zero, $zero
  .L8014622C:
    /* C634 8014622C 01008424 */  addiu      $a0, $a0, 0x1
    /* C638 80146230 2A104402 */  slt        $v0, $s2, $a0
    /* C63C 80146234 F7FF4010 */  beqz       $v0, .L80146214
    /* C640 80146238 28006324 */   addiu     $v1, $v1, 0x28
  .L8014623C:
    /* C644 8014623C FF00C233 */  andi       $v0, $fp, 0xFF
    /* C648 80146240 03004010 */  beqz       $v0, .L80146250
    /* C64C 80146244 00000000 */   nop
    /* C650 80146248 76180508 */  j          .L801461D8
    /* C654 8014624C FFFF3126 */   addiu     $s1, $s1, -0x1
  .L80146250:
    /* C658 80146250 02003126 */  addiu      $s1, $s1, 0x2
  .L80146254:
    /* C65C 80146254 23107102 */  subu       $v0, $s3, $s1
  .L80146258:
    /* C660 80146258 06004228 */  slti       $v0, $v0, 0x6
    /* C664 8014625C 0C004014 */  bnez       $v0, .L80146290
    /* C668 80146260 21200002 */   addu      $a0, $s0, $zero
    /* C66C 80146264 21282002 */  addu       $a1, $s1, $zero
    /* C670 80146268 21304002 */  addu       $a2, $s2, $zero
    /* C674 8014626C 21386002 */  addu       $a3, $s3, $zero
    /* C678 80146270 A515050C */  jal        DL2_DrawRoom__Fiiii
    /* C67C 80146274 2400AAAF */   sw        $t2, 0x24($sp)
    /* C680 80146278 21200002 */  addu       $a0, $s0, $zero
    /* C684 8014627C 21282002 */  addu       $a1, $s1, $zero
    /* C688 80146280 21304002 */  addu       $a2, $s2, $zero
    /* C68C 80146284 E615050C */  jal        DL2_KnockWalls__Fiiii
    /* C690 80146288 21386002 */   addu      $a3, $s3, $zero
    /* C694 8014628C 2400AA8F */  lw         $t2, 0x24($sp)
  .L80146290:
    /* C698 80146290 1000AB8F */  lw         $t3, 0x10($sp)
    /* C69C 80146294 00000000 */  nop
    /* C6A0 80146298 01006B25 */  addiu      $t3, $t3, 0x1
    /* C6A4 8014629C 67160508 */  j          .L8014599C
    /* C6A8 801462A0 1000ABAF */   sw        $t3, 0x10($sp)
  .L801462A4:
    /* C6AC 801462A4 8E15050C */  jal        DL2_NumNoChar__Fv
    /* C6B0 801462A8 00000000 */   nop
    /* C6B4 801462AC BD024228 */  slti       $v0, $v0, 0x2BD
    /* C6B8 801462B0 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* C6BC 801462B4 4800BE8F */  lw         $fp, 0x48($sp)
    /* C6C0 801462B8 4400B78F */  lw         $s7, 0x44($sp)
    /* C6C4 801462BC 4000B68F */  lw         $s6, 0x40($sp)
    /* C6C8 801462C0 3C00B58F */  lw         $s5, 0x3C($sp)
    /* C6CC 801462C4 3800B48F */  lw         $s4, 0x38($sp)
    /* C6D0 801462C8 3400B38F */  lw         $s3, 0x34($sp)
    /* C6D4 801462CC 3000B28F */  lw         $s2, 0x30($sp)
    /* C6D8 801462D0 2C00B18F */  lw         $s1, 0x2C($sp)
    /* C6DC 801462D4 2800B08F */  lw         $s0, 0x28($sp)
    /* C6E0 801462D8 5000BD27 */  addiu      $sp, $sp, 0x50
    /* C6E4 801462DC 0800E003 */  jr         $ra
    /* C6E8 801462E0 00000000 */   nop
endlabel DL2_FillVoids__Fv
