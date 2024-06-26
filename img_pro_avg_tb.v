`timescale 1ns / 1ps

module img_pro_avg_tb;

// Parameters

parameter Width = 28;
parameter Height = 28;
parameter CLK_PERIOD = 10; // Clock period in ns

integer output_file;
integer temp;
integer m;

task write_output_image;
begin
output_file = $fopen("output_image.txt", "w");
for (m = 0; m < Width*Height; m = m + 1) begin
temp = dut.memory_out[m];
temp = temp/625;
$fwrite(output_file, "%d\n", temp);
end
$fclose(output_file);
end
endtask

// Inputs

reg clk;
reg reset;
reg wr_en;
reg [8:0] data_in;

// Outputs

wire [7:0] data_out;

// Instantiate the module to be tested

img_pro_avg #(
    .Width(Width),
    .Height(Height)
) dut (
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation

always #((CLK_PERIOD)/2) clk = ~clk;

// Initial values

initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    wr_en = 0;
    data_in = 8'b01010001;
    #21 wr_en = 1;
    reset = 0;
    
    
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001001;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000111;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00001010;
    #10 data_in = 8'b00010001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00010110;
    #10 data_in = 8'b00011000;
    #10 data_in = 8'b00010011;
    #10 data_in = 8'b01110001;
    #10 data_in = 8'b10011110;
    #10 data_in = 8'b10101100;
    #10 data_in = 8'b00011001;
    #10 data_in = 8'b10010111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b01111000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00001111;
    #10 data_in = 8'b00011100;
    #10 data_in = 8'b00111000;
    #10 data_in = 8'b01011100;
    #10 data_in = 8'b10000011;
    #10 data_in = 8'b10110001;
    #10 data_in = 8'b11011111;
    #10 data_in = 8'b11111011;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111010;
    #10 data_in = 8'b11010011;
    #10 data_in = 8'b10110000;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11110101;
    #10 data_in = 8'b10111011;
    #10 data_in = 8'b00111110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00100101;
    #10 data_in = 8'b11101011;
    #10 data_in = 8'b11111000;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111110;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111001;
    #10 data_in = 8'b11111010;
    #10 data_in = 8'b11111011;
    #10 data_in = 8'b01101001;
    #10 data_in = 8'b01010100;
    #10 data_in = 8'b01001011;
    #10 data_in = 8'b00110100;
    #10 data_in = 8'b00101110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b11010110;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111011;
    #10 data_in = 8'b11101110;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11110101;
    #10 data_in = 8'b11010010;
    #10 data_in = 8'b10110100;
    #10 data_in = 8'b11111001;
    #10 data_in = 8'b11110111;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000111;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b01010011;
    #10 data_in = 8'b10010101;
    #10 data_in = 8'b01101000;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11001000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00101001;
    #10 data_in = 8'b10001100;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000111;
    #10 data_in = 8'b00001010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00001001;
    #10 data_in = 8'b00010011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b10011101;
    #10 data_in = 8'b11101100;
    #10 data_in = 8'b01011110;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00011010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001010;
    #10 data_in = 8'b10001011;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b10110110;
    #10 data_in = 8'b00010110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00001001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b10111001;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b00110110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010100;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00110100;
    #10 data_in = 8'b11110110;
    #10 data_in = 8'b11100001;
    #10 data_in = 8'b10100111;
    #10 data_in = 8'b01101100;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00001010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00111101;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111000;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b01101100;
    #10 data_in = 8'b00011001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00001001;
    #10 data_in = 8'b00101101;
    #10 data_in = 8'b10110101;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11110110;
    #10 data_in = 8'b10010110;
    #10 data_in = 8'b00010111;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b01011100;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b10110001;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00001001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00000111;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111110;
    #10 data_in = 8'b11100110;
    #10 data_in = 8'b01001001;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00001010;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001111;
    #10 data_in = 8'b00001010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00101001;
    #10 data_in = 8'b10000011;
    #10 data_in = 8'b10111111;
    #10 data_in = 8'b11101111;
    #10 data_in = 8'b11111100;
    #10 data_in = 8'b11100000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00011101;
    #10 data_in = 8'b10001100;
    #10 data_in = 8'b11101101;
    #10 data_in = 8'b11110011;
    #10 data_in = 8'b11111101;
    #10 data_in = 8'b11110111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b10110110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00001110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00010000;
    #10 data_in = 8'b01101100;
    #10 data_in = 8'b11100001;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11110101;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11010001;
    #10 data_in = 8'b01000101;
    #10 data_in = 8'b00001001;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000111;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010001;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b01010100;
    #10 data_in = 8'b11000110;
    #10 data_in = 8'b11111101;
    #10 data_in = 8'b11111101;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11110101;
    #10 data_in = 8'b10111110;
    #10 data_in = 8'b01001000;
    #10 data_in = 8'b00001111;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00010001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00011001;
    #10 data_in = 8'b10011110;
    #10 data_in = 8'b11100111;
    #10 data_in = 8'b11110011;
    #10 data_in = 8'b11110111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11000001;
    #10 data_in = 8'b01010011;
    #10 data_in = 8'b00010000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010110;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00111110;
    #10 data_in = 8'b10110001;
    #10 data_in = 8'b11010110;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11111000;
    #10 data_in = 8'b11111100;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11101001;
    #10 data_in = 8'b10000010;
    #10 data_in = 8'b00011000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000111;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001111;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010100;
    #10 data_in = 8'b01111101;
    #10 data_in = 8'b11110000;
    #10 data_in = 8'b11111111;
    #10 data_in = 8'b11110110;
    #10 data_in = 8'b11000110;
    #10 data_in = 8'b10010001;
    #10 data_in = 8'b01110110;
    #10 data_in = 8'b00010110;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00001011;
    #10 data_in = 8'b00000111;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001001;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000110;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000001;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00010001;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00001101;
    #10 data_in = 8'b00001100;
    #10 data_in = 8'b00000010;
    #10 data_in = 8'b00000011;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000100;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000101;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #10 data_in = 8'b00000000;
    #5 wr_en=0;
    // Reset sequence
    #20 reset = 1;
    
    write_output_image;
    
    $finish;
    
end

// Monitor

always @(posedge clk) begin
    $display("Time = %0t, data_out = %b", $time, data_out);
end

endmodule
