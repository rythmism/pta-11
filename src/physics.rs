static mut PATROL_COUNTER: i32 = 0;
static mut IS_PATROLLING: i32 = 1;
static mut SEED: u64 = 12345;

// LCG pseudorandom generator for trap placement
fn pseudorandom() -> u64 { 
    unsafe { 
        SEED = SEED.wrapping_mul(6364136223846793005).wrapping_add(1442695040888963407); 
        SEED 
    } 
}

#[no_mangle]
pub extern "C" fn check_collision(px: i32, py: i32, tx: i32, ty: i32) -> i32 { 
    if px == tx && py == ty { 1 } else { 0 } 
}

#[no_mangle]
pub extern "C" fn update_enemy_state(ex: i32, ey: i32, px: i32, py: i32) -> i32 { 
    unsafe { 
        PATROL_COUNTER += 1; 
        if PATROL_COUNTER > 15 { 
            IS_PATROLLING = if IS_PATROLLING == 1 { 0 } else { 1 }; 
            PATROL_COUNTER = 0; 
        } 
        IS_PATROLLING 
    } 
}

#[no_mangle]
pub extern "C" fn generate_procedural_trap(w: i32, h: i32, grid: *const i32, tx: *mut i32, ty: *mut i32) { 
    let grid_slice = unsafe { std::slice::from_raw_parts(grid, (w * h) as usize) }; 
    loop { 
        let rx = (pseudorandom() % (w as u64 - 2)) as i32 + 1; 
        let ry = (pseudorandom() % (h as u64 - 2)) as i32 + 1; 
        let idx = (ry * w + rx) as usize; 
        if grid_slice[idx] == 0 { 
            unsafe { *tx = rx; *ty = ry; } 
            break; 
        } 
    } 
}

#[no_mangle]
pub extern "C" fn process_player_hit(current_health: i32) -> i32 { 
    let updated = current_health - 1; 
    if updated < 0 { 0 } else { updated } 
}
