\ PC Bidmead has the KMTronic relay box on COM6
\ this file local and manual for each rig 
6 constant COM_KMT

: scan-relays
\ report connected relay devices - manual for each setup
 	CR ." COM"   tab ." Relay device                 " tab ." Handle"
 	CR COM_KMT . tab ." KMTronic USB relay controller" tab ." COM_KMT"
;
