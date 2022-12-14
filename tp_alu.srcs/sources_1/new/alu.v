`timescale 1ns / 1ps

module alu#(
    parameter NB_DATA = 8,
    parameter NB_OP = 6,
    parameter NB_OUT = 9
)(
    input wire [NB_DATA-1 :0] i_dato_A,
    input wire [NB_DATA-1 :0] i_dato_B,
    input wire [NB_OP-1 :0] i_OP,
    output wire [NB_OUT-1 :0] o_result //9bits, incluye carry
);

localparam OP_ADD = 6'b100000;
localparam OP_SUB = 6'b100010;
localparam OP_AND = 6'b100100;
localparam OP_OR = 6'b100101;
localparam OP_XOR = 6'b100110;
localparam OP_SRA = 6'b000011;
localparam OP_SRL = 6'b000010;
localparam OP_NOR = 6'b100111;

reg [NB_OUT-1 :0] result;

assign o_result = result;

always @(*)
begin
    case(i_OP)
        OP_ADD    : result = i_dato_A + i_dato_B;
        OP_SUB    : result = i_dato_A - i_dato_B;
        OP_AND    : result = i_dato_A & i_dato_B;
        OP_OR     : result = i_dato_A | i_dato_B;
        OP_XOR    : result = i_dato_A ^ i_dato_B;
        OP_SRA    : result = {1'b0,i_dato_A[NB_DATA-1],i_dato_A[NB_DATA-1:1]};
        OP_SRL    : result = i_dato_A >> 1;
        OP_NOR    : result = ~(i_dato_A | i_dato_B);
        default   : result = i_dato_A + i_dato_B;
    endcase
end
endmodule
