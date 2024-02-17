\ Use the serial port (COM) functionality of VFX Forth to communicate with a KMTronic USB Relay controller
\ Windows command line tools 
\ mode
\ chgport

\ local note: PC Bidmead has the KMTronic relay box on COM6

 include C:\MPE\VfxForth\lib\Win32\Genio\serialbuff.fth
\ this does not include properly in Win64

: connection_string ( com_port baud -- c-addr u)
\ create a VFX COM port connection string
\ the string is stored in the PAD and will be overwritten when the PAD is used again
	<#  
	s"  parity=N data=8 stop=1" HOLDS
	( baud) 0 #s 2drop
	s"  baud=" HOLDS
	dup 10 < if
		':' HOLD	
		( com_port) 0 # 
		s" COM" HOLDS
	else
		( com_port) 0 # #
		s" \\.\COM" HOLDS
	then	
	#>
;

 serdev: COM_KMT 
 \ prepare an instance of a VFX Forth generic I/O driver

 create KMTronic_protocol
 255 c, 0 c, 0 c,
 \ protocol binary string of 3 bytes
 
: add-relays ( com_port --)
	9600 ( com_port baud) connection_string 7 COM_KMT ( c-addr u attribs sid) open-gio ( sid ior) 
	ABORT" Failed to open KMTronic COM port" drop
;

: remove-relays 
	COM_KMT close-gio ABORT" Failed to close KMTronic COM port"
;

: switch-relay ( f r --)
\ f = -1 on; 0 off
\ r = relay number
	KMTronic_protocol 1 + c!
	if 1 else 0 then KMTronic_protocol 2 + c!
	KMTronic_protocol 3 COM_KMT ( addr n sid) write-gio ( ior) ABORT" Failed to write KMTronic COM port"
;

: relay-on ( r --)
 -1 swap switch-relay
;

: relay-off ( r --)
 0 swap switch-relay
;


	

