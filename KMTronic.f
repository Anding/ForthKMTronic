\ Use the serial port (COM) functionality of VFX Forth to communicate with a KMTronic USB Relay controller
NEED serial

\ COM port number, to revise on the local machine
	6 value KMTronic.COM

\ prepare an instance of a VFX Forth generic I/O driver
	serdev: sid_KMTronic

: add-relays ( --)
	KMTronic.COM 9600 sid_KMTronic ( com_port baud) open-serial
;

: remove-relays 
	sid_KMTronic close-serial
;

 create KMTronic_protocol
 255 c, 0 c, 0 c,
 \ protocol binary string of 3 bytes

: switch-relay ( f r --)
\ f = -1 on; 0 off
\ r = relay number
	KMTronic_protocol 1 + c!
	if 1 else 0 then KMTronic_protocol 2 + c!
	KMTronic_protocol 3 sid_KMTronic ( addr n sid) write-gio ( ior) ABORT" Failed to write KMTronic COM port"
;

: relay-on ( r --)
	-1 swap switch-relay
;

: relay-off ( r --)
	0 swap switch-relay
;


	

