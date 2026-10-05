/* EA EACLIB VARS -- data-only runtime state.
 * Twin: nfs4-decomp/recon/eaclib/psx/eacpsxz/vars.c and the NFS2 PC beta
 * vars.asm declarations. Diablo retains finebios, biosticks, cdreaddone and
 * timerperiod; it predates currentfilesystem/availablefilesystems. Initial
 * values and declaration order are verified against Diablo's retail image.
 */
void (*tmrsub[8])(void) = { 0 };
void (*vbltmrsub[8])(void) = { 0 };

int library = 4;
int disablecd = 1;
int kanjiwidth = 0;
int grmode = 0;
int mouseflag = 0;
int mx = 0;
int my = 0;
int mbuttons = 0;
int mouseshown = 0;
int mouseratio = 0;
int numjoy = 0;
int screenwidth = 0;
int screenheight = 0;
int screenbpp = 0;
int screenvisiblex = 16;
int screenvisibley = 16;
int screenvisiblew = 288;
int screenvisibleh = 208;
int zclipvalue = 10;
int zclipflag = 0;
volatile int ticks = 0;
volatile int libticks = 0;
volatile int finebios = 0;
volatile int biosticks = 0;
int vblflag = 0;
int pageflipflag = 0;
int vblticks = 0;
int debugexit = 0;
int cdreaddone = 0;
int timerhz = 100;
int timerperiod = 0;
int mb_default = 0;
int loadfilesize = 0;
int sendtoprintmem = 0;
int cenxpix = 160;
int cenypix = 100;
int originx = 0;
int originy = 0;
int centerx = 160;
int centery = 100;
int xscale = 0;
int yscale = 0;
int xbangle = 0;
int ybangle = 0;
int aspectratio = 0x10000;
