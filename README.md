# vedic-multiplier
Implementation of Area efficient 16x16 Vedic Multiplier using Parallel Prefix Adder in Verilog HDL.

Here's an overview of the key features and functionalities of the implemented circuit:

•The proposed Vedic multiplier uses the ancient "Urdhva Tiryagbhyam Sutra" to multiply two numbers faster (vertical and crosswise multiplication). The Vedic multiplier proves to be highly efficient for applications like digital signal processing in terms of both speed and smaller area compared to other designs. It minimizes the delay, power, and hardware need for the product. This method lessens number of levels and hence delay is minimized.

•In order to make it area efficient, we are using Ladner-Fischer parallel prefix adders because execution is done parallel. These parallel prefix adders increase the transfer rate and in turn increase the summation speed. The addition operation in the parallel prefix adder uses a 3-step stage: pre-processing, carry generation and post-processing stages.

•A combination of these algorithms generates a brand-new structure of low implementation area power efficiency in the Vedic multiplier.

The Vedic Multiplier is preferred than the conventional multiplier because it provides better performance and consumes less execution time for computation and requires fewer memory resources than conventional multipliers. The Vedic multiplier is also highly scalable, meaning it can be easily extended to handle larger operands.
