
// function pulse_burn< pulse_rate: float, throttle_rate: float >: void
function pulse_burn {
    parameter pulse_rate is 1.
    parameter throttle_rate is 1.
    set toggleEngine to false. 
    set x to 0.
    toggle AG1.
    lock throttle to throttle_rate.
    until ship:maxthrust = 0 {
        wait pulse_rate.
        lock throttle to choose 0 if toggleEngine else throttle_rate.
        set toggleEngine to not toggleEngine.
    }
}