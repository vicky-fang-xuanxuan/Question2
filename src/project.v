/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

module priority_encoder (
    input wire [7:0] A,      // 8位输入A
    input wire [7:0] B,      // 8位输入B
    output reg [7:0] C      // 8位输出C
);

    // 内部信号：将A和B拼接为16位输入
    wire [15:0] In;
    assign In = {A, B};

    // 优先级编码逻辑
    always @(*) begin
        if (In[15] == 1)
            C = 8'b00001111;  // 15 in binary
        else if (In[14] == 1)
            C = 8'b00001110;  // 14 in binary
        else if (In[13] == 1)
            C = 8'b00001101;  // 13 in binary
        else if (In[12] == 1)
            C = 8'b00001100;  // 12 in binary
        else if (In[11] == 1)
            C = 8'b00001011;  // 11 in binary
        else if (In[10] == 1)
            C = 8'b00001010;  // 10 in binary
        else if (In[9] == 1)
            C = 8'b00001001;  // 9 in binary
        else if (In[8] == 1)
            C = 8'b00001000;  // 8 in binary
        else if (In[7] == 1)
            C = 8'b00000111;  // 7 in binary
        else if (In[6] == 1)
            C = 8'b00000110;  // 6 in binary
        else if (In[5] == 1)
            C = 8'b00000101;  // 5 in binary
        else if (In[4] == 1)
            C = 8'b00000100;  // 4 in binary
        else if (In[3] == 1)
            C = 8'b00000011;  // 3 in binary
        else if (In[2] == 1)
            C = 8'b00000010;  // 2 in binary
        else if (In[1] == 1)
            C = 8'b00000001;  // 1 in binary
        else if (In[0] == 1)
            C = 8'b00000000;  // 0 in binary
        else
            C = 8'b11110000;  // 特殊情况：所有位为0
    end

endmodule

endmodule
