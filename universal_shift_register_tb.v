 `timescale 1ns/1ns

 module universal_shift_register_tb;
  reg clk ,rst,SI;
  reg [3:0]PI;
  reg [1:0]sel;
  wire [3:0]PO;
  // wire SO;

  universal_shift_register universal_shift_register_1(PO,PI,clk,rst,sel,SI);
  always #5 clk=~clk;
  initial begin 
  $dumpfile("universal_shift_register.vcd");
  $dumpvars(0,universal_shift_register_tb);

    $monitor("time=%d \t clk=%b\t rst=%b \t PI=%b\t PO=%b\t SI=%b\t  sel=%b" ,$time,clk,rst,PI,PO,SI,sel);

    clk=0;
    rst=1;
    PI=4'b0000;
    SI=0;
    sel = 2'b00;

    #10 rst=0;
     // Test 1: Parallel Load
    PI = 4'b1010;
    sel = 2'b11;
    #10;

    // Test 2: Hold
    sel = 2'b00;
    #10;

    // Test 3: Shift Left
    SI = 1;
    sel = 2'b01;
    #10;

    // Test 4: Shift Right
    SI = 0;
    sel = 2'b10;
    #10;

    // End simulation
    #20 $finish;
  end

endmodule
    
