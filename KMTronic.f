\ Use VFX Forth serial I/O to control a KMTronic USB relay box.
\ Maintenance: the wire packet is exactly FF, relay, state.  Keep COM policy
\ outside this driver and never alter relays other than the requested one.
NEED serial

\ COM port number supplied by the observing environment
	0 value KMTronic.COM

\ prepare an instance of a VFX Forth generic I/O driver
	serdev: KMTronic.sid

: add-relays ( -- )
	KMTronic.COM 0= ABORT" KMTronic COM port is not configured"
	KMTronic.COM 9600 ( com_port baud) KMTronic.sid open-serial
;

: remove-relays ( -- )
	KMTronic.sid close-serial
;

create KMTronic.command 3 allot

: switch-relay { flag relay -- }
\ Switch one relay; valid relay numbers are 1 through 4.
	relay 1 5 within 0= ABORT" KMTronic relay must be 1 through 4"
	0xff KMTronic.command c!
	relay KMTronic.command 1+ c!
	flag if 1 else 0 then KMTronic.command 2 + c!
	KMTronic.command 3
	KMTronic.sid write-gio ABORT" Failed to write KMTronic COM port"
;

: relay-on ( relay -- )
	-1 swap switch-relay
;

: relay-off ( relay -- )
	0 swap switch-relay
;
