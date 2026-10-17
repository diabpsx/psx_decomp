/* GMAIN.C -- Climax GLIBDEV bootstrap. Retail body/SYM authority:
 * C:\DIABPSX\GLIBDEV\SOURCE\GMAIN.C @0x80020E04. */
extern void GSYS_InitMachine(void);
extern void GAL_InitModule(void);
extern void TICK_InitModule(void);
extern void GU_InitModule(void);
extern void AppMain(void);

void main(void) __attribute__((section(".text.lib")));

void main(void)
{
    GSYS_InitMachine();
    GAL_InitModule();
    TICK_InitModule();
    GU_InitModule();
    AppMain();
    for (;;) {
    }
}
