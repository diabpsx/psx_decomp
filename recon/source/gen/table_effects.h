/* Retail PSX bank order: TSFX { Channel, bFlags, numeric bank ID }.
 * Unlike the PC EFFECTS.H filename table, all 992 IDs are sequential and
 * every channel starts at zero. Runs retain the exact retail flag values. */
#define PSX_SFX_1(f, n) {0, (f), (n)},
#define PSX_SFX_2(f, n) PSX_SFX_1(f, n) PSX_SFX_1(f, (n) + 1)
#define PSX_SFX_4(f, n) PSX_SFX_2(f, n) PSX_SFX_2(f, (n) + 2)
#define PSX_SFX_8(f, n) PSX_SFX_4(f, n) PSX_SFX_4(f, (n) + 4)
#define PSX_SFX_16(f, n) PSX_SFX_8(f, n) PSX_SFX_8(f, (n) + 8)
#define PSX_SFX_32(f, n) PSX_SFX_16(f, n) PSX_SFX_16(f, (n) + 16)
#define PSX_SFX_64(f, n) PSX_SFX_32(f, n) PSX_SFX_32(f, (n) + 32)
#define PSX_SFX_128(f, n) PSX_SFX_64(f, n) PSX_SFX_64(f, (n) + 64)
#define PSX_SFX_256(f, n) PSX_SFX_128(f, n) PSX_SFX_128(f, (n) + 128)

TSFX sgSFX[992] = {
    PSX_SFX_8(0x04, 0x000)
    PSX_SFX_4(0x04, 0x008)
    PSX_SFX_1(0x01, 0x00C)
    PSX_SFX_32(0x04, 0x00D)
    PSX_SFX_1(0x04, 0x02D)
    PSX_SFX_1(0x01, 0x02E)
    PSX_SFX_2(0x04, 0x02F)
    PSX_SFX_1(0x04, 0x031)
    PSX_SFX_2(0x08, 0x032)
    PSX_SFX_1(0x08, 0x034)
    PSX_SFX_32(0x04, 0x035)
    PSX_SFX_16(0x04, 0x055)
    PSX_SFX_4(0x04, 0x065)
    PSX_SFX_1(0x01, 0x069)
    PSX_SFX_1(0x04, 0x06A)
    PSX_SFX_1(0x01, 0x06B)
    PSX_SFX_8(0x04, 0x06C)
    PSX_SFX_4(0x04, 0x074)
    PSX_SFX_1(0x04, 0x078)
    PSX_SFX_64(0x02, 0x079)
    PSX_SFX_32(0x02, 0x0B9)
    PSX_SFX_2(0x00, 0x0D9)
    PSX_SFX_8(0x04, 0x0DB)
    PSX_SFX_4(0x04, 0x0E3)
    PSX_SFX_1(0x04, 0x0E7)
    PSX_SFX_256(0x02, 0x0E8)
    PSX_SFX_16(0x02, 0x1E8)
    PSX_SFX_4(0x02, 0x1F8)
    PSX_SFX_64(0x42, 0x1FC)
    PSX_SFX_4(0x42, 0x23C)
    PSX_SFX_2(0x04, 0x240)
    PSX_SFX_32(0x42, 0x242)
    PSX_SFX_2(0x42, 0x262)
    PSX_SFX_64(0x12, 0x264)
    PSX_SFX_4(0x12, 0x2A4)
    PSX_SFX_2(0x04, 0x2A8)
    PSX_SFX_32(0x12, 0x2AA)
    PSX_SFX_2(0x12, 0x2CA)
    PSX_SFX_64(0x22, 0x2CC)
    PSX_SFX_8(0x22, 0x30C)
    PSX_SFX_2(0x22, 0x314)
    PSX_SFX_2(0x04, 0x316)
    PSX_SFX_32(0x22, 0x318)
    PSX_SFX_4(0x22, 0x338)
    PSX_SFX_2(0x22, 0x33C)
    PSX_SFX_1(0x22, 0x33E)
    PSX_SFX_8(0x02, 0x33F)
    PSX_SFX_1(0x02, 0x347)
    PSX_SFX_1(0x01, 0x348)
    PSX_SFX_16(0x02, 0x349)
    PSX_SFX_4(0x02, 0x359)
    PSX_SFX_64(0x04, 0x35D)
    PSX_SFX_32(0x04, 0x39D)
    PSX_SFX_16(0x04, 0x3BD)
    PSX_SFX_4(0x04, 0x3CD)
    PSX_SFX_2(0x04, 0x3D1)
    PSX_SFX_1(0x08, 0x3D3)
    PSX_SFX_8(0x02, 0x3D4)
    PSX_SFX_2(0x02, 0x3DC)
    PSX_SFX_2(0x04, 0x3DE)
};
#undef PSX_SFX_1
#undef PSX_SFX_2
#undef PSX_SFX_4
#undef PSX_SFX_8
#undef PSX_SFX_16
#undef PSX_SFX_32
#undef PSX_SFX_64
#undef PSX_SFX_128
#undef PSX_SFX_256
