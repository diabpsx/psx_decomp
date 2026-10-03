/* TICK.C -- Climax GLIBDEV tick utilities. Retail body/SYM authority:
 * C:\DIABPSX\GLIBDEV\SOURCE\TICK.C @0x80020BEC. */
typedef unsigned long u_long;
#define LIBTEXT __attribute__((section(".text.lib")))

u_long GazTick;

void TICK_InitModule(void) LIBTEXT;
void TICK_Set(u_long Val) LIBTEXT;
u_long TICK_Get(void) LIBTEXT;
void TICK_Update(void) LIBTEXT;
u_long TICK_GetAge(u_long OldTick) LIBTEXT;
char *TICK_GetDateString(void) LIBTEXT;
char *TICK_GetTimeString(void) LIBTEXT;

void TICK_InitModule(void) { TICK_Set(0); }
void TICK_Set(u_long Val) { GazTick = Val; }
u_long TICK_Get(void) { return GazTick; }
void TICK_Update(void) { GazTick++; }
u_long TICK_GetAge(u_long OldTick) { return TICK_Get() - OldTick; }
char *TICK_GetDateString(void) { return "Jan 19 1998"; }
char *TICK_GetTimeString(void) { return "15:19:35"; }
