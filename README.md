# Bitmap editor

This is a program that simulates a basic interactive bitmap editor. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour.

### Program input
The input consists of a file containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.  

Pixel coordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

### Commands
There are 6 supported commands:  
I N M - Create a new M x N image with all pixels coloured white (O).  
C - Clears the table, setting all pixels to white (O).  
L X Y C - Colours the pixel (X,Y) with colour C.  
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).  
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).  
S - Show the contents of the current image

### Example
To run the application you must supply a command file like so `bin/bitmap_editor examples/show.txt`  
Input File:  
I 5 6  
L 1 3 A  
V 2 3 6 W  
H 3 5 2 Z  
S

Expected Output:  
OOOOO  
OOZZZ  
AWOOO  
OWOOO  
OWOOO  
OWOOO  

### Format
The grid is formatted from the top left cell:
  
|      |      |      | 
| ---- | ---- | ---- |
| 1, 1 | 2, 1 | 3, 1 |  
| 1, 2 | 2, 2 | 3, 2 |  
| 1, 3 | 2, 3 | 3, 3 |  

---

## Running

`>bin/bitmap_editor examples/show.txt`

---

### Further Work
- lib/bitmap/grid.rb:
    - Refactor to remove duplication.
    - Many more validation checks. Some are listed as TODO's in the valid_params method.  
    - Refactor method order, so that the code reads from top to bottom.
    - Specs for #vertical.
    - Specs for #horizontal.
    - Specs for all validations checks.
    - Comment: I am not so happy with the current state of this class. I feel it is becoming too bloated and needs extracting to other classes.
- lib/bitmap/presenter.rb:
    - Specs written for all methods.
    - Comment: I feel this is a tidy Class. It carries out its functionality without pulling in lots of other logic.
- lib/bitmap_editor.rb:
    - Comment: This file I also feel encapsulates some logic that it shouldn't. I feel that the command validations would be better suited elsewhere.
