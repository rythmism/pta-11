#include <stdio.h>
#include <windows.h>

static LARGE_INTEGER frequency;
static LARGE_INTEGER last_frame_time;
static double current_fps = 0.0;
static int initialized = 0;

void render_game_frame(int w, int h, const int* grid, int px, int py, int tx, int ty, int ex, int ey, int trapx, int trapy, int hp, int lvl) {
    HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
    DWORD dwMode = 0;
    GetConsoleMode(hOut, &dwMode);
    SetConsoleMode(hOut, dwMode | ENABLE_VIRTUAL_TERMINAL_PROCESSING);

    // Track frame timing metrics
    if (!initialized) {
        QueryPerformanceFrequency(&frequency);
        QueryPerformanceCounter(&last_frame_time);
        initialized = 1;
    } else {
        LARGE_INTEGER current_time;
        QueryPerformanceCounter(&current_time);
        double elapsed_seconds = (double)(current_time.QuadPart - last_frame_time.QuadPart) / frequency.QuadPart;
        if (elapsed_seconds > 0.0) {
            current_fps = 1.0 / elapsed_seconds;
        }
        last_frame_time = current_time;
    }

    // Reset cursor position to avoid full-screen flickering
    COORD coord = {0, 0};
    SetConsoleCursorPosition(hOut, coord);
    
    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            if (x == px && y == py) printf("\033[1;32m@\033[0m");      // Green Player
            else if (x == tx && y == ty) printf("\033[1;33mX\033[0m"); // Yellow Target
            else if (x == ex && y == ey) printf("\033[1;31mE\033[0m"); // Red Enemy
            else if (x == trapx && y == trapy) printf("\033[1;35m^\033[0m"); // Magenta Trap
            else if (grid[y * w + x] == 1) printf("\033[1;34m#\033[0m"); // Blue Wall
            else printf(" ");
        }
        printf("\n");
    }
    printf("\033[1;36m[Level: %d]  |  [Player HP: %d]  |  \033[1;33m[FPS: %0.1f]\033[0m\n", lvl, hp, current_fps);
}
