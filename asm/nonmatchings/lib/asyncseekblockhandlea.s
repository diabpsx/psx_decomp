.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncseekblockhandlea, 0x90

glabel asyncseekblockhandlea
    /* 16FE4 80026FE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 16FE8 80026FE8 80100400 */  sll        $v0, $a0, 2
    /* 16FEC 80026FEC 21104400 */  addu       $v0, $v0, $a0
    /* 16FF0 80026FF0 C0200200 */  sll        $a0, $v0, 3
    /* 16FF4 80026FF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 16FF8 80026FF8 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 16FFC 80026FFC 21082400 */  addu       $at, $at, $a0
    /* 17000 80027000 0064238C */  lw         $v1, %lo(D_800B6400)($at)
    /* 17004 80027004 02000224 */  addiu      $v0, $zero, 0x2
    /* 17008 80027008 10006210 */  beq        $v1, $v0, .L8002704C
    /* 1700C 8002700C 00000000 */   nop
    /* 17010 80027010 0B80013C */  lui        $at, %hi(D_800B640C)
    /* 17014 80027014 21082400 */  addu       $at, $at, $a0
    /* 17018 80027018 0C64228C */  lw         $v0, %lo(D_800B640C)($at)
    /* 1701C 8002701C 00000000 */  nop
    /* 17020 80027020 21104500 */  addu       $v0, $v0, $a1
    /* 17024 80027024 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 17028 80027028 21082400 */  addu       $at, $at, $a0
    /* 1702C 8002702C 106422AC */  sw         $v0, %lo(D_800B6410)($at)
    /* 17030 80027030 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 17034 80027034 21082400 */  addu       $at, $at, $a0
    /* 17038 80027038 1064228C */  lw         $v0, %lo(D_800B6410)($at)
    /* 1703C 8002703C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 17040 80027040 242383AF */  sw         $v1, %gp_rel(blockiosector)($gp)
    /* 17044 80027044 199C0008 */  j          .L80027064
    /* 17048 80027048 FF074230 */   andi      $v0, $v0, 0x7FF
  .L8002704C:
    /* 1704C 8002704C 0B80013C */  lui        $at, %hi(D_800B6404)
    /* 17050 80027050 21082400 */  addu       $at, $at, $a0
    /* 17054 80027054 0464248C */  lw         $a0, %lo(D_800B6404)($at)
    /* 17058 80027058 BAA3000C */  jal        seekhandle
    /* 1705C 8002705C 00000000 */   nop
    /* 17060 80027060 21100000 */  addu       $v0, $zero, $zero
  .L80027064:
    /* 17064 80027064 1000BF8F */  lw         $ra, 0x10($sp)
    /* 17068 80027068 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1706C 8002706C 0800E003 */  jr         $ra
    /* 17070 80027070 00000000 */   nop
endlabel asyncseekblockhandlea
