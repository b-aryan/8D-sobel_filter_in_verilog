from PIL import Image

# Open the output file
with open("output_image.txt", "r") as f:
    pixel_values = [int(line.strip()) for line in f.readlines()]

# Calculate the image dimensions based on the number of pixel values
num_pixels = len(pixel_values)
width = 28  # Replace with the actual image width
height = num_pixels // width

# Create a new grayscale image with the calculated dimensions
output_image = Image.new("L", (width, height))

# Set the pixel values in the output image
pixel_index = 0
for y in range(height):
    for x in range(width):
        output_image.putpixel((x, y), pixel_values[pixel_index])
        pixel_index += 1

# Save the output image
output_image.save("output_image.png")