import sys, msvcrt

# Samples the keyboard buffer; returns the lowercase key if pressed, else empty string
key = msvcrt.getch().decode('utf-8').lower() if msvcrt.kbhit() else ''
print(key)
