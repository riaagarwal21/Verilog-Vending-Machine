module vendingMachine(
  input clk,
  input rst,
  input [1:0] in, //01 = Rs.5, 10 = Rs.10
  output reg out,
  output reg [2:0] change
  //000 = Rs.0, 001 = Rs.5, 010 = Rs.10, 011 = Rs.15, 100 = Rs.20
);
  
parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
  
  reg [2:0] c_state, n_state;
  
  always @(posedge clk)
    begin
      if (rst == 1)
        begin
          c_state = 0;
          n_state = 0;
          change = 3'b000;
        end
      else
        c_state = n_state;
      
      case (c_state)
        s0:
          if (in == 0)
            begin
              n_state = s0;
              out = 0;
              change = 3'b000;
            end
         else if (in == 2'b01)
             begin
               n_state = s1;
               out = 0;
               change = 3'b000;
            end
          else if (in == 2'b10)
            begin
              n_state = s2;
              out = 0;
              change = 3'b000;
            end
        s1:
          if (in == 0)
            begin
              n_state = s0;
              out = 0;
              change = 3'b001;
            end
          else if (in == 2'b01)
            begin
              n_state = s2;
              out = 0;
              change = 3'b000;
            end
          else if (in == 2'b10)
            begin
              n_state = s3;
              out = 0;
              change = 3'b000;
            end
        s2:
          if (in == 0)
            begin
              n_state = s0;
              out = 0;
              change = 3'b010;
            end
          else if (in == 2'b01)
            begin
              n_state = s3;
              out = 0;
              change = 3'b000;
            end
          else if (in == 2'b10)
            begin
              n_state = s4;
              out = 0;
              change = 3'b000;
            end
        s3:
          if (in == 0)
            begin
              n_state = s0;
              out = 0;
              change = 3'b011;
            end
          else if (in == 2'b01)
            begin
              n_state = s4;
              out = 0;
              change = 3'b000;
            end
          else if (in == 2'b10)
            begin
              n_state = s0;
              out = 1;
              change = 3'b000;
            end
        s4:
          if (in == 0)
            begin
              n_state = s0;
              out = 0;
              change = 3'b100;
            end
          else if (in == 2'b01)
            begin
              n_state = s0;
              out = 1;
              change = 3'b000;
            end
          else if (in == 2'b10)
            begin
              n_state = s0;
              out = 1;
              change = 3'b001;
            end
      endcase
    end
  
endmodule
