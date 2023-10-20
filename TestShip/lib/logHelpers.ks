runpath("0:/boot/TestShip/lib/time.ks").

function initial_message {
    parameter name.
    print name + " is initialized!".
}

function countdown {
    parameter seconds is 5.
    set timer to seconds.
    until timer = -1 {
        wait 1.
        clearscreen.
        print "T-Minus " + timer + time_suffix(timer) AT(0,0).
        set timer to timer - 1.
    }
    clearscreen.
    print "Launch Off!" AT(0,0).
}

function limitVelocity {
    parameter maxV is 200.
    CLEARSCREEN.
    set percentage to ship:velocity:surface:mag/maxV*100.
}