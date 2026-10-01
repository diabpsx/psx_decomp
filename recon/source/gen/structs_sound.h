struct TSnd {   /* sizeof 1 (opaque legacy handle -- PSX code never touches its fields) */
};

struct TSFX {   /* sizeof 4 */
    unsigned char Channel;   /* +0x0 */
    unsigned char bFlags;   /* +0x1 */
    unsigned short pszName;   /* +0x2 */
};

struct SFXHDR {   /* retail STREAM.H layout: 132 bytes */
    char used, loop, playing, state;
    BOOL TaskAlive;
    struct STRHDR *StreamHND;
    unsigned char type, ChunkGot;
    int voice, volume, s_volume, pitch;
    int stream_sec, stream_offs, stream_read, stream_stall, stream_pos;
    int SPU_frame, SPU_sec, SPU_pos, SPUstreamaddr;
    int framecount, lastcount, sec_num, SPU_sec_num;
    int ah, stream_ending, DMA_size, spu_rate, SizeIn;
    unsigned char *mem;
    unsigned long stream_playing;
    int SfxNo;
    char name[14];
};
