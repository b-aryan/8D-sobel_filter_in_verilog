`timescale 1ns / 1ps

module img_pro_avg #(
    parameter Width = 28,
    parameter Height = 28
) (
    input wire clk,
    input wire reset,
    input wire wr_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

reg [9:0] memory_in [0:(Width+4)*(Height+4)-1];
reg signed [17:0] memory_out [0:Width*Height-1];
reg [9:0] addr_in;
reg [9:0] addr_out;
reg signed [9:0] kernel [0:199]; // 8 kernels, each with 25 values
reg signed [17:0] sum [0:7]; // 8 sums for 8 kernels
reg signed [17:0] abs_sum [0:7]; // Absolute values of the sums
reg signed [17:0] max_sum; // Maximum of the absolute sums

integer i,j,k;

// Initialize the 8 kernels
initial begin
    
    //Kernel 1
    kernel[175] = 0;  kernel[176] = 0;  kernel[177] = 0;  kernel[178] = 0;  kernel[179] = 0;
    kernel[180] = -1; kernel[181] = -2; kernel[182] = -4; kernel[183] = -2; kernel[184] = -1;
    kernel[185] = 0; kernel[186] = 0; kernel[187] = 0; kernel[188] = 0; kernel[189] = 0;
    kernel[190] = 1; kernel[191] = 2; kernel[192] = 4; kernel[193] = 2; kernel[194] = 1;
    kernel[195] = 0; kernel[196] = 0; kernel[197] = 0; kernel[198] = 0; kernel[199] = 0;

    // Kernel 2
    kernel[0] = 0;  kernel[1] = 0;  kernel[2] = 0;  kernel[3] = 0;  kernel[4] = 0;
    kernel[5] = -1; kernel[6] = -2; kernel[7] = -4; kernel[8] = -2; kernel[9] = -1;
    kernel[10] = 0; kernel[11] = 0; kernel[12] = 0; kernel[13] = 0; kernel[14] = 0;
    kernel[15] = 1; kernel[16] = 2; kernel[17] = 4; kernel[18] = 2; kernel[19] = 1;
    kernel[20] = 0; kernel[21] = 0; kernel[22] = 0; kernel[23] = 0; kernel[24] = 0;

    // Kernel 3
    kernel[25] = 0; kernel[26] = -1; kernel[27] = 0; kernel[28] = 1; kernel[29] = 0;
    kernel[30] = 0; kernel[31] = -2; kernel[32] = 0; kernel[33] = 2; kernel[34] = 0;
    kernel[35] = 0; kernel[36] = -4; kernel[37] = 0; kernel[38] = 4; kernel[39] = 0;
    kernel[40] = 0; kernel[41] = -2; kernel[42] = 0; kernel[43] = 2; kernel[44] = 0;
    kernel[45] = 0; kernel[46] = -1; kernel[47] = 0; kernel[48] = 1; kernel[49] = 0;

    // Kernel 4
    kernel[50] = 0; kernel[51] = -4; kernel[52] = 0; kernel[53] = 4; kernel[54] = 0;
    kernel[55] = 0; kernel[56] = -4; kernel[57] = 0; kernel[58] = 4; kernel[59] = 0;
    kernel[60] = 0; kernel[61] = -4; kernel[62] = 0; kernel[63] = 4; kernel[64] = 0;
    kernel[65] = 0; kernel[66] = -4; kernel[67] = 0; kernel[68] = 4; kernel[69] = 0;
    kernel[70] = 0; kernel[71] = -4; kernel[72] = 0; kernel[73] = 4; kernel[74] = 0;

    // Kernel 5
    kernel[75] = 0; kernel[76] = -1; kernel[77] = 0; kernel[78] = 1; kernel[79] = 0;
    kernel[80] = 0; kernel[81] = -2; kernel[82] = -4; kernel[83] = 2; kernel[84] = 0;
    kernel[85] = 0; kernel[86] = 0; kernel[87] = 0; kernel[88] = 0; kernel[89] = 0;
    kernel[90] = 0; kernel[91] = 2; kernel[92] = 4; kernel[93] = -2; kernel[94] = 0;
    kernel[95] = 0; kernel[96] = -1; kernel[97] = 0; kernel[98] = 1; kernel[99] = 0;

    // Kernel 6
    kernel[100] = 0; kernel[101] = 0; kernel[102] = -1; kernel[103] = 0; kernel[104] = 0;
    kernel[105] = 0; kernel[106] = -2; kernel[107] = -4; kernel[108] = 2; kernel[109] = 0;
    kernel[110] = -1; kernel[111] = -4; kernel[112] = 0; kernel[113] = 4; kernel[114] = 1;
    kernel[115] = 0; kernel[116] = 2; kernel[117] = 4; kernel[118] = -2; kernel[119] = 0;
    kernel[120] = 0; kernel[121] = 0; kernel[122] = -1; kernel[123] = 0; kernel[124] = 0;

    // Kernel 7
    kernel[125] = 0; kernel[126] = 0; kernel[127] = 0; kernel[128] = -1; kernel[129] = 0;
    kernel[130] = 0; kernel[131] = 0; kernel[132] = -2; kernel[133] = -4; kernel[134] = -2;
    kernel[135] = 0; kernel[136] = 0; kernel[137] = 0; kernel[138] = -4; kernel[139] = 0;
    kernel[140] = 0; kernel[141] = 0; kernel[142] = 2; kernel[143] = 4; kernel[144] = 2;
    kernel[145] = 0; kernel[146] = 0; kernel[147] = 0; kernel[148] = 1; kernel[149] = 0;

    // Kernel 8
    kernel[150] = 0; kernel[151] = 0; kernel[152] = 0; kernel[153] = 0; kernel[154] = 0;
    kernel[155] = 0; kernel[156] = 0; kernel[157] = -2; kernel[158] = -4; kernel[159] = -2;
    kernel[160] = 0; kernel[161] = 1; kernel[162] = 0; kernel[163] = -4; kernel[164] = 0;
    kernel[165] = 0; kernel[166] = 2; kernel[167] = 4; kernel[168] = 2; kernel[169] = 0;
    kernel[170] = 0; kernel[171] = 0; kernel[172] = 0; kernel[173] = 0; kernel[174] = 0;

end

always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < (Width+4)*(Height+4); i = i + 1) begin
            memory_in[i] = 0;
        end
        for (i = 0; i < Width*Height; i = i + 1) begin
            memory_out[i] = 0;
        end
        addr_in <= 0;
        addr_out <= 0;
        for (i = 0; i < 8; i = i + 1) begin
            sum[i] = 0;
            abs_sum[i] = 0;
        end
        max_sum <= 0;
    end else begin
        if (wr_en) begin
            memory_in[addr_in] = data_in;
            addr_in <= addr_in + 1;
            if (addr_in == (Width+4)*(Height+4)-1) begin
                addr_in <= 0;
            end
        end

        // Apply the 8 kernels with padding
        if (addr_in >= (Width+4)*2 + 2 && addr_in < (Width+4)*(Height+2) - 2) begin
            for (k = 0; k < 8; k = k + 1) begin
                sum[k] = 0;
                for (i = -2; i <= 2; i = i + 1) begin
                    for (j = -2; j <= 2; j = j + 1) begin
                        sum[k] = sum[k] + memory_in[addr_in + i*(Width+4) + j] * kernel[k*25 + i*5 + j + 12];
                    end
                end
                abs_sum[k] = (sum[k] >= 0) ? sum[k] : -sum[k];
            end

            // Find the maximum of the absolute sums
            max_sum <= abs_sum[0];
            for (k = 1; k < 8; k = k + 1) begin
                if (abs_sum[k] > max_sum) begin
                    max_sum <= abs_sum[k];
                end
            end

            memory_out[addr_out] = max_sum;
            addr_out <= addr_out + 1;
            if (addr_out == Width*Height-1) begin
                addr_out <= 0;
            end
        end
    end

    // Saturate the output to 8-bit range
    data_out <= (max_sum > 255) ? 8'hff : max_sum[7:0];
end

endmodule