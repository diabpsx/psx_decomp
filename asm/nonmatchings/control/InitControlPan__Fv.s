.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitControlPan__Fv, 0x22C

glabel InitControlPan__Fv
    /* 21F70 80031F70 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 21F74 80031F74 1180043C */  lui        $a0, %hi(D_8011107C)
    /* 21F78 80031F78 7C108424 */  addiu      $a0, $a0, %lo(D_8011107C)
    /* 21F7C 80031F7C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 21F80 80031F80 BC0E80AF */  sw         $zero, %gp_rel(D_8011B63C)($gp)
    /* 21F84 80031F84 C00E80AF */  sw         $zero, %gp_rel(D_8011B640)($gp)
    /* 21F88 80031F88 C40E80AF */  sw         $zero, %gp_rel(D_8011B644)($gp)
    /* 21F8C 80031F8C C80E80AF */  sw         $zero, %gp_rel(D_8011B648)($gp)
    /* 21F90 80031F90 5C0F80AF */  sw         $zero, %gp_rel(pManaBuff)($gp)
    /* 21F94 80031F94 600F80AF */  sw         $zero, %gp_rel(pLifeBuff)($gp)
    /* 21F98 80031F98 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 21F9C 80031F9C 21280000 */   addu      $a1, $zero, $zero
    /* 21FA0 80031FA0 1180043C */  lui        $a0, %hi(D_80111094)
    /* 21FA4 80031FA4 94108424 */  addiu      $a0, $a0, %lo(D_80111094)
    /* 21FA8 80031FA8 580F82AF */  sw         $v0, %gp_rel(pPanelText)($gp)
    /* 21FAC 80031FAC 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 21FB0 80031FB0 21280000 */   addu      $a1, $zero, $zero
    /* 21FB4 80031FB4 1180043C */  lui        $a0, %hi(D_801110A4)
    /* 21FB8 80031FB8 A4108424 */  addiu      $a0, $a0, %lo(D_801110A4)
    /* 21FBC 80031FBC 640F82AF */  sw         $v0, %gp_rel(pChrPanel)($gp)
    /* 21FC0 80031FC0 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 21FC4 80031FC4 21280000 */   addu      $a1, $zero, $zero
    /* 21FC8 80031FC8 6C0F82AF */  sw         $v0, %gp_rel(pSpellCels)($gp)
    /* 21FCC 80031FCC 4EC3000C */  jal        SetSpellTrans__Fc
    /* 21FD0 80031FD0 21200000 */   addu      $a0, $zero, $zero
    /* 21FD4 80031FD4 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 21FD8 80031FD8 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 21FDC 80031FDC 01000224 */  addiu      $v0, $zero, 0x1
    /* 21FE0 80031FE0 470F80A3 */  sb         $zero, %gp_rel(talkflag)($gp)
    /* 21FE4 80031FE4 14006210 */  beq        $v1, $v0, .L80032038
    /* 21FE8 80031FE8 01000424 */   addiu     $a0, $zero, 0x1
    /* 21FEC 80031FEC 01000324 */  addiu      $v1, $zero, 0x1
    /* 21FF0 80031FF0 1280023C */  lui        $v0, %hi(D_8011C79B)
    /* 21FF4 80031FF4 9BC74224 */  addiu      $v0, $v0, %lo(D_8011C79B)
    /* 21FF8 80031FF8 202080AF */  sw         $zero, %gp_rel(D_8011C7A0)($gp)
    /* 21FFC 80031FFC 242080AF */  sw         $zero, %gp_rel(D_8011C7A4)($gp)
    /* 22000 80032000 142080AF */  sw         $zero, %gp_rel(D_8011C794)($gp)
    /* 22004 80032004 1380013C */  lui        $at, %hi(D_8012EA98)
    /* 22008 80032008 98EA20A0 */  sb         $zero, %lo(D_8012EA98)($at)
  .L8003200C:
    /* 2200C 8003200C 000044A0 */  sb         $a0, 0x0($v0)
    /* 22010 80032010 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 22014 80032014 FDFF6104 */  bgez       $v1, .L8003200C
    /* 22018 80032018 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 2201C 8003201C 02000324 */  addiu      $v1, $zero, 0x2
    /* 22020 80032020 1280023C */  lui        $v0, %hi(D_8011C7AA)
    /* 22024 80032024 AAC74224 */  addiu      $v0, $v0, %lo(D_8011C7AA)
  .L80032028:
    /* 22028 80032028 000040A0 */  sb         $zero, 0x0($v0)
    /* 2202C 8003202C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 22030 80032030 FDFF6104 */  bgez       $v1, .L80032028
    /* 22034 80032034 FFFF4224 */   addiu     $v0, $v0, -0x1
  .L80032038:
    /* 22038 80032038 1180043C */  lui        $a0, %hi(D_801110BC)
    /* 2203C 8003203C BC108424 */  addiu      $a0, $a0, %lo(D_801110BC)
    /* 22040 80032040 430F80A3 */  sb         $zero, %gp_rel(panelflag)($gp)
    /* 22044 80032044 450F80A3 */  sb         $zero, %gp_rel(lvlbtndown)($gp)
    /* 22048 80032048 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2204C 8003204C 21280000 */   addu      $a1, $zero, $zero
    /* 22050 80032050 21180000 */  addu       $v1, $zero, $zero
    /* 22054 80032054 1280043C */  lui        $a0, %hi(D_8011C784)
    /* 22058 80032058 84C78424 */  addiu      $a0, $a0, %lo(D_8011C784)
    /* 2205C 8003205C 540F82AF */  sw         $v0, %gp_rel(pPanelButtons)($gp)
    /* 22060 80032060 420F80A3 */  sb         $zero, %gp_rel(panbtndown)($gp)
    /* 22064 80032064 680F80AF */  sw         $zero, %gp_rel(pChrButtons)($gp)
  .L80032068:
    /* 22068 80032068 1280023C */  lui        $v0, %hi(myplr)
    /* 2206C 8003206C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 22070 80032070 00000000 */  nop
    /* 22074 80032074 80100200 */  sll        $v0, $v0, 2
    /* 22078 80032078 21104400 */  addu       $v0, $v0, $a0
    /* 2207C 8003207C 21104300 */  addu       $v0, $v0, $v1
    /* 22080 80032080 01006324 */  addiu      $v1, $v1, 0x1
    /* 22084 80032084 000040A0 */  sb         $zero, 0x0($v0)
    /* 22088 80032088 04006228 */  slti       $v0, $v1, 0x4
    /* 2208C 8003208C F6FF4014 */  bnez       $v0, .L80032068
    /* 22090 80032090 00000000 */   nop
    /* 22094 80032094 800F80AF */  sw         $zero, %gp_rel(pDurIcons)($gp)
    /* 22098 80032098 4AED010C */  jal        GetStr__Fi
    /* 2209C 8003209C FA040424 */   addiu     $a0, $zero, 0x4FA
    /* 220A0 800320A0 21284000 */  addu       $a1, $v0, $zero
    /* 220A4 800320A4 1280043C */  lui        $a0, %hi(sel_data)
    /* 220A8 800320A8 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 220AC 800320AC 0D80023C */  lui        $v0, %hi(_infostr)
    /* 220B0 800320B0 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 220B4 800320B4 00220400 */  sll        $a0, $a0, 8
    /* 220B8 800320B8 F240000C */  jal        strcpy
    /* 220BC 800320BC 21208200 */   addu      $a0, $a0, $v0
    /* 220C0 800320C0 D4C7000C */  jal        InitPanelStr__Fv
    /* 220C4 800320C4 00000000 */   nop
    /* 220C8 800320C8 1280033C */  lui        $v1, %hi(myplr)
    /* 220CC 800320CC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 220D0 800320D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 220D4 800320D4 3E0F82A3 */  sb         $v0, %gp_rel(drawhpflag)($gp)
    /* 220D8 800320D8 3F0F82A3 */  sb         $v0, %gp_rel(drawmanaflag)($gp)
    /* 220DC 800320DC 400F80A3 */  sb         $zero, %gp_rel(chrflag)($gp)
    /* 220E0 800320E0 D00E80AF */  sw         $zero, %gp_rel(_spselflag)($gp)
    /* 220E4 800320E4 D40E80AF */  sw         $zero, %gp_rel(_spselflag + 0x4)($gp)
    /* 220E8 800320E8 880F80AF */  sw         $zero, %gp_rel(pSpellBkCel)($gp)
    /* 220EC 800320EC 8C0F80AF */  sw         $zero, %gp_rel(pSBkBtnCel)($gp)
    /* 220F0 800320F0 900F80AF */  sw         $zero, %gp_rel(pSBkIconCels)($gp)
    /* 220F4 800320F4 940F80AF */  sw         $zero, %gp_rel(sbooktab)($gp)
    /* 220F8 800320F8 460F80A3 */  sb         $zero, %gp_rel(sbookflag)($gp)
    /* 220FC 800320FC 980F80AF */  sw         $zero, %gp_rel(cur_spel)($gp)
    /* 22100 80032100 9C0F80AF */  sw         $zero, %gp_rel(cur_spel + 0x4)($gp)
    /* 22104 80032104 0C2080AF */  sw         $zero, %gp_rel(D_8011C78C)($gp)
    /* 22108 80032108 102080AF */  sw         $zero, %gp_rel(D_8011C790)($gp)
    /* 2210C 8003210C 40100300 */  sll        $v0, $v1, 1
    /* 22110 80032110 21104300 */  addu       $v0, $v0, $v1
    /* 22114 80032114 80100200 */  sll        $v0, $v0, 2
    /* 22118 80032118 21104300 */  addu       $v0, $v0, $v1
    /* 2211C 8003211C 00110200 */  sll        $v0, $v0, 4
    /* 22120 80032120 23104300 */  subu       $v0, $v0, $v1
    /* 22124 80032124 80100200 */  sll        $v0, $v0, 2
    /* 22128 80032128 21104300 */  addu       $v0, $v0, $v1
    /* 2212C 8003212C C0100200 */  sll        $v0, $v0, 3
    /* 22130 80032130 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 22134 80032134 21082200 */  addu       $at, $at, $v0
    /* 22138 80032138 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2213C 8003213C 00000000 */  nop
    /* 22140 80032140 03006014 */  bnez       $v1, .L80032150
    /* 22144 80032144 01000224 */   addiu     $v0, $zero, 0x1
    /* 22148 80032148 5AC80008 */  j          .L80032168
    /* 2214C 8003214C 1A000224 */   addiu     $v0, $zero, 0x1A
  .L80032150:
    /* 22150 80032150 03006214 */  bne        $v1, $v0, .L80032160
    /* 22154 80032154 02000224 */   addiu     $v0, $zero, 0x2
    /* 22158 80032158 5AC80008 */  j          .L80032168
    /* 2215C 8003215C 1C000224 */   addiu     $v0, $zero, 0x1C
  .L80032160:
    /* 22160 80032160 03006214 */  bne        $v1, $v0, .L80032170
    /* 22164 80032164 1B000224 */   addiu     $v0, $zero, 0x1B
  .L80032168:
    /* 22168 80032168 0D80013C */  lui        $at, %hi(SpellPages)
    /* 2216C 8003216C 4CE322AC */  sw         $v0, %lo(SpellPages)($at)
  .L80032170:
    /* 22170 80032170 1280013C */  lui        $at, %hi(pQLogCel)
    /* 22174 80032174 50BA20AC */  sw         $zero, %lo(pQLogCel)($at)
    /* 22178 80032178 300F80AF */  sw         $zero, %gp_rel(pGBoxBuff)($gp)
    /* 2217C 8003217C 340F80A3 */  sb         $zero, %gp_rel(dropGoldFlag)($gp)
    /* 22180 80032180 480F80AF */  sw         $zero, %gp_rel(dropGoldValue)($gp)
    /* 22184 80032184 4C0F80AF */  sw         $zero, %gp_rel(initialDropGoldValue)($gp)
    /* 22188 80032188 500F80AF */  sw         $zero, %gp_rel(initialDropGoldIndex)($gp)
    /* 2218C 8003218C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 22190 80032190 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22194 80032194 0800E003 */  jr         $ra
    /* 22198 80032198 00000000 */   nop
endlabel InitControlPan__Fv
