from PIL import Image
import numpy as np

# Open the image file
im = Image.open('CPM.png')

# Get the width and height of the image
width, height = im.size

# Loop through all the pixels in the image
for y in range(height):
    for x in range(width):
        # Get the pixel at position (x, y)
        pixel = im.getpixel((x, y))
        # Print the RGB values of the pixel
        #print(pixel)

def get_rgb(pixel):
    return pixel[0], pixel[1], pixel[2]

# ...

arr = []

for y in range(height):
    for x in range(width):
        pixel = im.getpixel((x, y))
        r, g, b = get_rgb(pixel)
        rr = format(r, '08b')
        rg = format(g, '08b')
        rb = format(b, '08b')
        rr = rr[:4]
        rg = rg[:4]
        rb = rb[:4]
        arr.append(rr + rg + rb);
        # print(rr + rg + rb);


tmp = np.array(arr).reshape(1, -1);
# print(tmp);

# Save the array to a binary file
arr = np.savetxt('CPM.bin', tmp, delimiter='\n', fmt = '%s')

