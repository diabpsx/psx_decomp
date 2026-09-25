.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndUItem__Fi, 0x248

glabel RndUItem__Fi
    /* 33894 80043894 E8F7BD27 */  addiu      $sp, $sp, -0x818
    /* 33898 80043898 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3389C 8004389C 17008210 */  beq        $a0, $v0, .L800438FC
    /* 338A0 800438A0 1008BFAF */   sw        $ra, 0x810($sp)
    /* 338A4 800438A4 40100400 */  sll        $v0, $a0, 1
    /* 338A8 800438A8 21104400 */  addu       $v0, $v0, $a0
    /* 338AC 800438AC 80100200 */  sll        $v0, $v0, 2
    /* 338B0 800438B0 21104400 */  addu       $v0, $v0, $a0
    /* 338B4 800438B4 C0100200 */  sll        $v0, $v0, 3
    /* 338B8 800438B8 1080013C */  lui        $at, %hi(monster + 0x64)
    /* 338BC 800438BC 21082200 */  addu       $at, $at, $v0
    /* 338C0 800438C0 F853228C */  lw         $v0, %lo(monster + 0x64)($at)
    /* 338C4 800438C4 00000000 */  nop
    /* 338C8 800438C8 34004594 */  lhu        $a1, 0x34($v0)
    /* 338CC 800438CC 00000000 */  nop
    /* 338D0 800438D0 0080A230 */  andi       $v0, $a1, 0x8000
    /* 338D4 800438D4 09004010 */  beqz       $v0, .L800438FC
    /* 338D8 800438D8 01000224 */   addiu     $v0, $zero, 0x1
    /* 338DC 800438DC 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 338E0 800438E0 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 338E4 800438E4 00000000 */  nop
    /* 338E8 800438E8 05006214 */  bne        $v1, $v0, .L80043900
    /* 338EC 800438EC 21400000 */   addu      $t0, $zero, $zero
    /* 338F0 800438F0 FF0FA230 */  andi       $v0, $a1, 0xFFF
    /* 338F4 800438F4 B30E0108 */  j          .L80043ACC
    /* 338F8 800438F8 27100200 */   nor       $v0, $zero, $v0
  .L800438FC:
    /* 338FC 800438FC 21400000 */  addu       $t0, $zero, $zero
  .L80043900:
    /* 33900 80043900 1180033C */  lui        $v1, %hi(AllItemsList + 0x2)
    /* 33904 80043904 A6136380 */  lb         $v1, %lo(AllItemsList + 0x2)($v1)
    /* 33908 80043908 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3390C 8004390C 6A006210 */  beq        $v1, $v0, .L80043AB8
    /* 33910 80043910 21480000 */   addu      $t1, $zero, $zero
    /* 33914 80043914 FFFF0A24 */  addiu      $t2, $zero, -0x1
    /* 33918 80043918 40100400 */  sll        $v0, $a0, 1
    /* 3391C 8004391C 21104400 */  addu       $v0, $v0, $a0
    /* 33920 80043920 80100200 */  sll        $v0, $v0, 2
    /* 33924 80043924 21104400 */  addu       $v0, $v0, $a0
    /* 33928 80043928 C0600200 */  sll        $t4, $v0, 3
    /* 3392C 8004392C 21300000 */  addu       $a2, $zero, $zero
    /* 33930 80043930 1280023C */  lui        $v0, %hi(currlevel)
    /* 33934 80043934 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 33938 80043938 1280073C */  lui        $a3, %hi(FePlayerNo)
    /* 3393C 8004393C 78B3E78C */  lw         $a3, %lo(FePlayerNo)($a3)
    /* 33940 80043940 40580200 */  sll        $t3, $v0, 1
  .L80043944:
    /* 33944 80043944 1180013C */  lui        $at, %hi(AllItemsList)
    /* 33948 80043948 21082600 */  addu       $at, $at, $a2
    /* 3394C 8004394C A4132290 */  lbu        $v0, %lo(AllItemsList)($at)
    /* 33950 80043950 00000000 */  nop
    /* 33954 80043954 2B100200 */  sltu       $v0, $zero, $v0
    /* 33958 80043958 09008A10 */  beq        $a0, $t2, .L80043980
    /* 3395C 8004395C 21284000 */   addu      $a1, $v0, $zero
    /* 33960 80043960 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 33964 80043964 21082C00 */  addu       $at, $at, $t4
    /* 33968 80043968 DB532280 */  lb         $v0, %lo(monster + 0x47)($at)
    /* 3396C 8004396C 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 33970 80043970 21082600 */  addu       $at, $at, $a2
    /* 33974 80043974 AE132380 */  lb         $v1, %lo(AllItemsList + 0xA)($at)
    /* 33978 80043978 650E0108 */  j          .L80043994
    /* 3397C 8004397C 2A104300 */   slt       $v0, $v0, $v1
  .L80043980:
    /* 33980 80043980 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 33984 80043984 21082600 */  addu       $at, $at, $a2
    /* 33988 80043988 AE132280 */  lb         $v0, %lo(AllItemsList + 0xA)($at)
    /* 3398C 8004398C 00000000 */  nop
    /* 33990 80043990 2A106201 */  slt        $v0, $t3, $v0
  .L80043994:
    /* 33994 80043994 02004010 */  beqz       $v0, .L800439A0
    /* 33998 80043998 00000000 */   nop
    /* 3399C 8004399C 21280000 */  addu       $a1, $zero, $zero
  .L800439A0:
    /* 339A0 800439A0 1180013C */  lui        $at, %hi(AllItemsList + 0x4)
    /* 339A4 800439A4 21082600 */  addu       $at, $at, $a2
    /* 339A8 800439A8 A8132380 */  lb         $v1, %lo(AllItemsList + 0x4)($at)
    /* 339AC 800439AC 00000000 */  nop
    /* 339B0 800439B0 02006014 */  bnez       $v1, .L800439BC
    /* 339B4 800439B4 0B000224 */   addiu     $v0, $zero, 0xB
    /* 339B8 800439B8 21280000 */  addu       $a1, $zero, $zero
  .L800439BC:
    /* 339BC 800439BC 02006214 */  bne        $v1, $v0, .L800439C8
    /* 339C0 800439C0 0E000224 */   addiu     $v0, $zero, 0xE
    /* 339C4 800439C4 21280000 */  addu       $a1, $zero, $zero
  .L800439C8:
    /* 339C8 800439C8 02006214 */  bne        $v1, $v0, .L800439D4
    /* 339CC 800439CC 00000000 */   nop
    /* 339D0 800439D0 21280000 */  addu       $a1, $zero, $zero
  .L800439D4:
    /* 339D4 800439D4 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 339D8 800439D8 21082600 */  addu       $at, $at, $a2
    /* 339DC 800439DC BC132390 */  lbu        $v1, %lo(AllItemsList + 0x18)($at)
    /* 339E0 800439E0 18000224 */  addiu      $v0, $zero, 0x18
    /* 339E4 800439E4 02006214 */  bne        $v1, $v0, .L800439F0
    /* 339E8 800439E8 00000000 */   nop
    /* 339EC 800439EC 01000524 */  addiu      $a1, $zero, 0x1
  .L800439F0:
    /* 339F0 800439F0 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 339F4 800439F4 21082600 */  addu       $at, $at, $a2
    /* 339F8 800439F8 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 339FC 800439FC 20000224 */  addiu      $v0, $zero, 0x20
    /* 33A00 80043A00 07006214 */  bne        $v1, $v0, .L80043A20
    /* 33A04 80043A04 00000000 */   nop
    /* 33A08 80043A08 0600E014 */  bnez       $a3, .L80043A24
    /* 33A0C 80043A0C 22000224 */   addiu     $v0, $zero, 0x22
    /* 33A10 80043A10 21280000 */  addu       $a1, $zero, $zero
    /* 33A14 80043A14 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33A18 80043A18 21082600 */  addu       $at, $at, $a2
    /* 33A1C 80043A1C BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
  .L80043A20:
    /* 33A20 80043A20 22000224 */  addiu      $v0, $zero, 0x22
  .L80043A24:
    /* 33A24 80043A24 04006214 */  bne        $v1, $v0, .L80043A38
    /* 33A28 80043A28 00000000 */   nop
    /* 33A2C 80043A2C 0200E014 */  bnez       $a3, .L80043A38
    /* 33A30 80043A30 00000000 */   nop
    /* 33A34 80043A34 21280000 */  addu       $a1, $zero, $zero
  .L80043A38:
    /* 33A38 80043A38 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33A3C 80043A3C 21082600 */  addu       $at, $at, $a2
    /* 33A40 80043A40 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 33A44 80043A44 17000224 */  addiu      $v0, $zero, 0x17
    /* 33A48 80043A48 07006214 */  bne        $v1, $v0, .L80043A68
    /* 33A4C 80043A4C 00000000 */   nop
    /* 33A50 80043A50 0600E010 */  beqz       $a3, .L80043A6C
    /* 33A54 80043A54 0A000224 */   addiu     $v0, $zero, 0xA
    /* 33A58 80043A58 21280000 */  addu       $a1, $zero, $zero
    /* 33A5C 80043A5C 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33A60 80043A60 21082600 */  addu       $at, $at, $a2
    /* 33A64 80043A64 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
  .L80043A68:
    /* 33A68 80043A68 0A000224 */  addiu      $v0, $zero, 0xA
  .L80043A6C:
    /* 33A6C 80043A6C 04006214 */  bne        $v1, $v0, .L80043A80
    /* 33A70 80043A70 00000000 */   nop
    /* 33A74 80043A74 0300E010 */  beqz       $a3, .L80043A84
    /* 33A78 80043A78 FF00A230 */   andi      $v0, $a1, 0xFF
    /* 33A7C 80043A7C 21280000 */  addu       $a1, $zero, $zero
  .L80043A80:
    /* 33A80 80043A80 FF00A230 */  andi       $v0, $a1, 0xFF
  .L80043A84:
    /* 33A84 80043A84 05004010 */  beqz       $v0, .L80043A9C
    /* 33A88 80043A88 80100800 */   sll       $v0, $t0, 2
    /* 33A8C 80043A8C 1000A327 */  addiu      $v1, $sp, 0x10
    /* 33A90 80043A90 21104300 */  addu       $v0, $v0, $v1
    /* 33A94 80043A94 000049AC */  sw         $t1, 0x0($v0)
    /* 33A98 80043A98 01000825 */  addiu      $t0, $t0, 0x1
  .L80043A9C:
    /* 33A9C 80043A9C 2000C624 */  addiu      $a2, $a2, 0x20
    /* 33AA0 80043AA0 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 33AA4 80043AA4 21082600 */  addu       $at, $at, $a2
    /* 33AA8 80043AA8 A6132280 */  lb         $v0, %lo(AllItemsList + 0x2)($at)
    /* 33AAC 80043AAC 00000000 */  nop
    /* 33AB0 80043AB0 A4FF4A14 */  bne        $v0, $t2, .L80043944
    /* 33AB4 80043AB4 01002925 */   addiu     $t1, $t1, 0x1
  .L80043AB8:
    /* 33AB8 80043AB8 C9F6000C */  jal        ENG_random__Fl
    /* 33ABC 80043ABC 21200001 */   addu      $a0, $t0, $zero
    /* 33AC0 80043AC0 80100200 */  sll        $v0, $v0, 2
    /* 33AC4 80043AC4 2110A203 */  addu       $v0, $sp, $v0
    /* 33AC8 80043AC8 1000428C */  lw         $v0, 0x10($v0)
  .L80043ACC:
    /* 33ACC 80043ACC 1008BF8F */  lw         $ra, 0x810($sp)
    /* 33AD0 80043AD0 1808BD27 */  addiu      $sp, $sp, 0x818
    /* 33AD4 80043AD4 0800E003 */  jr         $ra
    /* 33AD8 80043AD8 00000000 */   nop
endlabel RndUItem__Fi
