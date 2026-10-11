# ForthKMTronic

Low-level control of a KMTronic four-channel USB relay box.

The observing environment supplies the COM port:

```forth
NEED ForthKMTronic
\ KMTronic.COM must be supplied by the observing environment.
add-relays
1 relay-on
500 ms
1 relay-off
500 ms
remove-relays
```

Relay numbers are validated from 1 through 4. `relay-on` and `relay-off` send
one command and do not impose a transition delay; the calling equipment
lifecycle owns that policy.

AstroImagingInForth sets the Morbius COM port in `environments\DB-E160.f`.
In that installation relay 1 controls the camera 12 V supply. A web relay is
wired in parallel, so the circuit is on when either controller is on. Turning
KMTronic relay 1 off guarantees complete camera power-off only when the web
relay is also off.
