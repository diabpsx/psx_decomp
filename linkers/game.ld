SECTIONS
{
    HIDDEN(__romPos = 0);
    _gp = 0x8011A780;
    game_ROM_START = __romPos;
    game_VRAM = ADDR(.game);
    .game 0x80139BF8 : AT(game_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        game_RODATA_START = .;
        build/src/gameonly.c.o(.rodata);
        build/src/missiles.c.o(.rodata);
        build/src/monster.c.o(.rodata);
        build/src/inv.c.o(.rodata);
        build/src/automap.c.o(.rodata);
        . = ALIGN(., 16);
        game_RODATA_END = .;
        game_RODATA_SIZE = ABSOLUTE(game_RODATA_END - game_RODATA_START);
        game_TEXT_START = .;
        build/src/gameonly.c.o(.text);
        build/src/missiles.c.o(.text);
        build/src/monster.c.o(.text);
        build/src/inv.c.o(.text);
        build/src/automap.c.o(.text);
        . = ALIGN(., 16);
        game_TEXT_END = .;
        game_TEXT_SIZE = ABSOLUTE(game_TEXT_END - game_TEXT_START);
        game_DATA_START = .;
        build/asm/data/game_hdr.data.s.o(.data);
        build/src/gameonly.c.o(.data);
        build/src/missiles.c.o(.data);
        build/src/monster.c.o(.data);
        build/src/inv.c.o(.data);
        build/src/automap.c.o(.data);
        . = ALIGN(., 16);
        game_DATA_END = .;
        game_DATA_SIZE = ABSOLUTE(game_DATA_END - game_DATA_START);
        game_BSS_START = .;
        build/src/gameonly.c.o(.bss);
        build/src/missiles.c.o(.bss);
        build/src/monster.c.o(.bss);
        build/src/inv.c.o(.bss);
        build/src/automap.c.o(.bss);
        . = ALIGN(., 16);
        game_BSS_END = .;
        game_BSS_SIZE = ABSOLUTE(game_BSS_END - game_BSS_START);
    }
    __romPos += SIZEOF(.game);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    game_ROM_END = __romPos;
    game_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
