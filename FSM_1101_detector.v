`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2026 08:26:21 PM
// Design Name: 
// Module Name: FSM_1101_detector
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


module FSM_1101_detector(
    input wire clk,
    input wire rst,
    input wire x,
    output reg y,            
    output wire [1:0] state_out 
);
        
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;
  
    reg [1:0] state; 

    always @(posedge clk or negedge rst) begin  
        if (!rst) begin
            state <= A;
        end  
        else begin 
            case(state)
                A: state <= x ? B : A;
                B: state <= x ? C : A;
                C: state <= x ? C : D;
                D: state <= A; 
                default: state <= A;
            endcase
        end
    end   

    always @(*) begin
        if (state == D && x == 1)
            y = 1;
        else
            y = 0;
    end 
          
    assign state_out = state;         
        
endmodule