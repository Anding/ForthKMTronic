\ Use the serial port (COM) functionality of VFX Forth to communicate with a KMTronic USB Relay controller
NEED serial
NEED CommandStrings

\ COM port number, to revise on the local machine
	6 value KMTronic.COM

\ prepare an instance of a VFX Forth generic I/O driver
	serdev: KMTronic.sid

: add-relays ( --)
	KMTronic.COM 9600 ( com_port baud) KMTronic.sid open-serial
;

: remove-relays 
	KMTronic.sid close-serial
;

 create KMTronic.command
 3 allot
 \ protocol binary string of 3 bytes

: switch-relay ( f r --)
\ f = -1 on; 0 off
\ r = relay number
	KMTronic.command << 0xff | ( r) | ( f) if 1 else 0 then | >>
 	( addr 3) KMTronic.sid ( addr n sid) write-gio ( ior) ABORT" Failed to write KMTronic COM port"
;

: relay-on ( r --)
	-1 swap switch-relay
;

: relay-off ( r --)
	0 swap switch-relay
;


	

