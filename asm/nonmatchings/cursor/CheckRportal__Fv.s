.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckRportal__Fv, 0x268

glabel CheckRportal__Fv
    /* 27B18 80037B18 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27B1C 80037B1C D00F8B8F */  lw         $t3, %gp_rel(cursmx)($gp)
    /* 27B20 80037B20 D40F8A8F */  lw         $t2, %gp_rel(cursmy)($gp)
    /* 27B24 80037B24 21480000 */  addu       $t1, $zero, $zero
    /* 27B28 80037B28 1400BFAF */  sw         $ra, 0x14($sp)
    /* 27B2C 80037B2C 1000B0AF */  sw         $s0, 0x10($sp)
  .L80037B30:
    /* 27B30 80037B30 1280023C */  lui        $v0, %hi(nummissiles)
    /* 27B34 80037B34 88C2428C */  lw         $v0, %lo(nummissiles)($v0)
    /* 27B38 80037B38 00000000 */  nop
    /* 27B3C 80037B3C 2A102201 */  slt        $v0, $t1, $v0
    /* 27B40 80037B40 8A004010 */  beqz       $v0, .L80037D6C
    /* 27B44 80037B44 40100900 */   sll       $v0, $t1, 1
    /* 27B48 80037B48 1080013C */  lui        $at, %hi(missileactive)
    /* 27B4C 80037B4C 21082200 */  addu       $at, $at, $v0
    /* 27B50 80037B50 602A2384 */  lh         $v1, %lo(missileactive)($at)
    /* 27B54 80037B54 00000000 */  nop
    /* 27B58 80037B58 80100300 */  sll        $v0, $v1, 2
    /* 27B5C 80037B5C 21104300 */  addu       $v0, $v0, $v1
    /* 27B60 80037B60 80100200 */  sll        $v0, $v0, 2
    /* 27B64 80037B64 23104300 */  subu       $v0, $v0, $v1
    /* 27B68 80037B68 80200200 */  sll        $a0, $v0, 2
    /* 27B6C 80037B6C 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 27B70 80037B70 21082400 */  addu       $at, $at, $a0
    /* 27B74 80037B74 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 27B78 80037B78 41000224 */  addiu      $v0, $zero, 0x41
    /* 27B7C 80037B7C 79006214 */  bne        $v1, $v0, .L80037D64
    /* 27B80 80037B80 21400000 */   addu      $t0, $zero, $zero
    /* 27B84 80037B84 21808000 */  addu       $s0, $a0, $zero
  .L80037B88:
    /* 27B88 80037B88 1280013C */  lui        $at, %hi(offset_x)
    /* 27B8C 80037B8C 21082800 */  addu       $at, $at, $t0
    /* 27B90 80037B90 A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 27B94 80037B94 00000000 */  nop
    /* 27B98 80037B98 21286201 */  addu       $a1, $t3, $v0
    /* 27B9C 80037B9C D00F85AF */  sw         $a1, %gp_rel(cursmx)($gp)
    /* 27BA0 80037BA0 1280013C */  lui        $at, %hi(offset_y)
    /* 27BA4 80037BA4 21082800 */  addu       $at, $at, $t0
    /* 27BA8 80037BA8 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 27BAC 80037BAC 00000000 */  nop
    /* 27BB0 80037BB0 21204201 */  addu       $a0, $t2, $v0
    /* 27BB4 80037BB4 D40F84AF */  sw         $a0, %gp_rel(cursmy)($gp)
    /* 27BB8 80037BB8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 27BBC 80037BBC 21083000 */  addu       $at, $at, $s0
    /* 27BC0 80037BC0 892C2680 */  lb         $a2, %lo(missile + 0x31)($at)
    /* 27BC4 80037BC4 00000000 */  nop
    /* 27BC8 80037BC8 FFFFC724 */  addiu      $a3, $a2, -0x1
    /* 27BCC 80037BCC 0700A714 */  bne        $a1, $a3, .L80037BEC
    /* 27BD0 80037BD0 00000000 */   nop
    /* 27BD4 80037BD4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27BD8 80037BD8 21083000 */  addu       $at, $at, $s0
    /* 27BDC 80037BDC 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27BE0 80037BE0 00000000 */  nop
    /* 27BE4 80037BE4 2F008210 */  beq        $a0, $v0, .L80037CA4
    /* 27BE8 80037BE8 00000000 */   nop
  .L80037BEC:
    /* 27BEC 80037BEC 0800A614 */  bne        $a1, $a2, .L80037C10
    /* 27BF0 80037BF0 00000000 */   nop
    /* 27BF4 80037BF4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27BF8 80037BF8 21083000 */  addu       $at, $at, $s0
    /* 27BFC 80037BFC 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27C00 80037C00 00000000 */  nop
    /* 27C04 80037C04 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 27C08 80037C08 26008210 */  beq        $a0, $v0, .L80037CA4
    /* 27C0C 80037C0C 00000000 */   nop
  .L80037C10:
    /* 27C10 80037C10 0800A714 */  bne        $a1, $a3, .L80037C34
    /* 27C14 80037C14 FEFFC224 */   addiu     $v0, $a2, -0x2
    /* 27C18 80037C18 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27C1C 80037C1C 21083000 */  addu       $at, $at, $s0
    /* 27C20 80037C20 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27C24 80037C24 00000000 */  nop
    /* 27C28 80037C28 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 27C2C 80037C2C 1D008210 */  beq        $a0, $v0, .L80037CA4
    /* 27C30 80037C30 FEFFC224 */   addiu     $v0, $a2, -0x2
  .L80037C34:
    /* 27C34 80037C34 0A00A214 */  bne        $a1, $v0, .L80037C60
    /* 27C38 80037C38 00000000 */   nop
    /* 27C3C 80037C3C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27C40 80037C40 21083000 */  addu       $at, $at, $s0
    /* 27C44 80037C44 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* 27C48 80037C48 00000000 */  nop
    /* 27C4C 80037C4C FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 27C50 80037C50 14008210 */  beq        $a0, $v0, .L80037CA4
    /* 27C54 80037C54 FEFF6224 */   addiu     $v0, $v1, -0x2
    /* 27C58 80037C58 12008210 */  beq        $a0, $v0, .L80037CA4
    /* 27C5C 80037C5C 00000000 */   nop
  .L80037C60:
    /* 27C60 80037C60 0800A714 */  bne        $a1, $a3, .L80037C84
    /* 27C64 80037C64 00000000 */   nop
    /* 27C68 80037C68 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27C6C 80037C6C 21083000 */  addu       $at, $at, $s0
    /* 27C70 80037C70 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27C74 80037C74 00000000 */  nop
    /* 27C78 80037C78 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 27C7C 80037C7C 09008210 */  beq        $a0, $v0, .L80037CA4
    /* 27C80 80037C80 00000000 */   nop
  .L80037C84:
    /* 27C84 80037C84 3300A614 */  bne        $a1, $a2, .L80037D54
    /* 27C88 80037C88 00000000 */   nop
    /* 27C8C 80037C8C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27C90 80037C90 21083000 */  addu       $at, $at, $s0
    /* 27C94 80037C94 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27C98 80037C98 00000000 */  nop
    /* 27C9C 80037C9C 2E008214 */  bne        $a0, $v0, .L80037D58
    /* 27CA0 80037CA0 01000825 */   addiu     $t0, $t0, 0x1
  .L80037CA4:
    /* 27CA4 80037CA4 AC0F838F */  lw         $v1, %gp_rel(sel_data)($gp)
    /* 27CA8 80037CA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 27CAC 80037CAC 1280013C */  lui        $at, %hi(_trigflag)
    /* 27CB0 80037CB0 21082300 */  addu       $at, $at, $v1
    /* 27CB4 80037CB4 74BB22A0 */  sb         $v0, %lo(_trigflag)($at)
    /* 27CB8 80037CB8 C8C7000C */  jal        ClearPanel__Fv
    /* 27CBC 80037CBC 00000000 */   nop
    /* 27CC0 80037CC0 4AED010C */  jal        GetStr__Fi
    /* 27CC4 80037CC4 1E030424 */   addiu     $a0, $zero, 0x31E
    /* 27CC8 80037CC8 21284000 */  addu       $a1, $v0, $zero
    /* 27CCC 80037CCC AC0F838F */  lw         $v1, %gp_rel(sel_data)($gp)
    /* 27CD0 80037CD0 0D80043C */  lui        $a0, %hi(_infostr)
    /* 27CD4 80037CD4 10E88424 */  addiu      $a0, $a0, %lo(_infostr)
    /* 27CD8 80037CD8 001A0300 */  sll        $v1, $v1, 8
    /* 27CDC 80037CDC F240000C */  jal        strcpy
    /* 27CE0 80037CE0 21206400 */   addu      $a0, $v1, $a0
    /* 27CE4 80037CE4 1280023C */  lui        $v0, %hi(setlevel)
    /* 27CE8 80037CE8 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 27CEC 80037CEC 00000000 */  nop
    /* 27CF0 80037CF0 02004014 */  bnez       $v0, .L80037CFC
    /* 27CF4 80037CF4 44020424 */   addiu     $a0, $zero, 0x244
    /* 27CF8 80037CF8 79040424 */  addiu      $a0, $zero, 0x479
  .L80037CFC:
    /* 27CFC 80037CFC 4AED010C */  jal        GetStr__Fi
    /* 27D00 80037D00 00000000 */   nop
    /* 27D04 80037D04 0D80043C */  lui        $a0, %hi(tempstr)
    /* 27D08 80037D08 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 27D0C 80037D0C F240000C */  jal        strcpy
    /* 27D10 80037D10 21284000 */   addu      $a1, $v0, $zero
    /* 27D14 80037D14 0D80043C */  lui        $a0, %hi(tempstr)
    /* 27D18 80037D18 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 27D1C 80037D1C 98C7000C */  jal        AddPanelString__FPCci
    /* 27D20 80037D20 01000524 */   addiu     $a1, $zero, 0x1
    /* 27D24 80037D24 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 27D28 80037D28 21083000 */  addu       $at, $at, $s0
    /* 27D2C 80037D2C 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* 27D30 80037D30 00000000 */  nop
    /* 27D34 80037D34 D00F82AF */  sw         $v0, %gp_rel(cursmx)($gp)
    /* 27D38 80037D38 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27D3C 80037D3C 21083000 */  addu       $at, $at, $s0
    /* 27D40 80037D40 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27D44 80037D44 00000000 */  nop
    /* 27D48 80037D48 D40F82AF */  sw         $v0, %gp_rel(cursmy)($gp)
    /* 27D4C 80037D4C 5BDF0008 */  j          .L80037D6C
    /* 27D50 80037D50 00000000 */   nop
  .L80037D54:
    /* 27D54 80037D54 01000825 */  addiu      $t0, $t0, 0x1
  .L80037D58:
    /* 27D58 80037D58 08000229 */  slti       $v0, $t0, 0x8
    /* 27D5C 80037D5C 8AFF4014 */  bnez       $v0, .L80037B88
    /* 27D60 80037D60 00000000 */   nop
  .L80037D64:
    /* 27D64 80037D64 CCDE0008 */  j          .L80037B30
    /* 27D68 80037D68 01002925 */   addiu     $t1, $t1, 0x1
  .L80037D6C:
    /* 27D6C 80037D6C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 27D70 80037D70 1000B08F */  lw         $s0, 0x10($sp)
    /* 27D74 80037D74 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 27D78 80037D78 0800E003 */  jr         $ra
    /* 27D7C 80037D7C 00000000 */   nop
endlabel CheckRportal__Fv
