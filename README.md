# Implementation of a 16-bit processor

## 1. Introduction
This implementation is part of a practical assignment for the discipline "Organização de Computadores I" 
(Computer Organization I) for the undergraduate course in Computer Science in the 
[Universidade Federal de Minas Gerais](http://www.ufmg.br/).
The processor is a simplified one, with only a few instructions. The purpose of this assignment is
to get familiar with the Verilog language and the modeling, synthesis and testing of a system.

## 2. Description of the processor
The implemented processor is a 16-bit processor with 4 cicles and 8 registers.
The instructions are the following:

|Operation  |Code |Function performed                             |
|-----------|-----|-----------------------------------------------|
|rep Rx, Ry |111  |Replacex Rx with Ry                            |
|ldi Rx, #D |101  |Loads immediate #D in register Rx              |
|add Rx, Ry |000  |Adds Rx and Ry and stores in Rx                |
|sub Rx, Ry |001  |Subtracts Rx and Ry and stores the result in Rx|
|nan Rx, Ry |010  |Rx nand Ry and stores in Rx                    |
|out Rx     |100  |Outputs Rx in the bus                          |

## 3. References
* [Verilog Tutorials](http://www.hdlexpress.com/Verilog/VT.html)
* [Verilog description for an 4x16 register file](http://courses.cs.washington.edu/courses/cse370/10sp/pdfs/lectures/regfile.txt)
