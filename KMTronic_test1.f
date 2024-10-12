\ test for KMTronic.f

include "%idir%\..\ForthBase\libraries\libraries.f"
include "%idir%\KMTronic.f"

	CR
	add-relays

	2000 ms
	3 relay-on
	CR ." ON"
	
	2000 ms
	3 relay-off
	CR ." OFF"

	remove-relays
	CR