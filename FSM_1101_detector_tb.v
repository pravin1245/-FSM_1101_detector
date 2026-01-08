`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2026 08:46:38 PM
// Design Name: 
// Module Name: FSM_1101_detector_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_1101_detector_tb( );
        
        reg clk;
        reg rst;
        reg x;
        wire y;
        wire [1:0] state_out;
         
         
     FSM_1101_detector dut(
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y),
         .state_out(state_out)   
     );   
   
    always #5 clk = ~clk;    // T = 1/100*10^6 = 10*10^-9 = 10ns
     
    initial begin    
      clk = 0;
      rst = 0;
      x = 0;
      
  //apply rst
  #10;
    rst = 1;
    
  // apply input sequence  1101 
  // if 1101 detect y = 1 
  
 #10    x = 1;
 #10    x = 1;
 #10    x = 0;
 #10    x = 1;
      
      
 #10    x = 0;
 #10    x = 1;     
            
 #10    x = 1;
 #10    x = 1;
 #10    x = 0;
 #10    x = 1;
 
 #10    x = 1;    
 #10    x = 0;
 
 
 #10    x = 1;
 #10    x = 1;
 #10    x = 0;
 #10    x = 1;
 
        #20;
         $finish;
         
   end
    
           // Monitor values in console
     initial begin
        $monitor("T=%0t clk=%b x=%b state=%b y=%b",
                 $time, clk, x, state_out, y);
     end                                            
  endmodule
