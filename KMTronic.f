\ Use the serial port (COM) functionality of VFX Forth to communicate with a KMTronic USB Relay controller
\ Windows command line tools 
\	mode
\	chgport

include C:\MPE\VfxForth\Lib\Win32\Genio\serialbuff

serdev: COM_KMT
\ prepare an instance of a VFX Forth generic I/O driver

s" COM8: baud=115200 parity=N data=8 stop=1"  7 ( legacy_setting) COM_KMT open-gio . . CR
\ prepare a suitable connection string
\ open the port

s" command_protocol_example" COM_KMT write-gio . CR
\ send a string over the serial port to the SQM

COM_KMT close-gio . CR
\ close the serial port