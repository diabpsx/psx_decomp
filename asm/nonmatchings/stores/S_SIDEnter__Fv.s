.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_SIDEnter__Fv, 0x184

glabel S_SIDEnter__Fv
    /* 63B84 80073B84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 63B88 80073B88 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63B8C 80073B8C 16000224 */  addiu      $v0, $zero, 0x16
    /* 63B90 80073B90 07006214 */  bne        $v1, $v0, .L80073BB0
    /* 63B94 80073B94 1000BFAF */   sw        $ra, 0x10($sp)
    /* 63B98 80073B98 5BBE010C */  jal        StartStore__Fc
    /* 63B9C 80073B9C 0F000424 */   addiu     $a0, $zero, 0xF
    /* 63BA0 80073BA0 0E000224 */  addiu      $v0, $zero, 0xE
    /* 63BA4 80073BA4 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 63BA8 80073BA8 3ECF0108 */  j          .L80073CF8
    /* 63BAC 80073BAC 00000000 */   nop
  .L80073BB0:
    /* 63BB0 80073BB0 11000224 */  addiu      $v0, $zero, 0x11
    /* 63BB4 80073BB4 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 63BB8 80073BB8 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 63BBC 80073BBC 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 63BC0 80073BC0 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 63BC4 80073BC4 23106200 */  subu       $v0, $v1, $v0
    /* 63BC8 80073BC8 102184AF */  sw         $a0, %gp_rel(D_8011C890)($gp)
    /* 63BCC 80073BCC 02004104 */  bgez       $v0, .L80073BD8
    /* 63BD0 80073BD0 00000000 */   nop
    /* 63BD4 80073BD4 07004224 */  addiu      $v0, $v0, 0x7
  .L80073BD8:
    /* 63BD8 80073BD8 C3100200 */  sra        $v0, $v0, 3
    /* 63BDC 80073BDC 21404400 */  addu       $t0, $v0, $a0
    /* 63BE0 80073BE0 0E80033C */  lui        $v1, %hi(storehold)
    /* 63BE4 80073BE4 881D6324 */  addiu      $v1, $v1, %lo(storehold)
    /* 63BE8 80073BE8 C0100800 */  sll        $v0, $t0, 3
    /* 63BEC 80073BEC 23104800 */  subu       $v0, $v0, $t0
    /* 63BF0 80073BF0 80100200 */  sll        $v0, $v0, 2
    /* 63BF4 80073BF4 23104800 */  subu       $v0, $v0, $t0
    /* 63BF8 80073BF8 80100200 */  sll        $v0, $v0, 2
    /* 63BFC 80073BFC 21384300 */  addu       $a3, $v0, $v1
    /* 63C00 80073C00 1280033C */  lui        $v1, %hi(myplr)
    /* 63C04 80073C04 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 63C08 80073C08 6000E924 */  addiu      $t1, $a3, 0x60
    /* 63C0C 80073C0C 40100300 */  sll        $v0, $v1, 1
    /* 63C10 80073C10 21104300 */  addu       $v0, $v0, $v1
    /* 63C14 80073C14 80100200 */  sll        $v0, $v0, 2
    /* 63C18 80073C18 21104300 */  addu       $v0, $v0, $v1
    /* 63C1C 80073C1C 00110200 */  sll        $v0, $v0, 4
    /* 63C20 80073C20 23104300 */  subu       $v0, $v0, $v1
    /* 63C24 80073C24 80100200 */  sll        $v0, $v0, 2
    /* 63C28 80073C28 21104300 */  addu       $v0, $v0, $v1
    /* 63C2C 80073C2C C0100200 */  sll        $v0, $v0, 3
    /* 63C30 80073C30 0E80033C */  lui        $v1, %hi(plr + 0x1910)
    /* 63C34 80073C34 48BE6324 */  addiu      $v1, $v1, %lo(plr + 0x1910)
    /* 63C38 80073C38 21304300 */  addu       $a2, $v0, $v1
  .L80073C3C:
    /* 63C3C 80073C3C 0000E28C */  lw         $v0, 0x0($a3)
    /* 63C40 80073C40 0400E38C */  lw         $v1, 0x4($a3)
    /* 63C44 80073C44 0800E48C */  lw         $a0, 0x8($a3)
    /* 63C48 80073C48 0C00E58C */  lw         $a1, 0xC($a3)
    /* 63C4C 80073C4C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 63C50 80073C50 0400C3AC */  sw         $v1, 0x4($a2)
    /* 63C54 80073C54 0800C4AC */  sw         $a0, 0x8($a2)
    /* 63C58 80073C58 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 63C5C 80073C5C 1000E724 */  addiu      $a3, $a3, 0x10
    /* 63C60 80073C60 F6FFE914 */  bne        $a3, $t1, .L80073C3C
    /* 63C64 80073C64 1000C624 */   addiu     $a2, $a2, 0x10
    /* 63C68 80073C68 0000E28C */  lw         $v0, 0x0($a3)
    /* 63C6C 80073C6C 0400E38C */  lw         $v1, 0x4($a3)
    /* 63C70 80073C70 0800E48C */  lw         $a0, 0x8($a3)
    /* 63C74 80073C74 0000C2AC */  sw         $v0, 0x0($a2)
    /* 63C78 80073C78 0400C3AC */  sw         $v1, 0x4($a2)
    /* 63C7C 80073C7C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 63C80 80073C80 1280033C */  lui        $v1, %hi(myplr)
    /* 63C84 80073C84 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 63C88 80073C88 00000000 */  nop
    /* 63C8C 80073C8C 40100300 */  sll        $v0, $v1, 1
    /* 63C90 80073C90 21104300 */  addu       $v0, $v0, $v1
    /* 63C94 80073C94 80100200 */  sll        $v0, $v0, 2
    /* 63C98 80073C98 21104300 */  addu       $v0, $v0, $v1
    /* 63C9C 80073C9C 00110200 */  sll        $v0, $v0, 4
    /* 63CA0 80073CA0 23104300 */  subu       $v0, $v0, $v1
    /* 63CA4 80073CA4 80100200 */  sll        $v0, $v0, 2
    /* 63CA8 80073CA8 21104300 */  addu       $v0, $v0, $v1
    /* 63CAC 80073CAC C0100200 */  sll        $v0, $v0, 3
    /* 63CB0 80073CB0 C0180800 */  sll        $v1, $t0, 3
    /* 63CB4 80073CB4 23186800 */  subu       $v1, $v1, $t0
    /* 63CB8 80073CB8 80180300 */  sll        $v1, $v1, 2
    /* 63CBC 80073CBC 23186800 */  subu       $v1, $v1, $t0
    /* 63CC0 80073CC0 80180300 */  sll        $v1, $v1, 2
    /* 63CC4 80073CC4 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 63CC8 80073CC8 21082200 */  addu       $at, $at, $v0
    /* 63CCC 80073CCC 88A6228C */  lw         $v0, %lo(plr + 0x150)($at)
    /* 63CD0 80073CD0 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 63CD4 80073CD4 21082300 */  addu       $at, $at, $v1
    /* 63CD8 80073CD8 A01D238C */  lw         $v1, %lo(storehold + 0x18)($at)
    /* 63CDC 80073CDC 681388AF */  sw         $t0, %gp_rel(SellIdx)($gp)
    /* 63CE0 80073CE0 2A104300 */  slt        $v0, $v0, $v1
    /* 63CE4 80073CE4 02004010 */  beqz       $v0, .L80073CF0
    /* 63CE8 80073CE8 0B000424 */   addiu     $a0, $zero, 0xB
    /* 63CEC 80073CEC 09000424 */  addiu      $a0, $zero, 0x9
  .L80073CF0:
    /* 63CF0 80073CF0 5BBE010C */  jal        StartStore__Fc
    /* 63CF4 80073CF4 00000000 */   nop
  .L80073CF8:
    /* 63CF8 80073CF8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 63CFC 80073CFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 63D00 80073D00 0800E003 */  jr         $ra
    /* 63D04 80073D04 00000000 */   nop
endlabel S_SIDEnter__Fv
