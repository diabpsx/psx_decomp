.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdRead, 0x100

glabel CdRead
    /* DACC 8001DACC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* DAD0 8001DAD0 21388000 */  addu       $a3, $a0, $zero
    /* DAD4 8001DAD4 0B80043C */  lui        $a0, %hi(D_800B6220)
    /* DAD8 8001DAD8 20628424 */  addiu      $a0, $a0, %lo(D_800B6220)
    /* DADC 8001DADC 1400BFAF */  sw         $ra, 0x14($sp)
    /* DAE0 8001DAE0 1000B0AF */  sw         $s0, 0x10($sp)
    /* DAE4 8001DAE4 0C0086AC */  sw         $a2, 0xC($a0)
    /* DAE8 8001DAE8 0C00828C */  lw         $v0, 0xC($a0)
    /* DAEC 8001DAEC 00000000 */  nop
    /* DAF0 8001DAF0 30004330 */  andi       $v1, $v0, 0x30
    /* DAF4 8001DAF4 05006010 */  beqz       $v1, .L8001DB0C
    /* DAF8 8001DAF8 20000224 */   addiu     $v0, $zero, 0x20
    /* DAFC 8001DAFC 06006210 */  beq        $v1, $v0, .L8001DB18
    /* DB00 8001DB00 46020224 */   addiu     $v0, $zero, 0x246
    /* DB04 8001DB04 C9760008 */  j          .L8001DB24
    /* DB08 8001DB08 00000000 */   nop
  .L8001DB0C:
    /* DB0C 8001DB0C 00020224 */  addiu      $v0, $zero, 0x200
    /* DB10 8001DB10 CC760008 */  j          .L8001DB30
    /* DB14 8001DB14 100082AC */   sw        $v0, 0x10($a0)
  .L8001DB18:
    /* DB18 8001DB18 49020224 */  addiu      $v0, $zero, 0x249
    /* DB1C 8001DB1C CC760008 */  j          .L8001DB30
    /* DB20 8001DB20 100082AC */   sw        $v0, 0x10($a0)
  .L8001DB24:
    /* DB24 8001DB24 0B80033C */  lui        $v1, %hi(D_800B6220)
    /* DB28 8001DB28 20626324 */  addiu      $v1, $v1, %lo(D_800B6220)
    /* DB2C 8001DB2C 100062AC */  sw         $v0, 0x10($v1)
  .L8001DB30:
    /* DB30 8001DB30 0B80103C */  lui        $s0, %hi(D_800B6220)
    /* DB34 8001DB34 20621026 */  addiu      $s0, $s0, %lo(D_800B6220)
    /* DB38 8001DB38 0C00028E */  lw         $v0, 0xC($s0)
    /* DB3C 8001DB3C 21200000 */  addu       $a0, $zero, $zero
    /* DB40 8001DB40 20004234 */  ori        $v0, $v0, 0x20
    /* DB44 8001DB44 0C0002AE */  sw         $v0, 0xC($s0)
    /* DB48 8001DB48 040005AE */  sw         $a1, 0x4($s0)
    /* DB4C 8001DB4C 8C6B000C */  jal        CdSyncCallback
    /* DB50 8001DB50 000007AE */   sw        $a3, 0x0($s0)
    /* DB54 8001DB54 21200000 */  addu       $a0, $zero, $zero
    /* DB58 8001DB58 916B000C */  jal        CdReadyCallback
    /* DB5C 8001DB5C 240002AE */   sw        $v0, 0x24($s0)
    /* DB60 8001DB60 280002AE */  sw         $v0, 0x28($s0)
    /* DB64 8001DB64 3000028E */  lw         $v0, 0x30($s0)
    /* DB68 8001DB68 00000000 */  nop
    /* DB6C 8001DB6C 01004230 */  andi       $v0, $v0, 0x1
    /* DB70 8001DB70 04004010 */  beqz       $v0, .L8001DB84
    /* DB74 8001DB74 00000000 */   nop
    /* DB78 8001DB78 9D6C000C */  jal        CdDataCallback
    /* DB7C 8001DB7C 21200000 */   addu      $a0, $zero, $zero
    /* DB80 8001DB80 2C0002AE */  sw         $v0, 0x2C($s0)
  .L8001DB84:
    /* DB84 8001DB84 1748000C */  jal        VSync
    /* DB88 8001DB88 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* DB8C 8001DB8C 1C0002AE */  sw         $v0, 0x1C($s0)
    /* DB90 8001DB90 2B6B000C */  jal        CdStatus
    /* DB94 8001DB94 00000000 */   nop
    /* DB98 8001DB98 E0004230 */  andi       $v0, $v0, 0xE0
    /* DB9C 8001DB9C 04004010 */  beqz       $v0, .L8001DBB0
    /* DBA0 8001DBA0 09000424 */   addiu     $a0, $zero, 0x9
    /* DBA4 8001DBA4 21280000 */  addu       $a1, $zero, $zero
    /* DBA8 8001DBA8 326C000C */  jal        CdControlB
    /* DBAC 8001DBAC 21300000 */   addu      $a2, $zero, $zero
  .L8001DBB0:
    /* DBB0 8001DBB0 1276000C */  jal        func_8001D848
    /* DBB4 8001DBB4 21200000 */   addu      $a0, $zero, $zero
    /* DBB8 8001DBB8 2A100200 */  slt        $v0, $zero, $v0
    /* DBBC 8001DBBC 1400BF8F */  lw         $ra, 0x14($sp)
    /* DBC0 8001DBC0 1000B08F */  lw         $s0, 0x10($sp)
    /* DBC4 8001DBC4 0800E003 */  jr         $ra
    /* DBC8 8001DBC8 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel CdRead
