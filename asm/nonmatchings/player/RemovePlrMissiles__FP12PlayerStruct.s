.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemovePlrMissiles__FP12PlayerStruct, 0x318

glabel RemovePlrMissiles__FP12PlayerStruct
    /* 51DD0 80061DD0 1280023C */  lui        $v0, %hi(currlevel)
    /* 51DD4 80061DD4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 51DD8 80061DD8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 51DDC 80061DDC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 51DE0 80061DE0 21908000 */  addu       $s2, $a0, $zero
    /* 51DE4 80061DE4 2800BFAF */  sw         $ra, 0x28($sp)
    /* 51DE8 80061DE8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 51DEC 80061DEC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 51DF0 80061DF0 4B004010 */  beqz       $v0, .L80061F20
    /* 51DF4 80061DF4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 51DF8 80061DF8 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 51DFC 80061DFC 00000000 */   nop
    /* 51E00 80061E00 47004010 */  beqz       $v0, .L80061F20
    /* 51E04 80061E04 00000000 */   nop
    /* 51E08 80061E08 8812848F */  lw         $a0, %gp_rel(myplr)($gp)
    /* 51E0C 80061E0C 00000000 */  nop
    /* 51E10 80061E10 40100400 */  sll        $v0, $a0, 1
    /* 51E14 80061E14 21104400 */  addu       $v0, $v0, $a0
    /* 51E18 80061E18 80100200 */  sll        $v0, $v0, 2
    /* 51E1C 80061E1C 21104400 */  addu       $v0, $v0, $a0
    /* 51E20 80061E20 C0280200 */  sll        $a1, $v0, 3
    /* 51E24 80061E24 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 51E28 80061E28 21082500 */  addu       $at, $at, $a1
    /* 51E2C 80061E2C C8532380 */  lb         $v1, %lo(monster + 0x34)($at)
    /* 51E30 80061E30 01000224 */  addiu      $v0, $zero, 0x1
    /* 51E34 80061E34 07006214 */  bne        $v1, $v0, .L80061E54
    /* 51E38 80061E38 00000000 */   nop
    /* 51E3C 80061E3C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 51E40 80061E40 21082500 */  addu       $at, $at, $a1
    /* 51E44 80061E44 C9532280 */  lb         $v0, %lo(monster + 0x35)($at)
    /* 51E48 80061E48 00000000 */  nop
    /* 51E4C 80061E4C 34004010 */  beqz       $v0, .L80061F20
    /* 51E50 80061E50 00000000 */   nop
  .L80061E54:
    /* 51E54 80061E54 F630050C */  jal        func_8014C3D8
    /* 51E58 80061E58 21288000 */   addu      $a1, $a0, $zero
    /* 51E5C 80061E5C 8812838F */  lw         $v1, %gp_rel(myplr)($gp)
    /* 51E60 80061E60 00000000 */  nop
    /* 51E64 80061E64 40100300 */  sll        $v0, $v1, 1
    /* 51E68 80061E68 21104300 */  addu       $v0, $v0, $v1
    /* 51E6C 80061E6C 80100200 */  sll        $v0, $v0, 2
    /* 51E70 80061E70 21104300 */  addu       $v0, $v0, $v1
    /* 51E74 80061E74 C0100200 */  sll        $v0, $v0, 3
    /* 51E78 80061E78 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 51E7C 80061E7C 21082200 */  addu       $at, $at, $v0
    /* 51E80 80061E80 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 51E84 80061E84 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 51E88 80061E88 21082200 */  addu       $at, $at, $v0
    /* 51E8C 80061E8C F453238C */  lw         $v1, %lo(monster + 0x60)($at)
    /* 51E90 80061E90 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 51E94 80061E94 21082200 */  addu       $at, $at, $v0
    /* 51E98 80061E98 C9532580 */  lb         $a1, %lo(monster + 0x35)($at)
    /* 51E9C 80061E9C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 51EA0 80061EA0 21082200 */  addu       $at, $at, $v0
    /* 51EA4 80061EA4 D0532780 */  lb         $a3, %lo(monster + 0x3C)($at)
    /* 51EA8 80061EA8 18006680 */  lb         $a2, 0x18($v1)
    /* 51EAC 80061EAC E3DF000C */  jal        AddDead__Fiici
    /* 51EB0 80061EB0 00000000 */   nop
    /* 51EB4 80061EB4 8812828F */  lw         $v0, %gp_rel(myplr)($gp)
    /* 51EB8 80061EB8 00000000 */  nop
    /* 51EBC 80061EBC 40180200 */  sll        $v1, $v0, 1
    /* 51EC0 80061EC0 21186200 */  addu       $v1, $v1, $v0
    /* 51EC4 80061EC4 80180300 */  sll        $v1, $v1, 2
    /* 51EC8 80061EC8 21186200 */  addu       $v1, $v1, $v0
    /* 51ECC 80061ECC C0180300 */  sll        $v1, $v1, 3
    /* 51ED0 80061ED0 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 51ED4 80061ED4 21082300 */  addu       $at, $at, $v1
    /* 51ED8 80061ED8 C9532480 */  lb         $a0, %lo(monster + 0x35)($at)
    /* 51EDC 80061EDC 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 51EE0 80061EE0 21082300 */  addu       $at, $at, $v1
    /* 51EE4 80061EE4 C8532580 */  lb         $a1, %lo(monster + 0x34)($at)
    /* 51EE8 80061EE8 C0200400 */  sll        $a0, $a0, 3
    /* 51EEC 80061EEC C0100500 */  sll        $v0, $a1, 3
    /* 51EF0 80061EF0 23104500 */  subu       $v0, $v0, $a1
    /* 51EF4 80061EF4 C0110200 */  sll        $v0, $v0, 7
    /* 51EF8 80061EF8 21208200 */  addu       $a0, $a0, $v0
    /* 51EFC 80061EFC 01000224 */  addiu      $v0, $zero, 0x1
    /* 51F00 80061F00 0E80013C */  lui        $at, %hi(dung_map)
    /* 51F04 80061F04 21082400 */  addu       $at, $at, $a0
    /* 51F08 80061F08 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 51F0C 80061F0C 1080013C */  lui        $at, %hi(monster + 0x5B)
    /* 51F10 80061F10 21082300 */  addu       $at, $at, $v1
    /* 51F14 80061F14 EF5322A0 */  sb         $v0, %lo(monster + 0x5B)($at)
    /* 51F18 80061F18 3052050C */  jal        func_801548C0
    /* 51F1C 80061F1C 00000000 */   nop
  .L80061F20:
    /* 51F20 80061F20 1280023C */  lui        $v0, %hi(nummissiles)
    /* 51F24 80061F24 88C2428C */  lw         $v0, %lo(nummissiles)($v0)
    /* 51F28 80061F28 00000000 */  nop
    /* 51F2C 80061F2C 66004018 */  blez       $v0, .L800620C8
    /* 51F30 80061F30 21880000 */   addu      $s1, $zero, $zero
    /* 51F34 80061F34 0E80133C */  lui        $s3, %hi(plr)
    /* 51F38 80061F38 38A57326 */  addiu      $s3, $s3, %lo(plr)
    /* 51F3C 80061F3C 40101100 */  sll        $v0, $s1, 1
  .L80061F40:
    /* 51F40 80061F40 1080013C */  lui        $at, %hi(missileactive)
    /* 51F44 80061F44 21082200 */  addu       $at, $at, $v0
    /* 51F48 80061F48 602A3084 */  lh         $s0, %lo(missileactive)($at)
    /* 51F4C 80061F4C 00000000 */  nop
    /* 51F50 80061F50 80101000 */  sll        $v0, $s0, 2
    /* 51F54 80061F54 21105000 */  addu       $v0, $v0, $s0
    /* 51F58 80061F58 80100200 */  sll        $v0, $v0, 2
    /* 51F5C 80061F5C 23105000 */  subu       $v0, $v0, $s0
    /* 51F60 80061F60 80200200 */  sll        $a0, $v0, 2
    /* 51F64 80061F64 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 51F68 80061F68 21082400 */  addu       $at, $at, $a0
    /* 51F6C 80061F6C 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 51F70 80061F70 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 51F74 80061F74 1D006214 */  bne        $v1, $v0, .L80061FEC
    /* 51F78 80061F78 80101000 */   sll       $v0, $s0, 2
    /* 51F7C 80061F7C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 51F80 80061F80 21082400 */  addu       $at, $at, $a0
    /* 51F84 80061F84 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 51F88 80061F88 02005312 */  beq        $s2, $s3, .L80061F94
    /* 51F8C 80061F8C 00000000 */   nop
    /* 51F90 80061F90 01004238 */  xori       $v0, $v0, 0x1
  .L80061F94:
    /* 51F94 80061F94 0100422C */  sltiu      $v0, $v0, 0x1
    /* 51F98 80061F98 13004010 */  beqz       $v0, .L80061FE8
    /* 51F9C 80061F9C 80181000 */   sll       $v1, $s0, 2
    /* 51FA0 80061FA0 21187000 */  addu       $v1, $v1, $s0
    /* 51FA4 80061FA4 80180300 */  sll        $v1, $v1, 2
    /* 51FA8 80061FA8 23187000 */  subu       $v1, $v1, $s0
    /* 51FAC 80061FAC 80180300 */  sll        $v1, $v1, 2
    /* 51FB0 80061FB0 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 51FB4 80061FB4 21082300 */  addu       $at, $at, $v1
    /* 51FB8 80061FB8 782C2484 */  lh         $a0, %lo(missile + 0x20)($at)
    /* 51FBC 80061FBC 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 51FC0 80061FC0 21082300 */  addu       $at, $at, $v1
    /* 51FC4 80061FC4 762C2394 */  lhu        $v1, %lo(missile + 0x1E)($at)
    /* 51FC8 80061FC8 40100400 */  sll        $v0, $a0, 1
    /* 51FCC 80061FCC 21104400 */  addu       $v0, $v0, $a0
    /* 51FD0 80061FD0 80100200 */  sll        $v0, $v0, 2
    /* 51FD4 80061FD4 21104400 */  addu       $v0, $v0, $a0
    /* 51FD8 80061FD8 C0100200 */  sll        $v0, $v0, 3
    /* 51FDC 80061FDC 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 51FE0 80061FE0 21082200 */  addu       $at, $at, $v0
    /* 51FE4 80061FE4 C75323A0 */  sb         $v1, %lo(monster + 0x33)($at)
  .L80061FE8:
    /* 51FE8 80061FE8 80101000 */  sll        $v0, $s0, 2
  .L80061FEC:
    /* 51FEC 80061FEC 21105000 */  addu       $v0, $v0, $s0
    /* 51FF0 80061FF0 80100200 */  sll        $v0, $v0, 2
    /* 51FF4 80061FF4 23105000 */  subu       $v0, $v0, $s0
    /* 51FF8 80061FF8 80200200 */  sll        $a0, $v0, 2
    /* 51FFC 80061FFC 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 52000 80062000 21082400 */  addu       $at, $at, $a0
    /* 52004 80062004 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 52008 80062008 0D000224 */  addiu      $v0, $zero, 0xD
    /* 5200C 8006200C 10006214 */  bne        $v1, $v0, .L80062050
    /* 52010 80062010 80101000 */   sll       $v0, $s0, 2
    /* 52014 80062014 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 52018 80062018 21082400 */  addu       $at, $at, $a0
    /* 5201C 8006201C 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 52020 80062020 02005312 */  beq        $s2, $s3, .L8006202C
    /* 52024 80062024 00000000 */   nop
    /* 52028 80062028 01004238 */  xori       $v0, $v0, 0x1
  .L8006202C:
    /* 5202C 8006202C 0100422C */  sltiu      $v0, $v0, 0x1
    /* 52030 80062030 07004010 */  beqz       $v0, .L80062050
    /* 52034 80062034 80101000 */   sll       $v0, $s0, 2
    /* 52038 80062038 B02A050C */  jal        func_8014AAC0
    /* 5203C 8006203C 21200002 */   addu      $a0, $s0, $zero
    /* 52040 80062040 21200002 */  addu       $a0, $s0, $zero
    /* 52044 80062044 3AEA040C */  jal        func_8013A8E8
    /* 52048 80062048 21282002 */   addu      $a1, $s1, $zero
    /* 5204C 8006204C 80101000 */  sll        $v0, $s0, 2
  .L80062050:
    /* 52050 80062050 21105000 */  addu       $v0, $v0, $s0
    /* 52054 80062054 80100200 */  sll        $v0, $v0, 2
    /* 52058 80062058 23105000 */  subu       $v0, $v0, $s0
    /* 5205C 8006205C 80200200 */  sll        $a0, $v0, 2
    /* 52060 80062060 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 52064 80062064 21082400 */  addu       $at, $at, $a0
    /* 52068 80062068 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 5206C 8006206C 22000224 */  addiu      $v0, $zero, 0x22
    /* 52070 80062070 0F006214 */  bne        $v1, $v0, .L800620B0
    /* 52074 80062074 00000000 */   nop
    /* 52078 80062078 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 5207C 8006207C 21082400 */  addu       $at, $at, $a0
    /* 52080 80062080 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 52084 80062084 02005312 */  beq        $s2, $s3, .L80062090
    /* 52088 80062088 00000000 */   nop
    /* 5208C 8006208C 01004238 */  xori       $v0, $v0, 0x1
  .L80062090:
    /* 52090 80062090 0100422C */  sltiu      $v0, $v0, 0x1
    /* 52094 80062094 06004010 */  beqz       $v0, .L800620B0
    /* 52098 80062098 00000000 */   nop
    /* 5209C 8006209C B02A050C */  jal        func_8014AAC0
    /* 520A0 800620A0 21200002 */   addu      $a0, $s0, $zero
    /* 520A4 800620A4 21200002 */  addu       $a0, $s0, $zero
    /* 520A8 800620A8 3AEA040C */  jal        func_8013A8E8
    /* 520AC 800620AC 21282002 */   addu      $a1, $s1, $zero
  .L800620B0:
    /* 520B0 800620B0 1280023C */  lui        $v0, %hi(nummissiles)
    /* 520B4 800620B4 88C2428C */  lw         $v0, %lo(nummissiles)($v0)
    /* 520B8 800620B8 01003126 */  addiu      $s1, $s1, 0x1
    /* 520BC 800620BC 2A102202 */  slt        $v0, $s1, $v0
    /* 520C0 800620C0 9FFF4014 */  bnez       $v0, .L80061F40
    /* 520C4 800620C4 40101100 */   sll       $v0, $s1, 1
  .L800620C8:
    /* 520C8 800620C8 2800BF8F */  lw         $ra, 0x28($sp)
    /* 520CC 800620CC 2400B38F */  lw         $s3, 0x24($sp)
    /* 520D0 800620D0 2000B28F */  lw         $s2, 0x20($sp)
    /* 520D4 800620D4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 520D8 800620D8 1800B08F */  lw         $s0, 0x18($sp)
    /* 520DC 800620DC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 520E0 800620E0 0800E003 */  jr         $ra
    /* 520E4 800620E4 00000000 */   nop
endlabel RemovePlrMissiles__FP12PlayerStruct
