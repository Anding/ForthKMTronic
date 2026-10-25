\ Live camera-power relay cycle. Configure KMTronic.COM before invocation.
\ The parallel web relay must be off.
\
\ Maintenance: this deliberately leaves relay 1 off; do not run while the
\ camera must remain powered or while the web relay masks USB relay changes.

include "%idir%\..\ForthBase\libraries\libraries.f"
include "%idir%\KMTronic.f"
NEED simple-tester

: test-camera-power-relay ( -- )
	KMTronic.COM 0= if cr ." Configure KMTronic.COM before running this test" cr exit then
	add-relays
	1 relay-off
	500 ms
	1 relay-on
	500 ms
	1 relay-off
	500 ms
	remove-relays
;

Tstart
T{ 123 add-relays }T 123 ==
T{ 123 0 relay-on 5 relay-off }T 123 ==
Tend