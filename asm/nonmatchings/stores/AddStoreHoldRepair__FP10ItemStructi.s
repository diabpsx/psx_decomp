.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddStoreHoldRepair__FP10ItemStructi, 0x1E8

glabel AddStoreHoldRepair__FP10ItemStructi
    /* 5BBEC 8006BBEC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5BBF0 8006BBF0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5BBF4 8006BBF4 21808000 */  addu       $s0, $a0, $zero
    /* 5BBF8 8006BBF8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 5BBFC 8006BBFC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 5BC00 8006BC00 40000286 */  lh         $v0, 0x40($s0)
    /* 5BC04 8006BC04 00000000 */  nop
    /* 5BC08 8006BC08 0600401C */  bgtz       $v0, .L8006BC24
    /* 5BC0C 8006BC0C 2188A000 */   addu      $s1, $a1, $zero
    /* 5BC10 8006BC10 21200000 */  addu       $a0, $zero, $zero
    /* 5BC14 8006BC14 1180053C */  lui        $a1, %hi(D_80117968)
    /* 5BC18 8006BC18 6879A524 */  addiu      $a1, $a1, %lo(D_80117968)
    /* 5BC1C 8006BC1C A583000C */  jal        DBG_Error
    /* 5BC20 8006BC20 07040624 */   addiu     $a2, $zero, 0x407
  .L8006BC24:
    /* 5BC24 8006BC24 21380002 */  addu       $a3, $s0, $zero
    /* 5BC28 8006BC28 6000E824 */  addiu      $t0, $a3, 0x60
    /* 5BC2C 8006BC2C 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5BC30 8006BC30 0E80043C */  lui        $a0, %hi(storehold)
    /* 5BC34 8006BC34 881D8424 */  addiu      $a0, $a0, %lo(storehold)
    /* 5BC38 8006BC38 C0180200 */  sll        $v1, $v0, 3
    /* 5BC3C 8006BC3C 23186200 */  subu       $v1, $v1, $v0
    /* 5BC40 8006BC40 80180300 */  sll        $v1, $v1, 2
    /* 5BC44 8006BC44 23186200 */  subu       $v1, $v1, $v0
    /* 5BC48 8006BC48 80180300 */  sll        $v1, $v1, 2
    /* 5BC4C 8006BC4C 21306400 */  addu       $a2, $v1, $a0
  .L8006BC50:
    /* 5BC50 8006BC50 0000E28C */  lw         $v0, 0x0($a3)
    /* 5BC54 8006BC54 0400E38C */  lw         $v1, 0x4($a3)
    /* 5BC58 8006BC58 0800E48C */  lw         $a0, 0x8($a3)
    /* 5BC5C 8006BC5C 0C00E58C */  lw         $a1, 0xC($a3)
    /* 5BC60 8006BC60 0000C2AC */  sw         $v0, 0x0($a2)
    /* 5BC64 8006BC64 0400C3AC */  sw         $v1, 0x4($a2)
    /* 5BC68 8006BC68 0800C4AC */  sw         $a0, 0x8($a2)
    /* 5BC6C 8006BC6C 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 5BC70 8006BC70 1000E724 */  addiu      $a3, $a3, 0x10
    /* 5BC74 8006BC74 F6FFE814 */  bne        $a3, $t0, .L8006BC50
    /* 5BC78 8006BC78 1000C624 */   addiu     $a2, $a2, 0x10
    /* 5BC7C 8006BC7C 0000E28C */  lw         $v0, 0x0($a3)
    /* 5BC80 8006BC80 0400E38C */  lw         $v1, 0x4($a3)
    /* 5BC84 8006BC84 0800E48C */  lw         $a0, 0x8($a3)
    /* 5BC88 8006BC88 0000C2AC */  sw         $v0, 0x0($a2)
    /* 5BC8C 8006BC8C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 5BC90 8006BC90 0800C4AC */  sw         $a0, 0x8($a2)
    /* 5BC94 8006BC94 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5BC98 8006BC98 00000000 */  nop
    /* 5BC9C 8006BC9C C0100300 */  sll        $v0, $v1, 3
    /* 5BCA0 8006BCA0 23104300 */  subu       $v0, $v0, $v1
    /* 5BCA4 8006BCA4 80100200 */  sll        $v0, $v0, 2
    /* 5BCA8 8006BCA8 23104300 */  subu       $v0, $v0, $v1
    /* 5BCAC 8006BCAC 80100200 */  sll        $v0, $v0, 2
    /* 5BCB0 8006BCB0 0E80033C */  lui        $v1, %hi(storehold)
    /* 5BCB4 8006BCB4 881D6324 */  addiu      $v1, $v1, %lo(storehold)
    /* 5BCB8 8006BCB8 21804300 */  addu       $s0, $v0, $v1
    /* 5BCBC 8006BCBC 51000282 */  lb         $v0, 0x51($s0)
    /* 5BCC0 8006BCC0 00000000 */  nop
    /* 5BCC4 8006BCC4 10004010 */  beqz       $v0, .L8006BD08
    /* 5BCC8 8006BCC8 00000000 */   nop
    /* 5BCCC 8006BCCC 69000282 */  lb         $v0, 0x69($s0)
    /* 5BCD0 8006BCD0 00000000 */  nop
    /* 5BCD4 8006BCD4 0C004010 */  beqz       $v0, .L8006BD08
    /* 5BCD8 8006BCD8 EB51043C */   lui       $a0, (0x51EB851F >> 16)
    /* 5BCDC 8006BCDC 1800038E */  lw         $v1, 0x18($s0)
    /* 5BCE0 8006BCE0 1F858434 */  ori        $a0, $a0, (0x51EB851F & 0xFFFF)
    /* 5BCE4 8006BCE4 00110300 */  sll        $v0, $v1, 4
    /* 5BCE8 8006BCE8 23104300 */  subu       $v0, $v0, $v1
    /* 5BCEC 8006BCEC 40100200 */  sll        $v0, $v0, 1
    /* 5BCF0 8006BCF0 18004400 */  mult       $v0, $a0
    /* 5BCF4 8006BCF4 C3170200 */  sra        $v0, $v0, 31
    /* 5BCF8 8006BCF8 10480000 */  mfhi       $t1
    /* 5BCFC 8006BCFC 43190900 */  sra        $v1, $t1, 5
    /* 5BD00 8006BD00 23186200 */  subu       $v1, $v1, $v0
    /* 5BD04 8006BD04 140003AE */  sw         $v1, 0x14($s0)
  .L8006BD08:
    /* 5BD08 8006BD08 40000486 */  lh         $a0, 0x40($s0)
    /* 5BD0C 8006BD0C 3E000386 */  lh         $v1, 0x3E($s0)
    /* 5BD10 8006BD10 00000000 */  nop
    /* 5BD14 8006BD14 23188300 */  subu       $v1, $a0, $v1
    /* 5BD18 8006BD18 40100300 */  sll        $v0, $v1, 1
    /* 5BD1C 8006BD1C 21104300 */  addu       $v0, $v0, $v1
    /* 5BD20 8006BD20 C0100200 */  sll        $v0, $v0, 3
    /* 5BD24 8006BD24 21104300 */  addu       $v0, $v0, $v1
    /* 5BD28 8006BD28 80100200 */  sll        $v0, $v0, 2
    /* 5BD2C 8006BD2C 1A004400 */  div        $zero, $v0, $a0
    /* 5BD30 8006BD30 12200000 */  mflo       $a0
    /* 5BD34 8006BD34 1400028E */  lw         $v0, 0x14($s0)
    /* 5BD38 8006BD38 00000000 */  nop
    /* 5BD3C 8006BD3C 18008200 */  mult       $a0, $v0
    /* 5BD40 8006BD40 12100000 */  mflo       $v0
    /* 5BD44 8006BD44 EB51033C */  lui        $v1, (0x51EB851F >> 16)
    /* 5BD48 8006BD48 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 5BD4C 8006BD4C 18004300 */  mult       $v0, $v1
    /* 5BD50 8006BD50 C3170200 */  sra        $v0, $v0, 31
    /* 5BD54 8006BD54 10480000 */  mfhi       $t1
    /* 5BD58 8006BD58 43190900 */  sra        $v1, $t1, 5
    /* 5BD5C 8006BD5C 23206200 */  subu       $a0, $v1, $v0
    /* 5BD60 8006BD60 0B008014 */  bnez       $a0, .L8006BD90
    /* 5BD64 8006BD64 02008228 */   slti      $v0, $a0, 0x2
    /* 5BD68 8006BD68 51000282 */  lb         $v0, 0x51($s0)
    /* 5BD6C 8006BD6C 00000000 */  nop
    /* 5BD70 8006BD70 05004010 */  beqz       $v0, .L8006BD88
    /* 5BD74 8006BD74 00000000 */   nop
    /* 5BD78 8006BD78 69000282 */  lb         $v0, 0x69($s0)
    /* 5BD7C 8006BD7C 00000000 */  nop
    /* 5BD80 8006BD80 0E004014 */  bnez       $v0, .L8006BDBC
    /* 5BD84 8006BD84 00000000 */   nop
  .L8006BD88:
    /* 5BD88 8006BD88 01000424 */  addiu      $a0, $zero, 0x1
    /* 5BD8C 8006BD8C 02008228 */  slti       $v0, $a0, 0x2
  .L8006BD90:
    /* 5BD90 8006BD90 02004014 */  bnez       $v0, .L8006BD9C
    /* 5BD94 8006BD94 00000000 */   nop
    /* 5BD98 8006BD98 43200400 */  sra        $a0, $a0, 1
  .L8006BD9C:
    /* 5BD9C 8006BD9C 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5BDA0 8006BDA0 180004AE */  sw         $a0, 0x18($s0)
    /* 5BDA4 8006BDA4 140004AE */  sw         $a0, 0x14($s0)
    /* 5BDA8 8006BDA8 01006224 */  addiu      $v0, $v1, 0x1
    /* 5BDAC 8006BDAC 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5BDB0 8006BDB0 0E80013C */  lui        $at, %hi(storehidx)
    /* 5BDB4 8006BDB4 21082300 */  addu       $at, $at, $v1
    /* 5BDB8 8006BDB8 C83131A0 */  sb         $s1, %lo(storehidx)($at)
  .L8006BDBC:
    /* 5BDBC 8006BDBC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 5BDC0 8006BDC0 1400B18F */  lw         $s1, 0x14($sp)
    /* 5BDC4 8006BDC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 5BDC8 8006BDC8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5BDCC 8006BDCC 0800E003 */  jr         $ra
    /* 5BDD0 8006BDD0 00000000 */   nop
endlabel AddStoreHoldRepair__FP10ItemStructi
