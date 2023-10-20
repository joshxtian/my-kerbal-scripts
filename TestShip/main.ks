wait until ship:unpacked.

runpath("0:/boot/TestShip/lib/logHelpers.ks").
runpath("0:/boot/TestShip/lib/_engineTests.ks").


// TEST FUNCS
function run_tests {
    pulse_burn(0.5, 0.1).
}   

function main {
    initial_message("JAYSON-PROTO-1").

    // initial calculations
    set target_apoapsis to 150000.
    set start_turn_at to 3000.
    set ascending_angle to 85.
    set locked_angle to 35.

    // functions in sequence
    countdown(2).
    stage.
    until apoapsis > target_apoapsis {
        lock throttle to 0.5.
        set angle to -4.54545E-8 * alt:radar^2 - 0.000609091 * alt:radar + ascending_angle.
        set azimuth to LAZcalc_init(target_apoapsis, 90).
        clearscreen.
        print azimuth.
        if (alt:radar < start_turn_at) {
            lock steering to up.
        } else {
            lock steering to heading(LAZcalc(azimuth), choose locked_angle if angle < locked_angle else angle).
        }
      
      
    }


    // set min_alt to 10000.
    // set max_alt to 25000.
    // stage.
    // set THROTPID to PIDLOOP(    
    //         50,  // adjust throttle 0.1 per 5m in error from desired altitude.
    //         0.1, // adjust throttle 0.1 per second spent at 1m error in altitude.
    //         30,  // adjust throttle 0.1 per 3 m/s speed toward desired altitude.
    //         0,   // min possible throttle is zero.
    //         0.7    // max possible throttle is one.
    //     ).
    // set THROTPID:setpoint to 300.
    // until apoapsis > 150000 {
        
    //     limitVelocity(300).
    //     if apoapsis < 55000 {
            // set angle to -4.54545E-8 * alt:radar^2 - 0.000609091 * alt:radar + 90.
    //         lock steering to heading(LAZcalc(azimuth), angle).
    //         lock throttle to 0.5.
    //         clearscreen.
    //         print angle.
    //     } else {
    //         lock steering to 0.
    //         lock throttle to 0.7.
    //     }
    //     // if (alt:radar < 12000) {
    //     //     lock throttle to THROTPID:UPDATE(TIME:SECONDS, ship:velocity:surface:mag).
    //     // } else {
    //     //     lock throttle to 1.
    //     // }
    // }
    // lock steering to prograde.
    // stage.
}

