from PIL import Image

# Open the image file
image = Image.open("image.jpg").convert('L')

# Get the image dimensions
width, height = image.size

# Create a Verilog test bench file
with open("img_pro_avg_tb.v", "w") as f:
    # Write the module header
    f.write("`timescale 1ns / 1ps\n\n")
    f.write("module img_pro_avg_tb;\n\n")
    f.write("// Parameters\n\n")
    f.write(f"parameter Width = {width};\n")
    f.write(f"parameter Height = {height};\n")
    f.write("parameter CLK_PERIOD = 10; // Clock period in ns\n\n")
    
#     task write_output_image;
#     begin
#         output_file = $fopen("output_image.txt", "w");
#         for (integer m = 1; m < Width*Height+1; m = m + 1) begin
#             temp = dut.memory_out[m];
#             temp = temp/625;
#             //temp = temp/50;
# //            if (temp > 255)
# //                temp = 255;
# //            else if (temp<0)
# //                temp = 0;
#             $fwrite(output_file, "%d\n", temp);
#         end
#         $fclose(output_file);
#     end
# endtask

    f.write("integer output_file;\n")
    f.write("integer temp;\n\n")

    f.write("task write_output_image;\n")
    f.write("begin\n")
    f.write("output_file = $fopen(\"output_image.txt\", \"w\");\n")
    f.write("for (integer m = 1; m < Width*Height+1; m = m + 1) begin\n")
    f.write("temp = dut.memory_out[m];\n")
    f.write("temp = temp/625;\n")
    f.write("$fwrite(output_file, \"%d\n\", temp);\n")
    f.write("end\n")
    f.write("$fclose(output_file);\n")
    f.write("end\n")
    f.write("endtask\n\n")

    # Write the input/output declarations
    f.write("// Inputs\n\n")
    f.write("reg clk;\n")
    f.write("reg reset;\n")
    f.write("reg wr_en;\n")
    f.write("reg [8:0] data_in;\n\n")
    f.write("// Outputs\n\n")
    f.write("wire [8:0] data_out;\n\n")

    # Write the module instantiation
    f.write("// Instantiate the module to be tested\n\n")
    f.write("img_pro_avg #(\n")
    f.write("    .Width(Width),\n")
    f.write("    .Height(Height)\n")
    f.write(") dut (\n")
    f.write("    .clk(clk),\n")
    f.write("    .reset(reset),\n")
    f.write("    .wr_en(wr_en),\n")
    f.write("    .data_in(data_in),\n")
    f.write("    .data_out(data_out)\n")
    f.write(");\n\n")

    # Write the clock generation
    f.write("// Clock generation\n\n")
    f.write("always #((CLK_PERIOD)/2) clk = ~clk;\n\n")

    # Write the initial values
    f.write("// Initial values\n\n")
    f.write("initial begin\n")
    f.write("    // Initialize inputs\n")
    f.write("    clk = 0;\n")
    f.write("    reset = 1;\n")
    f.write("    wr_en = 0;\n")
    f.write("    data_in = 8'b01010001;\n")
    f.write("    #21 wr_en=1;\n")
    f.write("    reset=0;\n")

    # Write the pixel values
    f.write("    // Pixel values\n")
    for y in range(height):
        for x in range(width):
            pixel_value = image.getpixel((x, y))
            binary_pixel_value = format(pixel_value, '08b')
            binary_pixel_value = f"8'b{binary_pixel_value}"
            f.write(f"    #10 data_in = {binary_pixel_value};\n")

    f.write("    #5 wr_en=0;\n")
    f.write("    // Reset sequence\n")
    f.write("    #20 reset = 1;\n")
    f.write("end\n\n")

    # Write the monitor
    f.write("// Monitor\n\n")
    f.write("always @(posedge clk) begin\n")
    f.write("    $display(\"Time = %0t, data_out = %b\", $time, data_out);\n")
    f.write("end\n\n")
    f.write("endmodule\n")