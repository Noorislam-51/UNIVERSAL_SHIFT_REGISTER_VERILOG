// D Flip-Flop Module
module dff(q, d, clk, rst);
  input d, clk, rst;
  output reg q;

  always @(posedge clk) begin
    if (rst)
      q <= 1'b0;
    else
      q <= d;
  end
endmodule


// Universal Shift Register with Serial Input (SI)
module universal_shift_register(PO, PI, clk, rst, sel, SI);
  input clk, rst, SI;
  input [3:0] PI;
  input [1:0] sel;
  output reg [3:0] PO;
  
  always @(posedge clk) begin
    if (rst)
      PO <= 4'b0000;
    else begin
      case (sel)
        2'b00: PO <= PO;                    // Hold
        2'b01: PO <= {PO[2:0], SI};         // Shift Left
        2'b10: PO <= {SI, PO[3:1]};         // Shift Right
        2'b11: PO <= PI;                    // Parallel Load
        default: PO <= 4'b0000;
      endcase
    end
  end

endmodule
