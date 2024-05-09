[PCILeech 4.14](https://github.com/ufrisk/pcileech-fpga) for Kintex325T boards
=================
This project contains software and HDL code for the Kintex325T based boards that were sold by lurker studio.
The original Project was pcileech-fpga linked at the top of the project.

# To generate the project


edit shell.bat and fix the path to point to your vivado installation.
This is for Vivado 2023.2


``C:\Xilinx\Vivado/2023.2\bin\vivado.bat -mode tcl``

Then simply run, 

```source vivado_generate_project.tcl```