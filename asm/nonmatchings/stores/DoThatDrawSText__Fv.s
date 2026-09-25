.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoThatDrawSText__Fv, 0x208

glabel DoThatDrawSText__Fv
    /* 5FEAC 8006FEAC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5FEB0 8006FEB0 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5FEB4 8006FEB4 14000524 */  addiu      $a1, $zero, 0x14
    /* 5FEB8 8006FEB8 18000324 */  addiu      $v1, $zero, 0x18
    /* 5FEBC 8006FEBC 18010224 */  addiu      $v0, $zero, 0x118
    /* 5FEC0 8006FEC0 362183A7 */  sh         $v1, %gp_rel(D_8011C8B6)($gp)
    /* 5FEC4 8006FEC4 3E2183A7 */  sh         $v1, %gp_rel(D_8011C8BE)($gp)
    /* 5FEC8 8006FEC8 62138393 */  lbu        $v1, %gp_rel(stextscrl)($gp)
    /* 5FECC 8006FECC C9000424 */  addiu      $a0, $zero, 0xC9
    /* 5FED0 8006FED0 382182A7 */  sh         $v0, %gp_rel(D_8011C8B8)($gp)
    /* 5FED4 8006FED4 BC000224 */  addiu      $v0, $zero, 0xBC
    /* 5FED8 8006FED8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 5FEDC 8006FEDC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5FEE0 8006FEE0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5FEE4 8006FEE4 342185A7 */  sh         $a1, %gp_rel(D_8011C8B4)($gp)
    /* 5FEE8 8006FEE8 3A2184A7 */  sh         $a0, %gp_rel(D_8011C8BA)($gp)
    /* 5FEEC 8006FEEC 3C2185A7 */  sh         $a1, %gp_rel(D_8011C8BC)($gp)
    /* 5FEF0 8006FEF0 402182A7 */  sh         $v0, %gp_rel(D_8011C8C0)($gp)
    /* 5FEF4 8006FEF4 422184A7 */  sh         $a0, %gp_rel(D_8011C8C2)($gp)
    /* 5FEF8 8006FEF8 2B006010 */  beqz       $v1, .L8006FFA8
    /* 5FEFC 8006FEFC 21900000 */   addu      $s2, $zero, $zero
    /* 5FF00 8006FF00 60138293 */  lbu        $v0, %gp_rel(stextflag)($gp)
    /* 5FF04 8006FF04 00000000 */  nop
    /* 5FF08 8006FF08 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 5FF0C 8006FF0C 00160200 */  sll        $v0, $v0, 24
    /* 5FF10 8006FF10 031E0200 */  sra        $v1, $v0, 24
    /* 5FF14 8006FF14 1100622C */  sltiu      $v0, $v1, 0x11
    /* 5FF18 8006FF18 23004010 */  beqz       $v0, .L8006FFA8
    /* 5FF1C 8006FF1C 80100300 */   sll       $v0, $v1, 2
    /* 5FF20 8006FF20 1180013C */  lui        $at, %hi(jtbl_80117A88)
    /* 5FF24 8006FF24 21082200 */  addu       $at, $at, $v0
    /* 5FF28 8006FF28 887A228C */  lw         $v0, %lo(jtbl_80117A88)($at)
    /* 5FF2C 8006FF2C 00000000 */  nop
    /* 5FF30 8006FF30 08004000 */  jr         $v0
    /* 5FF34 8006FF34 00000000 */   nop
  jlabel .L8006FF38
    /* 5FF38 8006FF38 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5FF3C 8006FF3C F6AA010C */  jal        S_ScrollSBuy__Fi
    /* 5FF40 8006FF40 21880000 */   addu      $s1, $zero, $zero
    /* 5FF44 8006FF44 ECBF0108 */  j          .L8006FFB0
    /* 5FF48 8006FF48 C0101100 */   sll       $v0, $s1, 3
  jlabel .L8006FF4C
    /* 5FF4C 8006FF4C 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5FF50 8006FF50 ECAB010C */  jal        S_ScrollSPBuy__Fi
    /* 5FF54 8006FF54 21880000 */   addu      $s1, $zero, $zero
    /* 5FF58 8006FF58 ECBF0108 */  j          .L8006FFB0
    /* 5FF5C 8006FF5C C0101100 */   sll       $v0, $s1, 3
  jlabel .L8006FF60
    /* 5FF60 8006FF60 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5FF64 8006FF64 2EAD010C */  jal        S_ScrollSSell__Fi
    /* 5FF68 8006FF68 21880000 */   addu      $s1, $zero, $zero
    /* 5FF6C 8006FF6C ECBF0108 */  j          .L8006FFB0
    /* 5FF70 8006FF70 C0101100 */   sll       $v0, $s1, 3
  jlabel .L8006FF74
    /* 5FF74 8006FF74 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5FF78 8006FF78 1421838F */  lw         $v1, %gp_rel(D_8011C894)($gp)
    /* 5FF7C 8006FF7C 80100200 */  sll        $v0, $v0, 2
    /* 5FF80 8006FF80 1280013C */  lui        $at, %hi(_WitchIdxOfs)
    /* 5FF84 8006FF84 21082200 */  addu       $at, $at, $v0
    /* 5FF88 8006FF88 D0BA248C */  lw         $a0, %lo(_WitchIdxOfs)($at)
    /* 5FF8C 8006FF8C 34B1010C */  jal        S_ScrollWBuy__Fi
    /* 5FF90 8006FF90 21206400 */   addu      $a0, $v1, $a0
    /* 5FF94 8006FF94 EBBF0108 */  j          .L8006FFAC
    /* 5FF98 8006FF98 21880000 */   addu      $s1, $zero, $zero
  jlabel .L8006FF9C
    /* 5FF9C 8006FF9C 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5FFA0 8006FFA0 C1B8010C */  jal        S_ScrollHBuy__Fi
    /* 5FFA4 8006FFA4 00000000 */   nop
  jlabel .L8006FFA8
    /* 5FFA8 8006FFA8 21880000 */  addu       $s1, $zero, $zero
  .L8006FFAC:
    /* 5FFAC 8006FFAC C0101100 */  sll        $v0, $s1, 3
  .L8006FFB0:
    /* 5FFB0 8006FFB0 21105100 */  addu       $v0, $v0, $s1
    /* 5FFB4 8006FFB4 80100200 */  sll        $v0, $v0, 2
    /* 5FFB8 8006FFB8 23105100 */  subu       $v0, $v0, $s1
    /* 5FFBC 8006FFBC 80800200 */  sll        $s0, $v0, 2
    /* 5FFC0 8006FFC0 1380013C */  lui        $at, %hi(D_8012EECC)
    /* 5FFC4 8006FFC4 21083000 */  addu       $at, $at, $s0
    /* 5FFC8 8006FFC8 CCEE2290 */  lbu        $v0, %lo(D_8012EECC)($at)
    /* 5FFCC 8006FFCC 00000000 */  nop
    /* 5FFD0 8006FFD0 03004010 */  beqz       $v0, .L8006FFE0
    /* 5FFD4 8006FFD4 00000000 */   nop
    /* 5FFD8 8006FFD8 11A7010C */  jal        DrawSLine__Fi
    /* 5FFDC 8006FFDC 21202002 */   addu      $a0, $s1, $zero
  .L8006FFE0:
    /* 5FFE0 8006FFE0 1380013C */  lui        $at, %hi(D_8012EE4A)
    /* 5FFE4 8006FFE4 21083000 */  addu       $at, $at, $s0
    /* 5FFE8 8006FFE8 4AEE2280 */  lb         $v0, %lo(D_8012EE4A)($at)
    /* 5FFEC 8006FFEC 00000000 */  nop
    /* 5FFF0 8006FFF0 13004010 */  beqz       $v0, .L80070040
    /* 5FFF4 8006FFF4 21283202 */   addu      $a1, $s1, $s2
    /* 5FFF8 8006FFF8 1380073C */  lui        $a3, %hi(D_8012EE4A)
    /* 5FFFC 8006FFFC 4AEEE724 */  addiu      $a3, $a3, %lo(D_8012EE4A)
    /* 60000 80070000 1380013C */  lui        $at, %hi(D_8012EECB)
    /* 60004 80070004 21083000 */  addu       $at, $at, $s0
    /* 60008 80070008 CBEE2280 */  lb         $v0, %lo(D_8012EECB)($at)
    /* 6000C 8007000C 1380013C */  lui        $at, %hi(D_8012EE48)
    /* 60010 80070010 21083000 */  addu       $at, $at, $s0
    /* 60014 80070014 48EE2480 */  lb         $a0, %lo(D_8012EE48)($at)
    /* 60018 80070018 1380013C */  lui        $at, %hi(D_8012EECA)
    /* 6001C 8007001C 21083000 */  addu       $at, $at, $s0
    /* 60020 80070020 CAEE2690 */  lbu        $a2, %lo(D_8012EECA)($at)
    /* 60024 80070024 1000A2AF */  sw         $v0, 0x10($sp)
    /* 60028 80070028 1380013C */  lui        $at, %hi(D_8012EED0)
    /* 6002C 8007002C 21083000 */  addu       $at, $at, $s0
    /* 60030 80070030 D0EE228C */  lw         $v0, %lo(D_8012EED0)($at)
    /* 60034 80070034 21380702 */  addu       $a3, $s0, $a3
    /* 60038 80070038 E7A5010C */  jal        PrintSString__FiiUcPcci
    /* 6003C 8007003C 1400A2AF */   sw        $v0, 0x14($sp)
  .L80070040:
    /* 60040 80070040 01002426 */  addiu      $a0, $s1, 0x1
    /* 60044 80070044 C0100400 */  sll        $v0, $a0, 3
    /* 60048 80070048 21104400 */  addu       $v0, $v0, $a0
    /* 6004C 8007004C 80100200 */  sll        $v0, $v0, 2
    /* 60050 80070050 23104400 */  subu       $v0, $v0, $a0
    /* 60054 80070054 80100200 */  sll        $v0, $v0, 2
    /* 60058 80070058 1380013C */  lui        $at, %hi(D_8012EED0)
    /* 6005C 8007005C 21082200 */  addu       $at, $at, $v0
    /* 60060 80070060 D0EE228C */  lw         $v0, %lo(D_8012EED0)($at)
    /* 60064 80070064 00000000 */  nop
    /* 60068 80070068 02004018 */  blez       $v0, .L80070074
    /* 6006C 8007006C 21888000 */   addu      $s1, $a0, $zero
    /* 60070 80070070 21900000 */  addu       $s2, $zero, $zero
  .L80070074:
    /* 60074 80070074 1800222A */  slti       $v0, $s1, 0x18
    /* 60078 80070078 CDFF4014 */  bnez       $v0, .L8006FFB0
    /* 6007C 8007007C C0101100 */   sll       $v0, $s1, 3
    /* 60080 80070080 B337010C */  jal        DrawQTextBack__Fv
    /* 60084 80070084 00000000 */   nop
    /* 60088 80070088 87A5010C */  jal        DrawStoreArrows__Fv
    /* 6008C 8007008C 00000000 */   nop
    /* 60090 80070090 32BF010C */  jal        DrawStoreHelpText__Fv
    /* 60094 80070094 00000000 */   nop
    /* 60098 80070098 2400BF8F */  lw         $ra, 0x24($sp)
    /* 6009C 8007009C 2000B28F */  lw         $s2, 0x20($sp)
    /* 600A0 800700A0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 600A4 800700A4 1800B08F */  lw         $s0, 0x18($sp)
    /* 600A8 800700A8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 600AC 800700AC 0800E003 */  jr         $ra
    /* 600B0 800700B0 00000000 */   nop
endlabel DoThatDrawSText__Fv
