include "%idir%\KMTronic.f"

	CR
	6 constant COM-KMTronic

	COM-KMTronic add-relays

	1 relay-on
	2000 us
	1 relay-off

	remove-relays