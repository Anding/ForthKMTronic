include "%idir%\KMTronic.f"

	CR
	6 constant COM-KMTronic

	COM-KMTronic add-relays

	1 relay-on
	2000 ms
	1 relay-off

	remove-relays