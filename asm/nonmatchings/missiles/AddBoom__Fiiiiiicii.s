.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBoom__Fiiiiiicii, 0xA4

glabel AddBoom__Fiiiiiicii
    /* 704C 80140C44 80100400 */  sll        $v0, $a0, 2
    /* 7050 80140C48 21104400 */  addu       $v0, $v0, $a0
    /* 7054 80140C4C 80100200 */  sll        $v0, $v0, 2
    /* 7058 80140C50 23104400 */  subu       $v0, $v0, $a0
    /* 705C 80140C54 80100200 */  sll        $v0, $v0, 2
    /* 7060 80140C58 1000A48F */  lw         $a0, 0x10($sp)
    /* 7064 80140C5C 2000A58F */  lw         $a1, 0x20($sp)
    /* 7068 80140C60 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 706C 80140C64 21082200 */  addu       $at, $at, $v0
    /* 7070 80140C68 9A2C2390 */  lbu        $v1, %lo(missile + 0x42)($at)
    /* 7074 80140C6C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 7078 80140C70 21082200 */  addu       $at, $at, $v0
    /* 707C 80140C74 892C27A0 */  sb         $a3, %lo(missile + 0x31)($at)
    /* 7080 80140C78 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 7084 80140C7C 21082200 */  addu       $at, $at, $v0
    /* 7088 80140C80 8D2C27A0 */  sb         $a3, %lo(missile + 0x35)($at)
    /* 708C 80140C84 1080013C */  lui        $at, %hi(missile)
    /* 7090 80140C88 21082200 */  addu       $at, $at, $v0
    /* 7094 80140C8C 582C20AC */  sw         $zero, %lo(missile)($at)
    /* 7098 80140C90 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 709C 80140C94 21082200 */  addu       $at, $at, $v0
    /* 70A0 80140C98 5C2C20AC */  sw         $zero, %lo(missile + 0x4)($at)
    /* 70A4 80140C9C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 70A8 80140CA0 21082200 */  addu       $at, $at, $v0
    /* 70AC 80140CA4 762C20A4 */  sh         $zero, %lo(missile + 0x1E)($at)
    /* 70B0 80140CA8 001E0300 */  sll        $v1, $v1, 24
    /* 70B4 80140CAC 031E0300 */  sra        $v1, $v1, 24
    /* 70B8 80140CB0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 70BC 80140CB4 21082200 */  addu       $at, $at, $v0
    /* 70C0 80140CB8 8A2C24A0 */  sb         $a0, %lo(missile + 0x32)($at)
    /* 70C4 80140CBC 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 70C8 80140CC0 21082200 */  addu       $at, $at, $v0
    /* 70CC 80140CC4 8E2C24A0 */  sb         $a0, %lo(missile + 0x36)($at)
    /* 70D0 80140CC8 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 70D4 80140CCC 21082200 */  addu       $at, $at, $v0
    /* 70D8 80140CD0 682C25AC */  sw         $a1, %lo(missile + 0x10)($at)
    /* 70DC 80140CD4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 70E0 80140CD8 21082200 */  addu       $at, $at, $v0
    /* 70E4 80140CDC 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 70E8 80140CE0 0800E003 */  jr         $ra
    /* 70EC 80140CE4 00000000 */   nop
endlabel AddBoom__Fiiiiiicii
