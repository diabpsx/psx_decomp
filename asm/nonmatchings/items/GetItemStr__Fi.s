.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetItemStr__Fi, 0x1A8

glabel GetItemStr__Fi
    /* 35B78 80045B78 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 35B7C 80045B7C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 35B80 80045B80 21808000 */  addu       $s0, $a0, $zero
    /* 35B84 80045B84 C0101000 */  sll        $v0, $s0, 3
    /* 35B88 80045B88 23105000 */  subu       $v0, $v0, $s0
    /* 35B8C 80045B8C 80100200 */  sll        $v0, $v0, 2
    /* 35B90 80045B90 23105000 */  subu       $v0, $v0, $s0
    /* 35B94 80045B94 80280200 */  sll        $a1, $v0, 2
    /* 35B98 80045B98 2000BFAF */  sw         $ra, 0x20($sp)
    /* 35B9C 80045B9C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 35BA0 80045BA0 0D80013C */  lui        $at, %hi(item + 0x2C)
    /* 35BA4 80045BA4 21082500 */  addu       $at, $at, $a1
    /* 35BA8 80045BA8 801D2384 */  lh         $v1, %lo(item + 0x2C)($at)
    /* 35BAC 80045BAC 0B000224 */  addiu      $v0, $zero, 0xB
    /* 35BB0 80045BB0 15006214 */  bne        $v1, $v0, .L80045C08
    /* 35BB4 80045BB4 00000000 */   nop
    /* 35BB8 80045BB8 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 35BBC 80045BBC 21082500 */  addu       $at, $at, $a1
    /* 35BC0 80045BC0 681D318C */  lw         $s1, %lo(item + 0x14)($at)
    /* 35BC4 80045BC4 4AED010C */  jal        GetStr__Fi
    /* 35BC8 80045BC8 FF040424 */   addiu     $a0, $zero, 0x4FF
    /* 35BCC 80045BCC 21804000 */  addu       $s0, $v0, $zero
    /* 35BD0 80045BD0 47DD000C */  jal        get_pieces_str__Fi
    /* 35BD4 80045BD4 21202002 */   addu      $a0, $s1, $zero
    /* 35BD8 80045BD8 21280002 */  addu       $a1, $s0, $zero
    /* 35BDC 80045BDC 21302002 */  addu       $a2, $s1, $zero
    /* 35BE0 80045BE0 0D80033C */  lui        $v1, %hi(_infostr)
    /* 35BE4 80045BE4 10E86324 */  addiu      $v1, $v1, %lo(_infostr)
    /* 35BE8 80045BE8 1280043C */  lui        $a0, %hi(sel_data)
    /* 35BEC 80045BEC 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 35BF0 80045BF0 21384000 */  addu       $a3, $v0, $zero
    /* 35BF4 80045BF4 00220400 */  sll        $a0, $a0, 8
    /* 35BF8 80045BF8 9767000C */  jal        sprintf
    /* 35BFC 80045BFC 21208300 */   addu      $a0, $a0, $v1
    /* 35C00 80045C00 42170108 */  j          .L80045D08
    /* 35C04 80045C04 00000000 */   nop
  .L80045C08:
    /* 35C08 80045C08 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 35C0C 80045C0C 21082500 */  addu       $at, $at, $a1
    /* 35C10 80045C10 BD1D2280 */  lb         $v0, %lo(item + 0x69)($at)
    /* 35C14 80045C14 00000000 */  nop
    /* 35C18 80045C18 09004010 */  beqz       $v0, .L80045C40
    /* 35C1C 80045C1C 00000000 */   nop
    /* 35C20 80045C20 0D80043C */  lui        $a0, %hi(item)
    /* 35C24 80045C24 541D8424 */  addiu      $a0, $a0, %lo(item)
    /* 35C28 80045C28 2120A400 */  addu       $a0, $a1, $a0
    /* 35C2C 80045C2C 0D80013C */  lui        $at, %hi(item + 0x28)
    /* 35C30 80045C30 21082500 */  addu       $at, $at, $a1
    /* 35C34 80045C34 7C1D2594 */  lhu        $a1, %lo(item + 0x28)($at)
    /* 35C38 80045C38 16170108 */  j          .L80045C58
    /* 35C3C 80045C3C 00000000 */   nop
  .L80045C40:
    /* 35C40 80045C40 0D80043C */  lui        $a0, %hi(item)
    /* 35C44 80045C44 541D8424 */  addiu      $a0, $a0, %lo(item)
    /* 35C48 80045C48 2120A400 */  addu       $a0, $a1, $a0
    /* 35C4C 80045C4C 0D80013C */  lui        $at, %hi(item + 0x26)
    /* 35C50 80045C50 21082500 */  addu       $at, $at, $a1
    /* 35C54 80045C54 7A1D2594 */  lhu        $a1, %lo(item + 0x26)($at)
  .L80045C58:
    /* 35C58 80045C58 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 35C5C 80045C5C 00010624 */   addiu     $a2, $zero, 0x100
    /* 35C60 80045C60 21284000 */  addu       $a1, $v0, $zero
    /* 35C64 80045C64 1280043C */  lui        $a0, %hi(sel_data)
    /* 35C68 80045C68 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 35C6C 80045C6C 0D80023C */  lui        $v0, %hi(_infostr)
    /* 35C70 80045C70 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 35C74 80045C74 00220400 */  sll        $a0, $a0, 8
    /* 35C78 80045C78 F240000C */  jal        strcpy
    /* 35C7C 80045C7C 21208200 */   addu      $a0, $a0, $v0
    /* 35C80 80045C80 1280023C */  lui        $v0, %hi(sel_data)
    /* 35C84 80045C84 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 35C88 80045C88 1280043C */  lui        $a0, %hi(_infoclr)
    /* 35C8C 80045C8C BCB68424 */  addiu      $a0, $a0, %lo(_infoclr)
    /* 35C90 80045C90 1280013C */  lui        $at, %hi(_infoclr)
    /* 35C94 80045C94 21082200 */  addu       $at, $at, $v0
    /* 35C98 80045C98 BCB620A0 */  sb         $zero, %lo(_infoclr)($at)
    /* 35C9C 80045C9C C0101000 */  sll        $v0, $s0, 3
    /* 35CA0 80045CA0 23105000 */  subu       $v0, $v0, $s0
    /* 35CA4 80045CA4 80100200 */  sll        $v0, $v0, 2
    /* 35CA8 80045CA8 23105000 */  subu       $v0, $v0, $s0
    /* 35CAC 80045CAC 80280200 */  sll        $a1, $v0, 2
    /* 35CB0 80045CB0 0D80013C */  lui        $at, %hi(item + 0x51)
    /* 35CB4 80045CB4 21082500 */  addu       $at, $at, $a1
    /* 35CB8 80045CB8 A51D2380 */  lb         $v1, %lo(item + 0x51)($at)
    /* 35CBC 80045CBC 01000224 */  addiu      $v0, $zero, 0x1
    /* 35CC0 80045CC0 0A006214 */  bne        $v1, $v0, .L80045CEC
    /* 35CC4 80045CC4 02000224 */   addiu     $v0, $zero, 0x2
    /* 35CC8 80045CC8 1280023C */  lui        $v0, %hi(sel_data)
    /* 35CCC 80045CCC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 35CD0 80045CD0 01000324 */  addiu      $v1, $zero, 0x1
    /* 35CD4 80045CD4 21104400 */  addu       $v0, $v0, $a0
    /* 35CD8 80045CD8 000043A0 */  sb         $v1, 0x0($v0)
    /* 35CDC 80045CDC 0D80013C */  lui        $at, %hi(item + 0x51)
    /* 35CE0 80045CE0 21082500 */  addu       $at, $at, $a1
    /* 35CE4 80045CE4 A51D2380 */  lb         $v1, %lo(item + 0x51)($at)
    /* 35CE8 80045CE8 02000224 */  addiu      $v0, $zero, 0x2
  .L80045CEC:
    /* 35CEC 80045CEC 06006214 */  bne        $v1, $v0, .L80045D08
    /* 35CF0 80045CF0 03000324 */   addiu     $v1, $zero, 0x3
    /* 35CF4 80045CF4 1280023C */  lui        $v0, %hi(sel_data)
    /* 35CF8 80045CF8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 35CFC 80045CFC 00000000 */  nop
    /* 35D00 80045D00 21104400 */  addu       $v0, $v0, $a0
    /* 35D04 80045D04 000043A0 */  sb         $v1, 0x0($v0)
  .L80045D08:
    /* 35D08 80045D08 2000BF8F */  lw         $ra, 0x20($sp)
    /* 35D0C 80045D0C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 35D10 80045D10 1800B08F */  lw         $s0, 0x18($sp)
    /* 35D14 80045D14 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 35D18 80045D18 0800E003 */  jr         $ra
    /* 35D1C 80045D1C 00000000 */   nop
endlabel GetItemStr__Fi
