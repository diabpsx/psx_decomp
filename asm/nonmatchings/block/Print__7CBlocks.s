.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Print__7CBlocks, 0x11C

glabel Print__7CBlocks
    /* 7E140 8008E140 0E80023C */  lui        $v0, %hi(plr + 0x154)
    /* 7E144 8008E144 8CA64290 */  lbu        $v0, %lo(plr + 0x154)($v0)
    /* 7E148 8008E148 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7E14C 8008E14C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7E150 8008E150 21808000 */  addu       $s0, $a0, $zero
    /* 7E154 8008E154 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 7E158 8008E158 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7E15C 8008E15C 06004014 */  bnez       $v0, .L8008E178
    /* 7E160 8008E160 1400B1AF */   sw        $s1, 0x14($sp)
    /* 7E164 8008E164 0E80023C */  lui        $v0, %hi(plr + 0x1B3C)
    /* 7E168 8008E168 74C04290 */  lbu        $v0, %lo(plr + 0x1B3C)($v0)
    /* 7E16C 8008E16C 00000000 */  nop
    /* 7E170 8008E170 05004010 */  beqz       $v0, .L8008E188
    /* 7E174 8008E174 00000000 */   nop
  .L8008E178:
    /* 7E178 8008E178 01000224 */  addiu      $v0, $zero, 0x1
    /* 7E17C 8008E17C DC1E82AF */  sw         $v0, %gp_rel(D_8011C65C)($gp)
    /* 7E180 8008E180 63380208 */  j          .L8008E18C
    /* 7E184 8008E184 00000000 */   nop
  .L8008E188:
    /* 7E188 8008E188 DC1E80AF */  sw         $zero, %gp_rel(D_8011C65C)($gp)
  .L8008E18C:
    /* 7E18C 8008E18C D2000386 */  lh         $v1, 0xD2($s0)
    /* 7E190 8008E190 7C00028E */  lw         $v0, 0x7C($s0)
    /* 7E194 8008E194 21200002 */  addu       $a0, $s0, $zero
    /* 7E198 8008E198 23906200 */  subu       $s2, $v1, $v0
    /* 7E19C 8008E19C D6000386 */  lh         $v1, 0xD6($s0)
    /* 7E1A0 8008E1A0 8000028E */  lw         $v0, 0x80($s0)
    /* 7E1A4 8008E1A4 21284002 */  addu       $a1, $s2, $zero
    /* 7E1A8 8008E1A8 23886200 */  subu       $s1, $v1, $v0
    /* 7E1AC 8008E1AC 1F38020C */  jal        MyRoutine__FR7CBlocksii
    /* 7E1B0 8008E1B0 21302002 */   addu      $a2, $s1, $zero
    /* 7E1B4 8008E1B4 1280023C */  lui        $v0, %hi(leveltype)
    /* 7E1B8 8008E1B8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 7E1BC 8008E1BC 00000000 */  nop
    /* 7E1C0 8008E1C0 0A004014 */  bnez       $v0, .L8008E1EC
    /* 7E1C4 8008E1C4 21200002 */   addu      $a0, $s0, $zero
    /* 7E1C8 8008E1C8 21284002 */  addu       $a1, $s2, $zero
    /* 7E1CC 8008E1CC 4543020C */  jal        PrintItems__7CBlocksii
    /* 7E1D0 8008E1D0 21302002 */   addu      $a2, $s1, $zero
    /* 7E1D4 8008E1D4 21200002 */  addu       $a0, $s0, $zero
    /* 7E1D8 8008E1D8 21284002 */  addu       $a1, $s2, $zero
    /* 7E1DC 8008E1DC 3E40020C */  jal        PrintTowners__7CBlocksii
    /* 7E1E0 8008E1E0 21302002 */   addu      $a2, $s1, $zero
    /* 7E1E4 8008E1E4 8B380208 */  j          .L8008E22C
    /* 7E1E8 8008E1E8 21200002 */   addu      $a0, $s0, $zero
  .L8008E1EC:
    /* 7E1EC 8008E1EC 21284002 */  addu       $a1, $s2, $zero
    /* 7E1F0 8008E1F0 7D42020C */  jal        PrintDead__7CBlocksii
    /* 7E1F4 8008E1F4 21302002 */   addu      $a2, $s1, $zero
    /* 7E1F8 8008E1F8 21200002 */  addu       $a0, $s0, $zero
    /* 7E1FC 8008E1FC 21284002 */  addu       $a1, $s2, $zero
    /* 7E200 8008E200 7E3D020C */  jal        PrintMonsters__7CBlocksii
    /* 7E204 8008E204 21302002 */   addu      $a2, $s1, $zero
    /* 7E208 8008E208 21200002 */  addu       $a0, $s0, $zero
    /* 7E20C 8008E20C 21284002 */  addu       $a1, $s2, $zero
    /* 7E210 8008E210 4341020C */  jal        PrintObjects__7CBlocksii
    /* 7E214 8008E214 21302002 */   addu      $a2, $s1, $zero
    /* 7E218 8008E218 21200002 */  addu       $a0, $s0, $zero
    /* 7E21C 8008E21C 21284002 */  addu       $a1, $s2, $zero
    /* 7E220 8008E220 4543020C */  jal        PrintItems__7CBlocksii
    /* 7E224 8008E224 21302002 */   addu      $a2, $s1, $zero
    /* 7E228 8008E228 21200002 */  addu       $a0, $s0, $zero
  .L8008E22C:
    /* 7E22C 8008E22C 21284002 */  addu       $a1, $s2, $zero
    /* 7E230 8008E230 FB44020C */  jal        PrintMissiles__7CBlocksii
    /* 7E234 8008E234 21302002 */   addu      $a2, $s1, $zero
    /* 7E238 8008E238 7C0000AE */  sw         $zero, 0x7C($s0)
    /* 7E23C 8008E23C 800000AE */  sw         $zero, 0x80($s0)
    /* 7E240 8008E240 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 7E244 8008E244 1800B28F */  lw         $s2, 0x18($sp)
    /* 7E248 8008E248 1400B18F */  lw         $s1, 0x14($sp)
    /* 7E24C 8008E24C 1000B08F */  lw         $s0, 0x10($sp)
    /* 7E250 8008E250 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7E254 8008E254 0800E003 */  jr         $ra
    /* 7E258 8008E258 00000000 */   nop
endlabel Print__7CBlocks
