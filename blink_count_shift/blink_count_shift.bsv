package blink_count_shift;

typedef struct {
    Bit#(5) leds;
    Bit#(2) rg_led_n;
    Bit#(16) seven_seg;
} BCDisplay deriving (Bits);

 // Blink Count Shift
interface BCS;
    method BCDisplay updateDisplay(Bit#(1) btn_n, Bit#(1) btn1, Bit#(1) btn2, Bit#(1) btn3);
endinterface: BCS

(* synthesize *)
module top (BCS);

    int log2delay = 22;
    int bits = 5;

    Reg#(int) counter <- mkReg (log2delay + bits);
    Reg#(int) outcnt <- mkReg (bits);

    rule r;
        counter <= counter + 1;
        outcnt <= counter >> log2delay;
    endrule

endmodule: top

endpackage: blink_count_shift