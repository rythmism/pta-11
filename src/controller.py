import sys
import msvcrt

def capture_input():
    try:
        # Check if a keypress is waiting in the Windows terminal ring buffer
        if msvcrt.kbhit():
            key = msvcrt.getch()
            # Handle special function keys or arrow prefix sequences
            if key in (b'\x00', b'\xe0'):
                msvcrt.getch() 
                return
            try:
                char_out = key.decode('utf-8').lower()
                sys.stdout.write(char_out)
                sys.stdout.flush()
            except UnicodeDecodeError:
                return
    except Exception as e:
        sys.stderr.write(str(e))

if __name__ == "__main__":
    capture_input()

