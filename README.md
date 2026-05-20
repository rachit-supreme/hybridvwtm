#### ABSTRACT ####

8-bit Hybrid Vedic Wallace Tree Multiplier
Multiply–Accumulate (MAC) operations form the computational backbone of digital signal
processing (DSP) systems and machine learning accelerators, where efficient multiplication
plays a critical role in determining overall performance. In such systems, low latency, reduced
power consumption, and minimal hardware area are key design requirements.
In this work, a hybrid multiplier architecture is proposed by combining the advantages of
the Vedic multiplication algorithm and the Wallace tree reduction technique. The proposed
design exploits the parallelism of Vedic multiplication for partial product generation and the
efficiency of Wallace tree structures for fast partial product reduction.
The proposed multiplier is implemented on an Artix-7 FPGA platform for multiple word
lengths, and its performance is evaluated in terms of hardware utilization and power consumption.
Experimental results show that, for an 8-bit implementation, the proposed hybrid design
reduces LUT utilization by approximately 13–20% and dynamic power consumption by about
6–10% compared to conventional Vedic and Wallace multipliers. Similar improvements are
observed for higher word lengths, demonstrating better scalability.
Further optimization is achieved through the elimination of redundant computations and the
application of clock and power gating techniques, leading to additional reductions in dynamic
power consumption. Overall, the proposed architecture achieves a balanced trade-off between
speed, area, andpower, making it well suited for high-performance and energy-efficient DSP applications.

## Objective ##
The main objective of this design is to combine the advantages of both Vedic and Wallace
Tree architectures while minimizing their individual drawbacks.

## Utilization Report ##
From the implementation results, the proposed HVWTM utilizes a limited number of hardware
resources, demonstrating efficient design optimization. The utilization summary shows that 79
Look-Up Tables (LUTs), 32 Flip-Flops (FFs), and 34 I/O pins are used.
The percentage utilization is very low for LUTs (0.38%) and Flip-Flops (0.08%), indicating
that the design is highly area-efficient and leaves significant room for scalability. Although
I/O utilization is comparatively higher (32.08%), it is acceptable as it depends on input-output
interfacing requirements.

## Timing Summary ##
From the timing report, the Worst Negative Slack (WNS) is observed to be 2.637 ns, and the 
Worst Hold Slack (WHS) is 0.293 ns. Since both values are positive, it indicates that the design
meets all timing constraints successfully. 
We have taken clock period as 10 ns , so Fmax is 100 MHz.
Additionally, the Total Negative Slack (TNS) is zero, and no failing endpoints are reported.
This confirms that the proposed HVWTM operates without timing violations.
The detailed path analysis further shows that the logic delay ( 26% of total delay) and route
delay( 74% of total delay) are well balanced, contributing to stable and efficient operation.

## Power Consumption ##
The total on-chip power consumption is observed to be 0.063 W. Out of this, the major portion
(91%) is contributed by static power, while dynamic power accounts for only 9%.
Among dynamic components, clock power contributes approximately 12%, while logic and
signal power remain minimal. This indicates that the design effectively minimizes switching
activity, leading to reduced dynamic power consumption.

## Key Highlights ##
1. Designed and FPGA-implemented an 8-bit Hybrid Vedic–Wallace Tree Multiplier in Verilog, 
  optimizing speed, area, and power for high-performance digital systems.
2. Achieved up to 20% LUT reduction and improved energy efficiency, making the design 
  suitable for DSP, FPGA-based signal processing, and hardware accelerator applications.
3. Reduction in dynamic power consumption by about 6–10% compared to conventional Vedic 
  and Wallace multipliers.

# References #
1. Janwadkar S, Dhavse R. ”ASIC implementation of ECG denoising FIR filter by using
   hybrid Vedic–Wallace tree multiplier.” Int J Circ Theor Appl. 2024;52(4):1621-1646
2. J. Tirthaji, Vedic Mathematics, Motilal Banarsidass, 1965.
3. C. S. Wallace, ”A Suggestion for a Fast Multiplier,” IEEE Trans. Electronic Computers,
   1964.
4. Parhami B. ”Computer Arithmetic: Algorithms and Hardware Designs,” Oxford University Press, Inc.; 1999
5. Pushpangadan R, Sukumaran V, Innocent R, Sasikumar D, Sundar V. ”High speed Vedic
   multiplier for digital signal processors.” IETE J Res. 2009;55(6):282-286.
