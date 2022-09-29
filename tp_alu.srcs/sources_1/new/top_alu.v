`timescale 1ns / 1ps

module top_alu#(
    parameter NB_DATA = 8,
    parameter NB_OP = 6,
    parameter NB_LEDS = 10
)(
    input wire [NB_DATA-1 :0] i_switches,
    input wire i_enable_A,
    input wire i_enable_B,
    input wire i_enable_OP,
    input wire i_reset,
    input wire i_clock,
    output wire [NB_LEDS-1 :0] o_leds //10bits
);


reg [NB_DATA-1 :0] dato_A;
reg [NB_DATA-1 :0] dato_B;
reg [NB_OP-1 :0] operacion;
wire [NB_DATA : 0] result;

wire carry;
wire zero;

assign carry = result[NB_DATA];
assign zero = ~| result;
assign o_leds = {zero,result};

alu u_alu(
    .i_dato_A(dato_A),
    .i_dato_B(dato_B),
    .i_OP(operacion),
    .o_result(result)
);

always@(posedge i_clock)
begin 
    if(i_reset)
        dato_A <= {NB_DATA{1'b0}};
    else if(i_enable_A)
        dato_A <= i_switches;
end

always@(posedge i_clock)
begin 
    if(i_reset)
        dato_B <= {NB_DATA{1'b0}};
    else if(i_enable_B)
        dato_B <= i_switches;
end

always@(posedge i_clock)
begin 
    if(i_reset)
        operacion <= {NB_DATA{1'b0}};
    else if(i_enable_OP)
        operacion <= i_switches;
end

endmodule
