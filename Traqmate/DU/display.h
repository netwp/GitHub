#ifndef DISPLAY_H
#define DISPLAY_H

#include <tmtypes.h>

//	This is the Software Revision number in the format
//	software version * 100 (xxx.yy) 65535 = 655.35
#define SWREV	370		// 3.70 fixed timing loops
						// 3.50 added camera selection
						// 3.40 added build dates on DRIVE SAFELY screen
						// 3.33 no changes, 3.31 fixed tach synchronization bug
						// 3.30	GoPro, bug fixes
						// 3.15 su2 compatible, AutoOn implemented, new repairsession, lanc status, timing tweaks
						// backed down super code optimization on cygnalflash, dataflash, cygfx120, factorytest, fdl, display
						// added start screen and auto on support
						// added 1/8 and 1/4 mile modes
						// changed clear s/f default to no
						// eliminated wait for camera for traqtach, traqdata1
#define HWREV	101		// 1.01 of DU board
#define MODELNUM	2	// DU is model number 2

// compilation controls
#undef DISPLAYATTACHED
#undef GMETER_ENABLED

//------------------------------------------------------------------------------------
// Display.h
//------------------------------------------------------------------------------------
// Copyright 2004-2012 Track Systems Technologies, LLC
//
// AUTH: GAS
// DATE: 21 MAR 04
// REVISED: 15 JUN 04 - adapted for AZ display
//
// This file contains the definitions for the Traqmate 122x32 LCD Display Unit
//

//------------------------------------------------------------------------------------
// Display Unit Declarations
//------------------------------------------------------------------------------------
extern code u08 largeascii[95][2][8];
extern code u08 smallascii[95][1][5];
extern code u08 meddigits[10][2][6];
extern code u08 medl[2][6];
extern code u08 medspace[2][6];
extern code u08 reversebar[1][122];
extern code u08 clearbar[1][122];
extern code u08 reversearrow[1][122];
extern code u08 clearup[1][122];
extern code u08 cleardn[1][122];
extern code u08 cleartop[1][122];
extern code u08 clearbot[1][122];
extern code u08 cleartopbot[1][122];
extern code u08 menubar[1][122];
extern code u08 camready[1][16];
extern code u08 camnotready[1][16];
extern code u08 camrecord[1][16];
extern code u08 green[4][122];
extern code u08 flag[2][10];
extern code u08 blankicon[2][4];
extern code u08 timingicon[2][81];
extern code u08 predictive[4][122];
extern code u08 plussign[1][8];
extern code u08 minussign[1][8];
extern code u08 rpmbckgnd[4][122];
extern code u08 rpminvert[4][122];
extern code u08 graphbckgnd[1][122];
//extern code u08 gmeterbckgnd[4][122];
//extern code u08 allonbckgnd[4][122];
extern code u08 infoscreen[4][122];
extern code u08 end[4][122];
extern code u08 findgps[4][122];
extern code u08 findstart[4][122];
extern code u08 startfin[4][122];
extern code u08 autoxstage[4][122];
extern code u08 autoxready[4][122];
extern code u08 dragstage[4][122];
extern code u08 readytext[4][59];
extern code u08 go[4][59];
extern code u08 stoplight[1][4];

//extern code u08 replay[2][12];
extern code u08 smallbolddigits[10][1][6];
extern code u08 smallboldperiod[2][2];

#define DATA_8 P6				// bytewise write to port

// port pin definitions
sbit A0_DISP = P4 ^ 0;
sbit E1_DISP = P4 ^ 1;
sbit E2_DISP = P4 ^ 2;
sbit RW_DISP = P4 ^ 3;
sbit RST_DISP = P4 ^ 4;
sbit EN3VDISP = P7 ^ 3;					// 1 turns on display
sbit BACKLITEKB = P7 ^ 5;
sbit BACKLITEDS = P7 ^ 6;

sbit USB_PRESENT = P3 ^ 4;

// used for displaying battery voltage
#define ADC_RATE			2500000		// ADC conversion clock

// display unit LCD definitions
#define NUMBER_OF_COLUMNS 122
#define NUMBER_OF_ROWS 32
#define NUMBER_OF_PAGES 4
#define FIRST_PAGE 0
#define FIRST_COLUMN 0
#define LAST_PAGE 3
#define LAST_COLUMN (NUMBER_OF_COLUMNS - 1)
#define LAST_ROW (NUMBER_OF_ROWS - 1)
// #define CONTRAST_CENTER		0x5A		// middle of the road contrast setting
#define CONTRAST_CENTER		0x60		// middle of the road contrast setting, increased in 1.26
#define CONTRAST_UPPER		(CONTRAST_CENTER+20)	// upperbound of the contrast setting
#define CONTRAST_LOWER		(CONTRAST_CENTER-20)	// lowerbound of the contrast setting
#define TIMECODE_UPPER		12						// upperbound of the GMT offset setting
#define TIMECODE_LOWER		-12						// lowerbound of the GMT offset setting
#define LAPHOLD_UPPER		240						// upperbound of lap holding = 4 minutes
#define LAPHOLD_LOWER		0						// lowerbound of lap holding = immediate resume
#define LAPHOLD_DEFAULT		60						// default = hold for one minute
#define USERSETTINGS_DEFAULT	0x73				// +-1 sec, med len, US units
#define SHORTTRACKDIST		50						// <1 mi track, breadcrumb every 50 meters
#define MEDTRACKDIST		250						// 1 - 5 mi track, breadcrumb every 250 meters
#define LONGTRACKDIST		800						// 5 - 15mi track, breadcrumb every 800 meters

//#define TRACKLEN_DEFAULT	3970					// default track length in meters = 2.5 miles
//#define SECTORLEN_DEFAULT	300						// default sector length in meters

// G threshold for determining if autocross/rally launch
// #define LAUNCHVAL	-0.35			// .35 Gs forward acceleration WORKS WELL
#define LAUNCHVAL	-0.25			// .25 Gs forward acceleration TRYING LOWER VALUE FOR MORE ACCURACY

// fontdefinitions
#define CHARSLARGE	12				// characters per line with large font
#define CHARSSMALL	20				// characters per line with small font

// These are the flags that are passed to Write_Display() or Read_Display() routines.
#define CMD 0x01
#define DATA 0xFF

// The following definitions are the command codes that are passed to the
// display via the data bus.
#define DISPLAY_ON			0xAF	// turns display on
#define DISPLAY_OFF			0xAE	// turns display off
#define COLUMN_SET			0x00	// must OR with column number (0-60)
#define START_LINE_SET		0xC0	// must OR with start line (0-31)
#define PAGE_ADDRESS_SET	0xB8	// must OR with page address (0-3)
#define NORMAL_DRIVE		0xA4
#define STATIC_DRIVE		0xA5
#define ADC_SELECT_NORMAL	0xA0
#define ADC_SELECT_REVERSE	0xA1
#define READ_MODIFY_WRITE	0xE0	// begins read-modify-write mode
#define END					0xEE	// ends read-modify-write
#define RESET_DISPLAY		0xE2
#define DUTY_CYCLE_SET		0xA8	// must or with 1 for 1/32, else 1/16

// Display number of retries when busy
#define DISPLAY_TRIES		50		// retry busy line on LCD this many times before moving on

// Display Status Masks
#define DISP_BUSY			0x80	// 1 when display is busy
#define DISP_ADC			0x40	// 1 is normal, 0 inverted
#define DISP_ON				0x20	// 1 in ON, 0 is OFF
#define DISP_RST			0x10	// 0 is normal, 1 is still resetting

#define NUMDETAILS			8		// lines of detail information for a session
#define NUMSTATUS			4		// lines of status information. must be less than NUMDETAILS
#define NUMBER_OF_BUTTONS	7		// number of buttons to read

// Display Unit Switches
typedef enum {
	LITE,		// 0
	SEL,		// 1
	UP,			// 2
	BACK,		// 3
	DN,			// 4
	SW6,		// 5
	ONOFF		// 6
} displaybutton;

// Menu Operations
typedef enum {
	INIT,
	BUTTONPRESS
} menuop;

// this is the control type used for formattime
typedef enum {
	SHORTDANDT,
	LONGDANDT,
	SHORTTIME
} timeforms;

// Lap Timer Operations
typedef enum {
	INC_TIME,
	START_POSITION,
	FINISH_POSITION,
	NEW_POSITION,
	CLEAR_START,
	INITIALIZE
} lapop;

// Lap timing modes for timing display
typedef enum {
	LAP,					// lap mode (multisession predictive lap)
	QUAL,					// qualifying mode (single session predictive lap)
	HILL,					// hillclimb mode (multisession pred lap, separate s/f)
	REV						// lap time review
} timingtype;

// 4/8/2005 - changed lap_dist from 30 to 35 & lap_head from 20 to 30 based on VIR test
// 10/12/2005 - changed lap_dist from 35 to 40, lap_alt from 80 to 100 based on customer feedback
// 3/28/2006 - changed lap_dist from 40 to 45
//
// Lap Timer Parameters
#define LAP_DISTRANGE	45	// matching error for start/finish distance for lat and lon in meters
#define LAP_ALTRANGE	100	// matching error for start/finish altitude in meters
#define LAP_HEADRANGE	40	// matching error for start/finish heading in degrees

#define AUTOXSETHDGTIME	2000	// 2 second = number of ms to delay from launch before recording heading
#define AUTOX_DISTRANGE	10		// matching error for finish line distance for lat and lon in meters
#define AUTOX_HEADRANGE	30		// matching error for finish heading in degrees

sbit UP_SW = P5 ^ UP;		// schematic sw 1
sbit SEL_SW	= P5 ^ SEL;		// schematic sw 2
sbit DN_SW = P5	^ DN;		// schematic sw 3
sbit BACK_SW = P5 ^ BACK;	// schematic sw 4
sbit LITE_SW = P5 ^ LITE;	// schematic sw 5
sbit ONOFF_SW = P5 ^ ONOFF;	// schematic sw 7

// Menu System Declarations
#define SESSNAMELEN			18		// characters in session name on screen including null

typedef enum {
	LASTITEM,
	SUBMENU,
	PICKLIST,
	VIEWLIST,
	CONFIRM,
	INFORM,
	FUNCSUB,
	FUNCNORET,
	FUNCRETURN
} menuoptions;

typedef struct ml {
	menuoptions actionid;
	char *itemname;
	union {
		struct mt * (*f)(struct mt *);
		struct mt *submenu;
	} action;
} menulisttype;

typedef struct mt {
	char *menuname;				// name to put at top of menu
	struct mt *prev_menu;		// how to get back
	u08 num_items;				// number of items in menulist
	u08 current_sel;			// last selection (0 based)
	u08 current_hl;				// currently highlighted item (0 based)
	u08 top_line;				// item number displayed in line 1 of window. 0xFF = graphic menu
	menulisttype *menulist;		// pointer to array of menu items
} menutype;

typedef struct {
	u08 tracknum;				// current track
	s32 timer;					// current lap time in msec
	s32 besttime;				// best lap time in this session
	u08 lastlap;				// last programmed lap number (1 based)
	gpstype startpos;			// position of starting line
	gpstype finishpos;			// position of the finish line
	gpstype previouspos;		// position of last sample
	gpstype currentpos;			// position of latest sample
	u16	startheading;			// heading in integer degrees of start position
	u16	finishheading;			// heading in integer degrees of finish position
	u16	previousheading;		// heading in integer degrees of previous position
	u16	currentheading;			// heading in integer degrees of current position
	u16 currentlap;				// current lap number (1 based)
	float distance;				// current lap distance in meters
	s32 timernminus1;			// lap time at last gps sample in msec
} laptype;

typedef struct {
	BOOL quarter;				// TRUE if 1/4 mile, FALSE if 1/8 mile
	u16 sixtyfoot;				// 60 foot time in seconds * 100
	u16 zerosixty;				// 0-60 mph time in seconds * 100
	u16 zerohundred;			// 0-100 mph time in seconds * 100
	u16 threethirty;			// 330 foot time in seconds * 100
	u16 eighthmile;				// 1/8 mile time in seconds * 100
	u16 quartermile;			// 1/4 mile time in seconds * 100
	u16 eighthtrap;				// 1/8 mile trap speed in mph * 10
	u16 quartertrap;			// 1/4 mile trap speed in mph * 10
	s16 reaction;				// reaction time in seconds * 100
	u16 launchg;				// launch g force * 100
	u16 horsepower;				// horsepower during run
	u16 torque;					// torque during run
} dragracetype;

// menu data structures
typedef union {
	u08 driver[NUMDRIVERS][NAMELEN];	// all the drivers for the menu
	u08 track[NUMTRACKS][NAMELEN];		// all the tracks for the menu
	u08 vehicle[NUMCARS][NAMELEN];		// all the vehicles for the menu
	u08 session[NUMSESSIONS][SESSNAMELEN];		// all the sessions for the menu
	u08 menudetail[NUMDETAILS][CHARSSMALL+1];	// for detailed info in menu lists
} menunamestype; // menunames

typedef union {
	menulisttype driverlist[NUMDRIVERS+1];
	menulisttype tracklist[NUMTRACKS+1];
	menulisttype vehiclelist[NUMCARS+1];
	menulisttype sessionlist[NUMSESSIONS+1];
} menuliststype; // menulists

#define Clear_Screen() Full_Screen((u08) 0)
#define Clear_Line(LINE) Write_Icon(0, (LINE)*8, 122, 7, &(clearbar[0]), '-')

//------------------------------------------------------------------------------------
// Function PROTOTYPES
//------------------------------------------------------------------------------------
void PORT_Init_DU(void);
void Display_Init(void);
void Write_Display(u08, u08, u08);
unsigned char Read_Display(u08, u08);
void Write_Screen(u08 *bitmap, char);
#ifndef SAVEMEM
void Info_Screen(u08 *);
#endif
void Write_Icon(int , int , int , int , u08 *bitmap, char );
void Write_Line(u08, char *, BOOL, char);
void Write_Text(u08 , u08 , char *, char);
void Write_Big_Line(u08, char *, BOOL, char);
void Write_Big_Text(u08, u08, char *, char);
void Write_Med_Text(u08, u08, char *, char);
void Full_Screen(u08);
void Reset_Top_Line(void);
void formatgps (gpstype *, int, char *, u08);
void formattime (u32, u16, BOOL, char *);
float dotemp(s08, char);
void Menu_Op(menuop, displaybutton) reentrant;
void Write_Timer(void);
void Write_Flag( BOOL );
void Write_Lap( void );
void Lap_Check(lapop , gpstype *);
void Lap_Store( void );
void Sector_Store ( void );
BOOL AutoX_Timing(lapop, gpstype *);
void unpack_velocities( u08 *, s16 *, s16 *, s16 *);
u16 compute_heading (s16, s16 );
void writecompass (gpstype *);
void writerpm (gpstype *);
void writegmeter (BOOL , float , float );
void writeinputs (void);
void formatgauges(tmstatetype);
void Draw_Rect( int, int, int, int, char);
void Write_Qual( float);

// menu definition externs
extern menutype *collectdata(menutype *);
extern menutype *calibrate(menutype *);
extern menutype *erase(menutype *);
extern menutype *eraseall(menutype *);
extern menutype *packmem(menutype *);
extern menutype *erasesess(menutype *);
extern menutype *wipemem(menutype *);
extern menutype *review(menutype *);
extern menutype *idle(menutype *);
extern menutype *markstart(menutype *);
extern menutype *markfinish(menutype *);
extern menutype *loaddrivers(menutype *);
extern menutype *loadtracks(menutype *);
extern menutype *loadvehicles(menutype *);
extern menutype *savepicklists(menutype *);
extern menutype *detail(menutype *);
extern menutype *status(menutype *);
extern menutype *sesstitle(menutype *);
extern menutype *showlaps(menutype *);
extern menutype *uplap(menutype *);
extern menutype *dnlap(menutype *);
extern menutype *backlap(menutype *);
extern menutype *contrast(menutype *);
extern menutype *clearmenu(menutype *);
extern menutype *clearstart(menutype *);
extern menutype *dontclear(menutype *);
extern menutype *loadsamp(menutype *);
extern menutype *dogmt(menutype *);
extern menutype *laphold(menutype *);
extern menutype *savesamp(menutype *);
extern menutype *nextinput(menutype *); 
extern menutype *previnput(menutype *);
extern menutype *stage(menutype *);
extern menutype *saveunits(menutype *);
extern menutype *savescale(menutype *);
extern menutype *savetracklen(menutype *);
extern menutype *loadgraphscale(menutype *);
extern menutype *loadtracklen(menutype *);
extern menutype *loadunits(menutype *);
extern menutype *loadautoon(menutype *);
extern menutype *loadstartscreen(menutype *);
extern menutype *loadcameras(menutype *);
extern menutype *saveautoon(menutype *);
extern menutype *savestartscreen(menutype *);
extern menutype *savecameras(menutype *);
extern menutype *displaydragnums(menutype *);

extern xdata menutype mainmenu;
extern xdata menutype setup;
extern xdata menutype sessionmenu;

// Global Variables
#ifdef DU_MAIN
xdata comporthandle com[NUMPORTS];			// handles to com ports
//	0 place = this units id, 1 unit = PC = COM1, 2 unit = SU = COM0, 3 unit = DISPLAY = self = -1
xdata u08 msgrxbuff[2][MSGSIZE*2];		// inbound msg buffers
xdata u08 msgtxbuff[2][MSGSIZE];			// outbound msg buffers
code s08 msgrouting[NUMUNITS+1] = {DISPLAY_UNIT, 1, 0, -1};	// what port to route messages to
xdata u08 CTS[NUMUNITS] = {0};	// non-zero when waiting for response, 0 when clear to send
xdata u16 debounce[NUMBER_OF_BUTTONS] = {0};	// used to count up button press debounce
// xdata char uart1parity;				// 'n', 'e', or 'o'
//xdata u08 txbufcnt = 0;				// used for UART0 prints
xdata u16 clocktick = 0;			// increments in 1/SAMPLE_RATE sec intervals
xdata u16 secondtick = 0;			// increments in one second intervals for timing slow events
xdata u16 nextsecond = SAMPLE_RATE;	// which clocktick the next second will appear
xdata u16 camreadytick;				// which clocktick to timeout waiting for cam
xdata u16 mode_change = 0;			// indicates change in state machine
xdata flashpagetype flashpage;		// structure to access one page of flash
xdata tmstatetype tm_state = STARTUP;		// where in the state machine
xdata u16 pagesize;					// page size of dataflash
xdata u16 numpages;					// number of pages in dataflash
									// used to put function overlays on the buttons for certain modes
xdata menutype *(*button_overlay[NUMBER_OF_BUTTONS])(menutype *) = { NULL, NULL, NULL, NULL, NULL, NULL };
xdata laptype lap;					// timing of lap
xdata laplisttype laplist;			// one sessions worth of laps
xdata int secondcnt = 0;			// how many seconds into sample period
xdata int gcnt = 0;					// how many tenths into a second
xdata u16 pagecnt = 0;				// which page to write
xdata u16 iopagecnt = 0;			// which io page to write
xdata u08 session = 0;				// which session we are working on
xdata u08 gpslock = 0;				// GPS signal strength (# of satellites)
xdata u16 dop = 0;					// gps dillution of precision * 100
xdata camlancstatustype camlancstatus = UNKNOWNSTATUS;	// what mode is chasecam cam or lanc device is in
xdata u08 allinputs[NUMINPUTBYTES] = { 0 };	// copy of current sampling of all analogs, digitals, and freqs D, A0-3, F0,1
xdata u08 outstanding_msg[NUMUNITS] = { 0 };	// lists which messages are outstanding from each device
xdata u08 topline = 3;				// current top line of lcd for scrolling
xdata scratchpadtype scratch;		// structure to store config data from SU
xdata BOOL su_present = FALSE;		// whether or not we are hooked to an SU
xdata u16 su_sw, su_data;			// software and data revs from SU
xdata u08 su_hw;					// hardware rev from SU
xdata u08 su_week, su_year;			// build date from SU
xdata tmstatetype new_mode = WAITING;	// holds mode change information
xdata u08 samps_per_sec = 20;		// number of samples per second
xdata u08 iocollect = 0;			// which i/o point to collect
xdata u16 iobyte;					// next byte to write
xdata BOOL traqdataconnected;		// whether io interface is present
xdata BOOL firstpulse = TRUE;		// used to get synched up
xdata analogdefs analogscaling[NUMTDANALOGS];			// scaling and name info for inputs
xdata digitaldefs digitalscaling[NUMTDDIGITALS];		// scaling and name info for inputs
xdata sectortype sector[NUMSECTORS];	// intermediate values for predictive lap timing
xdata u08 refsectornum;				// which sector are we comparing to
xdata u08 cursectornum;				// which sector are we in
xdata s16 lastdist;					// previous samples distance measurement for predictive lap timing
xdata timingtype timingmode;			// what type of timing behavior is required
xdata float graphratio;				// ratio of qualifying graph
xdata u16 tracksampledist;			// number of meters between breadcrumbs for predictive lap timing
xdata BOOL waitforcam;				// if TRUE don't record until cam is ready or timeout
xdata dragracetype dragnumbers;		// results of dragrace
xdata u16 draglighttimer;			// to determine when to turn on drag race lights

xdata u32 sessstarttime = 0xFFFFFFFF;	// these are the first and last good dates for a session
xdata u32 sessendtime = 0xFFFFFFFF;
xdata u16 sessstartweeks = 0xFFFF;
xdata u16 sessendweeks = 0xFFFF;

xdata cartype currentcar;			// specifications for current car

xdata s32 seeklat;					// what point are we watching for. could be start or finish
xdata s32 seeklon;
xdata u16 seekhdg;

// Menus
xdata menunamestype menunames;
xdata menuliststype menulists;

xdata menutype drivers = { "Select Driver", &setup, 0, 0, 0, 0, menulists.driverlist };
xdata menutype tracks = { "Select Track", &setup, 0, 0, 0, 0, menulists.tracklist };
xdata menutype vehicles = { "Select Vehicle", &setup, 0, 0, 0, 0, menulists.vehiclelist };
xdata menutype sessions = { "Sessions", &mainmenu, 0, 0, 0, 0, menulists.sessionlist };

xdata menulisttype detaillist[NUMDETAILS+1];
xdata u08 sessionmenutitle[] = "Session ##";
code u08 statustitle[] = "Current Status";
xdata menutype details = {sessionmenutitle, &sessionmenu, 0, 0, 0, 0, detaillist };
// xdata u08 menudetailname[NUMDETAILS][CHARSSMALL+1];	// where session details will appear

code menulisttype sessmenulist[] = {	{ FUNCNORET, "View Laps", &showlaps },
										{ CONFIRM, "Erase Data", &erasesess },
										{ FUNCSUB, "Session Detail", &detail },
										{ LASTITEM, NULL, NULL } };

xdata menutype sessionmenu = {sessionmenutitle, &sessions, 0, 0, 0, 0, sessmenulist };

code menulisttype samplelist[] = {		{ PICKLIST, "10 Hz", &savesamp },
										{ PICKLIST, "20 Hz", &savesamp },
										{ PICKLIST, "40 Hz", &savesamp },
										{ LASTITEM, NULL, NULL } };
xdata menutype samprates = { "Select Rate", &setup, 0, 0, 0, 0, samplelist };

code menulisttype unitlist[] = {		{ PICKLIST, "US Standard", &saveunits },
										{ PICKLIST, "Metric", &saveunits },
										{ LASTITEM, NULL, NULL } };
xdata menutype unitchoices = { "Select Units", &setup, 0, 0, 0, 0, unitlist };

code menulisttype lapsetlist[] = {		{ FUNCNORET, "Laptime Hold", &laphold },
										{ FUNCSUB, "Graph Scale", &loadgraphscale },
										{ FUNCSUB, "Track Length", &loadtracklen },
										{ LASTITEM, NULL, NULL } };
xdata menutype lapsettings = { "Lap Settings", &setup, 0, 0, 0, 0, lapsetlist };

code menulisttype scalelist[] = {		{ PICKLIST, "-0.5 to 0.5s", &savescale },
										{ PICKLIST, "-1 to +1s", &savescale },
										{ PICKLIST, "-2 to +2s", &savescale },
										{ PICKLIST, "-5 to +5s", &savescale },
										{ PICKLIST, "-10 to +10s", &savescale },
										{ LASTITEM, NULL, NULL } };
xdata menutype scalechoices = { "Graph Scale", &lapsettings, 0, 0, 0, 0, scalelist };

code menulisttype tracklenlist[] = {	{ PICKLIST, "Short <1 mi,1.6km", &savetracklen },
										{ PICKLIST, "Med 1-5mi,1.6-8km", &savetracklen },
										{ PICKLIST, "Long 5+ mi,8+ km", &savetracklen },
										{ LASTITEM, NULL, NULL } };
xdata menutype tracklenchoices = { "Track Length", &lapsettings, 0, 0, 0, 0, tracklenlist };

code menulisttype autoonlist[] = {		{ PICKLIST, "Disabled", &saveautoon },
										{ PICKLIST, "Enabled", &saveautoon },
										{ LASTITEM, NULL, NULL } };
xdata menutype autoonchoices = { "AutoOn (SU2)", &setup, 0, 0, 0, 0, autoonlist };

code menulisttype cameralist[] = {		{ PICKLIST, "None", &savecameras },
										{ PICKLIST, "Mobius USB", &savecameras },
										{ PICKLIST, "Replay Mini USB", &savecameras },
										{ PICKLIST, "Replay PrimeX USB", &savecameras },
										{ PICKLIST, "GoPro", &savecameras },
										{ PICKLIST, "ReplayXD", &savecameras },
										{ PICKLIST, "Sony LANC", &savecameras },
										{ PICKLIST, "ReplayXD USB", &savecameras },
										{ LASTITEM, NULL, NULL } };
xdata menutype camerachoices = { "Cameras", &setup, 0, 0, 0, 0, cameralist };

code menulisttype startscreenlist[] = {	{ PICKLIST, "Main Menu", &savestartscreen },
										{ PICKLIST, "Laps", &savestartscreen },
										{ PICKLIST, "Qualifying", &savestartscreen },
										{ PICKLIST, "Drive", &savestartscreen },
										{ PICKLIST, "Tach", &savestartscreen },
										{ PICKLIST, "Gauges", &savestartscreen },
										{ PICKLIST, "Compass", &savestartscreen },
										{ PICKLIST, "Instruments", &savestartscreen },										
										{ PICKLIST, "GPS Location", &savestartscreen },
										{ LASTITEM, NULL, NULL } };
xdata menutype startscreenchoices = { "Start Screen", &setup, 0, 0, 0, 0, startscreenlist };

code menulisttype setuplist[] = {		{ FUNCSUB, "Driver", &loaddrivers },
										{ FUNCSUB, "Vehicle", &loadvehicles },
										{ FUNCSUB, "Track", &loadtracks },
										{ FUNCSUB, "Camera", &loadcameras },
										{ FUNCSUB, "Sampling Rate", &loadsamp },
										{ CONFIRM, "Erase Sessions", &eraseall },
#ifdef PACKMEM
										{ FUNCSUB, "Pack Sessions", &packmem },
#endif
										{ FUNCNORET, "GMT Offset", &dogmt },
										{ FUNCNORET, "Contrast", &contrast },
										{ FUNCSUB, "Units", &loadunits },
										{ SUBMENU, "Lap/Qual Settings", &lapsettings },			
										{ CONFIRM, "Factory Defaults", &wipemem },
										{ FUNCSUB, "AutoOn", &loadautoon },
										{ FUNCSUB, "Start Screen", &loadstartscreen },
//										{ FUNCNORET, "Calibrate", NULL },
										{ LASTITEM, NULL, NULL } };
xdata menutype setup = { "Settings", &mainmenu, 0, 0, 0, 0, setuplist };

code menulisttype collectlist[] = {		{ FUNCNORET, "Laps", &collectdata },
										{ FUNCNORET, "Qualifying", &collectdata },
										{ FUNCNORET, "Autocross / Rally", &collectdata },
										{ FUNCNORET, "1/8 Mile Car Test", &collectdata },
										{ FUNCNORET, "1/4 Mile", &collectdata },
										{ FUNCNORET, "Drive", &collectdata },
										{ FUNCNORET, "Tach & Speedo", &collectdata },
										{ FUNCNORET, "Gauges", &collectdata },
										{ FUNCNORET, "G-Forces", &collectdata },
										{ FUNCNORET, "Segment Timing", &collectdata }, 
										{ FUNCNORET, "Gs & Location", &collectdata },
										{ FUNCNORET, "Inputs", &collectdata },
										{ LASTITEM, NULL, NULL } };
xdata menutype collect = { "Data Mode", &mainmenu, 0, 0, 0, 0, collectlist };

code menulisttype otherlist[] = {		{ FUNCNORET, "GPS Compass", &collectdata },
										{ FUNCNORET, "Instruments", &collectdata },
										{ FUNCNORET, "GPS Location", &collectdata },
										{ FUNCNORET, "Check Inputs", &collectdata },
										{ LASTITEM, NULL, NULL } };
xdata menutype other = { "Other Modes", &mainmenu, 0, 0, 0, 0, otherlist };

// must be xdata so it can be modified
xdata menulisttype mainmenulist[] = {	{ SUBMENU, "Record Data", &collect },
										{ FUNCSUB, "View Sessions", &review },
										{ SUBMENU, "Change Settings", &setup },
										{ FUNCSUB, "Current Status", &status },
										{ SUBMENU, "Other Features", &other },
										{ LASTITEM, NULL, NULL } };
xdata menutype mainmenu = { "Main Menu", &mainmenu, 0, 0, 0, 0, mainmenulist };

// must be xdata so it can be modified
xdata menulisttype confirmation[] = {	{ FUNCSUB, "YES", NULL },
										{ SUBMENU, "NO", NULL },
										{ LASTITEM, NULL, NULL } };

// must be xdata so it can be modified
xdata menulisttype clearconfirm[] = {	{ FUNCNORET, "NO", &dontclear },
										{ FUNCNORET, "YES", &clearstart },
										{ LASTITEM, NULL, NULL } };

xdata menutype confirm = { " Are You Sure?", NULL, 0, 0, 0, 0, confirmation };

xdata menutype clearsf = { " Clr Start/Fin?", NULL, 0, 0, 0, 0, clearconfirm };

// graphic menus
xdata menulisttype startfinlist[] = { SUBMENU, NULL, &clearsf };
xdata menutype startfinmenu = { NULL, NULL, 0, 0, 0, 0xFF, startfinlist };

#else
extern xdata comporthandle com[NUMPORTS];			// handles to com ports
extern code s08 msgrouting[NUMUNITS+1];	// what port to route messages to
extern xdata u08 CTS[NUMUNITS];		// non-zero when waiting for response, 0 when clear to send
extern xdata u16 debounce[NUMBER_OF_BUTTONS];	// used to count up button press debounce
extern xdata u08 txbufcnt;			// used for UART0 prints
extern xdata u16 clocktick;			// increments in 1/SAMPLE_RATE sec intervals
extern xdata u16 secondtick;		// increments in one second intervals for timing slow events
extern xdata u16 nextsecond;		// which clocktick the next second will appear
extern xdata u16 camreadytick;		// which clocktick to timeout waiting for cam
extern xdata u08 mode_change;		// indicates change in state machine
extern xdata flashpagetype flashpage;	// structure to access one page of flash
extern xdata tmstatetype tm_state;		// where in the state machine
extern xdata u08 samps_per_sec;		// number of samples per second
extern xdata u16 pagesize;			// page size of dataflash
extern xdata u16 numpages;			// number of pages in dataflash
									// used to put function overlays on the buttons for certain modes
extern xdata menutype *(*button_overlay[NUMBER_OF_BUTTONS])(menutype *);
extern xdata laptype lap;
extern xdata laplisttype laplist;		// one sessions worth of laps

extern xdata u08 gpslock;				// GPS signal strength (# of satellites)
extern xdata u16 dop;					// gps dillution of precision * 100
extern xdata camlancstatustype camlancstatus;	// what mode is camera or lanc device is in
extern xdata u08 allinputs[NUMINPUTBYTES];	// copy of current sampling of all analogs, digitals, and freqs
extern xdata int secondcnt;				// how many seconds into sample period
extern xdata int gcnt;					// how many tenths into a second
extern xdata u16 pagecnt;				// which page to write
extern xdata u16 iopagecnt;				// which io page to write
extern xdata u08 session;				// which session we are working on
extern xdata BOOL su_present;			// whether or not we are hooked to an SU
extern xdata u16 su_sw, su_data;		// software and data revs from SU
extern xdata u08 su_hw;					// hardware rev from SU
extern xdata tmstatetype new_mode;		// holds mode change information
extern xdata u08 iocollect;				// which i/o point to collect
extern xdata u16 iobyte;				// next byte to write
extern xdata BOOL traqdataconnected;	// whether io interface is present
extern xdata BOOL firstpulse;			// used to get synched up
extern xdata analogdefs analogscaling[NUMTDANALOGS];			// scaling and name info for inputs
extern xdata digitaldefs digitalscaling[NUMTDDIGITALS];		// scaling and name info for inputs

extern xdata u08 outstanding_msg[NUMUNITS];	// lists which messages are outstanding from each device
extern xdata u08 topline;				// current top line of lcd for scrolling
extern xdata scratchpadtype scratch;	// structure to store config data from SU

extern xdata menunamestype menunames;
extern xdata menuliststype menulists;

//extern xdata u08 menudrivername[NUMDRIVERS][NAMELEN];	// all the drivers for the menu
//extern xdata menulisttype driverlist[NUMDRIVERS+1];
extern xdata menutype drivers;

//extern xdata u08 menutrackname[NUMTRACKS][NAMELEN];		// all the tracks for the menu
//extern xdata menulisttype tracklist[NUMTRACKS+1];
extern xdata menutype tracks;

//extern xdata u08 menuvehiclename[NUMCARS][NAMELEN];		// all the vehicles for the menu
//extern xdata menulisttype vehiclelist[NUMCARS+1];
extern xdata menutype vehicles;

//extern xdata menulisttype sessionlist[NUMSESSIONS+1];
extern xdata menutype sessions;
//extern xdata u08 menusessionname[NUMSESSIONS][SESSNAMELEN];		// all the sessions for the menu
extern xdata menutype samprates;
extern xdata menutype startscreenchoices;
extern xdata menutype camerachoices;
extern xdata menutype autoonchoices;
extern xdata menulisttype detaillist[NUMDETAILS+1];
extern xdata menutype details;
//extern xdata u08 menudetailname[NUMDETAILS][CHARSSMALL+1];	// where session details will appear
extern code menulisttype sessmenulist[];
extern code menulisttype setuplist[];
extern code menulisttype collectlist[];
extern xdata menutype collect;
extern code menulisttype otherlist[];
extern xdata menutype other;
extern code menulisttype mainmenulist[];
extern xdata menulisttype confirmation[];
extern xdata menulisttype clearconfirm[];
extern xdata menutype confirm;
extern xdata menutype clearsf;

extern code menulisttype unitlist[];
extern xdata menutype unitchoices;
extern code menulisttype scalelist[];
extern xdata menutype scalechoices;
extern code menulisttype tracklenlist[];
extern xdata menutype tracklenchoices;

extern xdata u08 sessionmenutitle[];
extern code u08 statustitle[];
extern xdata sectortype sector[];		// intermediate values for predictive lap timing
extern xdata u08 refsectornum;				// which sector are we comparing to
extern xdata u08 cursectornum;				// which sector are we in
extern xdata s16 lastdist;				// previous samples distance measurement for predictive lap timing
extern xdata timingtype timingmode;		// what type of timing behavior is required
extern xdata float graphratio;			// ratio of qualifying graph
extern xdata u16 tracksampledist;		// number of meters between breadcrumbs for predictive lap timing
extern xdata BOOL waitforcam;			// if TRUE don't record until camera is ready or timeout
extern xdata dragracetype dragnumbers;	// results of dragrace
extern xdata u16 draglighttimer;				// to determine which staging light is on
										
extern xdata u32 sessstarttime;			// these are the first and last good dates for a session
extern xdata u32 sessendtime;
extern xdata u16 sessstartweeks;
extern xdata u16 sessendweeks;

extern xdata cartype currentcar;		// specifications for current car

extern xdata s32 seeklat;					// what point are we watching for. could be start or finish
extern xdata s32 seeklon;
extern xdata u16 seekhdg;

#endif

#endif