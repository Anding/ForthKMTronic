include "%idir%\..\ForthBase\ForthBase.f"
include "%idir%\..\ForthBase\serial\VFX32serial.f"
include "%idir%\KMTronic_Bidmead.f"
include "%idir%\KMTronic.f"

	CR
	scan-relays
	COM_KMT add-relays

	3 relay-on
	CR ." ON"
	2000 ms
	
	3 relay-off
	CR ." OFF"

	remove-relays
	CR