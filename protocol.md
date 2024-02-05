# KMTronic U4CRB
A general purpose USB Relay controller for connection to a PC's USB port using VCP (Virtual COM port). Control devices using your PC.  USB Relay controller allows a PC to control a external devices using simple RS232 commands. Relay is fully powered from the USB bus. Free test software

##  Communication Parameters:
- 8 Data, 1 Stop, No Parity
- Baud rate : 9600

## Commands:
1. FIRST channel commands:
- OFF command : FF 01 00 (HEX) or 255 1 0 (DEC)
- ON command : FF 01 01 (HEX) or 255 1 1 (DEC)

2. SECOND channel commands:
- OFF command : FF 02 00 (HEX) or 255 2 0 (DEC)
- ON command : FF 02 01 (HEX) or 255 2 1 (DEC)

3. THIRD channel commands:
- OFF command : FF 03 00 (HEX) or 255 3 0 (DEC)
- ON command : FF 03 01 (HEX) or 255 3 1 (DEC)

4. FOURTH channel commands:
- OFF command : FF 04 00 (HEX) or 255 4 0 (DEC)
- ON command : FF 04 01 (HEX) or 255 4 1 (DEC)