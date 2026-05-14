#include <stdio.h>
#include <windows.h>

void render_game_frame(int w, int h, const int* grid, int px, int py, int tx, int ty, int ex, int ey, int trapx, int trapy, int hp, int lvl) { 
    // Enable ANSI processing in the Windows Console Host
    HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE); 
    DWORD dwMode = 0; 
    GetConsoleMode(hOut, &dwMode); 
    SetConsoleMode(hOut, dwMode | ENABLE_VIRTUAL_TERMINAL_PROCESSING); 
}
Frame Logic Loop:
void render_frame(int w, int h, int px, int py, int tx, int ty) { 
    COORD coord = {0, 0}; 
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord); 
    for (int y = 0; y < h; y++) { 
        for (int x = 0; x < w; x++) { 
            if (x == 0 || x == w - 1 || y == 0 || y == h - 1) printf("#"); 
            else if (x == px && y == py) printf("@"); 
            else if (x == tx && y == ty) printf("X"); 
            else printf(" "); 
        } 
        printf("\n"); 
    } 
}
