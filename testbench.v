module vendingMachine_tb;
  
  //Input Declaration
  reg clk;
  reg [1:0] in;
  reg rst;
  
  //Output Declaration
  wire out;
  wire [2:0] change;
  
  //Instantiate
  vendingMachine uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
  );
  
  //Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, vendingMachine_tb);
    
    // Initialize inputs
    rst = 1; 
    in = 2'b00;
    #10;
    
    rst = 0;
    #10;
    
    // Insert Rs.5
    in = 2'b01;
    #10;
    
    // Insert Rs.10
    in = 2'b10;
    #10;
    
    // Reset the machine
    rst = 1;
    #10;
    rst = 0;
    #10;
    
    // Insert Rs.10
    in = 2'b10;
    #10;

    // Insert Rs.10
    in = 2'b10;
    #10;

    // Insert Rs.5
    in = 2'b01;
    #10;

    // End simulation
    $finish;
  end

endmodule
