
// Generated by Cadence Genus(TM) Synthesis Solution 20.11-s111_1
// Generated on: Mar 27 2025 18:36:27 IST (Mar 27 2025 13:06:27 UTC)

// Verification Directory fv/lock 

module lock(clock, reset, x, ready, unlock, error);
  input clock, reset, x;
  output ready, unlock, error;
  wire clock, reset, x;
  wire ready, unlock, error;
  wire [2:0] state;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_7, n_8;
  wire n_9, n_10, n_11, n_12, n_13, n_14, n_16, n_18;
  wire n_19, n_20, n_21;
  OAI2BB1XL g360(.A0N (x), .A1N (n_8), .B0 (n_18), .Y (n_20));
  NAND2XL g362(.A (n_3), .B (n_18), .Y (n_19));
  NAND2XL g364(.A (n_7), .B (n_13), .Y (error));
  OAI221XL g363(.A0 (n_14), .A1 (state[2]), .B0 (n_2), .B1 (n_11), .C0
       (n_9), .Y (n_16));
  OAI33XL g366(.A0 (x), .A1 (state[1]), .A2 (n_12), .B0 (n_5), .B1
       (n_0), .B2 (n_14), .Y (ready));
  AOI2BB1XL g368(.A0N (n_14), .A1N (n_12), .B0 (n_10), .Y (n_13));
  AOI21XL g370(.A0 (state[1]), .A1 (n_11), .B0 (n_10), .Y (n_18));
  NOR2XL g371(.A (x), .B (n_9), .Y (n_10));
  OAI211XL g365(.A0 (state[0]), .A1 (state[1]), .B0 (state[2]), .C0
       (n_1), .Y (n_8));
  NAND3XL g369(.A (n_9), .B (x), .C (state[0]), .Y (n_7));
  NOR3XL g372(.A (state[0]), .B (n_5), .C (n_4), .Y (unlock));
  INVXL g373(.A (n_11), .Y (n_12));
  NAND2XL g376(.A (state[2]), .B (n_4), .Y (n_9));
  MXI2XL g367(.A (state[0]), .B (x), .S0 (state[1]), .Y (n_3));
  NAND2XL g377(.A (n_2), .B (state[1]), .Y (n_14));
  NOR2XL g375(.A (state[0]), .B (state[2]), .Y (n_11));
  NAND2XL g374(.A (state[0]), .B (state[1]), .Y (n_1));
  INVXL g379(.A (x), .Y (n_2));
  INVXL g378(.A (reset), .Y (n_21));
  DFFRX1 \state_reg[0] (.RN (n_21), .CK (clock), .D (n_20), .Q
       (state[0]), .QN (n_0));
  DFFRX1 \state_reg[1] (.RN (n_21), .CK (clock), .D (n_19), .Q
       (state[1]), .QN (n_4));
  DFFRX1 \state_reg[2] (.RN (n_21), .CK (clock), .D (n_16), .Q
       (state[2]), .QN (n_5));
endmodule

