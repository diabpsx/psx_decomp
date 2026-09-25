.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateL2Door__FiiUc, 0x15C

glabel OperateL2Door__FiiUc
    /* 49954 80059954 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 49958 80059958 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4995C 8005995C 21908000 */  addu       $s2, $a0, $zero
    /* 49960 80059960 1400B1AF */  sw         $s1, 0x14($sp)
    /* 49964 80059964 2188A000 */  addu       $s1, $a1, $zero
    /* 49968 80059968 40101100 */  sll        $v0, $s1, 1
    /* 4996C 8005996C 21105100 */  addu       $v0, $v0, $s1
    /* 49970 80059970 80100200 */  sll        $v0, $v0, 2
    /* 49974 80059974 23105100 */  subu       $v0, $v0, $s1
    /* 49978 80059978 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4997C 8005997C 80980200 */  sll        $s3, $v0, 2
    /* 49980 80059980 1000B0AF */  sw         $s0, 0x10($sp)
    /* 49984 80059984 40801200 */  sll        $s0, $s2, 1
    /* 49988 80059988 21801202 */  addu       $s0, $s0, $s2
    /* 4998C 8005998C 80801000 */  sll        $s0, $s0, 2
    /* 49990 80059990 21801202 */  addu       $s0, $s0, $s2
    /* 49994 80059994 00811000 */  sll        $s0, $s0, 4
    /* 49998 80059998 23801202 */  subu       $s0, $s0, $s2
    /* 4999C 8005999C 80801000 */  sll        $s0, $s0, 2
    /* 499A0 800599A0 21801202 */  addu       $s0, $s0, $s2
    /* 499A4 800599A4 C0801000 */  sll        $s0, $s0, 3
    /* 499A8 800599A8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 499AC 800599AC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 499B0 800599B0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 499B4 800599B4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 499B8 800599B8 21083300 */  addu       $at, $at, $s3
    /* 499BC 800599BC 6B8C2280 */  lb         $v0, %lo(object + 0x1F)($at)
    /* 499C0 800599C0 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 499C4 800599C4 21083000 */  addu       $at, $at, $s0
    /* 499C8 800599C8 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 499CC 800599CC 21A8C000 */  addu       $s5, $a2, $zero
    /* 499D0 800599D0 6D41000C */  jal        abs
    /* 499D4 800599D4 23204400 */   subu      $a0, $v0, $a0
    /* 499D8 800599D8 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 499DC 800599DC 21083300 */  addu       $at, $at, $s3
    /* 499E0 800599E0 6C8C2380 */  lb         $v1, %lo(object + 0x20)($at)
    /* 499E4 800599E4 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 499E8 800599E8 21083000 */  addu       $at, $at, $s0
    /* 499EC 800599EC 6AA52484 */  lh         $a0, %lo(plr + 0x32)($at)
    /* 499F0 800599F0 21804000 */  addu       $s0, $v0, $zero
    /* 499F4 800599F4 6D41000C */  jal        abs
    /* 499F8 800599F8 23206400 */   subu      $a0, $v1, $a0
    /* 499FC 800599FC 21A04000 */  addu       $s4, $v0, $zero
    /* 49A00 80059A00 01000224 */  addiu      $v0, $zero, 0x1
    /* 49A04 80059A04 0F000216 */  bne        $s0, $v0, .L80059A44
    /* 49A08 80059A08 0200022A */   slti      $v0, $s0, 0x2
    /* 49A0C 80059A0C 0200822A */  slti       $v0, $s4, 0x2
    /* 49A10 80059A10 0B004010 */  beqz       $v0, .L80059A40
    /* 49A14 80059A14 2A000224 */   addiu     $v0, $zero, 0x2A
    /* 49A18 80059A18 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 49A1C 80059A1C 21083300 */  addu       $at, $at, $s3
    /* 49A20 80059A20 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 49A24 80059A24 00000000 */  nop
    /* 49A28 80059A28 06006214 */  bne        $v1, $v0, .L80059A44
    /* 49A2C 80059A2C 0200022A */   slti      $v0, $s0, 0x2
    /* 49A30 80059A30 21204002 */  addu       $a0, $s2, $zero
    /* 49A34 80059A34 21282002 */  addu       $a1, $s1, $zero
    /* 49A38 80059A38 CA59010C */  jal        OperateL2LDoor__FiiUc
    /* 49A3C 80059A3C FF00A632 */   andi      $a2, $s5, 0xFF
  .L80059A40:
    /* 49A40 80059A40 0200022A */  slti       $v0, $s0, 0x2
  .L80059A44:
    /* 49A44 80059A44 10004010 */  beqz       $v0, .L80059A88
    /* 49A48 80059A48 01000224 */   addiu     $v0, $zero, 0x1
    /* 49A4C 80059A4C 0E008216 */  bne        $s4, $v0, .L80059A88
    /* 49A50 80059A50 40101100 */   sll       $v0, $s1, 1
    /* 49A54 80059A54 21105100 */  addu       $v0, $v0, $s1
    /* 49A58 80059A58 80100200 */  sll        $v0, $v0, 2
    /* 49A5C 80059A5C 23105100 */  subu       $v0, $v0, $s1
    /* 49A60 80059A60 80100200 */  sll        $v0, $v0, 2
    /* 49A64 80059A64 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 49A68 80059A68 21082200 */  addu       $at, $at, $v0
    /* 49A6C 80059A6C 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 49A70 80059A70 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 49A74 80059A74 04006214 */  bne        $v1, $v0, .L80059A88
    /* 49A78 80059A78 21204002 */   addu      $a0, $s2, $zero
    /* 49A7C 80059A7C 21282002 */  addu       $a1, $s1, $zero
    /* 49A80 80059A80 EF58010C */  jal        OperateL2RDoor__FiiUc
    /* 49A84 80059A84 FF00A632 */   andi      $a2, $s5, 0xFF
  .L80059A88:
    /* 49A88 80059A88 2800BF8F */  lw         $ra, 0x28($sp)
    /* 49A8C 80059A8C 2400B58F */  lw         $s5, 0x24($sp)
    /* 49A90 80059A90 2000B48F */  lw         $s4, 0x20($sp)
    /* 49A94 80059A94 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 49A98 80059A98 1800B28F */  lw         $s2, 0x18($sp)
    /* 49A9C 80059A9C 1400B18F */  lw         $s1, 0x14($sp)
    /* 49AA0 80059AA0 1000B08F */  lw         $s0, 0x10($sp)
    /* 49AA4 80059AA4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 49AA8 80059AA8 0800E003 */  jr         $ra
    /* 49AAC 80059AAC 00000000 */   nop
endlabel OperateL2Door__FiiUc
