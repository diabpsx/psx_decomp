struct TSnd {   /* sizeof 1 (opaque legacy handle -- PSX code never touches its fields) */
};

struct TSFX {   /* sizeof 4 */
    unsigned char Channel;   /* +0x0 */
    unsigned char bFlags;   /* +0x1 */
    unsigned short pszName;   /* +0x2 */
};

struct SFXHDR;   /* opaque here -- only passed by pointer (STR_PlaySound/STR_SoundCommand) */
