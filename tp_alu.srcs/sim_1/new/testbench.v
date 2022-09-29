`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2022 11:32:48 AM
// Design Name: 
// Module Name: testbench_alu
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


module testbench_alu(
);

localparam NB_DATA=8;
localparam NB_OP = 6;

localparam OP_ADD = 6'b100000;
localparam OP_SUB = 6'b100010;
localparam OP_AND = 6'b100100;
localparam OP_OR = 6'b100101;
localparam OP_XOR = 6'b100110;
localparam OP_SRA = 6'b000011;
localparam OP_SRL = 6'b000010;
localparam OP_NOR = 6'b100111;

reg [NB_DATA-1 :0] switches;
reg enable_A;
reg enable_B;
reg enable_OP;
reg clock;
reg reset;

wire [NB_DATA+1 :0] leds;

top_alu u_top_alu(
    .i_switches(switches),
    .i_enable_A(enable_A),
    .i_enable_B(enable_B),
    .i_enable_OP(enable_OP),
    .i_reset(reset),
    .i_clock(clock),
    .o_leds(leds)
);

initial
begin
    clock = 1'b0;
    reset = 1'b1;
    switches = 8'b0;
    enable_A = 1'b0;
    enable_B = 1'b0;
    enable_OP = 1'b0;
    
    #50
    reset = 1'b0;
    
    // SUMA 255 + 1 
    #20 
    switches = 8'b11111111; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000001; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_ADD; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0;
    
    // RESTA 3 - 3
    #20 
    switches = 8'b00000011; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000011; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_SUB; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0;
    
    //AND 11111110 & 00000011
    #20 
    switches = 8'b11111110; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000011; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_AND; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0;
    
    //OR 11111110 | 00000011
    #20 
    switches = 8'b11111110; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000011; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_OR; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0;
    
    //XOR 11111010 ^ 00000011
    #20 
    switches = 8'b11111010; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000011; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_XOR; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0;  
    
    //SRA 
    #20 
    switches = 8'b11001010; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000000; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_SRA; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0;  
     
    //SRL
    #20 
    switches = 8'b10000010; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000000; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_SRL; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0; 
    
    //NOR 11111110 | 00000010
    #20 
    switches = 8'b11111110; //valor 255 para dato A
    enable_A = 1'b1;
    #20 
    enable_A = 1'b0;
    switches = 8'b00000010; //valor 1 para dato B
    enable_B = 1'b1;
    #20
    enable_B = 1'b0;
    switches = OP_NOR; // operacion 
    enable_OP = 1'b1;
    #20 
    enable_OP = 1'b0;
    
    #20 
    $finish;
end

always 
begin
    #5
    clock = ~clock;
end

endmodule
