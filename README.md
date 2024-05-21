# **8-Direction Sobel Filter Implementation on FPGA**

## Introduction:
Image processing is a process to carry out some algorithms on a picture thus to obtain an intensified image and to abstract helpful characteristics from an image. In this process image is taken as input and characteristics that we want to extract are obtained as output. The approach for finding the margins of an object in an image is simply referred to as edge detection. It operates by diagnosing discontinuities in the intensity of light. In fields like digital image processing, machine vision and computer vision the edge detection method is utilized for extraction of features and segmentation of an image.
FPGA is a microcircuit which will be programmed within the area after manufacturing. FPGAs have greater potential application than programmable ROM (PROM) chips. Because their structure is spatial and parallel, they are used in real time image processing as an implementation platform.
The aim of this work is to implement the 8-D Sobel algorithm. It checks the image in eight directions and computes a discrete approximation to the derivative of each pixel. The gradient vector is the result of the Sobel operator is stored at the respective pixel of the image matrix. The image is convolved with the kernel matrix and stores the value of gradient at corresponding pixel. It is hence comparatively economical in means of calculations. On the contrary, the derivative results that it generates are comparatively unprocessed.

## Architecture:
We are taking an input image of 28x28 pixels, from which, we extract the pixel values and make a testbench file for verilog to run using a python script. After the testbench is generated, it can be run along with the main file on the FPGA to generate the output txt file which contains pixel values for the output image. This txt file can be used to generate the output image using another python script.

<img width="1540" alt="image" src="https://github.com/b-aryan/8D-sobel_filter_in_verilog/assets/108257626/4de38153-8e81-419e-898d-2276e161ee6a">

## Sobel Filter:

The traditional Sobel algorithm performs convolution calculations on discrete pixel chromaticity values, and then calculates the approximate value of the maximum gradient in the image direction through differential weighted average. Edge information is generated in this algorithm by calculating the vector gradient corresponding to each pixel in the image. However, the actual image has many edge directions, only two direction templates are used that makes other gradient directions cannot be detected, and massive edge information will be missed. Hence, to offset the shortcomings of the traditional Sobel algorithm for edge detection and increase edge information in other directions, the traditional Sobel algorithm templates are expanded, which uses the extended multi-directional template operator for edge detection.
<p align="center">
<img width="322" alt="Eight Directions of expansion" src="https://github.com/b-aryan/8D-sobel_filter_in_verilog/assets/108257626/b8123330-15ec-4618-8772-a8ec2f7177d6">
</p>
<p align="center">
Eight Directions of expansion
</p>

As shown by the solid arrow in the above figure, the algorithm uses the edge detection templates of 0°, 22.5°, 45°, 67.5°, 90°, 112.5°, 135°, 157.5° in eight directions for detection, the dashed arrow indicates the direction of symmetry. Taking the absolute value of the convolution result can realize edge detection in eight symmetric directions. The extended eight-direction template operator uses the 5x5 convolution template, and the convolution is calculated respectively as follows: 

<img width="1096" alt="image" src="https://github.com/b-aryan/8D-sobel_filter_in_verilog/assets/108257626/4552c66d-5779-477a-a69c-6dbe45773f13">



G<sub>0</sub> = (a) * image &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G<sub>90</sub> = (e) * image

G<sub>22.5</sub> = (b) * image&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G<sub>112.5</sub> = (f) * image

G<sub>45</sub> = (c) * image&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G<sub>135</sub> = (g) * image

G<sub>67.5</sub> = (d) * image&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G<sub>157.5</sub> = (h) * image

Through eight convolution templates, carry out the convolution weighting calculation of the image in the eight directions, and finally take the maximum value of the absolute value of the gradient in the eight convolution results as the output value of the current pixel. The expression is given by formula:

<p align="center">
G = max{|G<sub>0</sub>|,|G<sub>22.5</sub>|,|G<sub>45</sub>|,|G<sub>67.5</sub>|,|G<sub>90</sub>|,|G<sub>112.5</sub>|,|G<sub>135</sub>|,|G<sub>157.5</sub>|}
</p>

## Improvements Possible:
- The verilog code can be more optimized.
- Some pixels are rolling over from the left end of the image to the right end, this can be corrected.
- Adaptive Thresholding can be used for edge detection.

### Note:
This project was made as the course project for the course EE605: Machine Learning Architectures taught at IIT Guwahati.
