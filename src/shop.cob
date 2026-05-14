       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHOP.
       author. PTA-11 ENGINE LINKER.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ITEM-COST      PIC 9(4) VALUE 2.
       01  WS-HP-INCREASE    PIC 9(2) VALUE 1.

       LINKAGE SECTION.
       01  PASSED-SCORE      PIC S9(9) COMP-5.
       01  PASSED-HP         PIC S9(9) COMP-5.

       PROCEDURE DIVISION USING PASSED-SCORE, PASSED-HP.
       000-MAIN-LOGIC.
           DISPLAY " "
           DISPLAY "========= 🏪 COBOL TRANSACTION SHOP ========="
           DISPLAY "Current Balance: " PASSED-SCORE " Points"
           DISPLAY "Current Health : " PASSED-HP    " HP"
           DISPLAY "---------------------------------------------"
           DISPLAY "Attempting purchase: +1 HP for 2 Points..."

           IF PASSED-SCORE >= WS-ITEM-COST THEN
               SUBTRACT WS-ITEM-COST FROM PASSED-SCORE
               ADD WS-HP-INCREASE TO PASSED-HP
               DISPLAY "[SUCCESS] Transaction complete! Health boosted."
               DISPLAY "Updated Balance: " PASSED-SCORE " Points"
               DISPLAY "Updated Health : " PASSED-HP    " HP"
           ELSE
               DISPLAY "[REJECTED] Transaction failed! Insufficient funds."
               DISPLAY "Earn more points to unlock structural upgrades."
           END-IF

           DISPLAY "============================================="
           DISPLAY " "
           GOBACK.
