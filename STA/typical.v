`timescale 1ns/10ps
`celldefine
module ANTENNA (A);
input  A ;

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ACHCONX2 (A, B, CI, CON);
input  A ;
input  B ;
input  CI ;
output CON ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (CON, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A$CON = 0.1:0.1:0.1,
       tphlh$A$CON = 0.094:0.095:0.095,
       tplhl$B$CON = 0.044:0.05:0.055,
       tphlh$B$CON = 0.046:0.053:0.06,
       tplhl$CI$CON = 0.023:0.023:0.023,
       tphlh$CI$CON = 0.025:0.025:0.025;

     // path delays
     (A *> CON) = (tphlh$A$CON, tplhl$A$CON);
     (B *> CON) = (tphlh$B$CON, tplhl$B$CON);
     (CI *> CON) = (tphlh$CI$CON, tplhl$CI$CON);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHX1 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.054:0.062:0.07,
       tplhl$A$S = 0.11:0.11:0.11,
       tphlh$A$S = 0.13:0.13:0.13,
       tphhl$A$S = 0.068:0.078:0.088,
       tpllh$A$CO = 0.065:0.065:0.065,
       tphhl$A$CO = 0.079:0.08:0.08,
       tpllh$B$S = 0.05:0.061:0.071,
       tplhl$B$S = 0.11:0.11:0.11,
       tphlh$B$S = 0.13:0.13:0.14,
       tphhl$B$S = 0.064:0.076:0.087,
       tpllh$B$CO = 0.063:0.066:0.069,
       tphhl$B$CO = 0.08:0.08:0.081,
       tpllh$CI$S = 0.049:0.06:0.071,
       tplhl$CI$S = 0.11:0.11:0.11,
       tphlh$CI$S = 0.13:0.13:0.13,
       tphhl$CI$S = 0.063:0.073:0.082,
       tpllh$CI$CO = 0.06:0.061:0.063,
       tphhl$CI$CO = 0.072:0.073:0.074;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHX2 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.065:0.076:0.086,
       tplhl$A$S = 0.14:0.14:0.14,
       tphlh$A$S = 0.16:0.16:0.17,
       tphhl$A$S = 0.083:0.096:0.11,
       tpllh$A$CO = 0.073:0.074:0.074,
       tphhl$A$CO = 0.091:0.091:0.092,
       tpllh$B$S = 0.061:0.075:0.088,
       tplhl$B$S = 0.15:0.15:0.15,
       tphlh$B$S = 0.16:0.17:0.17,
       tphhl$B$S = 0.079:0.094:0.11,
       tpllh$B$CO = 0.072:0.075:0.078,
       tphhl$B$CO = 0.092:0.092:0.093,
       tpllh$CI$S = 0.061:0.074:0.088,
       tplhl$CI$S = 0.14:0.14:0.14,
       tphlh$CI$S = 0.16:0.16:0.16,
       tphhl$CI$S = 0.079:0.092:0.11,
       tpllh$CI$CO = 0.068:0.07:0.071,
       tphhl$CI$CO = 0.083:0.084:0.086;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHX4 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.08:0.093:0.11,
       tplhl$A$S = 0.18:0.18:0.18,
       tphlh$A$S = 0.21:0.21:0.21,
       tphhl$A$S = 0.1:0.12:0.14,
       tpllh$A$CO = 0.087:0.087:0.087,
       tphhl$A$CO = 0.11:0.11:0.11,
       tpllh$B$S = 0.075:0.092:0.11,
       tplhl$B$S = 0.18:0.18:0.18,
       tphlh$B$S = 0.21:0.21:0.21,
       tphhl$B$S = 0.097:0.12:0.14,
       tpllh$B$CO = 0.085:0.088:0.091,
       tphhl$B$CO = 0.11:0.11:0.11,
       tpllh$CI$S = 0.075:0.092:0.11,
       tplhl$CI$S = 0.18:0.18:0.18,
       tphlh$CI$S = 0.2:0.2:0.21,
       tphhl$CI$S = 0.098:0.12:0.13,
       tpllh$CI$CO = 0.081:0.083:0.085,
       tphhl$CI$CO = 0.1:0.1:0.1;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHXL (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.051:0.058:0.066,
       tplhl$A$S = 0.1:0.11:0.11,
       tphlh$A$S = 0.12:0.12:0.13,
       tphhl$A$S = 0.064:0.074:0.083,
       tpllh$A$CO = 0.062:0.062:0.063,
       tphhl$A$CO = 0.076:0.076:0.076,
       tpllh$B$S = 0.047:0.057:0.067,
       tplhl$B$S = 0.11:0.11:0.11,
       tphlh$B$S = 0.12:0.13:0.13,
       tphhl$B$S = 0.06:0.071:0.082,
       tpllh$B$CO = 0.06:0.063:0.066,
       tphhl$B$CO = 0.077:0.077:0.077,
       tpllh$CI$S = 0.047:0.057:0.067,
       tplhl$CI$S = 0.1:0.1:0.11,
       tphlh$CI$S = 0.12:0.12:0.12,
       tphhl$CI$S = 0.06:0.069:0.077,
       tpllh$CI$CO = 0.057:0.058:0.06,
       tphhl$CI$CO = 0.068:0.069:0.07;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFX1 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.061:0.071:0.08,
       tplhl$A$S = 0.13:0.13:0.13,
       tphlh$A$S = 0.15:0.15:0.16,
       tphhl$A$S = 0.079:0.091:0.1,
       tpllh$A$CO = 0.073:0.073:0.073,
       tphhl$A$CO = 0.092:0.092:0.092,
       tpllh$B$S = 0.057:0.069:0.081,
       tplhl$B$S = 0.13:0.14:0.14,
       tphlh$B$S = 0.15:0.16:0.16,
       tphhl$B$S = 0.074:0.088:0.1,
       tpllh$B$CO = 0.071:0.074:0.077,
       tphhl$B$CO = 0.092:0.093:0.094,
       tpllh$CI$S = 0.057:0.069:0.081,
       tplhl$CI$S = 0.13:0.13:0.13,
       tphlh$CI$S = 0.15:0.15:0.15,
       tphhl$CI$S = 0.074:0.086:0.099,
       tpllh$CI$CO = 0.068:0.07:0.071,
       tphhl$CI$CO = 0.084:0.086:0.087;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFX2 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.077:0.091:0.1,
       tplhl$A$S = 0.18:0.18:0.18,
       tphlh$A$S = 0.2:0.2:0.21,
       tphhl$A$S = 0.1:0.12:0.14,
       tpllh$A$CO = 0.086:0.087:0.087,
       tphhl$A$CO = 0.11:0.11:0.11,
       tpllh$B$S = 0.072:0.088:0.1,
       tplhl$B$S = 0.18:0.18:0.18,
       tphlh$B$S = 0.2:0.21:0.21,
       tphhl$B$S = 0.096:0.11:0.13,
       tpllh$B$CO = 0.085:0.088:0.092,
       tphhl$B$CO = 0.11:0.11:0.11,
       tpllh$CI$S = 0.073:0.089:0.1,
       tplhl$CI$S = 0.18:0.18:0.18,
       tphlh$CI$S = 0.2:0.2:0.2,
       tphhl$CI$S = 0.096:0.11:0.13,
       tpllh$CI$CO = 0.082:0.083:0.085,
       tphhl$CI$CO = 0.1:0.1:0.11;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFX4 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.08:0.093:0.11,
       tplhl$A$S = 0.18:0.18:0.18,
       tphlh$A$S = 0.21:0.21:0.21,
       tphhl$A$S = 0.1:0.12:0.14,
       tpllh$A$CO = 0.087:0.087:0.087,
       tphhl$A$CO = 0.11:0.11:0.11,
       tpllh$B$S = 0.075:0.092:0.11,
       tplhl$B$S = 0.18:0.18:0.18,
       tphlh$B$S = 0.21:0.21:0.21,
       tphhl$B$S = 0.097:0.12:0.14,
       tpllh$B$CO = 0.085:0.088:0.091,
       tphhl$B$CO = 0.11:0.11:0.11,
       tpllh$CI$S = 0.075:0.092:0.11,
       tplhl$CI$S = 0.18:0.18:0.18,
       tphlh$CI$S = 0.2:0.2:0.21,
       tphhl$CI$S = 0.098:0.12:0.13,
       tpllh$CI$CO = 0.081:0.083:0.085,
       tphhl$CI$CO = 0.1:0.1:0.1;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFXL (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.055:0.063:0.072,
       tplhl$A$S = 0.11:0.11:0.11,
       tphlh$A$S = 0.13:0.13:0.13,
       tphhl$A$S = 0.07:0.08:0.091,
       tpllh$A$CO = 0.067:0.067:0.067,
       tphhl$A$CO = 0.082:0.082:0.083,
       tpllh$B$S = 0.05:0.061:0.072,
       tplhl$B$S = 0.11:0.11:0.11,
       tphlh$B$S = 0.13:0.13:0.14,
       tphhl$B$S = 0.065:0.077:0.088,
       tpllh$B$CO = 0.065:0.067:0.07,
       tphhl$B$CO = 0.081:0.082:0.083,
       tpllh$CI$S = 0.05:0.061:0.072,
       tplhl$CI$S = 0.11:0.11:0.11,
       tphlh$CI$S = 0.13:0.13:0.13,
       tphhl$CI$S = 0.065:0.075:0.085,
       tpllh$CI$CO = 0.061:0.063:0.064,
       tphhl$CI$CO = 0.074:0.075:0.076;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHX1 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.054:0.054:0.054,
       tplhl$A$S = 0.079:0.079:0.079,
       tphlh$A$S = 0.074:0.074:0.074,
       tphhl$A$S = 0.058:0.058:0.058,
       tpllh$A$CO = 0.046:0.046:0.046,
       tphhl$A$CO = 0.039:0.039:0.039,
       tpllh$B$S = 0.04:0.04:0.04,
       tplhl$B$S = 0.071:0.071:0.071,
       tphlh$B$S = 0.058:0.058:0.058,
       tphhl$B$S = 0.041:0.041:0.041,
       tpllh$B$CO = 0.043:0.043:0.043,
       tphhl$B$CO = 0.036:0.036:0.036;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHX2 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.067:0.067:0.067,
       tplhl$A$S = 0.1:0.1:0.1,
       tphlh$A$S = 0.089:0.089:0.089,
       tphhl$A$S = 0.073:0.073:0.073,
       tpllh$A$CO = 0.061:0.061:0.061,
       tphhl$A$CO = 0.051:0.051:0.051,
       tpllh$B$S = 0.057:0.057:0.057,
       tplhl$B$S = 0.087:0.087:0.087,
       tphlh$B$S = 0.067:0.067:0.067,
       tphhl$B$S = 0.055:0.055:0.055,
       tpllh$B$CO = 0.06:0.06:0.06,
       tphhl$B$CO = 0.049:0.049:0.049;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHX4 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.096:0.096:0.096,
       tplhl$A$S = 0.11:0.11:0.11,
       tphlh$A$S = 0.1:0.1:0.1,
       tphhl$A$S = 0.11:0.11:0.11,
       tpllh$A$CO = 0.064:0.064:0.064,
       tphhl$A$CO = 0.052:0.052:0.052,
       tpllh$B$S = 0.061:0.061:0.061,
       tplhl$B$S = 0.099:0.099:0.099,
       tphlh$B$S = 0.093:0.093:0.093,
       tphhl$B$S = 0.075:0.075:0.075,
       tpllh$B$CO = 0.063:0.063:0.063,
       tphhl$B$CO = 0.05:0.05:0.05;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHXL (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.048:0.048:0.048,
       tplhl$A$S = 0.069:0.069:0.069,
       tphlh$A$S = 0.067:0.067:0.067,
       tphhl$A$S = 0.051:0.051:0.051,
       tpllh$A$CO = 0.038:0.038:0.038,
       tphhl$A$CO = 0.033:0.033:0.033,
       tpllh$B$S = 0.033:0.033:0.033,
       tplhl$B$S = 0.061:0.061:0.061,
       tphlh$B$S = 0.052:0.052:0.052,
       tphhl$B$S = 0.033:0.033:0.033,
       tpllh$B$CO = 0.036:0.036:0.036,
       tphhl$B$CO = 0.03:0.03:0.03;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.045:0.045:0.045,
       tphhl$A$Y = 0.039:0.039:0.039,
       tpllh$B$Y = 0.043:0.043:0.043,
       tphhl$B$Y = 0.036:0.036:0.036;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.061:0.061:0.061,
       tphhl$A$Y = 0.051:0.051:0.051,
       tpllh$B$Y = 0.059:0.059:0.059,
       tphhl$B$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.064:0.064:0.064,
       tphhl$A$Y = 0.052:0.052:0.052,
       tpllh$B$Y = 0.062:0.062:0.062,
       tphhl$B$Y = 0.05:0.05:0.05;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.054:0.054:0.054,
       tphhl$A$Y = 0.045:0.045:0.045,
       tpllh$B$Y = 0.052:0.052:0.052,
       tphhl$B$Y = 0.043:0.043:0.043;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.064:0.064:0.064,
       tphhl$A$Y = 0.052:0.052:0.052,
       tpllh$B$Y = 0.062:0.062:0.062,
       tphhl$B$Y = 0.05:0.05:0.05;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.038:0.038:0.038,
       tphhl$A$Y = 0.033:0.033:0.033,
       tpllh$B$Y = 0.036:0.036:0.036,
       tphhl$B$Y = 0.03:0.03:0.03;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.065:0.065:0.065,
       tphhl$A$Y = 0.044:0.044:0.044,
       tpllh$B$Y = 0.063:0.063:0.063,
       tphhl$B$Y = 0.041:0.041:0.041,
       tpllh$C$Y = 0.059:0.059:0.059,
       tphhl$C$Y = 0.038:0.038:0.038;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.088:0.088:0.088,
       tphhl$A$Y = 0.056:0.056:0.056,
       tpllh$B$Y = 0.087:0.087:0.087,
       tphhl$B$Y = 0.054:0.054:0.054,
       tpllh$C$Y = 0.082:0.082:0.082,
       tphhl$C$Y = 0.051:0.051:0.051;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.092:0.092:0.092,
       tphhl$A$Y = 0.057:0.057:0.057,
       tpllh$B$Y = 0.091:0.091:0.091,
       tphhl$B$Y = 0.055:0.055:0.055,
       tpllh$C$Y = 0.087:0.087:0.087,
       tphhl$C$Y = 0.053:0.053:0.053;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.077:0.077:0.077,
       tphhl$A$Y = 0.049:0.049:0.049,
       tpllh$B$Y = 0.075:0.075:0.075,
       tphhl$B$Y = 0.047:0.047:0.047,
       tpllh$C$Y = 0.071:0.071:0.071,
       tphhl$C$Y = 0.044:0.044:0.044;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.09:0.09:0.09,
       tphhl$A$Y = 0.056:0.056:0.056,
       tpllh$B$Y = 0.088:0.088:0.088,
       tphhl$B$Y = 0.054:0.054:0.054,
       tpllh$C$Y = 0.084:0.084:0.084,
       tphhl$C$Y = 0.051:0.051:0.051;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.055:0.055:0.055,
       tphhl$A$Y = 0.038:0.038:0.038,
       tpllh$B$Y = 0.053:0.053:0.053,
       tphhl$B$Y = 0.036:0.036:0.036,
       tpllh$C$Y = 0.05:0.05:0.05,
       tphhl$C$Y = 0.033:0.033:0.033;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.087:0.087:0.087,
       tphhl$A$Y = 0.047:0.047:0.047,
       tpllh$B$Y = 0.085:0.085:0.085,
       tphhl$B$Y = 0.045:0.045:0.045,
       tpllh$C$Y = 0.08:0.08:0.08,
       tphhl$C$Y = 0.043:0.043:0.043,
       tpllh$D$Y = 0.075:0.075:0.075,
       tphhl$D$Y = 0.04:0.04:0.04;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.059:0.059:0.059,
       tpllh$B$Y = 0.11:0.11:0.11,
       tphhl$B$Y = 0.057:0.057:0.057,
       tpllh$C$Y = 0.11:0.11:0.11,
       tphhl$C$Y = 0.054:0.054:0.054,
       tpllh$D$Y = 0.1:0.1:0.1,
       tphhl$D$Y = 0.052:0.052:0.052;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.061:0.061:0.061,
       tpllh$B$Y = 0.12:0.12:0.12,
       tphhl$B$Y = 0.059:0.059:0.059,
       tpllh$C$Y = 0.12:0.12:0.12,
       tphhl$C$Y = 0.056:0.056:0.056,
       tpllh$D$Y = 0.11:0.11:0.11,
       tphhl$D$Y = 0.054:0.054:0.054;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.053:0.053:0.053,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.051:0.051:0.051,
       tpllh$C$Y = 0.097:0.097:0.097,
       tphhl$C$Y = 0.049:0.049:0.049,
       tpllh$D$Y = 0.09:0.09:0.09,
       tphhl$D$Y = 0.046:0.046:0.046;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.06:0.06:0.06,
       tpllh$B$Y = 0.12:0.12:0.12,
       tphhl$B$Y = 0.058:0.058:0.058,
       tpllh$C$Y = 0.11:0.11:0.11,
       tphhl$C$Y = 0.056:0.056:0.056,
       tpllh$D$Y = 0.11:0.11:0.11,
       tphhl$D$Y = 0.053:0.053:0.053;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.074:0.074:0.074,
       tphhl$A$Y = 0.041:0.041:0.041,
       tpllh$B$Y = 0.072:0.072:0.072,
       tphhl$B$Y = 0.04:0.04:0.04,
       tpllh$C$Y = 0.068:0.068:0.068,
       tphhl$C$Y = 0.037:0.037:0.037,
       tpllh$D$Y = 0.063:0.063:0.063,
       tphhl$D$Y = 0.035:0.035:0.035;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.051:0.051:0.051,
       tphhl$A0$Y = 0.063:0.063:0.063,
       tpllh$A1$Y = 0.05:0.05:0.05,
       tphhl$A1$Y = 0.059:0.059:0.059,
       tpllh$B0$Y = 0.031:0.032:0.033,
       tphhl$B0$Y = 0.043:0.05:0.057;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.066:0.066:0.066,
       tphhl$A0$Y = 0.084:0.084:0.084,
       tpllh$A1$Y = 0.065:0.065:0.065,
       tphhl$A1$Y = 0.08:0.08:0.08,
       tpllh$B0$Y = 0.04:0.041:0.041,
       tphhl$B0$Y = 0.059:0.068:0.078;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.07:0.07:0.07,
       tphhl$A0$Y = 0.088:0.088:0.088,
       tpllh$A1$Y = 0.069:0.069:0.069,
       tphhl$A1$Y = 0.084:0.084:0.084,
       tpllh$B0$Y = 0.042:0.043:0.043,
       tphhl$B0$Y = 0.062:0.071:0.081;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.043:0.043:0.043,
       tphhl$A0$Y = 0.053:0.053:0.053,
       tpllh$A1$Y = 0.042:0.042:0.042,
       tphhl$A1$Y = 0.049:0.049:0.049,
       tpllh$B0$Y = 0.026:0.027:0.028,
       tphhl$B0$Y = 0.034:0.04:0.045;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.054:0.056:0.057,
       tphhl$A0$Y = 0.058:0.065:0.072,
       tpllh$A1$Y = 0.052:0.054:0.056,
       tphhl$A1$Y = 0.055:0.062:0.069,
       tpllh$B0$Y = 0.047:0.048:0.049,
       tphhl$B0$Y = 0.048:0.056:0.063,
       tpllh$B1$Y = 0.044:0.046:0.047,
       tphhl$B1$Y = 0.044:0.051:0.058;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.071:0.072:0.074,
       tphhl$A0$Y = 0.075:0.085:0.094,
       tpllh$A1$Y = 0.069:0.071:0.073,
       tphhl$A1$Y = 0.072:0.081:0.091,
       tpllh$B0$Y = 0.063:0.064:0.066,
       tphhl$B0$Y = 0.065:0.075:0.085,
       tpllh$B1$Y = 0.061:0.062:0.063,
       tphhl$B1$Y = 0.062:0.071:0.081;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.075:0.076:0.078,
       tphhl$A0$Y = 0.078:0.088:0.098,
       tpllh$A1$Y = 0.073:0.075:0.076,
       tphhl$A1$Y = 0.075:0.084:0.094,
       tpllh$B0$Y = 0.066:0.067:0.069,
       tphhl$B0$Y = 0.067:0.078:0.088,
       tpllh$B1$Y = 0.064:0.066:0.067,
       tphhl$B1$Y = 0.064:0.074:0.084;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.046:0.048:0.05,
       tphhl$A0$Y = 0.05:0.056:0.062,
       tpllh$A1$Y = 0.045:0.047:0.048,
       tphhl$A1$Y = 0.047:0.053:0.058,
       tpllh$B0$Y = 0.038:0.04:0.041,
       tphhl$B0$Y = 0.04:0.046:0.052,
       tpllh$B1$Y = 0.037:0.038:0.039,
       tphhl$B1$Y = 0.036:0.042:0.047;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211X1 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.023:0.023,
       tphlh$A0$Y = 0.051:0.051:0.051,
       tplhl$A1$Y = 0.022:0.022:0.022,
       tphlh$A1$Y = 0.045:0.045:0.045,
       tplhl$B0$Y = 0.013:0.014:0.014,
       tphlh$B0$Y = 0.032:0.038:0.044,
       tplhl$C0$Y = 0.012:0.012:0.012,
       tphlh$C0$Y = 0.026:0.031:0.036;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211X2 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.023:0.023,
       tphlh$A0$Y = 0.051:0.051:0.051,
       tplhl$A1$Y = 0.022:0.022:0.022,
       tphlh$A1$Y = 0.045:0.045:0.045,
       tplhl$B0$Y = 0.013:0.014:0.014,
       tphlh$B0$Y = 0.033:0.039:0.046,
       tplhl$C0$Y = 0.011:0.011:0.012,
       tphlh$C0$Y = 0.024:0.029:0.034;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211X4 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.023:0.023,
       tphlh$A0$Y = 0.051:0.051:0.051,
       tplhl$A1$Y = 0.022:0.022:0.022,
       tphlh$A1$Y = 0.044:0.044:0.044,
       tplhl$B0$Y = 0.013:0.014:0.014,
       tphlh$B0$Y = 0.032:0.039:0.045,
       tplhl$C0$Y = 0.011:0.011:0.012,
       tphlh$C0$Y = 0.024:0.029:0.034;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211XL (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.024:0.024:0.024,
       tphlh$A0$Y = 0.053:0.053:0.053,
       tplhl$A1$Y = 0.023:0.023:0.023,
       tphlh$A1$Y = 0.047:0.047:0.047,
       tplhl$B0$Y = 0.014:0.014:0.015,
       tphlh$B0$Y = 0.034:0.04:0.047,
       tplhl$C0$Y = 0.012:0.012:0.013,
       tphlh$C0$Y = 0.028:0.033:0.038;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.021:0.021:0.021,
       tphlh$A0$Y = 0.032:0.032:0.032,
       tplhl$A1$Y = 0.019:0.019:0.019,
       tphlh$A1$Y = 0.028:0.028:0.028,
       tplhl$B0$Y = 0.01:0.011:0.011,
       tphlh$B0$Y = 0.017:0.021:0.025;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.02:0.02:0.02,
       tphlh$A0$Y = 0.031:0.031:0.031,
       tplhl$A1$Y = 0.019:0.019:0.019,
       tphlh$A1$Y = 0.027:0.027:0.027,
       tplhl$B0$Y = 0.0097:0.01:0.01,
       tphlh$B0$Y = 0.016:0.02:0.024;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.02:0.02:0.02,
       tphlh$A0$Y = 0.031:0.031:0.031,
       tplhl$A1$Y = 0.019:0.019:0.019,
       tphlh$A1$Y = 0.027:0.027:0.027,
       tplhl$B0$Y = 0.0098:0.01:0.011,
       tphlh$B0$Y = 0.016:0.02:0.024;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.021:0.021:0.021,
       tphlh$A0$Y = 0.033:0.033:0.033,
       tplhl$A1$Y = 0.02:0.02:0.02,
       tphlh$A1$Y = 0.029:0.029:0.029,
       tplhl$B0$Y = 0.011:0.011:0.011,
       tphlh$B0$Y = 0.018:0.022:0.026;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221X1 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.025:0.026:0.027,
       tphlh$A0$Y = 0.052:0.058:0.064,
       tplhl$A1$Y = 0.024:0.025:0.026,
       tphlh$A1$Y = 0.047:0.053:0.059,
       tplhl$B0$Y = 0.023:0.024:0.025,
       tphlh$B0$Y = 0.042:0.049:0.057,
       tplhl$B1$Y = 0.022:0.023:0.023,
       tphlh$B1$Y = 0.037:0.044:0.051,
       tplhl$C0$Y = 0.012:0.012:0.013,
       tphlh$C0$Y = 0.022:0.032:0.042;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221X2 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.024:0.025:0.026,
       tphlh$A0$Y = 0.05:0.056:0.062,
       tplhl$A1$Y = 0.023:0.024:0.024,
       tphlh$A1$Y = 0.045:0.051:0.056,
       tplhl$B0$Y = 0.023:0.024:0.024,
       tphlh$B0$Y = 0.041:0.049:0.056,
       tplhl$B1$Y = 0.021:0.022:0.023,
       tphlh$B1$Y = 0.036:0.043:0.049,
       tplhl$C0$Y = 0.011:0.012:0.013,
       tphlh$C0$Y = 0.021:0.03:0.04;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221X4 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.025:0.025:0.026,
       tphlh$A0$Y = 0.051:0.057:0.063,
       tplhl$A1$Y = 0.023:0.024:0.025,
       tphlh$A1$Y = 0.045:0.051:0.057,
       tplhl$B0$Y = 0.023:0.024:0.025,
       tphlh$B0$Y = 0.042:0.049:0.056,
       tplhl$B1$Y = 0.021:0.022:0.023,
       tphlh$B1$Y = 0.036:0.043:0.05,
       tplhl$C0$Y = 0.011:0.012:0.013,
       tphlh$C0$Y = 0.021:0.031:0.041;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221XL (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.026:0.027:0.028,
       tphlh$A0$Y = 0.056:0.062:0.069,
       tplhl$A1$Y = 0.025:0.026:0.027,
       tphlh$A1$Y = 0.051:0.057:0.063,
       tplhl$B0$Y = 0.024:0.025:0.026,
       tphlh$B0$Y = 0.045:0.053:0.061,
       tplhl$B1$Y = 0.023:0.024:0.025,
       tphlh$B1$Y = 0.04:0.048:0.055,
       tplhl$C0$Y = 0.012:0.013:0.014,
       tphlh$C0$Y = 0.023:0.034:0.045;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222X1 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, C0, C1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.028:0.031:0.035,
       tphlh$A0$Y = 0.051:0.065:0.078,
       tplhl$A1$Y = 0.026:0.03:0.033,
       tphlh$A1$Y = 0.048:0.06:0.073,
       tplhl$B0$Y = 0.026:0.028:0.029,
       tphlh$B0$Y = 0.043:0.057:0.071,
       tplhl$B1$Y = 0.025:0.026:0.028,
       tphlh$B1$Y = 0.038:0.052:0.065,
       tplhl$C0$Y = 0.02:0.021:0.022,
       tphlh$C0$Y = 0.028:0.04:0.051,
       tplhl$C1$Y = 0.019:0.02:0.021,
       tphlh$C1$Y = 0.025:0.035:0.046;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222X2 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, C0, C1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.027:0.03:0.034,
       tphlh$A0$Y = 0.05:0.063:0.076,
       tplhl$A1$Y = 0.025:0.029:0.032,
       tphlh$A1$Y = 0.046:0.058:0.07,
       tplhl$B0$Y = 0.026:0.027:0.029,
       tphlh$B0$Y = 0.042:0.055:0.069,
       tplhl$B1$Y = 0.024:0.026:0.027,
       tphlh$B1$Y = 0.037:0.05:0.063,
       tplhl$C0$Y = 0.019:0.02:0.021,
       tphlh$C0$Y = 0.028:0.039:0.05,
       tplhl$C1$Y = 0.018:0.019:0.02,
       tphlh$C1$Y = 0.024:0.034:0.045;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222X4 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, C0, C1);
   and (I1_out, A0, A1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.027:0.031:0.034,
       tphlh$A0$Y = 0.051:0.064:0.077,
       tplhl$A1$Y = 0.026:0.029:0.032,
       tphlh$A1$Y = 0.046:0.059:0.071,
       tplhl$B0$Y = 0.026:0.028:0.029,
       tphlh$B0$Y = 0.042:0.056:0.07,
       tplhl$B1$Y = 0.024:0.026:0.027,
       tphlh$B1$Y = 0.038:0.051:0.064,
       tplhl$C0$Y = 0.02:0.021:0.022,
       tphlh$C0$Y = 0.028:0.04:0.052,
       tplhl$C1$Y = 0.018:0.019:0.02,
       tphlh$C1$Y = 0.024:0.035:0.046;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222XL (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, C0, C1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.029:0.032:0.036,
       tphlh$A0$Y = 0.054:0.068:0.083,
       tplhl$A1$Y = 0.028:0.031:0.035,
       tphlh$A1$Y = 0.051:0.064:0.077,
       tplhl$B0$Y = 0.028:0.029:0.031,
       tphlh$B0$Y = 0.046:0.06:0.075,
       tplhl$B1$Y = 0.026:0.028:0.029,
       tphlh$B1$Y = 0.041:0.055:0.069,
       tplhl$C0$Y = 0.021:0.022:0.023,
       tphlh$C0$Y = 0.03:0.042:0.054,
       tplhl$C1$Y = 0.02:0.021:0.022,
       tphlh$C1$Y = 0.027:0.038:0.05;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.025:0.026,
       tphlh$A0$Y = 0.032:0.036:0.041,
       tplhl$A1$Y = 0.022:0.023:0.025,
       tphlh$A1$Y = 0.028:0.033:0.037,
       tplhl$B0$Y = 0.017:0.018:0.018,
       tphlh$B0$Y = 0.021:0.026:0.031,
       tplhl$B1$Y = 0.016:0.017:0.017,
       tphlh$B1$Y = 0.019:0.023:0.027;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.025:0.026,
       tphlh$A0$Y = 0.031:0.036:0.04,
       tplhl$A1$Y = 0.021:0.023:0.025,
       tphlh$A1$Y = 0.028:0.032:0.036,
       tplhl$B0$Y = 0.017:0.018:0.018,
       tphlh$B0$Y = 0.022:0.026:0.031,
       tplhl$B1$Y = 0.016:0.016:0.017,
       tphlh$B1$Y = 0.019:0.023:0.027;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.025:0.027,
       tphlh$A0$Y = 0.032:0.036:0.041,
       tplhl$A1$Y = 0.022:0.023:0.025,
       tphlh$A1$Y = 0.028:0.032:0.036,
       tplhl$B0$Y = 0.018:0.018:0.019,
       tphlh$B0$Y = 0.022:0.027:0.031,
       tplhl$B1$Y = 0.016:0.017:0.017,
       tphlh$B1$Y = 0.019:0.023:0.027;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.025:0.027,
       tphlh$A0$Y = 0.033:0.038:0.042,
       tplhl$A1$Y = 0.022:0.024:0.026,
       tphlh$A1$Y = 0.03:0.034:0.039,
       tplhl$B0$Y = 0.017:0.018:0.019,
       tphlh$B0$Y = 0.022:0.027:0.032,
       tplhl$B1$Y = 0.016:0.017:0.018,
       tphlh$B1$Y = 0.019:0.024:0.028;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1X1 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.041:0.041:0.041,
       tphhl$A0N$Y = 0.057:0.057:0.057,
       tpllh$A1N$Y = 0.038:0.038:0.038,
       tphhl$A1N$Y = 0.053:0.053:0.053,
       tplhl$B0$Y = 0.012:0.012:0.012,
       tphlh$B0$Y = 0.025:0.025:0.025;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1X2 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.05:0.05:0.05,
       tphhl$A0N$Y = 0.08:0.08:0.08,
       tpllh$A1N$Y = 0.048:0.048:0.048,
       tphhl$A1N$Y = 0.077:0.077:0.077,
       tplhl$B0$Y = 0.012:0.012:0.012,
       tphlh$B0$Y = 0.025:0.025:0.025;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1X4 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.052:0.052:0.052,
       tphhl$A0N$Y = 0.084:0.084:0.084,
       tpllh$A1N$Y = 0.05:0.05:0.05,
       tphhl$A1N$Y = 0.08:0.08:0.08,
       tplhl$B0$Y = 0.012:0.012:0.012,
       tphlh$B0$Y = 0.025:0.025:0.025;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1XL (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.038:0.038:0.038,
       tphhl$A0N$Y = 0.049:0.049:0.049,
       tpllh$A1N$Y = 0.036:0.036:0.036,
       tphhl$A1N$Y = 0.044:0.044:0.044,
       tplhl$B0$Y = 0.012:0.012:0.012,
       tphlh$B0$Y = 0.026:0.026:0.026;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2X1 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.049:0.054:0.058,
       tphhl$A0N$Y = 0.05:0.052:0.054,
       tpllh$A1N$Y = 0.048:0.052:0.056,
       tphhl$A1N$Y = 0.05:0.052:0.054,
       tplhl$B0$Y = 0.017:0.018:0.018,
       tphlh$B0$Y = 0.021:0.026:0.03,
       tplhl$B1$Y = 0.016:0.016:0.017,
       tphlh$B1$Y = 0.018:0.022:0.026;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2X2 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.061:0.065:0.07,
       tphhl$A0N$Y = 0.066:0.068:0.07,
       tpllh$A1N$Y = 0.058:0.062:0.066,
       tphhl$A1N$Y = 0.063:0.065:0.067,
       tplhl$B0$Y = 0.017:0.018:0.018,
       tphlh$B0$Y = 0.022:0.026:0.03,
       tplhl$B1$Y = 0.016:0.016:0.017,
       tphlh$B1$Y = 0.019:0.022:0.026;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2X4 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.064:0.069:0.073,
       tphhl$A0N$Y = 0.069:0.071:0.073,
       tpllh$A1N$Y = 0.06:0.065:0.069,
       tphhl$A1N$Y = 0.066:0.068:0.07,
       tplhl$B0$Y = 0.018:0.018:0.018,
       tphlh$B0$Y = 0.022:0.026:0.03,
       tplhl$B1$Y = 0.016:0.016:0.017,
       tphlh$B1$Y = 0.019:0.022:0.026;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2XL (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.047:0.052:0.056,
       tphhl$A0N$Y = 0.045:0.047:0.048,
       tpllh$A1N$Y = 0.046:0.05:0.054,
       tphhl$A1N$Y = 0.045:0.047:0.049,
       tplhl$B0$Y = 0.018:0.018:0.019,
       tphlh$B0$Y = 0.023:0.027:0.032,
       tplhl$B1$Y = 0.017:0.017:0.018,
       tphlh$B1$Y = 0.02:0.024:0.028;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31X1 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.031:0.031:0.031,
       tphlh$A0$Y = 0.037:0.037:0.037,
       tplhl$A1$Y = 0.03:0.03:0.03,
       tphlh$A1$Y = 0.034:0.034:0.034,
       tplhl$A2$Y = 0.027:0.027:0.027,
       tphlh$A2$Y = 0.029:0.029:0.029,
       tplhl$B0$Y = 0.01:0.011:0.011,
       tphlh$B0$Y = 0.016:0.022:0.028;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31X2 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.032:0.032:0.032,
       tphlh$A0$Y = 0.037:0.037:0.037,
       tplhl$A1$Y = 0.03:0.03:0.03,
       tphlh$A1$Y = 0.034:0.034:0.034,
       tplhl$A2$Y = 0.026:0.026:0.026,
       tphlh$A2$Y = 0.029:0.029:0.029,
       tplhl$B0$Y = 0.0097:0.01:0.011,
       tphlh$B0$Y = 0.015:0.022:0.028;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31X4 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.033:0.033:0.033,
       tphlh$A0$Y = 0.038:0.038:0.038,
       tplhl$A1$Y = 0.031:0.031:0.031,
       tphlh$A1$Y = 0.034:0.034:0.034,
       tplhl$A2$Y = 0.027:0.027:0.027,
       tphlh$A2$Y = 0.029:0.029:0.029,
       tplhl$B0$Y = 0.0098:0.01:0.011,
       tphlh$B0$Y = 0.015:0.022:0.029;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31XL (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.032:0.032:0.032,
       tphlh$A0$Y = 0.039:0.039:0.039,
       tplhl$A1$Y = 0.031:0.031:0.031,
       tphlh$A1$Y = 0.035:0.035:0.035,
       tplhl$A2$Y = 0.028:0.028:0.028,
       tphlh$A2$Y = 0.031:0.031:0.031,
       tplhl$B0$Y = 0.011:0.011:0.012,
       tphlh$B0$Y = 0.017:0.024:0.031;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32X1 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.035:0.038:0.04,
       tphlh$A0$Y = 0.035:0.041:0.046,
       tplhl$A1$Y = 0.034:0.036:0.039,
       tphlh$A1$Y = 0.033:0.038:0.043,
       tplhl$A2$Y = 0.031:0.033:0.036,
       tphlh$A2$Y = 0.03:0.034:0.039,
       tplhl$B0$Y = 0.017:0.018:0.018,
       tphlh$B0$Y = 0.02:0.027:0.035,
       tplhl$B1$Y = 0.016:0.017:0.017,
       tphlh$B1$Y = 0.018:0.024:0.031;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32X2 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.036:0.038:0.041,
       tphlh$A0$Y = 0.036:0.042:0.047,
       tplhl$A1$Y = 0.034:0.037:0.039,
       tphlh$A1$Y = 0.033:0.038:0.043,
       tplhl$A2$Y = 0.03:0.033:0.035,
       tphlh$A2$Y = 0.03:0.034:0.039,
       tplhl$B0$Y = 0.017:0.018:0.019,
       tphlh$B0$Y = 0.02:0.028:0.035,
       tplhl$B1$Y = 0.016:0.017:0.017,
       tphlh$B1$Y = 0.018:0.024:0.031;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32X4 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.036:0.039:0.041,
       tphlh$A0$Y = 0.037:0.042:0.047,
       tplhl$A1$Y = 0.034:0.037:0.039,
       tphlh$A1$Y = 0.034:0.038:0.043,
       tplhl$A2$Y = 0.031:0.033:0.036,
       tphlh$A2$Y = 0.03:0.035:0.039,
       tplhl$B0$Y = 0.018:0.018:0.019,
       tphlh$B0$Y = 0.021:0.028:0.036,
       tplhl$B1$Y = 0.016:0.017:0.018,
       tphlh$B1$Y = 0.018:0.025:0.032;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32XL (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.036:0.038:0.04,
       tphlh$A0$Y = 0.037:0.042:0.047,
       tplhl$A1$Y = 0.035:0.037:0.039,
       tphlh$A1$Y = 0.035:0.039:0.044,
       tplhl$A2$Y = 0.032:0.034:0.036,
       tphlh$A2$Y = 0.031:0.036:0.04,
       tplhl$B0$Y = 0.018:0.018:0.019,
       tphlh$B0$Y = 0.021:0.029:0.037,
       tplhl$B1$Y = 0.017:0.018:0.018,
       tphlh$B1$Y = 0.019:0.026:0.033;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33X1 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.039:0.044:0.048,
       tphlh$A0$Y = 0.038:0.046:0.055,
       tplhl$A1$Y = 0.038:0.043:0.047,
       tphlh$A1$Y = 0.036:0.044:0.052,
       tplhl$A2$Y = 0.035:0.039:0.044,
       tphlh$A2$Y = 0.032:0.04:0.047,
       tplhl$B0$Y = 0.028:0.029:0.03,
       tphlh$B0$Y = 0.026:0.034:0.043,
       tplhl$B1$Y = 0.027:0.028:0.029,
       tphlh$B1$Y = 0.023:0.031:0.039,
       tplhl$B2$Y = 0.023:0.024:0.025,
       tphlh$B2$Y = 0.02:0.027:0.034;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33X2 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.04:0.044:0.049,
       tphlh$A0$Y = 0.038:0.047:0.056,
       tplhl$A1$Y = 0.038:0.043:0.047,
       tphlh$A1$Y = 0.036:0.044:0.052,
       tplhl$A2$Y = 0.034:0.039:0.043,
       tphlh$A2$Y = 0.033:0.04:0.047,
       tplhl$B0$Y = 0.028:0.029:0.03,
       tphlh$B0$Y = 0.025:0.034:0.042,
       tplhl$B1$Y = 0.026:0.027:0.028,
       tphlh$B1$Y = 0.023:0.031:0.039,
       tplhl$B2$Y = 0.023:0.024:0.025,
       tphlh$B2$Y = 0.02:0.027:0.034;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33X4 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.041:0.045:0.05,
       tphlh$A0$Y = 0.039:0.048:0.057,
       tplhl$A1$Y = 0.039:0.043:0.048,
       tphlh$A1$Y = 0.036:0.044:0.052,
       tplhl$A2$Y = 0.035:0.04:0.044,
       tphlh$A2$Y = 0.033:0.041:0.048,
       tplhl$B0$Y = 0.029:0.03:0.031,
       tphlh$B0$Y = 0.026:0.035:0.044,
       tplhl$B1$Y = 0.027:0.028:0.029,
       tphlh$B1$Y = 0.023:0.031:0.039,
       tplhl$B2$Y = 0.023:0.024:0.025,
       tphlh$B2$Y = 0.02:0.028:0.035;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33XL (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.041:0.046:0.05,
       tphlh$A0$Y = 0.04:0.049:0.058,
       tplhl$A1$Y = 0.04:0.045:0.049,
       tphlh$A1$Y = 0.038:0.046:0.055,
       tplhl$A2$Y = 0.036:0.041:0.045,
       tphlh$A2$Y = 0.034:0.042:0.05,
       tplhl$B0$Y = 0.031:0.032:0.033,
       tphlh$B0$Y = 0.028:0.037:0.047,
       tplhl$B1$Y = 0.029:0.03:0.031,
       tphlh$B1$Y = 0.025:0.034:0.042,
       tplhl$B2$Y = 0.025:0.026:0.027,
       tphlh$B2$Y = 0.022:0.03:0.037;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BMXIX2 (A, M0, M1, PPN, S, X2);
input  A ;
input  M0 ;
input  M1 ;
input  S ;
input  X2 ;
output PPN ;

   udp_mux2 (I0_out, S, A, M0);
   udp_mux2 (I1_out, S, A, M1);
   udp_mux2 (PPN, I1_out, I0_out, X2);

   specify
     // delay parameters
     specparam
       tpllh$A$PPN = 0.096:0.099:0.1,
       tphhl$A$PPN = 0.11:0.12:0.12,
       tpllh$M0$PPN = 0.092:0.092:0.092,
       tplhl$M0$PPN = 0.13:0.13:0.13,
       tphlh$M0$PPN = 0.12:0.12:0.12,
       tphhl$M0$PPN = 0.11:0.11:0.11,
       tpllh$M1$PPN = 0.092:0.092:0.092,
       tplhl$M1$PPN = 0.13:0.13:0.13,
       tphlh$M1$PPN = 0.12:0.12:0.12,
       tphhl$M1$PPN = 0.11:0.11:0.11,
       tpllh$S$PPN = 0.1:0.1:0.1,
       tphhl$S$PPN = 0.12:0.12:0.12,
       tpllh$X2$PPN = 0.067:0.067:0.067,
       tplhl$X2$PPN = 0.072:0.072:0.072,
       tphlh$X2$PPN = 0.081:0.081:0.081,
       tphhl$X2$PPN = 0.067:0.067:0.067;

     // path delays
     (A *> PPN) = (tpllh$A$PPN, tphhl$A$PPN);
     (posedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tpllh$M0$PPN, tplhl$M0$PPN);
     (negedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tphlh$M0$PPN, tphhl$M0$PPN);
     (posedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tpllh$M1$PPN, tplhl$M1$PPN);
     (negedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tphlh$M1$PPN, tphhl$M1$PPN);
     (S *> PPN) = (tpllh$S$PPN, tphhl$S$PPN);
     (posedge X2 *> (PPN +: M1?A:S)) = (tpllh$X2$PPN, tplhl$X2$PPN);
     (negedge X2 *> (PPN +: M1?A:S)) = (tphlh$X2$PPN, tphhl$X2$PPN);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BMXIX4 (A, M0, M1, PPN, S, X2);
input  A ;
input  M0 ;
input  M1 ;
input  S ;
input  X2 ;
output PPN ;

   udp_mux2 (I0_out, S, A, M0);
   udp_mux2 (I1_out, S, A, M1);
   udp_mux2 (PPN, I1_out, I0_out, X2);

   specify
     // delay parameters
     specparam
       tpllh$A$PPN = 0.14:0.14:0.14,
       tphhl$A$PPN = 0.17:0.17:0.18,
       tpllh$M0$PPN = 0.14:0.14:0.14,
       tplhl$M0$PPN = 0.19:0.19:0.19,
       tphlh$M0$PPN = 0.17:0.17:0.17,
       tphhl$M0$PPN = 0.16:0.16:0.16,
       tpllh$M1$PPN = 0.14:0.14:0.14,
       tplhl$M1$PPN = 0.18:0.18:0.18,
       tphlh$M1$PPN = 0.16:0.16:0.16,
       tphhl$M1$PPN = 0.16:0.16:0.16,
       tpllh$S$PPN = 0.14:0.15:0.15,
       tphhl$S$PPN = 0.17:0.18:0.18,
       tpllh$X2$PPN = 0.1:0.1:0.1,
       tplhl$X2$PPN = 0.11:0.11:0.11,
       tphlh$X2$PPN = 0.11:0.11:0.11,
       tphhl$X2$PPN = 0.11:0.11:0.11;

     // path delays
     (A *> PPN) = (tpllh$A$PPN, tphhl$A$PPN);
     (posedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tpllh$M0$PPN, tplhl$M0$PPN);
     (negedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tphlh$M0$PPN, tphhl$M0$PPN);
     (posedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tpllh$M1$PPN, tplhl$M1$PPN);
     (negedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tphlh$M1$PPN, tphhl$M1$PPN);
     (S *> PPN) = (tpllh$S$PPN, tphhl$S$PPN);
     (posedge X2 *> (PPN +: M1?A:S)) = (tpllh$X2$PPN, tplhl$X2$PPN);
     (negedge X2 *> (PPN +: M1?A:S)) = (tphlh$X2$PPN, tphhl$X2$PPN);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX12 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX16 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.071:0.071:0.071,
       tphhl$A$Y = 0.078:0.078:0.078;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.039:0.039:0.039,
       tphhl$A$Y = 0.047:0.047:0.047;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX20 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.042:0.042:0.042,
       tphhl$A$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.036:0.036:0.036,
       tphhl$A$Y = 0.041:0.041:0.041;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX6 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.035:0.035:0.035,
       tphhl$A$Y = 0.041:0.041:0.041;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX8 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X12 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.058:0.058:0.058,
       tpllh$B$Y = 0.04:0.04:0.04,
       tphhl$B$Y = 0.053:0.053:0.053;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.039:0.039:0.039,
       tphhl$A$Y = 0.055:0.055:0.055,
       tpllh$B$Y = 0.037:0.037:0.037,
       tphhl$B$Y = 0.05:0.05:0.05;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X3 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.036:0.036:0.036,
       tphhl$A$Y = 0.05:0.05:0.05,
       tpllh$B$Y = 0.034:0.034:0.034,
       tphhl$B$Y = 0.045:0.045:0.045;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.057:0.057:0.057,
       tpllh$B$Y = 0.039:0.039:0.039,
       tphhl$B$Y = 0.053:0.053:0.053;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.036:0.036:0.036,
       tphhl$A$Y = 0.051:0.051:0.051,
       tpllh$B$Y = 0.034:0.034:0.034,
       tphhl$B$Y = 0.045:0.045:0.045;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.058:0.058:0.058,
       tpllh$B$Y = 0.039:0.039:0.039,
       tphhl$B$Y = 0.052:0.052:0.052;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX12 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX16 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.071:0.071:0.071,
       tphhl$A$Y = 0.078:0.078:0.078;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.039:0.039:0.039,
       tphhl$A$Y = 0.047:0.047:0.047;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX20 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.042:0.042:0.042,
       tphhl$A$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.036:0.036:0.036,
       tphhl$A$Y = 0.041:0.041:0.041;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX6 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.035:0.035:0.035,
       tphhl$A$Y = 0.041:0.041:0.041;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX8 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.009:0.009:0.009,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX12 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0087:0.0087:0.0087,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX16 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.028:0.028:0.028,
       tphlh$A$Y = 0.042:0.042:0.042;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0083:0.0083:0.0083,
       tphlh$A$Y = 0.012:0.012:0.012;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX20 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0089:0.0089:0.0089,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX3 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0087:0.0087:0.0087,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0085:0.0085:0.0085,
       tphlh$A$Y = 0.012:0.012:0.012;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX6 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0088:0.0088:0.0088,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0087:0.0087:0.0087,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X12 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.18:0.18:0.18,
       tphhl$A$Y = 0.22:0.22:0.22,
       tpllh$B$Y = 0.18:0.18:0.18,
       tphhl$B$Y = 0.23:0.23:0.23,
       tpllh$S0$Y = 0.17:0.17:0.17,
       tplhl$S0$Y = 0.23:0.23:0.23,
       tphlh$S0$Y = 0.19:0.19:0.19,
       tphhl$S0$Y = 0.21:0.21:0.21;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X2 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.067:0.067:0.067,
       tphhl$A$Y = 0.084:0.084:0.084,
       tpllh$B$Y = 0.068:0.068:0.068,
       tphhl$B$Y = 0.087:0.087:0.087,
       tpllh$S0$Y = 0.056:0.056:0.056,
       tplhl$S0$Y = 0.093:0.093:0.093,
       tphlh$S0$Y = 0.087:0.087:0.087,
       tphhl$S0$Y = 0.068:0.068:0.068;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X3 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.062:0.062:0.062,
       tphhl$A$Y = 0.074:0.074:0.074,
       tpllh$B$Y = 0.061:0.061:0.061,
       tphhl$B$Y = 0.077:0.077:0.077,
       tpllh$S0$Y = 0.05:0.05:0.05,
       tplhl$S0$Y = 0.088:0.088:0.088,
       tphlh$S0$Y = 0.087:0.087:0.087,
       tphhl$S0$Y = 0.059:0.059:0.059;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X4 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.081:0.081:0.081,
       tphhl$A$Y = 0.099:0.099:0.099,
       tpllh$B$Y = 0.081:0.081:0.081,
       tphhl$B$Y = 0.1:0.1:0.1,
       tpllh$S0$Y = 0.07:0.07:0.07,
       tplhl$S0$Y = 0.11:0.11:0.11,
       tphlh$S0$Y = 0.1:0.1:0.1,
       tphhl$S0$Y = 0.085:0.085:0.085;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X6 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.13:0.13:0.13,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.13:0.13:0.13,
       tpllh$S0$Y = 0.094:0.094:0.094,
       tplhl$S0$Y = 0.14:0.14:0.14,
       tphlh$S0$Y = 0.13:0.13:0.13,
       tphhl$S0$Y = 0.12:0.12:0.12;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X8 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.13:0.13:0.13,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpllh$B$Y = 0.13:0.13:0.13,
       tphhl$B$Y = 0.16:0.16:0.16,
       tpllh$S0$Y = 0.12:0.12:0.12,
       tplhl$S0$Y = 0.17:0.17:0.17,
       tphlh$S0$Y = 0.15:0.15:0.15,
       tphhl$S0$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.057:0.057:0.057,
       tplhl$A$Y = 0.083:0.083:0.083,
       tphlh$A$Y = 0.077:0.077:0.077,
       tphhl$A$Y = 0.062:0.062:0.062,
       tpllh$B$Y = 0.044:0.044:0.044,
       tplhl$B$Y = 0.07:0.07:0.07,
       tphlh$B$Y = 0.057:0.057:0.057,
       tphhl$B$Y = 0.045:0.045:0.045;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.071:0.071:0.071,
       tplhl$A$Y = 0.1:0.1:0.1,
       tphlh$A$Y = 0.093:0.093:0.093,
       tphhl$A$Y = 0.077:0.077:0.077,
       tpllh$B$Y = 0.059:0.059:0.059,
       tplhl$B$Y = 0.092:0.092:0.092,
       tphlh$B$Y = 0.07:0.07:0.07,
       tphhl$B$Y = 0.059:0.059:0.059;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.099:0.099:0.099,
       tplhl$A$Y = 0.12:0.12:0.12,
       tphlh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.073:0.073:0.073,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.094:0.094:0.094,
       tphhl$B$Y = 0.08:0.08:0.08;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.15:0.15:0.15,
       tplhl$A$Y = 0.19:0.19:0.19,
       tphlh$A$Y = 0.16:0.16:0.16,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.17:0.17:0.17,
       tphlh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.14:0.14:0.14;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX1 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.072:0.14:0.14,
       tminpwl$CK = 0.081:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX2 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_3, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_3);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.073:0.15:0.15,
       tminpwl$CK = 0.082:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX4 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_7, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_8, N30_7);
   not (Q, QBINT_8);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.085:0.15:0.15,
       tminpwl$CK = 0.085:0.15:0.15,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX8 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_12, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_12);
   not (Q, QBINT_30);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tminpwh$CK = 0.099:0.17:0.17,
       tminpwl$CK = 0.081:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRX1 (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_5, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_5);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.15:0.15:0.15,
       tphhl$CKN$Q = 0.13:0.13:0.13,
       tphlh$CKN$QN = 0.16:0.16:0.16,
       tphhl$CKN$QN = 0.18:0.18:0.18,
       tphhl$RN$Q = 0.15:0.16:0.17,
       tphlh$RN$QN = 0.18:0.19:0.2,
       tplhl$SN$Q = 0.13:0.14:0.14,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tpllh$SN$QN = 0.16:0.16:0.17,
       tphhl$SN$QN = 0.15:0.15:0.15,
       tminpwh$CKN = 0.059:0.14:0.14,
       tminpwl$CKN = 0.064:0.18:0.18,
       tminpwl$RN = 0.064:0.2:0.2,
       tminpwl$SN = 0.03:0.15:0.15,
       tsetup_negedge$D$CKN = 0.094:0.094:0.094,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.094:0.094:0.094,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRX2 (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_2, N35_3);
   not (Q, QBINT_2);
   buf (QN, QBINT_2);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.16:0.16:0.16,
       tphhl$CKN$Q = 0.15:0.15:0.15,
       tphlh$CKN$QN = 0.19:0.19:0.19,
       tphhl$CKN$QN = 0.2:0.2:0.2,
       tphhl$RN$Q = 0.17:0.18:0.18,
       tphlh$RN$QN = 0.21:0.22:0.23,
       tplhl$SN$Q = 0.13:0.14:0.15,
       tphlh$SN$Q = 0.13:0.13:0.13,
       tpllh$SN$QN = 0.18:0.19:0.19,
       tphhl$SN$QN = 0.17:0.17:0.17,
       tminpwh$CKN = 0.064:0.15:0.15,
       tminpwl$CKN = 0.076:0.2:0.2,
       tminpwl$RN = 0.07:0.23:0.23,
       tminpwl$SN = 0.033:0.17:0.17,
       tsetup_negedge$D$CKN = 0.094:0.094:0.094,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.094:0.094:0.094,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRX4 (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_8, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_11, N35_8);
   not (Q, QBINT_11);
   buf (QN, QBINT_11);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.17:0.17:0.17,
       tphhl$CKN$Q = 0.16:0.16:0.16,
       tphlh$CKN$QN = 0.21:0.21:0.21,
       tphhl$CKN$QN = 0.22:0.22:0.22,
       tphhl$RN$Q = 0.18:0.19:0.19,
       tphlh$RN$QN = 0.23:0.24:0.24,
       tplhl$SN$Q = 0.15:0.16:0.16,
       tphlh$SN$Q = 0.14:0.14:0.15,
       tpllh$SN$QN = 0.2:0.2:0.21,
       tphhl$SN$QN = 0.19:0.19:0.19,
       tminpwh$CKN = 0.065:0.15:0.15,
       tminpwl$CKN = 0.09:0.22:0.22,
       tminpwl$RN = 0.069:0.24:0.24,
       tminpwl$SN = 0.033:0.19:0.19,
       tsetup_negedge$D$CKN = 0.094:0.094:0.094,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.094:0.094:0.094,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRXL (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_7, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_7);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.14:0.14:0.14,
       tphhl$CKN$Q = 0.12:0.12:0.12,
       tphlh$CKN$QN = 0.14:0.14:0.14,
       tphhl$CKN$QN = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.14:0.15:0.16,
       tphlh$RN$QN = 0.16:0.17:0.18,
       tplhl$SN$Q = 0.12:0.12:0.13,
       tphlh$SN$Q = 0.11:0.11:0.11,
       tpllh$SN$QN = 0.14:0.14:0.15,
       tphhl$SN$QN = 0.13:0.13:0.13,
       tminpwh$CKN = 0.059:0.14:0.14,
       tminpwl$CKN = 0.063:0.16:0.16,
       tminpwl$RN = 0.064:0.18:0.18,
       tminpwl$SN = 0.03:0.13:0.13,
       tsetup_negedge$D$CKN = 0.094:0.094:0.094,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.094:0.094:0.094,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQX1 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_2, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.068:0.14:0.14,
       tminpwl$CK = 0.077:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQX2 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_4);
   not (Q, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.075:0.14:0.14,
       tminpwl$CK = 0.076:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQX4 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_7, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_19, N30_7);
   not (Q, QBINT_19);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.087:0.15:0.15,
       tminpwl$CK = 0.079:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQXL (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_4);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tminpwh$CK = 0.068:0.13:0.13,
       tminpwl$CK = 0.077:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX1 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_3, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tphhl$RN$Q = 0.041:0.042:0.042,
       tminpwh$CK = 0.078:0.15:0.15,
       tminpwl$CK = 0.087:0.15:0.15,
       tminpwl$RN = 0.031:0.095:0.095,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX2 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_5, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_4, N30_5);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tphhl$RN$Q = 0.049:0.05:0.05,
       tminpwh$CK = 0.076:0.15:0.15,
       tminpwl$CK = 0.085:0.15:0.15,
       tminpwl$RN = 0.039:0.095:0.095,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX4 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_7, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_9, N30_7);
   not (Q, QBINT_9);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.044:0.044:0.044,
       tminpwh$CK = 0.086:0.16:0.16,
       tminpwl$CK = 0.084:0.16:0.16,
       tminpwl$RN = 0.034:0.1:0.1,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX8 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_13, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_40, N30_13);
   not (Q, QBINT_40);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.17:0.17:0.17,
       tplhl$CK$Q = 0.18:0.18:0.18,
       tphhl$RN$Q = 0.044:0.044:0.044,
       tminpwh$CK = 0.1:0.18:0.18,
       tminpwl$CK = 0.083:0.15:0.15,
       tminpwl$RN = 0.031:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRX1 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_4, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_6, N30_4);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.055:0.055:0.056,
       tphlh$RN$QN = 0.083:0.083:0.084,
       tminpwh$CK = 0.068:0.18:0.18,
       tminpwl$CK = 0.077:0.14:0.14,
       tminpwl$RN = 0.043:0.097:0.097,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRX2 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_8, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_16, N30_8);
   not (Q, QBINT_16);
   buf (QN, QBINT_16);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.2:0.2:0.2,
       tphhl$RN$Q = 0.054:0.055:0.055,
       tphlh$RN$QN = 0.099:0.1:0.1,
       tminpwh$CK = 0.071:0.2:0.2,
       tminpwl$CK = 0.075:0.14:0.14,
       tminpwl$RN = 0.043:0.1:0.1,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRX4 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_6, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_25, N30_6);
   not (Q, QBINT_25);
   buf (QN, QBINT_25);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.17:0.17:0.17,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.22:0.22:0.22,
       tphhl$RN$Q = 0.049:0.049:0.049,
       tphlh$RN$QN = 0.096:0.096:0.097,
       tminpwh$CK = 0.087:0.22:0.22,
       tminpwl$CK = 0.074:0.13:0.13,
       tminpwl$RN = 0.038:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRXL (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_4, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_4, N30_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.15:0.15:0.15,
       tphhl$RN$Q = 0.049:0.05:0.05,
       tphlh$RN$QN = 0.069:0.069:0.07,
       tminpwh$CK = 0.068:0.16:0.16,
       tminpwl$CK = 0.077:0.14:0.14,
       tminpwl$RN = 0.038:0.096:0.096,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX1 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_3, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_3, N35_3);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tphlh$SN$Q = 0.092:0.092:0.093,
       tminpwh$CK = 0.074:0.15:0.15,
       tminpwl$CK = 0.084:0.16:0.16,
       tminpwl$SN = 0.025:0.093:0.093,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX2 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_3, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tphlh$SN$Q = 0.1:0.1:0.1,
       tminpwh$CK = 0.074:0.16:0.16,
       tminpwl$CK = 0.084:0.16:0.16,
       tminpwl$SN = 0.025:0.1:0.1,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX4 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_4, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_6, N35_4);
   not (Q, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tphlh$SN$Q = 0.11:0.11:0.11,
       tminpwh$CK = 0.087:0.17:0.17,
       tminpwl$CK = 0.085:0.16:0.16,
       tminpwl$SN = 0.025:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX8 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_12, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_9, N35_12);
   not (Q, QBINT_9);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.18:0.18:0.18,
       tphlh$SN$Q = 0.13:0.13:0.14,
       tminpwh$CK = 0.1:0.18:0.18,
       tminpwl$CK = 0.081:0.15:0.15,
       tminpwl$SN = 0.025:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX1 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35);
   not (Q, QBINT_3);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.14:0.15:0.16,
       tplhl$SN$Q = 0.11:0.12:0.12,
       tphlh$SN$Q = 0.1:0.1:0.11,
       tminpwh$CK = 0.079:0.16:0.16,
       tminpwl$CK = 0.084:0.17:0.17,
       tminpwl$RN = 0.07:0.16:0.16,
       tminpwl$SN = 0.029:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX2 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.15:0.16:0.17,
       tplhl$SN$Q = 0.12:0.13:0.13,
       tphlh$SN$Q = 0.11:0.11:0.11,
       tminpwh$CK = 0.08:0.17:0.17,
       tminpwl$CK = 0.084:0.16:0.16,
       tminpwl$RN = 0.07:0.17:0.17,
       tminpwl$SN = 0.029:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX4 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_9, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_6, N35_9);
   not (Q, QBINT_6);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.17:0.17:0.18,
       tplhl$SN$Q = 0.14:0.14:0.14,
       tphlh$SN$Q = 0.12:0.13:0.13,
       tminpwh$CK = 0.1:0.17:0.17,
       tminpwl$CK = 0.087:0.16:0.16,
       tminpwl$RN = 0.07:0.18:0.18,
       tminpwl$SN = 0.029:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = 0.093:0.093:0.093,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX8 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_10, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_30, N35_10);
   not (Q, QBINT_30);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.17:0.17:0.17,
       tplhl$CK$Q = 0.19:0.19:0.19,
       tphhl$RN$Q = 0.19:0.2:0.2,
       tplhl$SN$Q = 0.16:0.16:0.16,
       tphlh$SN$Q = 0.14:0.15:0.15,
       tminpwh$CK = 0.11:0.19:0.19,
       tminpwl$CK = 0.083:0.16:0.16,
       tminpwl$RN = 0.07:0.2:0.2,
       tminpwl$SN = 0.029:0.15:0.15,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.19:0.19,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRX1 (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_4, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_4);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.15:0.15:0.15,
       tphhl$RN$Q = 0.16:0.16:0.17,
       tphlh$RN$QN = 0.18:0.19:0.2,
       tplhl$SN$Q = 0.13:0.14:0.15,
       tphlh$SN$Q = 0.12:0.12:0.13,
       tpllh$SN$QN = 0.16:0.17:0.17,
       tphhl$SN$QN = 0.15:0.15:0.15,
       tminpwh$CK = 0.071:0.19:0.19,
       tminpwl$CK = 0.074:0.15:0.15,
       tminpwl$RN = 0.065:0.2:0.2,
       tminpwl$SN = 0.034:0.15:0.15,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.19:0.19:0.19,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRX2 (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_6, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT, N35_6);
   not (Q, QBINT);
   buf (QN, QBINT);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.21:0.21:0.21,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tphhl$RN$Q = 0.17:0.18:0.18,
       tphlh$RN$QN = 0.21:0.22:0.23,
       tplhl$SN$Q = 0.13:0.14:0.15,
       tphlh$SN$Q = 0.12:0.13:0.13,
       tpllh$SN$QN = 0.18:0.19:0.19,
       tphhl$SN$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.086:0.21:0.21,
       tminpwl$CK = 0.079:0.15:0.15,
       tminpwl$RN = 0.069:0.23:0.23,
       tminpwl$SN = 0.031:0.17:0.17,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRX4 (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_8, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_11, N35_8);
   not (Q, QBINT_11);
   buf (QN, QBINT_11);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.18:0.18:0.18,
       tpllh$CK$QN = 0.23:0.23:0.23,
       tplhl$CK$QN = 0.2:0.2:0.2,
       tphhl$RN$Q = 0.18:0.19:0.2,
       tphlh$RN$QN = 0.23:0.24:0.24,
       tplhl$SN$Q = 0.15:0.16:0.16,
       tphlh$SN$Q = 0.14:0.14:0.15,
       tpllh$SN$QN = 0.2:0.21:0.21,
       tphhl$SN$QN = 0.19:0.19:0.19,
       tminpwh$CK = 0.095:0.23:0.23,
       tminpwl$CK = 0.082:0.16:0.16,
       tminpwl$RN = 0.07:0.24:0.24,
       tminpwl$SN = 0.033:0.19:0.19,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.19:0.19:0.19,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRXL (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_6, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_6);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tphhl$RN$Q = 0.15:0.15:0.16,
       tphlh$RN$QN = 0.17:0.17:0.18,
       tplhl$SN$Q = 0.12:0.13:0.14,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tpllh$SN$QN = 0.14:0.15:0.16,
       tphhl$SN$QN = 0.13:0.13:0.14,
       tminpwh$CK = 0.071:0.17:0.17,
       tminpwl$CK = 0.074:0.16:0.16,
       tminpwl$RN = 0.064:0.18:0.18,
       tminpwl$SN = 0.034:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.19:0.19:0.19,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSX1 (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_5, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_5);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.15:0.15:0.15,
       tphlh$SN$Q = 0.11:0.11:0.12,
       tphhl$SN$QN = 0.13:0.14:0.14,
       tminpwh$CK = 0.07:0.18:0.18,
       tminpwl$CK = 0.077:0.15:0.15,
       tminpwl$SN = 0.026:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSX2 (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_8, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_3, N35_8);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tphhl$SN$QN = 0.16:0.16:0.17,
       tminpwh$CK = 0.073:0.2:0.2,
       tminpwl$CK = 0.079:0.15:0.15,
       tminpwl$SN = 0.027:0.17:0.17,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSX4 (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_9, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_22, N35_9);
   not (Q, QBINT_22);
   buf (QN, QBINT_22);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tpllh$CK$QN = 0.22:0.22:0.22,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tphlh$SN$Q = 0.13:0.13:0.13,
       tphhl$SN$QN = 0.17:0.18:0.18,
       tminpwh$CK = 0.085:0.22:0.22,
       tminpwl$CK = 0.074:0.14:0.14,
       tminpwl$SN = 0.026:0.18:0.18,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSXL (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_4, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tphlh$SN$Q = 0.1:0.11:0.11,
       tphhl$SN$QN = 0.12:0.12:0.13,
       tminpwh$CK = 0.07:0.16:0.16,
       tminpwl$CK = 0.077:0.15:0.15,
       tminpwl$SN = 0.026:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRX1 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_4);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.065:0.17:0.17,
       tminpwl$CK = 0.074:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.095:0.095:0.095,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRX2 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_6);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.068:0.19:0.19,
       tminpwl$CK = 0.073:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.095:0.095:0.095,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRX4 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_8, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_19, N30_8);
   not (Q, QBINT_19);
   buf (QN, QBINT_19);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.18:0.18:0.18,
       tminpwh$CK = 0.082:0.2:0.2,
       tminpwl$CK = 0.072:0.1:0.1,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.095:0.095:0.095,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRXL (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.065:0.16:0.16,
       tminpwl$CK = 0.073:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.095:0.095:0.095,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFX1 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.15:0.15:0.15,
       tminpwh$CK = 0.068:0.17:0.17,
       tminpwl$CK = 0.077:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFX2 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_8, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_13, N30_8);
   not (Q, QBINT_13);
   buf (QN, QBINT_13);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.069:0.19:0.19,
       tminpwl$CK = 0.072:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFX4 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_9, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_21, N30_9);
   not (Q, QBINT_21);
   buf (QN, QBINT_21);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tminpwh$CK = 0.085:0.2:0.2,
       tminpwl$CK = 0.074:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFXL (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_4);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.068:0.16:0.16,
       tminpwl$CK = 0.077:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY1X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.09:0.09:0.09,
       tphhl$A$Y = 0.086:0.086:0.086;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY1X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY2X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.17:0.17:0.17,
       tphhl$A$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY2X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.2:0.2:0.2,
       tphhl$A$Y = 0.19:0.19:0.19;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY3X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.25:0.25:0.25,
       tphhl$A$Y = 0.25:0.25:0.25;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY3X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.28:0.28:0.28,
       tphhl$A$Y = 0.27:0.27:0.27;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY4X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.33:0.33:0.33,
       tphhl$A$Y = 0.32:0.32:0.32;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY4X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.36:0.36:0.36,
       tphhl$A$Y = 0.35:0.35:0.35;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX1 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_5);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_3);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.069:0.14:0.14,
       tminpwl$CK = 0.076:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_5)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX2 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_5);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_3);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.072:0.14:0.14,
       tminpwl$CK = 0.076:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_5)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX4 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_14);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_14, N30);
   not (Q, QBINT_14);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.082:0.15:0.15,
       tminpwl$CK = 0.076:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_14)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX8 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_17);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_11, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_11);
   not (Q, QBINT_17);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tminpwh$CK = 0.1:0.17:0.17,
       tminpwl$CK = 0.076:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_17)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRX1 (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_18);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_18, N30_7);
   not (Q, QBINT_18);
   buf (QN, QBINT_18);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.15:0.15:0.15,
       tminpwh$CK = 0.074:0.17:0.17,
       tminpwl$CK = 0.078:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_18&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_18&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRX2 (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_11);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_5, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_11, N30_5);
   not (Q, QBINT_11);
   buf (QN, QBINT_11);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.18:0.18:0.18,
       tminpwh$CK = 0.077:0.19:0.19,
       tminpwl$CK = 0.078:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_11&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_11&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRX4 (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_7);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_7, N30_4);
   not (Q, QBINT_7);
   buf (QN, QBINT_7);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.21:0.21:0.21,
       tplhl$CK$QN = 0.2:0.2:0.2,
       tminpwh$CK = 0.09:0.21:0.21,
       tminpwl$CK = 0.079:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_7&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_7&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRXL (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_17);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_6);
   not (Q, QBINT_17);
   buf (QN, QBINT_17);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.068:0.16:0.16,
       tminpwl$CK = 0.077:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_17&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_17&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFX1 (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_6);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_7);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.066:0.16:0.16,
       tminpwl$CK = 0.071:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_6)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_6)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFX2 (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_16);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_16, N30);
   not (Q, QBINT_16);
   buf (QN, QBINT_16);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.16:0.16:0.16,
       tminpwh$CK = 0.071:0.18:0.18,
       tminpwl$CK = 0.072:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_16)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_16)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFX4 (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_25);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_25, N30);
   not (Q, QBINT_25);
   buf (QN, QBINT_25);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tminpwh$CK = 0.081:0.2:0.2,
       tminpwl$CK = 0.071:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_25)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_25)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFXL (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_6);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_6);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.064:0.16:0.16,
       tminpwl$CK = 0.073:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_6)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_6)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module HOLDX1 (Y);
inout  Y ;

   buf (weak1, weak0) (Y, Y);


endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.009:0.009:0.009,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX12 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0087:0.0087:0.0087,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX16 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.028:0.028:0.028,
       tphlh$A$Y = 0.042:0.042:0.042;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0083:0.0083:0.0083,
       tphlh$A$Y = 0.012:0.012:0.012;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX20 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0089:0.0089:0.0089,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX3 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0087:0.0087:0.0087,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0085:0.0085:0.0085,
       tphlh$A$Y = 0.012:0.012:0.012;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX6 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0088:0.0088:0.0088,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.0087:0.0087:0.0087,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVXL (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.009:0.009:0.009,
       tphlh$A$Y = 0.013:0.013:0.013;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX1 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.071:0.14:0.14,
       tminpwl$CK = 0.081:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.095:0.095,
       thold_negedge$S0$CK = -0.001:0.093:0.093,
       tsetup_posedge$D0$CK = 0.095:0.095:0.095,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.095:0.095:0.095,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX2 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.07:0.15:0.15,
       tminpwl$CK = 0.08:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.095:0.095,
       thold_negedge$S0$CK = -0.001:0.093:0.093,
       tsetup_posedge$D0$CK = 0.095:0.095:0.095,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.095:0.095:0.095,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX4 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_15, N30_6);
   not (Q, QBINT_15);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.082:0.15:0.15,
       tminpwl$CK = 0.082:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.095:0.095,
       thold_negedge$S0$CK = -0.001:0.093:0.093,
       tsetup_posedge$D0$CK = 0.095:0.095:0.095,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.095:0.095:0.095,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX8 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30_11, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_11);
   not (Q, QBINT_30);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tminpwh$CK = 0.1:0.17:0.17,
       tminpwl$CK = 0.082:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.095:0.095,
       thold_negedge$S0$CK = -0.001:0.093:0.093,
       tsetup_posedge$D0$CK = 0.095:0.095:0.095,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.095:0.095:0.095,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X1 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.051:0.051:0.051,
       tphhl$A$Y = 0.061:0.061:0.061,
       tpllh$B$Y = 0.051:0.051:0.051,
       tphhl$B$Y = 0.065:0.065:0.065,
       tpllh$S0$Y = 0.04:0.04:0.04,
       tplhl$S0$Y = 0.072:0.072:0.072,
       tphlh$S0$Y = 0.071:0.071:0.071,
       tphhl$S0$Y = 0.047:0.047:0.047;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X2 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.067:0.067:0.067,
       tphhl$A$Y = 0.084:0.084:0.084,
       tpllh$B$Y = 0.068:0.068:0.068,
       tphhl$B$Y = 0.087:0.087:0.087,
       tpllh$S0$Y = 0.056:0.056:0.056,
       tplhl$S0$Y = 0.093:0.093:0.093,
       tphlh$S0$Y = 0.087:0.087:0.087,
       tphhl$S0$Y = 0.068:0.068:0.068;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X4 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.081:0.081:0.081,
       tphhl$A$Y = 0.099:0.099:0.099,
       tpllh$B$Y = 0.081:0.081:0.081,
       tphhl$B$Y = 0.1:0.1:0.1,
       tpllh$S0$Y = 0.07:0.07:0.07,
       tplhl$S0$Y = 0.11:0.11:0.11,
       tphlh$S0$Y = 0.1:0.1:0.1,
       tphhl$S0$Y = 0.085:0.085:0.085;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X6 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.13:0.13:0.13,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.13:0.13:0.13,
       tpllh$S0$Y = 0.094:0.094:0.094,
       tplhl$S0$Y = 0.14:0.14:0.14,
       tphlh$S0$Y = 0.13:0.13:0.13,
       tphhl$S0$Y = 0.12:0.12:0.12;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X8 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.13:0.13:0.13,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpllh$B$Y = 0.13:0.13:0.13,
       tphhl$B$Y = 0.16:0.16:0.16,
       tpllh$S0$Y = 0.12:0.12:0.12,
       tplhl$S0$Y = 0.17:0.17:0.17,
       tphlh$S0$Y = 0.15:0.15:0.15,
       tphhl$S0$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2XL (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.044:0.044:0.044,
       tphhl$A$Y = 0.052:0.052:0.052,
       tpllh$B$Y = 0.045:0.045:0.045,
       tphhl$B$Y = 0.055:0.055:0.055,
       tpllh$S0$Y = 0.034:0.034:0.034,
       tplhl$S0$Y = 0.063:0.063:0.063,
       tphlh$S0$Y = 0.064:0.064:0.064,
       tphhl$S0$Y = 0.038:0.038:0.038;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3X1 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.081:0.081:0.081,
       tphhl$A$Y = 0.093:0.093:0.093,
       tpllh$B$Y = 0.08:0.08:0.08,
       tphhl$B$Y = 0.095:0.095:0.095,
       tpllh$C$Y = 0.051:0.051:0.051,
       tphhl$C$Y = 0.065:0.065:0.065,
       tpllh$S0$Y = 0.07:0.07:0.07,
       tplhl$S0$Y = 0.1:0.1:0.1,
       tphlh$S0$Y = 0.1:0.1:0.1,
       tphhl$S0$Y = 0.078:0.078:0.078,
       tpllh$S1$Y = 0.041:0.041:0.041,
       tplhl$S1$Y = 0.071:0.071:0.071,
       tphlh$S1$Y = 0.068:0.068:0.068,
       tphhl$S1$Y = 0.047:0.047:0.047;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3X2 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.12:0.12:0.12,
       tpllh$C$Y = 0.068:0.068:0.068,
       tphhl$C$Y = 0.087:0.087:0.087,
       tpllh$S0$Y = 0.09:0.09:0.09,
       tplhl$S0$Y = 0.12:0.12:0.12,
       tphlh$S0$Y = 0.12:0.12:0.12,
       tphhl$S0$Y = 0.1:0.1:0.1,
       tpllh$S1$Y = 0.056:0.056:0.056,
       tplhl$S1$Y = 0.091:0.091:0.091,
       tphlh$S1$Y = 0.085:0.085:0.085,
       tphhl$S1$Y = 0.066:0.067:0.067;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3X4 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.14:0.14:0.14,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.17:0.17:0.17,
       tpllh$C$Y = 0.071:0.071:0.071,
       tphhl$C$Y = 0.09:0.09:0.09,
       tpllh$S0$Y = 0.13:0.13:0.13,
       tplhl$S0$Y = 0.18:0.18:0.18,
       tphlh$S0$Y = 0.16:0.16:0.16,
       tphhl$S0$Y = 0.16:0.16:0.16,
       tpllh$S1$Y = 0.06:0.06:0.06,
       tplhl$S1$Y = 0.098:0.098:0.098,
       tphlh$S1$Y = 0.12:0.12:0.12,
       tphhl$S1$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3XL (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.072:0.072:0.072,
       tphhl$A$Y = 0.081:0.081:0.081,
       tpllh$B$Y = 0.071:0.071:0.071,
       tphhl$B$Y = 0.083:0.083:0.083,
       tpllh$C$Y = 0.045:0.045:0.045,
       tphhl$C$Y = 0.056:0.056:0.056,
       tpllh$S0$Y = 0.061:0.061:0.061,
       tplhl$S0$Y = 0.09:0.09:0.09,
       tphlh$S0$Y = 0.09:0.09:0.09,
       tphhl$S0$Y = 0.066:0.066:0.066,
       tpllh$S1$Y = 0.034:0.034:0.034,
       tplhl$S1$Y = 0.062:0.062:0.062,
       tphlh$S1$Y = 0.06:0.06:0.06,
       tphhl$S1$Y = 0.039:0.039:0.039;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4X1 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.084:0.084:0.084,
       tphhl$A$Y = 0.097:0.097:0.097,
       tpllh$B$Y = 0.084:0.084:0.084,
       tphhl$B$Y = 0.099:0.099:0.099,
       tpllh$C$Y = 0.08:0.08:0.08,
       tphhl$C$Y = 0.094:0.094:0.094,
       tpllh$D$Y = 0.079:0.079:0.079,
       tphhl$D$Y = 0.096:0.096:0.096,
       tpllh$S0$Y = 0.069:0.072:0.075,
       tplhl$S0$Y = 0.11:0.11:0.11,
       tphlh$S0$Y = 0.11:0.11:0.11,
       tphhl$S0$Y = 0.079:0.082:0.085,
       tpllh$S1$Y = 0.046:0.046:0.046,
       tplhl$S1$Y = 0.059:0.059:0.059,
       tphlh$S1$Y = 0.07:0.07:0.07,
       tphhl$S1$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4X2 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.099:0.099:0.099,
       tphhl$B$Y = 0.12:0.12:0.12,
       tpllh$C$Y = 0.11:0.11:0.11,
       tphhl$C$Y = 0.12:0.12:0.12,
       tpllh$D$Y = 0.1:0.1:0.1,
       tphhl$D$Y = 0.12:0.12:0.12,
       tpllh$S0$Y = 0.092:0.093:0.093,
       tplhl$S0$Y = 0.13:0.14:0.14,
       tphlh$S0$Y = 0.13:0.13:0.14,
       tphhl$S0$Y = 0.1:0.11:0.11,
       tpllh$S1$Y = 0.063:0.063:0.063,
       tplhl$S1$Y = 0.076:0.076:0.076,
       tphlh$S1$Y = 0.085:0.085:0.086,
       tphhl$S1$Y = 0.067:0.068:0.068;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4X4 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.14:0.14:0.14,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.17:0.17:0.17,
       tpllh$C$Y = 0.15:0.15:0.15,
       tphhl$C$Y = 0.18:0.18:0.18,
       tpllh$D$Y = 0.15:0.15:0.15,
       tphhl$D$Y = 0.18:0.18:0.18,
       tpllh$S0$Y = 0.13:0.14:0.14,
       tplhl$S0$Y = 0.19:0.19:0.2,
       tphlh$S0$Y = 0.17:0.18:0.18,
       tphhl$S0$Y = 0.16:0.16:0.16,
       tpllh$S1$Y = 0.096:0.097:0.097,
       tplhl$S1$Y = 0.12:0.12:0.12,
       tphlh$S1$Y = 0.12:0.12:0.12,
       tphhl$S1$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4XL (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.075:0.075:0.075,
       tphhl$A$Y = 0.085:0.085:0.085,
       tpllh$B$Y = 0.074:0.074:0.074,
       tphhl$B$Y = 0.086:0.086:0.086,
       tpllh$C$Y = 0.071:0.071:0.071,
       tphhl$C$Y = 0.082:0.082:0.082,
       tpllh$D$Y = 0.071:0.071:0.071,
       tphhl$D$Y = 0.084:0.084:0.084,
       tpllh$S0$Y = 0.06:0.063:0.066,
       tplhl$S0$Y = 0.099:0.1:0.1,
       tphlh$S0$Y = 0.1:0.1:0.1,
       tphhl$S0$Y = 0.067:0.07:0.072,
       tpllh$S1$Y = 0.036:0.036:0.037,
       tplhl$S1$Y = 0.05:0.05:0.05,
       tphlh$S1$Y = 0.063:0.063:0.063,
       tphhl$S1$Y = 0.039:0.039:0.039;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X1 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.022:0.022:0.022,
       tphlh$A$Y = 0.03:0.03:0.03,
       tplhl$B$Y = 0.02:0.02:0.02,
       tphlh$B$Y = 0.032:0.032:0.032,
       tpllh$S0$Y = 0.044:0.044:0.044,
       tplhl$S0$Y = 0.014:0.014:0.014,
       tphlh$S0$Y = 0.019:0.019:0.019,
       tphhl$S0$Y = 0.045:0.045:0.045;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X2 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.084:0.084:0.084,
       tphlh$A$Y = 0.094:0.094:0.094,
       tplhl$B$Y = 0.084:0.084:0.084,
       tphlh$B$Y = 0.096:0.096:0.096,
       tpllh$S0$Y = 0.1:0.1:0.1,
       tplhl$S0$Y = 0.075:0.075:0.075,
       tphlh$S0$Y = 0.082:0.082:0.082,
       tphhl$S0$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X4 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.098:0.098:0.098,
       tphlh$A$Y = 0.11:0.11:0.11,
       tplhl$B$Y = 0.098:0.098:0.098,
       tphlh$B$Y = 0.12:0.12:0.12,
       tpllh$S0$Y = 0.12:0.12:0.12,
       tplhl$S0$Y = 0.09:0.09:0.09,
       tphlh$S0$Y = 0.1:0.1:0.1,
       tphhl$S0$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X6 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.1:0.1:0.1,
       tphlh$A$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.1:0.1:0.1,
       tphlh$B$Y = 0.13:0.13:0.13,
       tpllh$S0$Y = 0.13:0.13:0.13,
       tplhl$S0$Y = 0.093:0.093:0.093,
       tphlh$S0$Y = 0.11:0.11:0.11,
       tphhl$S0$Y = 0.12:0.12:0.12;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X8 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.14:0.14:0.14,
       tpllh$S0$Y = 0.14:0.14:0.14,
       tplhl$S0$Y = 0.1:0.1:0.1,
       tphlh$S0$Y = 0.12:0.12:0.12,
       tphhl$S0$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2XL (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.022:0.022:0.022,
       tphlh$A$Y = 0.032:0.032:0.032,
       tplhl$B$Y = 0.021:0.021:0.021,
       tphlh$B$Y = 0.033:0.033:0.033,
       tpllh$S0$Y = 0.045:0.045:0.045,
       tplhl$S0$Y = 0.014:0.014:0.014,
       tphlh$S0$Y = 0.019:0.019:0.019,
       tphhl$S0$Y = 0.044:0.044:0.044;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3X1 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.098:0.098:0.098,
       tphlh$A$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.098:0.098:0.098,
       tphlh$B$Y = 0.1:0.1:0.1,
       tplhl$C$Y = 0.08:0.08:0.08,
       tphlh$C$Y = 0.073:0.073:0.073,
       tpllh$S0$Y = 0.11:0.11:0.11,
       tplhl$S0$Y = 0.087:0.087:0.087,
       tphlh$S0$Y = 0.087:0.087:0.087,
       tphhl$S0$Y = 0.12:0.12:0.12,
       tpllh$S1$Y = 0.042:0.042:0.042,
       tplhl$S1$Y = 0.078:0.078:0.078,
       tphlh$S1$Y = 0.076:0.076:0.076,
       tphhl$S1$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3X2 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.12:0.12:0.12,
       tphlh$A$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.12:0.12:0.12,
       tphlh$B$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.099:0.099:0.099,
       tphlh$C$Y = 0.088:0.088:0.088,
       tpllh$S0$Y = 0.13:0.13:0.13,
       tplhl$S0$Y = 0.11:0.11:0.11,
       tphlh$S0$Y = 0.11:0.11:0.11,
       tphhl$S0$Y = 0.14:0.14:0.14,
       tpllh$S1$Y = 0.06:0.06:0.06,
       tplhl$S1$Y = 0.089:0.089:0.089,
       tphlh$S1$Y = 0.083:0.083:0.083,
       tphhl$S1$Y = 0.072:0.072:0.072;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3X4 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.14:0.14:0.14,
       tphlh$A$Y = 0.14:0.14:0.14,
       tplhl$B$Y = 0.14:0.14:0.14,
       tphlh$B$Y = 0.14:0.14:0.14,
       tplhl$C$Y = 0.12:0.12:0.12,
       tphlh$C$Y = 0.11:0.11:0.11,
       tpllh$S0$Y = 0.15:0.15:0.15,
       tplhl$S0$Y = 0.13:0.13:0.13,
       tphlh$S0$Y = 0.13:0.13:0.13,
       tphhl$S0$Y = 0.16:0.16:0.16,
       tpllh$S1$Y = 0.072:0.072:0.072,
       tplhl$S1$Y = 0.11:0.11:0.11,
       tphlh$S1$Y = 0.1:0.1:0.1,
       tphhl$S1$Y = 0.087:0.087:0.087;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3XL (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.086:0.086:0.086,
       tphlh$A$Y = 0.092:0.092:0.092,
       tplhl$B$Y = 0.086:0.086:0.086,
       tphlh$B$Y = 0.095:0.095:0.095,
       tplhl$C$Y = 0.069:0.069:0.069,
       tphlh$C$Y = 0.065:0.065:0.065,
       tpllh$S0$Y = 0.1:0.1:0.1,
       tplhl$S0$Y = 0.076:0.076:0.076,
       tphlh$S0$Y = 0.078:0.078:0.078,
       tphhl$S0$Y = 0.11:0.11:0.11,
       tpllh$S1$Y = 0.034:0.034:0.034,
       tplhl$S1$Y = 0.067:0.067:0.067,
       tphlh$S1$Y = 0.068:0.068:0.068,
       tphhl$S1$Y = 0.038:0.038:0.038;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4X1 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.099:0.099:0.099,
       tphlh$A$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.098:0.098:0.098,
       tphlh$B$Y = 0.11:0.11:0.11,
       tplhl$C$Y = 0.099:0.099:0.099,
       tphlh$C$Y = 0.1:0.1:0.1,
       tplhl$D$Y = 0.099:0.099:0.099,
       tphlh$D$Y = 0.1:0.1:0.1,
       tpllh$S0$Y = 0.12:0.12:0.12,
       tplhl$S0$Y = 0.089:0.089:0.089,
       tphlh$S0$Y = 0.088:0.089:0.09,
       tphhl$S0$Y = 0.13:0.13:0.13,
       tpllh$S1$Y = 0.043:0.043:0.043,
       tplhl$S1$Y = 0.07:0.07:0.07,
       tphlh$S1$Y = 0.069:0.069:0.069,
       tphhl$S1$Y = 0.05:0.05:0.05;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4X2 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.13:0.13:0.13,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.13:0.13:0.13,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.13:0.13:0.13,
       tphlh$C$Y = 0.13:0.13:0.13,
       tplhl$D$Y = 0.13:0.13:0.13,
       tphlh$D$Y = 0.13:0.13:0.13,
       tpllh$S0$Y = 0.15:0.15:0.15,
       tplhl$S0$Y = 0.12:0.12:0.12,
       tphlh$S0$Y = 0.11:0.11:0.11,
       tphhl$S0$Y = 0.16:0.16:0.16,
       tpllh$S1$Y = 0.059:0.059:0.059,
       tplhl$S1$Y = 0.1:0.1:0.1,
       tphlh$S1$Y = 0.094:0.094:0.094,
       tphhl$S1$Y = 0.07:0.07:0.07;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4X4 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.14:0.14:0.14,
       tphlh$A$Y = 0.15:0.15:0.15,
       tplhl$B$Y = 0.14:0.14:0.14,
       tphlh$B$Y = 0.15:0.15:0.15,
       tplhl$C$Y = 0.15:0.15:0.15,
       tphlh$C$Y = 0.15:0.15:0.15,
       tplhl$D$Y = 0.15:0.15:0.15,
       tphlh$D$Y = 0.15:0.15:0.15,
       tpllh$S0$Y = 0.16:0.16:0.17,
       tplhl$S0$Y = 0.13:0.14:0.14,
       tphlh$S0$Y = 0.13:0.13:0.13,
       tphhl$S0$Y = 0.17:0.18:0.18,
       tpllh$S1$Y = 0.073:0.073:0.073,
       tplhl$S1$Y = 0.12:0.12:0.12,
       tphlh$S1$Y = 0.11:0.11:0.11,
       tphhl$S1$Y = 0.088:0.088:0.088;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4XL (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.089:0.089:0.089,
       tphlh$A$Y = 0.097:0.097:0.097,
       tplhl$B$Y = 0.089:0.089:0.089,
       tphlh$B$Y = 0.099:0.099:0.099,
       tplhl$C$Y = 0.089:0.089:0.089,
       tphlh$C$Y = 0.095:0.095:0.095,
       tplhl$D$Y = 0.088:0.088:0.088,
       tphlh$D$Y = 0.097:0.097:0.097,
       tpllh$S0$Y = 0.11:0.12:0.12,
       tplhl$S0$Y = 0.079:0.079:0.079,
       tphlh$S0$Y = 0.081:0.082:0.083,
       tphhl$S0$Y = 0.12:0.12:0.12,
       tpllh$S1$Y = 0.035:0.035:0.035,
       tplhl$S1$Y = 0.06:0.06:0.06,
       tphlh$S1$Y = 0.061:0.061:0.061,
       tphhl$S1$Y = 0.04:0.04:0.04;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BX1 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.035:0.035:0.035,
       tphhl$AN$Y = 0.042:0.042:0.042,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BX2 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.046:0.046:0.046,
       tphhl$AN$Y = 0.056:0.056:0.056,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BX4 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.049:0.049:0.049,
       tphhl$AN$Y = 0.059:0.059:0.059,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BXL (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.03:0.03:0.03,
       tphhl$AN$Y = 0.035:0.035:0.035,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.016:0.016:0.016,
       tphlh$A$Y = 0.017:0.017:0.017,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.016:0.016:0.016,
       tphlh$A$Y = 0.017:0.017:0.017,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.016:0.016:0.016,
       tphlh$A$Y = 0.017:0.017:0.017,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.017:0.017:0.017,
       tphlh$A$Y = 0.017:0.017:0.017,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.016:0.016:0.016,
       tphlh$A$Y = 0.017:0.017:0.017,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.016:0.016:0.016,
       tphlh$A$Y = 0.017:0.017:0.017,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BX1 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.039:0.039:0.039,
       tphhl$AN$Y = 0.052:0.052:0.052,
       tplhl$B$Y = 0.025:0.025:0.025,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.022:0.022:0.022,
       tphlh$C$Y = 0.017:0.017:0.017;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BX2 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.052:0.052:0.052,
       tphhl$AN$Y = 0.067:0.067:0.067,
       tplhl$B$Y = 0.024:0.024:0.024,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.02:0.02:0.02,
       tphlh$C$Y = 0.016:0.016:0.016;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BX4 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.055:0.055:0.055,
       tphhl$AN$Y = 0.069:0.069:0.069,
       tplhl$B$Y = 0.024:0.024:0.024,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.021:0.021:0.021,
       tphlh$C$Y = 0.016:0.016:0.016;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BXL (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.034:0.034:0.034,
       tphhl$AN$Y = 0.046:0.046:0.046,
       tplhl$B$Y = 0.025:0.025:0.025,
       tphlh$B$Y = 0.02:0.02:0.02,
       tplhl$C$Y = 0.023:0.023:0.023,
       tphlh$C$Y = 0.018:0.018:0.018;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.026:0.026:0.026,
       tphlh$A$Y = 0.02:0.02:0.02,
       tplhl$B$Y = 0.025:0.025:0.025,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.022:0.022:0.022,
       tphlh$C$Y = 0.017:0.017:0.017;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.026:0.026:0.026,
       tphlh$A$Y = 0.02:0.02:0.02,
       tplhl$B$Y = 0.024:0.024:0.024,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.021:0.021:0.021,
       tphlh$C$Y = 0.016:0.016:0.016;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.026:0.026:0.026,
       tphlh$A$Y = 0.021:0.021:0.021,
       tplhl$B$Y = 0.024:0.024:0.024,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.021:0.021:0.021,
       tphlh$C$Y = 0.017:0.017:0.017;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.027:0.027:0.027,
       tphlh$A$Y = 0.021:0.021:0.021,
       tplhl$B$Y = 0.025:0.025:0.025,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.021:0.021:0.021,
       tphlh$C$Y = 0.017:0.017:0.017;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.026:0.026:0.026,
       tphlh$A$Y = 0.021:0.021:0.021,
       tplhl$B$Y = 0.024:0.024:0.024,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.021:0.021:0.021,
       tphlh$C$Y = 0.017:0.017:0.017;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.026:0.026:0.026,
       tphlh$A$Y = 0.02:0.02:0.02,
       tplhl$B$Y = 0.024:0.024:0.024,
       tphlh$B$Y = 0.019:0.019:0.019,
       tplhl$C$Y = 0.021:0.021:0.021,
       tphlh$C$Y = 0.017:0.017:0.017;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBX1 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.042:0.042:0.042,
       tphhl$AN$Y = 0.065:0.065:0.065,
       tpllh$BN$Y = 0.042:0.042:0.042,
       tphhl$BN$Y = 0.064:0.064:0.064,
       tplhl$C$Y = 0.034:0.034:0.034,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.029:0.029:0.029,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBX2 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.053:0.053:0.053,
       tphhl$AN$Y = 0.079:0.079:0.079,
       tpllh$BN$Y = 0.055:0.055:0.055,
       tphhl$BN$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.034:0.034:0.034,
       tphlh$C$Y = 0.02:0.02:0.02,
       tplhl$D$Y = 0.027:0.027:0.027,
       tphlh$D$Y = 0.017:0.017:0.017;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBX4 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.054:0.054:0.054,
       tphhl$AN$Y = 0.079:0.079:0.079,
       tpllh$BN$Y = 0.055:0.055:0.055,
       tphhl$BN$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.033:0.033:0.033,
       tphlh$C$Y = 0.02:0.02:0.02,
       tplhl$D$Y = 0.027:0.027:0.027,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBXL (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.038:0.038:0.038,
       tphhl$AN$Y = 0.06:0.06:0.06,
       tpllh$BN$Y = 0.038:0.038:0.038,
       tphhl$BN$Y = 0.06:0.06:0.06,
       tplhl$C$Y = 0.035:0.035:0.035,
       tphlh$C$Y = 0.022:0.022:0.022,
       tplhl$D$Y = 0.03:0.03:0.03,
       tphlh$D$Y = 0.019:0.019:0.019;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BX1 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.042:0.042:0.042,
       tphhl$AN$Y = 0.064:0.064:0.064,
       tplhl$B$Y = 0.037:0.037:0.037,
       tphlh$B$Y = 0.022:0.022:0.022,
       tplhl$C$Y = 0.034:0.034:0.034,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.029:0.029:0.029,
       tphlh$D$Y = 0.019:0.019:0.019;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BX2 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.052:0.052:0.052,
       tphhl$AN$Y = 0.077:0.077:0.077,
       tplhl$B$Y = 0.038:0.038:0.038,
       tphlh$B$Y = 0.022:0.022:0.022,
       tplhl$C$Y = 0.035:0.035:0.035,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.028:0.028:0.028,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BX4 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.055:0.055:0.055,
       tphhl$AN$Y = 0.079:0.079:0.079,
       tplhl$B$Y = 0.039:0.039:0.039,
       tphlh$B$Y = 0.023:0.023:0.023,
       tplhl$C$Y = 0.036:0.036:0.036,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.028:0.028:0.028,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BXL (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.037:0.037:0.037,
       tphhl$AN$Y = 0.058:0.058:0.058,
       tplhl$B$Y = 0.037:0.037:0.037,
       tphlh$B$Y = 0.023:0.023:0.023,
       tplhl$C$Y = 0.033:0.033:0.033,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.029:0.029:0.029,
       tphlh$D$Y = 0.019:0.019:0.019;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.038:0.038:0.038,
       tphlh$A$Y = 0.023:0.023:0.023,
       tplhl$B$Y = 0.037:0.037:0.037,
       tphlh$B$Y = 0.022:0.022:0.022,
       tplhl$C$Y = 0.034:0.034:0.034,
       tphlh$C$Y = 0.02:0.02:0.02,
       tplhl$D$Y = 0.029:0.029:0.029,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.04:0.04:0.04,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.037:0.037:0.037,
       tphlh$B$Y = 0.022:0.022:0.022,
       tplhl$C$Y = 0.034:0.034:0.034,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.028:0.028:0.028,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.041:0.041:0.041,
       tphlh$A$Y = 0.023:0.023:0.023,
       tplhl$B$Y = 0.039:0.039:0.039,
       tphlh$B$Y = 0.023:0.023:0.023,
       tplhl$C$Y = 0.036:0.036:0.036,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.029:0.029:0.029,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.039:0.039:0.039,
       tphlh$A$Y = 0.023:0.023:0.023,
       tplhl$B$Y = 0.038:0.038:0.038,
       tphlh$B$Y = 0.022:0.022:0.022,
       tplhl$C$Y = 0.034:0.034:0.034,
       tphlh$C$Y = 0.02:0.02:0.02,
       tplhl$D$Y = 0.028:0.028:0.028,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.039:0.039:0.039,
       tphlh$A$Y = 0.023:0.023:0.023,
       tplhl$B$Y = 0.037:0.037:0.037,
       tphlh$B$Y = 0.022:0.022:0.022,
       tplhl$C$Y = 0.034:0.034:0.034,
       tphlh$C$Y = 0.02:0.02:0.02,
       tplhl$D$Y = 0.028:0.028:0.028,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.037:0.037:0.037,
       tphlh$A$Y = 0.023:0.023:0.023,
       tplhl$B$Y = 0.036:0.036:0.036,
       tphlh$B$Y = 0.022:0.022:0.022,
       tplhl$C$Y = 0.033:0.033:0.033,
       tphlh$C$Y = 0.021:0.021:0.021,
       tplhl$D$Y = 0.029:0.029:0.029,
       tphlh$D$Y = 0.018:0.018:0.018;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BX1 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.042:0.042:0.042,
       tphhl$AN$Y = 0.038:0.038:0.038,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.02:0.02:0.02;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BX2 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.053:0.053:0.053,
       tphhl$AN$Y = 0.053:0.053:0.053,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.019:0.019:0.019;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BX4 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.075:0.075:0.075,
       tphhl$AN$Y = 0.081:0.081:0.081,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.019:0.019:0.019;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BXL (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.039:0.039:0.039,
       tphhl$AN$Y = 0.032:0.032:0.032,
       tplhl$B$Y = 0.011:0.011:0.011,
       tphlh$B$Y = 0.022:0.022:0.022;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.012:0.012:0.012,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.012:0.012:0.012,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.012:0.012:0.012,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.012:0.012:0.012,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.012:0.012:0.012,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.012:0.012:0.012,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.01:0.01:0.01,
       tphlh$B$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BX1 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.059:0.059:0.059,
       tphhl$AN$Y = 0.041:0.041:0.041,
       tplhl$B$Y = 0.014:0.014:0.014,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.012:0.012:0.012,
       tphlh$C$Y = 0.03:0.03:0.03;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BX2 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.071:0.071:0.071,
       tphhl$AN$Y = 0.058:0.058:0.058,
       tplhl$B$Y = 0.013:0.013:0.013,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.011:0.011:0.011,
       tphlh$C$Y = 0.027:0.027:0.027;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BX4 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.074:0.074:0.074,
       tphhl$AN$Y = 0.06:0.06:0.06,
       tplhl$B$Y = 0.013:0.013:0.013,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.011:0.011:0.011,
       tphlh$C$Y = 0.027:0.027:0.027;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BXL (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.056:0.056:0.056,
       tphhl$AN$Y = 0.034:0.034:0.034,
       tplhl$B$Y = 0.014:0.014:0.014,
       tphlh$B$Y = 0.04:0.04:0.04,
       tplhl$C$Y = 0.013:0.013:0.013,
       tphlh$C$Y = 0.032:0.032:0.032;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.04:0.04:0.04,
       tplhl$B$Y = 0.013:0.013:0.013,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.011:0.011:0.011,
       tphlh$C$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.041:0.041:0.041,
       tplhl$B$Y = 0.013:0.013:0.013,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.011:0.011:0.011,
       tphlh$C$Y = 0.027:0.027:0.027;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.041:0.041:0.041,
       tplhl$B$Y = 0.013:0.013:0.013,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.011:0.011:0.011,
       tphlh$C$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.042:0.042:0.042,
       tplhl$B$Y = 0.014:0.014:0.014,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.012:0.012:0.012,
       tphlh$C$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.042:0.042:0.042,
       tplhl$B$Y = 0.013:0.013:0.013,
       tphlh$B$Y = 0.037:0.037:0.037,
       tplhl$C$Y = 0.012:0.012:0.012,
       tphlh$C$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.043:0.043:0.043,
       tplhl$B$Y = 0.014:0.014:0.014,
       tphlh$B$Y = 0.04:0.04:0.04,
       tplhl$C$Y = 0.012:0.012:0.012,
       tphlh$C$Y = 0.032:0.032:0.032;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBX1 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.081:0.081:0.081,
       tphhl$AN$Y = 0.042:0.042:0.042,
       tpllh$BN$Y = 0.076:0.076:0.076,
       tphhl$BN$Y = 0.042:0.042:0.042,
       tplhl$C$Y = 0.015:0.015:0.015,
       tphlh$C$Y = 0.051:0.051:0.051,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.037:0.037:0.037;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBX2 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.093:0.093:0.093,
       tphhl$AN$Y = 0.054:0.054:0.054,
       tpllh$BN$Y = 0.087:0.087:0.087,
       tphhl$BN$Y = 0.057:0.057:0.057,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.05:0.05:0.05,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.033:0.033:0.033;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBX4 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.095:0.095:0.095,
       tphhl$AN$Y = 0.056:0.056:0.056,
       tpllh$BN$Y = 0.088:0.088:0.088,
       tphhl$BN$Y = 0.058:0.058:0.058,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.05:0.05:0.05,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.033:0.033:0.033;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBXL (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.08:0.08:0.08,
       tphhl$AN$Y = 0.036:0.036:0.036,
       tpllh$BN$Y = 0.078:0.078:0.078,
       tphhl$BN$Y = 0.038:0.038:0.038,
       tplhl$C$Y = 0.015:0.015:0.015,
       tphlh$C$Y = 0.055:0.055:0.055,
       tplhl$D$Y = 0.013:0.013:0.013,
       tphlh$D$Y = 0.041:0.041:0.041;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BX1 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.079:0.079:0.079,
       tphhl$AN$Y = 0.041:0.041:0.041,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.058:0.058:0.058,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.049:0.049:0.049,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.037:0.037:0.037;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BX2 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.091:0.091:0.091,
       tphhl$AN$Y = 0.054:0.054:0.054,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.061:0.061:0.061,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.051:0.051:0.051,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.034:0.034:0.034;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BX4 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.092:0.092:0.092,
       tphhl$AN$Y = 0.056:0.056:0.056,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.06:0.06:0.06,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.051:0.051:0.051,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.035:0.035:0.035;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BXL (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.078:0.078:0.078,
       tphhl$AN$Y = 0.035:0.035:0.035,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.062:0.062:0.062,
       tplhl$C$Y = 0.015:0.015:0.015,
       tphlh$C$Y = 0.054:0.054:0.054,
       tplhl$D$Y = 0.013:0.013:0.013,
       tphlh$D$Y = 0.042:0.042:0.042;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.061:0.061:0.061,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.058:0.058:0.058,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.05:0.05:0.05,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.036:0.036:0.036;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.015:0.015:0.015,
       tphlh$A$Y = 0.062:0.062:0.062,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.058:0.058:0.058,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.05:0.05:0.05,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.035:0.035:0.035;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.063:0.063:0.063,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.06:0.06:0.06,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.051:0.051:0.051,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.035:0.035:0.035;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.063:0.063:0.063,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.059:0.059:0.059,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.05:0.05:0.05,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.034:0.034:0.034;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.014:0.014:0.014,
       tphlh$A$Y = 0.062:0.062:0.062,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.058:0.058:0.058,
       tplhl$C$Y = 0.014:0.014:0.014,
       tphlh$C$Y = 0.049:0.049:0.049,
       tplhl$D$Y = 0.012:0.012:0.012,
       tphlh$D$Y = 0.033:0.033:0.033;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.015:0.015:0.015,
       tphlh$A$Y = 0.064:0.064:0.064,
       tplhl$B$Y = 0.015:0.015:0.015,
       tphlh$B$Y = 0.062:0.062:0.062,
       tplhl$C$Y = 0.015:0.015:0.015,
       tphlh$C$Y = 0.053:0.053:0.053,
       tplhl$D$Y = 0.013:0.013:0.013,
       tphlh$D$Y = 0.04:0.04:0.04;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.05:0.05:0.05,
       tphhl$A0$Y = 0.062:0.062:0.062,
       tpllh$A1$Y = 0.046:0.046:0.046,
       tphhl$A1$Y = 0.059:0.059:0.059,
       tpllh$B0$Y = 0.036:0.042:0.047,
       tphhl$B0$Y = 0.035:0.036:0.037;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.066:0.066:0.066,
       tphhl$A0$Y = 0.084:0.084:0.084,
       tpllh$A1$Y = 0.062:0.062:0.062,
       tphhl$A1$Y = 0.081:0.081:0.081,
       tpllh$B0$Y = 0.048:0.056:0.064,
       tphhl$B0$Y = 0.048:0.049:0.049;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.071:0.071:0.071,
       tphhl$A0$Y = 0.089:0.089:0.089,
       tpllh$A1$Y = 0.067:0.067:0.067,
       tphhl$A1$Y = 0.085:0.085:0.085,
       tpllh$B0$Y = 0.052:0.06:0.069,
       tphhl$B0$Y = 0.05:0.051:0.052;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.043:0.043:0.043,
       tphhl$A0$Y = 0.053:0.053:0.053,
       tpllh$A1$Y = 0.039:0.039:0.039,
       tphhl$A1$Y = 0.049:0.049:0.049,
       tpllh$B0$Y = 0.031:0.036:0.041,
       tphhl$B0$Y = 0.03:0.031:0.031;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.046:0.052:0.058,
       tphhl$A0$Y = 0.067:0.068:0.07,
       tpllh$A1$Y = 0.043:0.048:0.054,
       tphhl$A1$Y = 0.063:0.064:0.066,
       tpllh$B0$Y = 0.041:0.048:0.054,
       tphhl$B0$Y = 0.058:0.06:0.061,
       tpllh$B1$Y = 0.037:0.043:0.049,
       tphhl$B1$Y = 0.053:0.055:0.056;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.059:0.067:0.075,
       tphhl$A0$Y = 0.089:0.091:0.092,
       tpllh$A1$Y = 0.055:0.063:0.071,
       tphhl$A1$Y = 0.085:0.087:0.088,
       tpllh$B0$Y = 0.054:0.062:0.071,
       tphhl$B0$Y = 0.081:0.082:0.084,
       tpllh$B1$Y = 0.05:0.058:0.066,
       tphhl$B1$Y = 0.076:0.077:0.079;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.062:0.07:0.079,
       tphhl$A0$Y = 0.092:0.093:0.095,
       tpllh$A1$Y = 0.058:0.066:0.074,
       tphhl$A1$Y = 0.088:0.089:0.091,
       tpllh$B0$Y = 0.057:0.066:0.075,
       tphhl$B0$Y = 0.084:0.086:0.087,
       tpllh$B1$Y = 0.053:0.062:0.07,
       tphhl$B1$Y = 0.08:0.081:0.083;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.041:0.046:0.051,
       tphhl$A0$Y = 0.057:0.059:0.06,
       tpllh$A1$Y = 0.038:0.043:0.047,
       tphhl$A1$Y = 0.053:0.055:0.056,
       tpllh$B0$Y = 0.036:0.042:0.048,
       tphhl$B0$Y = 0.049:0.05:0.052,
       tpllh$B1$Y = 0.033:0.038:0.043,
       tphhl$B1$Y = 0.044:0.046:0.047;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211X1 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.034:0.034:0.034,
       tphlh$A0$Y = 0.038:0.038:0.038,
       tplhl$A1$Y = 0.028:0.028:0.028,
       tphlh$A1$Y = 0.035:0.035:0.035,
       tplhl$B0$Y = 0.021:0.026:0.031,
       tphlh$B0$Y = 0.019:0.019:0.02,
       tplhl$C0$Y = 0.019:0.024:0.028,
       tphlh$C0$Y = 0.017:0.017:0.018;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211X2 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.033:0.033:0.033,
       tphlh$A0$Y = 0.038:0.038:0.038,
       tplhl$A1$Y = 0.028:0.028:0.028,
       tphlh$A1$Y = 0.034:0.034:0.034,
       tplhl$B0$Y = 0.022:0.027:0.032,
       tphlh$B0$Y = 0.019:0.02:0.02,
       tplhl$C0$Y = 0.019:0.023:0.027,
       tphlh$C0$Y = 0.016:0.017:0.017;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211X4 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.034:0.034:0.034,
       tphlh$A0$Y = 0.039:0.039:0.039,
       tplhl$A1$Y = 0.029:0.029:0.029,
       tphlh$A1$Y = 0.034:0.034:0.034,
       tplhl$B0$Y = 0.022:0.027:0.032,
       tphlh$B0$Y = 0.019:0.02:0.02,
       tplhl$C0$Y = 0.019:0.023:0.027,
       tphlh$C0$Y = 0.016:0.017:0.017;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211XL (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.034:0.034:0.034,
       tphlh$A0$Y = 0.04:0.04:0.04,
       tplhl$A1$Y = 0.029:0.029:0.029,
       tphlh$A1$Y = 0.036:0.036:0.036,
       tplhl$B0$Y = 0.021:0.026:0.031,
       tphlh$B0$Y = 0.019:0.02:0.02,
       tplhl$C0$Y = 0.02:0.024:0.028,
       tphlh$C0$Y = 0.017:0.018:0.018;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.021:0.021:0.021,
       tphlh$A0$Y = 0.032:0.032:0.032,
       tplhl$A1$Y = 0.018:0.018:0.018,
       tphlh$A1$Y = 0.028:0.028:0.028,
       tplhl$B0$Y = 0.013:0.016:0.019,
       tphlh$B0$Y = 0.015:0.015:0.016;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.021:0.021:0.021,
       tphlh$A0$Y = 0.032:0.032:0.032,
       tplhl$A1$Y = 0.018:0.018:0.018,
       tphlh$A1$Y = 0.027:0.027:0.027,
       tplhl$B0$Y = 0.012:0.015:0.018,
       tphlh$B0$Y = 0.014:0.015:0.015;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.021:0.021:0.021,
       tphlh$A0$Y = 0.032:0.032:0.032,
       tplhl$A1$Y = 0.018:0.018:0.018,
       tphlh$A1$Y = 0.027:0.027:0.027,
       tplhl$B0$Y = 0.012:0.015:0.019,
       tphlh$B0$Y = 0.014:0.015:0.015;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.022:0.022:0.022,
       tphlh$A0$Y = 0.034:0.034:0.034,
       tplhl$A1$Y = 0.019:0.019:0.019,
       tphlh$A1$Y = 0.03:0.03:0.03,
       tplhl$B0$Y = 0.013:0.016:0.019,
       tphlh$B0$Y = 0.015:0.016:0.016;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221X1 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.033:0.038:0.043,
       tphlh$A0$Y = 0.042:0.043:0.045,
       tplhl$A1$Y = 0.029:0.034:0.038,
       tphlh$A1$Y = 0.039:0.04:0.041,
       tplhl$B0$Y = 0.029:0.035:0.04,
       tphlh$B0$Y = 0.037:0.038:0.039,
       tplhl$B1$Y = 0.025:0.03:0.035,
       tphlh$B1$Y = 0.033:0.034:0.035,
       tplhl$C0$Y = 0.017:0.026:0.035,
       tphlh$C0$Y = 0.017:0.018:0.019;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221X2 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.032:0.037:0.042,
       tphlh$A0$Y = 0.041:0.042:0.043,
       tplhl$A1$Y = 0.028:0.032:0.037,
       tphlh$A1$Y = 0.037:0.038:0.039,
       tplhl$B0$Y = 0.028:0.033:0.039,
       tphlh$B0$Y = 0.035:0.036:0.037,
       tplhl$B1$Y = 0.023:0.028:0.033,
       tphlh$B1$Y = 0.031:0.032:0.033,
       tplhl$C0$Y = 0.016:0.024:0.033,
       tphlh$C0$Y = 0.016:0.017:0.018;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221X4 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.033:0.037:0.042,
       tphlh$A0$Y = 0.041:0.042:0.043,
       tplhl$A1$Y = 0.028:0.032:0.037,
       tphlh$A1$Y = 0.037:0.038:0.039,
       tplhl$B0$Y = 0.028:0.033:0.039,
       tphlh$B0$Y = 0.035:0.036:0.037,
       tplhl$B1$Y = 0.023:0.028:0.033,
       tphlh$B1$Y = 0.031:0.032:0.033,
       tplhl$C0$Y = 0.016:0.024:0.033,
       tphlh$C0$Y = 0.016:0.017:0.018;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221XL (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.034:0.039:0.044,
       tphlh$A0$Y = 0.045:0.046:0.047,
       tplhl$A1$Y = 0.03:0.035:0.04,
       tphlh$A1$Y = 0.041:0.042:0.044,
       tplhl$B0$Y = 0.03:0.035:0.041,
       tphlh$B0$Y = 0.039:0.04:0.041,
       tplhl$B1$Y = 0.026:0.031:0.036,
       tphlh$B1$Y = 0.035:0.036:0.037,
       tplhl$C0$Y = 0.017:0.026:0.035,
       tphlh$C0$Y = 0.018:0.019:0.02;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222X1 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, C0, C1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.032:0.042:0.053,
       tphlh$A0$Y = 0.045:0.048:0.052,
       tplhl$A1$Y = 0.028:0.038:0.048,
       tphlh$A1$Y = 0.042:0.045:0.048,
       tplhl$B0$Y = 0.028:0.039:0.05,
       tphlh$B0$Y = 0.041:0.043:0.045,
       tplhl$B1$Y = 0.024:0.034:0.044,
       tphlh$B1$Y = 0.036:0.039:0.041,
       tplhl$C0$Y = 0.021:0.031:0.041,
       tphlh$C0$Y = 0.031:0.033:0.035,
       tplhl$C1$Y = 0.019:0.028:0.037,
       tphlh$C1$Y = 0.028:0.03:0.032;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222X2 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, C0, C1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.031:0.041:0.052,
       tphlh$A0$Y = 0.044:0.047:0.051,
       tplhl$A1$Y = 0.027:0.037:0.047,
       tphlh$A1$Y = 0.04:0.043:0.046,
       tplhl$B0$Y = 0.027:0.038:0.049,
       tphlh$B0$Y = 0.039:0.041:0.043,
       tplhl$B1$Y = 0.023:0.033:0.043,
       tphlh$B1$Y = 0.035:0.037:0.039,
       tplhl$C0$Y = 0.021:0.031:0.041,
       tphlh$C0$Y = 0.03:0.032:0.034,
       tplhl$C1$Y = 0.018:0.027:0.036,
       tphlh$C1$Y = 0.026:0.028:0.03;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222X4 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, C0, C1);
   or  (I1_out, A0, A1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.031:0.041:0.052,
       tphlh$A0$Y = 0.044:0.047:0.05,
       tplhl$A1$Y = 0.027:0.037:0.047,
       tphlh$A1$Y = 0.04:0.043:0.046,
       tplhl$B0$Y = 0.027:0.038:0.049,
       tphlh$B0$Y = 0.039:0.041:0.044,
       tplhl$B1$Y = 0.023:0.033:0.043,
       tphlh$B1$Y = 0.034:0.037:0.039,
       tplhl$C0$Y = 0.021:0.031:0.041,
       tphlh$C0$Y = 0.03:0.032:0.034,
       tplhl$C1$Y = 0.018:0.027:0.036,
       tphlh$C1$Y = 0.026:0.028:0.03;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222XL (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, C0, C1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.033:0.044:0.055,
       tphlh$A0$Y = 0.05:0.053:0.056,
       tplhl$A1$Y = 0.03:0.04:0.051,
       tphlh$A1$Y = 0.046:0.049:0.053,
       tplhl$B0$Y = 0.03:0.041:0.052,
       tphlh$B0$Y = 0.045:0.047:0.049,
       tplhl$B1$Y = 0.026:0.036:0.047,
       tphlh$B1$Y = 0.04:0.043:0.045,
       tplhl$C0$Y = 0.022:0.032:0.042,
       tphlh$C0$Y = 0.034:0.036:0.038,
       tplhl$C1$Y = 0.02:0.029:0.038,
       tphlh$C1$Y = 0.031:0.033:0.035;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.02:0.024:0.028,
       tphlh$A0$Y = 0.035:0.036:0.038,
       tplhl$A1$Y = 0.018:0.021:0.024,
       tphlh$A1$Y = 0.031:0.032:0.034,
       tplhl$B0$Y = 0.016:0.02:0.023,
       tphlh$B0$Y = 0.026:0.027:0.028,
       tplhl$B1$Y = 0.014:0.017:0.02,
       tphlh$B1$Y = 0.022:0.023:0.024;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.02:0.024:0.028,
       tphlh$A0$Y = 0.035:0.036:0.038,
       tplhl$A1$Y = 0.018:0.021:0.024,
       tphlh$A1$Y = 0.03:0.032:0.033,
       tplhl$B0$Y = 0.016:0.02:0.023,
       tphlh$B0$Y = 0.027:0.028:0.029,
       tplhl$B1$Y = 0.014:0.017:0.02,
       tphlh$B1$Y = 0.023:0.023:0.024;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.02:0.024:0.027,
       tphlh$A0$Y = 0.035:0.036:0.038,
       tplhl$A1$Y = 0.018:0.021:0.024,
       tphlh$A1$Y = 0.03:0.032:0.033,
       tplhl$B0$Y = 0.016:0.02:0.024,
       tphlh$B0$Y = 0.027:0.028:0.029,
       tplhl$B1$Y = 0.014:0.017:0.02,
       tphlh$B1$Y = 0.023:0.024:0.025;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.021:0.025:0.028,
       tphlh$A0$Y = 0.037:0.038:0.04,
       tplhl$A1$Y = 0.019:0.022:0.025,
       tphlh$A1$Y = 0.033:0.035:0.037,
       tplhl$B0$Y = 0.016:0.02:0.024,
       tphlh$B0$Y = 0.028:0.029:0.029,
       tplhl$B1$Y = 0.014:0.017:0.021,
       tphlh$B1$Y = 0.024:0.025:0.026;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1X1 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.047:0.047:0.047,
       tphhl$A0N$Y = 0.045:0.045:0.045,
       tpllh$A1N$Y = 0.046:0.046:0.046,
       tphhl$A1N$Y = 0.042:0.042:0.042,
       tplhl$B0$Y = 0.016:0.016:0.016,
       tphlh$B0$Y = 0.016:0.016:0.016;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1X2 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.064:0.064:0.064,
       tphhl$A0N$Y = 0.057:0.057:0.057,
       tpllh$A1N$Y = 0.062:0.062:0.062,
       tphhl$A1N$Y = 0.055:0.055:0.055,
       tplhl$B0$Y = 0.016:0.016:0.016,
       tphlh$B0$Y = 0.016:0.016:0.016;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1X4 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.069:0.069:0.069,
       tphhl$A0N$Y = 0.06:0.06:0.06,
       tpllh$A1N$Y = 0.067:0.067:0.067,
       tphhl$A1N$Y = 0.058:0.058:0.058,
       tplhl$B0$Y = 0.017:0.017:0.017,
       tphlh$B0$Y = 0.016:0.016:0.016;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1XL (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.04:0.04:0.04,
       tphhl$A0N$Y = 0.039:0.039:0.039,
       tpllh$A1N$Y = 0.039:0.039:0.039,
       tphhl$A1N$Y = 0.037:0.037:0.037,
       tplhl$B0$Y = 0.017:0.017:0.017,
       tphlh$B0$Y = 0.017:0.017:0.017;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2X1 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.054:0.056:0.058,
       tphhl$A0N$Y = 0.047:0.051:0.054,
       tpllh$A1N$Y = 0.052:0.054:0.055,
       tphhl$A1N$Y = 0.048:0.051:0.055,
       tplhl$B0$Y = 0.016:0.02:0.023,
       tphlh$B0$Y = 0.027:0.028:0.028,
       tplhl$B1$Y = 0.014:0.017:0.02,
       tphlh$B1$Y = 0.023:0.024:0.024;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2X2 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.067:0.068:0.07,
       tphhl$A0N$Y = 0.063:0.066:0.07,
       tpllh$A1N$Y = 0.061:0.062:0.064,
       tphhl$A1N$Y = 0.061:0.064:0.068,
       tplhl$B0$Y = 0.016:0.02:0.023,
       tphlh$B0$Y = 0.027:0.028:0.028,
       tplhl$B1$Y = 0.014:0.017:0.019,
       tphlh$B1$Y = 0.023:0.023:0.024;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2X4 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.072:0.073:0.075,
       tphhl$A0N$Y = 0.067:0.07:0.074,
       tpllh$A1N$Y = 0.063:0.065:0.066,
       tphhl$A1N$Y = 0.062:0.066:0.069,
       tplhl$B0$Y = 0.016:0.02:0.023,
       tphlh$B0$Y = 0.027:0.028:0.028,
       tplhl$B1$Y = 0.014:0.017:0.019,
       tphlh$B1$Y = 0.023:0.024:0.024;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2XL (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.053:0.055:0.057,
       tphhl$A0N$Y = 0.042:0.046:0.05,
       tpllh$A1N$Y = 0.052:0.054:0.056,
       tphhl$A1N$Y = 0.044:0.047:0.05,
       tplhl$B0$Y = 0.016:0.02:0.023,
       tphlh$B0$Y = 0.028:0.028:0.029,
       tplhl$B1$Y = 0.014:0.017:0.02,
       tphlh$B1$Y = 0.024:0.025:0.026;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31X1 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.024:0.024:0.024,
       tphlh$A0$Y = 0.05:0.05:0.05,
       tplhl$A1$Y = 0.023:0.023:0.023,
       tphlh$A1$Y = 0.047:0.047:0.047,
       tplhl$A2$Y = 0.019:0.019:0.019,
       tphlh$A2$Y = 0.039:0.039:0.039,
       tplhl$B0$Y = 0.012:0.016:0.021,
       tphlh$B0$Y = 0.015:0.015:0.016;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31X2 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.024:0.024:0.024,
       tphlh$A0$Y = 0.052:0.052:0.052,
       tplhl$A1$Y = 0.023:0.023:0.023,
       tphlh$A1$Y = 0.048:0.048:0.048,
       tplhl$A2$Y = 0.019:0.019:0.019,
       tphlh$A2$Y = 0.038:0.038:0.038,
       tplhl$B0$Y = 0.012:0.016:0.02,
       tphlh$B0$Y = 0.014:0.015:0.015;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31X4 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.025:0.025:0.025,
       tphlh$A0$Y = 0.052:0.052:0.052,
       tplhl$A1$Y = 0.023:0.023:0.023,
       tphlh$A1$Y = 0.048:0.048:0.048,
       tplhl$A2$Y = 0.019:0.019:0.019,
       tphlh$A2$Y = 0.039:0.039:0.039,
       tplhl$B0$Y = 0.012:0.016:0.021,
       tphlh$B0$Y = 0.015:0.015:0.015;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31XL (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.025:0.025:0.025,
       tphlh$A0$Y = 0.054:0.054:0.054,
       tplhl$A1$Y = 0.023:0.023:0.023,
       tphlh$A1$Y = 0.05:0.05:0.05,
       tplhl$A2$Y = 0.02:0.02:0.02,
       tphlh$A2$Y = 0.042:0.042:0.042,
       tplhl$B0$Y = 0.012:0.016:0.021,
       tphlh$B0$Y = 0.015:0.016:0.016;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32X1 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.022:0.026:0.031,
       tphlh$A0$Y = 0.055:0.058:0.06,
       tplhl$A1$Y = 0.021:0.025:0.029,
       tphlh$A1$Y = 0.052:0.054:0.056,
       tplhl$A2$Y = 0.019:0.022:0.025,
       tphlh$A2$Y = 0.044:0.046:0.048,
       tplhl$B0$Y = 0.015:0.021:0.026,
       tphlh$B0$Y = 0.027:0.028:0.029,
       tplhl$B1$Y = 0.013:0.018:0.023,
       tphlh$B1$Y = 0.023:0.024:0.025;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32X2 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.027:0.031,
       tphlh$A0$Y = 0.057:0.059:0.062,
       tplhl$A1$Y = 0.022:0.025:0.029,
       tphlh$A1$Y = 0.053:0.055:0.057,
       tplhl$A2$Y = 0.019:0.022:0.025,
       tphlh$A2$Y = 0.043:0.045:0.048,
       tplhl$B0$Y = 0.015:0.021:0.026,
       tphlh$B0$Y = 0.027:0.028:0.029,
       tplhl$B1$Y = 0.013:0.018:0.022,
       tphlh$B1$Y = 0.023:0.024:0.025;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32X4 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.027:0.032,
       tphlh$A0$Y = 0.058:0.06:0.062,
       tplhl$A1$Y = 0.022:0.026:0.029,
       tphlh$A1$Y = 0.053:0.055:0.057,
       tplhl$A2$Y = 0.019:0.022:0.026,
       tphlh$A2$Y = 0.044:0.046:0.048,
       tplhl$B0$Y = 0.016:0.021:0.027,
       tphlh$B0$Y = 0.027:0.028:0.029,
       tplhl$B1$Y = 0.013:0.018:0.023,
       tphlh$B1$Y = 0.023:0.024:0.025;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32XL (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.027:0.032,
       tphlh$A0$Y = 0.06:0.062:0.064,
       tplhl$A1$Y = 0.022:0.026:0.03,
       tphlh$A1$Y = 0.056:0.059:0.061,
       tplhl$A2$Y = 0.02:0.023:0.026,
       tphlh$A2$Y = 0.047:0.05:0.052,
       tplhl$B0$Y = 0.015:0.02:0.026,
       tphlh$B0$Y = 0.027:0.028:0.029,
       tplhl$B1$Y = 0.013:0.018:0.022,
       tphlh$B1$Y = 0.023:0.024:0.025;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33X1 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.03:0.036,
       tphlh$A0$Y = 0.06:0.064:0.069,
       tplhl$A1$Y = 0.022:0.028:0.034,
       tphlh$A1$Y = 0.057:0.061:0.066,
       tplhl$A2$Y = 0.02:0.025:0.029,
       tphlh$A2$Y = 0.048:0.052:0.056,
       tplhl$B0$Y = 0.018:0.024:0.031,
       tphlh$B0$Y = 0.045:0.047:0.049,
       tplhl$B1$Y = 0.017:0.023:0.028,
       tphlh$B1$Y = 0.041:0.043:0.045,
       tplhl$B2$Y = 0.014:0.019:0.024,
       tphlh$B2$Y = 0.032:0.034:0.036;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33X2 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.025:0.031:0.038,
       tphlh$A0$Y = 0.066:0.07:0.075,
       tplhl$A1$Y = 0.023:0.029:0.035,
       tphlh$A1$Y = 0.061:0.066:0.07,
       tplhl$A2$Y = 0.021:0.026:0.032,
       tphlh$A2$Y = 0.052:0.057:0.061,
       tplhl$B0$Y = 0.018:0.025:0.032,
       tphlh$B0$Y = 0.048:0.05:0.052,
       tplhl$B1$Y = 0.017:0.023:0.029,
       tphlh$B1$Y = 0.044:0.046:0.048,
       tplhl$B2$Y = 0.015:0.021:0.026,
       tphlh$B2$Y = 0.036:0.038:0.04;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33X4 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.023:0.03:0.038,
       tphlh$A0$Y = 0.062:0.066:0.07,
       tplhl$A1$Y = 0.022:0.029:0.035,
       tphlh$A1$Y = 0.057:0.062:0.066,
       tplhl$A2$Y = 0.02:0.025:0.03,
       tphlh$A2$Y = 0.047:0.052:0.056,
       tplhl$B0$Y = 0.017:0.025:0.032,
       tphlh$B0$Y = 0.047:0.048:0.05,
       tplhl$B1$Y = 0.017:0.023:0.029,
       tphlh$B1$Y = 0.042:0.044:0.045,
       tplhl$B2$Y = 0.014:0.019:0.024,
       tphlh$B2$Y = 0.032:0.033:0.035;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33XL (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.024:0.031:0.037,
       tphlh$A0$Y = 0.065:0.069:0.074,
       tplhl$A1$Y = 0.023:0.029:0.035,
       tphlh$A1$Y = 0.062:0.067:0.071,
       tplhl$A2$Y = 0.021:0.026:0.031,
       tphlh$A2$Y = 0.053:0.057:0.061,
       tplhl$B0$Y = 0.018:0.025:0.032,
       tphlh$B0$Y = 0.049:0.051:0.052,
       tplhl$B1$Y = 0.017:0.023:0.029,
       tphlh$B1$Y = 0.045:0.047:0.048,
       tplhl$B2$Y = 0.015:0.02:0.025,
       tphlh$B2$Y = 0.035:0.037:0.039;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.033:0.033:0.033,
       tphhl$A$Y = 0.056:0.056:0.056,
       tpllh$B$Y = 0.031:0.031:0.031,
       tphhl$B$Y = 0.051:0.051:0.051;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.043:0.043:0.043,
       tphhl$A$Y = 0.078:0.078:0.078,
       tpllh$B$Y = 0.04:0.04:0.04,
       tphhl$B$Y = 0.073:0.073:0.073;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.045:0.045:0.045,
       tphhl$A$Y = 0.081:0.081:0.081,
       tpllh$B$Y = 0.042:0.042:0.042,
       tphhl$B$Y = 0.077:0.077:0.077;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.039:0.039:0.039,
       tphhl$A$Y = 0.068:0.068:0.068,
       tpllh$B$Y = 0.037:0.037:0.037,
       tphhl$B$Y = 0.063:0.063:0.063;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.044:0.044:0.044,
       tphhl$A$Y = 0.08:0.08:0.08,
       tpllh$B$Y = 0.042:0.042:0.042,
       tphhl$B$Y = 0.076:0.076:0.076;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.029:0.029:0.029,
       tphhl$A$Y = 0.045:0.045:0.045,
       tpllh$B$Y = 0.027:0.027:0.027,
       tphhl$B$Y = 0.041:0.041:0.041;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.037:0.037:0.037,
       tphhl$A$Y = 0.086:0.086:0.086,
       tpllh$B$Y = 0.036:0.036:0.036,
       tphhl$B$Y = 0.082:0.082:0.082,
       tpllh$C$Y = 0.033:0.033:0.033,
       tphhl$C$Y = 0.072:0.072:0.072;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.047:0.047:0.047,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.045:0.045:0.045,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.042:0.042:0.042,
       tphhl$C$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.048:0.048:0.048,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.046:0.046:0.046,
       tphhl$B$Y = 0.12:0.12:0.12,
       tpllh$C$Y = 0.044:0.044:0.044,
       tphhl$C$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.042:0.042:0.042,
       tphhl$A$Y = 0.1:0.1:0.1,
       tpllh$B$Y = 0.04:0.04:0.04,
       tphhl$B$Y = 0.096:0.096:0.096,
       tpllh$C$Y = 0.037:0.037:0.037,
       tphhl$C$Y = 0.086:0.086:0.086;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.048:0.048:0.048,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.046:0.046:0.046,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.043:0.043:0.043,
       tphhl$C$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.033:0.033:0.033,
       tphhl$A$Y = 0.07:0.07:0.07,
       tpllh$B$Y = 0.031:0.031:0.031,
       tphhl$B$Y = 0.066:0.066:0.066,
       tpllh$C$Y = 0.029:0.029:0.029,
       tphhl$C$Y = 0.056:0.056:0.056;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.038:0.038:0.038,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.037:0.037:0.037,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.036:0.036:0.036,
       tphhl$C$Y = 0.1:0.1:0.1,
       tpllh$D$Y = 0.033:0.033:0.033,
       tphhl$D$Y = 0.087:0.087:0.087;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.048:0.048:0.048,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpllh$B$Y = 0.047:0.047:0.047,
       tphhl$B$Y = 0.15:0.15:0.15,
       tpllh$C$Y = 0.045:0.045:0.045,
       tphhl$C$Y = 0.14:0.14:0.14,
       tpllh$D$Y = 0.042:0.042:0.042,
       tphhl$D$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.05:0.05:0.05,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpllh$B$Y = 0.049:0.049:0.049,
       tphhl$B$Y = 0.16:0.16:0.16,
       tpllh$C$Y = 0.047:0.047:0.047,
       tphhl$C$Y = 0.15:0.15:0.15,
       tpllh$D$Y = 0.044:0.044:0.044,
       tphhl$D$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.044:0.044:0.044,
       tphhl$A$Y = 0.14:0.14:0.14,
       tpllh$B$Y = 0.043:0.043:0.043,
       tphhl$B$Y = 0.13:0.13:0.13,
       tpllh$C$Y = 0.041:0.041:0.041,
       tphhl$C$Y = 0.12:0.12:0.12,
       tpllh$D$Y = 0.038:0.038:0.038,
       tphhl$D$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.05:0.05:0.05,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpllh$B$Y = 0.048:0.048:0.048,
       tphhl$B$Y = 0.16:0.16:0.16,
       tpllh$C$Y = 0.047:0.047:0.047,
       tphhl$C$Y = 0.15:0.15:0.15,
       tpllh$D$Y = 0.044:0.044:0.044,
       tphhl$D$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.035:0.035:0.035,
       tphhl$A$Y = 0.098:0.098:0.098,
       tpllh$B$Y = 0.034:0.034:0.034,
       tphhl$B$Y = 0.094:0.094:0.094,
       tpllh$C$Y = 0.032:0.032:0.032,
       tphhl$C$Y = 0.084:0.084:0.084,
       tpllh$D$Y = 0.03:0.03:0.03,
       tphhl$D$Y = 0.069:0.069:0.069;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX1 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.071:0.14:0.14,
       tminpwl$CK = 0.081:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX2 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.07:0.15:0.15,
       tminpwl$CK = 0.08:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX4 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_15, N30_6);
   not (Q, QBINT_15);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.082:0.15:0.15,
       tminpwl$CK = 0.082:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX8 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_11, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_11);
   not (Q, QBINT_30);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tminpwh$CK = 0.1:0.17:0.17,
       tminpwl$CK = 0.082:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRX1 (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_2, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.15:0.15:0.15,
       tphhl$CKN$Q = 0.12:0.12:0.12,
       tphlh$CKN$QN = 0.15:0.15:0.15,
       tphhl$CKN$QN = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.16:0.16:0.17,
       tphlh$RN$QN = 0.19:0.19:0.2,
       tplhl$SN$Q = 0.13:0.14:0.14,
       tphlh$SN$Q = 0.12:0.12:0.13,
       tpllh$SN$QN = 0.16:0.16:0.17,
       tphhl$SN$QN = 0.14:0.15:0.15,
       tminpwh$CKN = 0.057:0.13:0.13,
       tminpwl$CKN = 0.06:0.17:0.17,
       tminpwl$RN = 0.065:0.2:0.2,
       tminpwl$SN = 0.03:0.15:0.15,
       tsetup_negedge$D$CKN = 0.19:0.19:0.19,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_negedge$SE$CKN = 0.19:0.19:0.19,
       thold_negedge$SE$CKN = 0:0:0,
       tsetup_negedge$SI$CKN = 0.19:0.19:0.19,
       thold_negedge$SI$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.19:0.19:0.19,
       thold_posedge$D$CKN = 0:0:0,
       tsetup_posedge$SE$CKN = 0.094:0.19:0.19,
       thold_posedge$SE$CKN = 0:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.19:0.19:0.19,
       thold_posedge$SI$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRX2 (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_4, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_6, N35_4);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.16:0.16:0.16,
       tphhl$CKN$Q = 0.13:0.13:0.13,
       tphlh$CKN$QN = 0.18:0.18:0.18,
       tphhl$CKN$QN = 0.2:0.2:0.2,
       tphhl$RN$Q = 0.16:0.17:0.18,
       tphlh$RN$QN = 0.2:0.21:0.22,
       tplhl$SN$Q = 0.13:0.14:0.15,
       tphlh$SN$Q = 0.12:0.13:0.13,
       tpllh$SN$QN = 0.18:0.19:0.19,
       tphhl$SN$QN = 0.17:0.17:0.17,
       tminpwh$CKN = 0.06:0.13:0.13,
       tminpwl$CKN = 0.065:0.2:0.2,
       tminpwl$RN = 0.065:0.22:0.22,
       tminpwl$SN = 0.031:0.17:0.17,
       tsetup_negedge$D$CKN = 0.19:0.19:0.19,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_negedge$SE$CKN = 0.19:0.19:0.19,
       thold_negedge$SE$CKN = 0:0:0,
       tsetup_negedge$SI$CKN = 0.19:0.19:0.19,
       thold_negedge$SI$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.19:0.19:0.19,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       tsetup_posedge$SE$CKN = 0.094:0.19:0.19,
       thold_posedge$SE$CKN = 0:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.19:0.19:0.19,
       thold_posedge$SI$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRX4 (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_12, N35_3);
   not (Q, QBINT_12);
   buf (QN, QBINT_12);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.17:0.17:0.17,
       tphhl$CKN$Q = 0.16:0.16:0.16,
       tphlh$CKN$QN = 0.21:0.21:0.21,
       tphhl$CKN$QN = 0.22:0.22:0.22,
       tphhl$RN$Q = 0.18:0.19:0.2,
       tphlh$RN$QN = 0.23:0.24:0.24,
       tplhl$SN$Q = 0.15:0.16:0.16,
       tphlh$SN$Q = 0.14:0.14:0.15,
       tpllh$SN$QN = 0.2:0.21:0.21,
       tphhl$SN$QN = 0.19:0.19:0.19,
       tminpwh$CKN = 0.07:0.14:0.14,
       tminpwl$CKN = 0.091:0.22:0.22,
       tminpwl$RN = 0.069:0.24:0.24,
       tminpwl$SN = 0.033:0.19:0.19,
       tsetup_negedge$D$CKN = 0.19:0.19:0.19,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_negedge$SE$CKN = 0.19:0.19:0.19,
       thold_negedge$SE$CKN = 0:0:0,
       tsetup_negedge$SI$CKN = 0.19:0.19:0.19,
       thold_negedge$SI$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.094:0.094:0.094,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       tsetup_posedge$SE$CKN = 0.094:0.19:0.19,
       thold_posedge$SE$CKN = 0:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.094:0.094:0.094,
       thold_posedge$SI$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRXL (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_3);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.14:0.14:0.14,
       tphhl$CKN$Q = 0.12:0.12:0.12,
       tphlh$CKN$QN = 0.15:0.15:0.15,
       tphhl$CKN$QN = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.15:0.16:0.16,
       tphlh$RN$QN = 0.17:0.18:0.18,
       tplhl$SN$Q = 0.12:0.13:0.13,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tpllh$SN$QN = 0.14:0.15:0.15,
       tphhl$SN$QN = 0.13:0.13:0.14,
       tminpwh$CKN = 0.059:0.13:0.13,
       tminpwl$CKN = 0.066:0.16:0.16,
       tminpwl$RN = 0.064:0.18:0.18,
       tminpwl$SN = 0.03:0.14:0.14,
       tsetup_negedge$D$CKN = 0.19:0.19:0.19,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_negedge$SE$CKN = 0.19:0.19:0.19,
       thold_negedge$SE$CKN = 0:0:0,
       tsetup_negedge$SI$CKN = 0.19:0.19:0.19,
       thold_negedge$SI$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.094:0.094:0.094,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       tsetup_posedge$SE$CKN = 0.094:0.19:0.19,
       thold_posedge$SE$CKN = 0:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.094:0.094:0.094,
       thold_posedge$SI$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.094:0.094:0.094,
       trem$RN$CKN = 0:0:0,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CKN = 0.094:0.094:0.094,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQX1 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tminpwh$CK = 0.066:0.13:0.13,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQX2 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.07:0.14:0.14,
       tminpwl$CK = 0.075:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQX4 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_6);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.086:0.15:0.15,
       tminpwl$CK = 0.079:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQXL (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30_2);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tminpwh$CK = 0.065:0.13:0.13,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX1 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_3, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tphhl$RN$Q = 0.041:0.041:0.042,
       tminpwh$CK = 0.075:0.14:0.14,
       tminpwl$CK = 0.084:0.13:0.13,
       tminpwl$RN = 0.03:0.093:0.093,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX2 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_3, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tphhl$RN$Q = 0.049:0.05:0.05,
       tminpwh$CK = 0.074:0.15:0.15,
       tminpwl$CK = 0.083:0.13:0.13,
       tminpwl$RN = 0.039:0.094:0.094,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX4 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_4, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_24, N30_4);
   not (Q, QBINT_24);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.044:0.044:0.044,
       tminpwh$CK = 0.086:0.16:0.16,
       tminpwl$CK = 0.085:0.14:0.14,
       tminpwl$RN = 0.033:0.1:0.1,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX8 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_11, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_38, N30_11);
   not (Q, QBINT_38);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.18:0.18:0.18,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.044:0.044:0.044,
       tminpwh$CK = 0.1:0.18:0.18,
       tminpwl$CK = 0.083:0.13:0.13,
       tminpwl$RN = 0.032:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRX1 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_2, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.054:0.054:0.055,
       tphlh$RN$QN = 0.082:0.082:0.083,
       tminpwh$CK = 0.071:0.17:0.17,
       tminpwl$CK = 0.079:0.12:0.12,
       tminpwl$RN = 0.042:0.096:0.096,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRX2 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT, N30);
   not (Q, QBINT);
   buf (QN, QBINT);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.2:0.2:0.2,
       tphhl$RN$Q = 0.053:0.053:0.053,
       tphlh$RN$QN = 0.098:0.098:0.099,
       tminpwh$CK = 0.074:0.2:0.2,
       tminpwl$CK = 0.079:0.12:0.12,
       tminpwl$RN = 0.042:0.099:0.099,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRX4 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_2, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_19, N30_2);
   not (Q, QBINT_19);
   buf (QN, QBINT_19);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.22:0.22:0.22,
       tphhl$RN$Q = 0.049:0.049:0.049,
       tphlh$RN$QN = 0.096:0.097:0.097,
       tminpwh$CK = 0.086:0.22:0.22,
       tminpwl$CK = 0.076:0.12:0.12,
       tminpwl$RN = 0.038:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRXL (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_2, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.049:0.05:0.05,
       tphlh$RN$QN = 0.069:0.069:0.07,
       tminpwh$CK = 0.07:0.16:0.16,
       tminpwl$CK = 0.078:0.12:0.12,
       tminpwl$RN = 0.038:0.096:0.096,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX1 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_3, N35);
   not (Q, QBINT_3);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tphlh$SN$Q = 0.093:0.093:0.093,
       tminpwh$CK = 0.073:0.15:0.15,
       tminpwl$CK = 0.082:0.14:0.14,
       tminpwl$SN = 0.024:0.093:0.093,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX2 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tphlh$SN$Q = 0.1:0.1:0.1,
       tminpwh$CK = 0.073:0.16:0.16,
       tminpwl$CK = 0.083:0.14:0.14,
       tminpwl$SN = 0.024:0.1:0.1,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX4 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_4, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_6, N35_4);
   not (Q, QBINT_6);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tphlh$SN$Q = 0.11:0.11:0.11,
       tminpwh$CK = 0.086:0.16:0.16,
       tminpwl$CK = 0.084:0.14:0.14,
       tminpwl$SN = 0.024:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX8 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_6, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_26, N35_6);
   not (Q, QBINT_26);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.18:0.18:0.18,
       tphlh$SN$Q = 0.13:0.13:0.14,
       tminpwh$CK = 0.1:0.18:0.18,
       tminpwl$CK = 0.084:0.14:0.14,
       tminpwl$SN = 0.024:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX1 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT, N35_3);
   not (Q, QBINT);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.15:0.15:0.16,
       tplhl$SN$Q = 0.12:0.12:0.12,
       tphlh$SN$Q = 0.1:0.11:0.11,
       tminpwh$CK = 0.087:0.16:0.16,
       tminpwl$CK = 0.086:0.15:0.15,
       tminpwl$RN = 0.069:0.16:0.16,
       tminpwl$SN = 0.029:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX2 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.16:0.16:0.17,
       tplhl$SN$Q = 0.13:0.13:0.13,
       tphlh$SN$Q = 0.11:0.12:0.12,
       tminpwh$CK = 0.087:0.17:0.17,
       tminpwl$CK = 0.086:0.15:0.15,
       tminpwl$RN = 0.07:0.17:0.17,
       tminpwl$SN = 0.029:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX4 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_10, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_18, N35_10);
   not (Q, QBINT_18);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.17:0.17:0.18,
       tplhl$SN$Q = 0.14:0.14:0.14,
       tphlh$SN$Q = 0.12:0.13:0.13,
       tminpwh$CK = 0.098:0.17:0.17,
       tminpwl$CK = 0.085:0.15:0.15,
       tminpwl$RN = 0.07:0.18:0.18,
       tminpwl$SN = 0.029:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX8 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_12, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_28, N35_12);
   not (Q, QBINT_28);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.18:0.18:0.18,
       tplhl$CK$Q = 0.19:0.19:0.19,
       tphhl$RN$Q = 0.19:0.2:0.2,
       tplhl$SN$Q = 0.17:0.17:0.17,
       tphlh$SN$Q = 0.14:0.15:0.16,
       tminpwh$CK = 0.12:0.19:0.19,
       tminpwl$CK = 0.086:0.15:0.15,
       tminpwl$RN = 0.07:0.2:0.2,
       tminpwl$SN = 0.029:0.16:0.16,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.19:0.19,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRX1 (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_3);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.16:0.16:0.17,
       tphlh$RN$QN = 0.19:0.19:0.2,
       tplhl$SN$Q = 0.13:0.14:0.14,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tpllh$SN$QN = 0.16:0.16:0.17,
       tphhl$SN$QN = 0.14:0.15:0.15,
       tminpwh$CK = 0.076:0.18:0.18,
       tminpwl$CK = 0.077:0.14:0.14,
       tminpwl$RN = 0.064:0.2:0.2,
       tminpwl$SN = 0.03:0.15:0.15,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRX2 (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_5, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT, N35_5);
   not (Q, QBINT);
   buf (QN, QBINT);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.21:0.21:0.21,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tphhl$RN$Q = 0.17:0.18:0.18,
       tphlh$RN$QN = 0.21:0.22:0.23,
       tplhl$SN$Q = 0.14:0.14:0.15,
       tphlh$SN$Q = 0.13:0.13:0.13,
       tpllh$SN$QN = 0.18:0.19:0.19,
       tphhl$SN$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.086:0.21:0.21,
       tminpwl$CK = 0.078:0.15:0.15,
       tminpwl$RN = 0.068:0.23:0.23,
       tminpwl$SN = 0.031:0.17:0.17,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRX4 (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_12, N35_3);
   not (Q, QBINT_12);
   buf (QN, QBINT_12);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.18:0.18:0.18,
       tpllh$CK$QN = 0.23:0.23:0.23,
       tplhl$CK$QN = 0.2:0.2:0.2,
       tphhl$RN$Q = 0.18:0.19:0.2,
       tphlh$RN$QN = 0.23:0.24:0.24,
       tplhl$SN$Q = 0.15:0.16:0.16,
       tphlh$SN$Q = 0.14:0.14:0.15,
       tpllh$SN$QN = 0.2:0.21:0.21,
       tphhl$SN$QN = 0.19:0.19:0.19,
       tminpwh$CK = 0.094:0.23:0.23,
       tminpwl$CK = 0.086:0.15:0.15,
       tminpwl$RN = 0.07:0.24:0.24,
       tminpwl$SN = 0.033:0.19:0.19,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.19:0.19:0.19,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRXL (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_6, N35_3);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tphhl$RN$Q = 0.15:0.15:0.16,
       tphlh$RN$QN = 0.17:0.17:0.18,
       tplhl$SN$Q = 0.13:0.13:0.13,
       tphlh$SN$Q = 0.11:0.12:0.12,
       tpllh$SN$QN = 0.14:0.15:0.15,
       tphhl$SN$QN = 0.13:0.13:0.14,
       tminpwh$CK = 0.075:0.16:0.16,
       tminpwl$CK = 0.077:0.14:0.14,
       tminpwl$RN = 0.064:0.18:0.18,
       tminpwl$SN = 0.03:0.14:0.14,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.095:0.095:0.095,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.094:0.094:0.094,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSX1 (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tphlh$SN$Q = 0.11:0.11:0.11,
       tphhl$SN$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.067:0.18:0.18,
       tminpwl$CK = 0.077:0.13:0.13,
       tminpwl$SN = 0.026:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSX2 (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_9, N35_3);
   not (Q, QBINT_9);
   buf (QN, QBINT_9);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tphlh$SN$Q = 0.11:0.11:0.11,
       tphhl$SN$QN = 0.15:0.15:0.16,
       tminpwh$CK = 0.072:0.2:0.2,
       tminpwl$CK = 0.08:0.14:0.14,
       tminpwl$SN = 0.026:0.16:0.16,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSX4 (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_4, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_9, N35_4);
   not (Q, QBINT_9);
   buf (QN, QBINT_9);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tpllh$CK$QN = 0.22:0.22:0.22,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tphlh$SN$Q = 0.13:0.13:0.14,
       tphhl$SN$QN = 0.17:0.18:0.18,
       tminpwh$CK = 0.09:0.22:0.22,
       tminpwl$CK = 0.077:0.14:0.14,
       tminpwl$SN = 0.027:0.18:0.18,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSXL (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_6, N35);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tphlh$SN$Q = 0.1:0.1:0.11,
       tphhl$SN$QN = 0.12:0.12:0.12,
       tminpwh$CK = 0.067:0.17:0.17,
       tminpwl$CK = 0.077:0.13:0.13,
       tminpwl$SN = 0.026:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRX1 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.065:0.17:0.17,
       tminpwl$CK = 0.073:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRX2 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30_2);
   not (Q, QBINT_2);
   buf (QN, QBINT_2);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.069:0.19:0.19,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRX4 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30);
   not (Q, QBINT_17);
   buf (QN, QBINT_17);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.18:0.18:0.18,
       tminpwh$CK = 0.081:0.2:0.2,
       tminpwl$CK = 0.071:0.11:0.11,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRXL (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tpllh$CK$QN = 0.15:0.15:0.15,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.065:0.15:0.15,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFX1 (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.066:0.17:0.17,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFX2 (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_5, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_5);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.07:0.19:0.19,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFX4 (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_16, N30);
   not (Q, QBINT_16);
   buf (QN, QBINT_16);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.18:0.18:0.18,
       tminpwh$CK = 0.082:0.2:0.2,
       tminpwl$CK = 0.071:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFXL (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_2);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.16:0.16:0.16,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.067:0.16:0.16,
       tminpwl$CK = 0.075:0.12:0.12,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.095:0.095:0.095,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX1 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_10);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_10, N30_3);
   not (Q, QBINT_10);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.069:0.15:0.15,
       tminpwl$CK = 0.079:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_10))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX2 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_17);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_3);
   not (Q, QBINT_17);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.072:0.15:0.15,
       tminpwl$CK = 0.079:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_17))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX4 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_23);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_9, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_23, N30_9);
   not (Q, QBINT_23);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tminpwh$CK = 0.079:0.16:0.16,
       tminpwl$CK = 0.078:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.19:0.19,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_23))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX8 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_38);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_38, N30_7);
   not (Q, QBINT_38);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.18:0.18:0.18,
       tminpwh$CK = 0.1:0.18:0.18,
       tminpwl$CK = 0.078:0.13:0.13,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.19:0.19,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_38))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRX1 (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_19);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_19, N30);
   not (Q, QBINT_19);
   buf (QN, QBINT_19);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.16:0.16:0.16,
       tminpwh$CK = 0.063:0.18:0.18,
       tminpwl$CK = 0.071:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.28:0.28,
       thold_posedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.28:0.28:0.28,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_19&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_19&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRX2 (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_14);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_14, N30_2);
   not (Q, QBINT_14);
   buf (QN, QBINT_14);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.072:0.19:0.19,
       tminpwl$CK = 0.075:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.28:0.28,
       thold_posedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.28:0.28:0.28,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_14&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_14&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRX4 (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_22);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_22, N30_3);
   not (Q, QBINT_22);
   buf (QN, QBINT_22);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.15:0.15:0.15,
       tplhl$CK$Q = 0.16:0.16:0.16,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tminpwh$CK = 0.087:0.2:0.2,
       tminpwl$CK = 0.076:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.28:0.28,
       thold_posedge$E$CK = -0.19:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.28:0.28:0.28,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_22&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_22&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRXL (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_15);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_15, N30);
   not (Q, QBINT_15);
   buf (QN, QBINT_15);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.063:0.17:0.17,
       tminpwl$CK = 0.072:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.28:0.28,
       thold_posedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.28:0.28:0.28,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_15&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_15&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFX1 (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_14);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_14, N30_2);
   not (Q, QBINT_14);
   buf (QN, QBINT_14);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.19:0.19:0.19,
       tplhl$CK$QN = 0.16:0.16:0.16,
       tminpwh$CK = 0.065:0.19:0.19,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_14))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_14))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFX2 (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_17);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_4);
   not (Q, QBINT_17);
   buf (QN, QBINT_17);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.18:0.18:0.18,
       tminpwh$CK = 0.068:0.2:0.2,
       tminpwl$CK = 0.073:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_17))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_17))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFX4 (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_23);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_8, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_23, N30_8);
   not (Q, QBINT_23);
   buf (QN, QBINT_23);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.14:0.14:0.14,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tpllh$CK$QN = 0.2:0.2:0.2,
       tplhl$CK$QN = 0.19:0.19:0.19,
       tminpwh$CK = 0.082:0.2:0.2,
       tminpwl$CK = 0.073:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_23))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_23))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFXL (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_4);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_3);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tpllh$CK$QN = 0.17:0.17:0.17,
       tplhl$CK$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.065:0.17:0.17,
       tminpwl$CK = 0.074:0.12:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.19:0.19,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_4))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_4))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX1 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.072:0.14:0.14,
       tminpwl$CK = 0.08:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.19:0.19,
       thold_negedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.19:0.19:0.19,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.19:0.19:0.19,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX2 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30);
   not (Q, QBINT_3);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.12:0.12:0.12,
       tplhl$CK$Q = 0.14:0.14:0.14,
       tminpwh$CK = 0.075:0.14:0.14,
       tminpwl$CK = 0.08:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.19:0.19,
       thold_negedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.19:0.19:0.19,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.19:0.19:0.19,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX4 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_8, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_21, N30_8);
   not (Q, QBINT_21);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.13:0.13:0.13,
       tplhl$CK$Q = 0.15:0.15:0.15,
       tminpwh$CK = 0.085:0.15:0.15,
       tminpwl$CK = 0.082:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.19:0.19,
       thold_negedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:0.093:0.093,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.19:0.19:0.19,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.19:0.19:0.19,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX8 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_7);
   not (Q, QBINT_30);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.16:0.16:0.16,
       tplhl$CK$Q = 0.17:0.17:0.17,
       tminpwh$CK = 0.11:0.17:0.17,
       tminpwl$CK = 0.081:0.13:0.13,
       tsetup_negedge$D0$CK = 0.095:0.095:0.095,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.095:0.095:0.095,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.19:0.19,
       thold_negedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.095:0.095:0.095,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.19:0.19:0.19,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.095:0.095:0.095,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.095:0.095:0.095,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.095:0.095:0.095,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX1 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.039:0.039:0.039,
       tphhl$A$Y = 0.039:0.039:0.039,
       tpzh$OE$Y = 0.038:0.038:0.038,
       tpzl$OE$Y = 0.047:0.047:0.047,
       tplz$OE$Y = 0.04:0.04:0.04,
       tphz$OE$Y = 0.037:0.037:0.037;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX12 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.046:0.046:0.046,
       tphhl$A$Y = 0.049:0.049:0.049,
       tpzh$OE$Y = 0.044:0.044:0.044,
       tpzl$OE$Y = 0.068:0.068:0.068,
       tplz$OE$Y = 0.07:0.07:0.07,
       tphz$OE$Y = 0.047:0.047:0.047;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX16 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.078:0.078:0.078,
       tphhl$A$Y = 0.077:0.077:0.077,
       tpzh$OE$Y = 0.079:0.079:0.079,
       tpzl$OE$Y = 0.11:0.11:0.11,
       tplz$OE$Y = 0.096:0.096:0.096,
       tphz$OE$Y = 0.064:0.064:0.064;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX2 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.047:0.047:0.047,
       tphhl$A$Y = 0.048:0.048:0.048,
       tpzh$OE$Y = 0.044:0.044:0.044,
       tpzl$OE$Y = 0.052:0.052:0.052,
       tplz$OE$Y = 0.045:0.045:0.045,
       tphz$OE$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX20 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.048:0.048:0.048,
       tphhl$A$Y = 0.05:0.05:0.05,
       tpzh$OE$Y = 0.046:0.046:0.046,
       tpzl$OE$Y = 0.064:0.064:0.064,
       tplz$OE$Y = 0.065:0.065:0.065,
       tphz$OE$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX3 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.042:0.042:0.042,
       tphhl$A$Y = 0.043:0.043:0.043,
       tpzh$OE$Y = 0.04:0.04:0.04,
       tpzl$OE$Y = 0.054:0.054:0.054,
       tplz$OE$Y = 0.05:0.05:0.05,
       tphz$OE$Y = 0.042:0.042:0.042;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX4 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.046:0.046:0.046,
       tphhl$A$Y = 0.048:0.048:0.048,
       tpzh$OE$Y = 0.044:0.044:0.044,
       tpzl$OE$Y = 0.057:0.057:0.057,
       tplz$OE$Y = 0.054:0.054:0.054,
       tphz$OE$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX6 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.044:0.044:0.044,
       tpzh$OE$Y = 0.04:0.04:0.04,
       tpzl$OE$Y = 0.067:0.067:0.067,
       tplz$OE$Y = 0.071:0.071:0.071,
       tphz$OE$Y = 0.042:0.042:0.042;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX8 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.046:0.046:0.046,
       tphhl$A$Y = 0.049:0.049:0.049,
       tpzh$OE$Y = 0.045:0.045:0.045,
       tpzl$OE$Y = 0.071:0.071:0.071,
       tplz$OE$Y = 0.075:0.075:0.075,
       tphz$OE$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFXL (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.035:0.035:0.035,
       tphhl$A$Y = 0.036:0.036:0.036,
       tpzh$OE$Y = 0.033:0.033:0.033,
       tpzl$OE$Y = 0.043:0.043:0.043,
       tplz$OE$Y = 0.037:0.037:0.037,
       tphz$OE$Y = 0.03:0.03:0.03;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TIEHI (Y);
output Y ;

   buf (Y, 'B1);


endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TIELO (Y);
output Y ;

   buf (Y, 'B0);


endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX12 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.2:0.2:0.2,
       tphhl$CK$ECK = 0.18:0.18:0.18,
       tminpwl$CK = 0.15:0.19:0.19,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX16 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_21, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, EINT_21);
   and (ECK, CK, EINT_21);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.22:0.22:0.22,
       tphhl$CK$ECK = 0.19:0.2:0.2,
       tminpwl$CK = 0.19:0.22:0.22,
       tsetup_negedge$E$CK = 0.059:0.059:0.059,
       thold_negedge$E$CK = 0.035:0.035:0.035,
       tsetup_posedge$E$CK = 0.059:0.059:0.059,
       thold_posedge$E$CK = 0.035:0.035:0.035;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX2 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_5, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.27:0.27:0.27,
       tphhl$CK$ECK = 0.22:0.22:0.22,
       tminpwl$CK = 0.1:0.22:0.22,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX20 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_27, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, EINT_27);
   and (ECK, CK, EINT_27);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.22:0.22:0.22,
       tphhl$CK$ECK = 0.19:0.19:0.19,
       tminpwl$CK = 0.19:0.23:0.23,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX3 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_7, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_5, EINT_7);
   and (ECK, CK, EINT_7);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.22:0.22:0.22,
       tphhl$CK$ECK = 0.19:0.19:0.19,
       tminpwl$CK = 0.11:0.19:0.19,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX4 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.21:0.21:0.21,
       tphhl$CK$ECK = 0.18:0.18:0.18,
       tminpwl$CK = 0.11:0.18:0.18,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX6 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.19:0.19:0.19,
       tphhl$CK$ECK = 0.17:0.17:0.17,
       tminpwl$CK = 0.13:0.17:0.17,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX8 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_14, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, EINT_14);
   and (ECK, CK, EINT_14);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.19:0.19:0.19,
       tphhl$CK$ECK = 0.17:0.17:0.17,
       tminpwl$CK = 0.13:0.17:0.17,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRX1 (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_4, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_6, QINT_4);
   buf (Q, QINT_4);
   not (QN, QINT_4);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.11:0.11:0.11,
       tphhl$D$Q = 0.14:0.14:0.14,
       tplhl$D$QN = 0.094:0.094:0.094,
       tphlh$D$QN = 0.12:0.12:0.12,
       tphlh$GN$Q = 0.19:0.19:0.19,
       tphhl$GN$Q = 0.19:0.19:0.19,
       tphlh$GN$QN = 0.17:0.17:0.17,
       tphhl$GN$QN = 0.17:0.17:0.17,
       tpllh$RN$Q = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.15:0.15:0.15,
       tplhl$RN$QN = 0.15:0.15:0.15,
       tphlh$RN$QN = 0.14:0.14:0.14,
       tplhl$SN$Q = 0.09:0.09:0.09,
       tphlh$SN$Q = 0.078:0.079:0.08,
       tpllh$SN$QN = 0.072:0.072:0.072,
       tphhl$SN$QN = 0.057:0.058:0.058,
       tminpwl$GN = 0.085:0.19:0.19,
       tminpwl$RN = 0.052:0.15:0.15,
       tminpwl$SN = 0.046:0.1:0.1,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0:0:0,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0.094:0.094:0.094,
       tsetup_posedge$RN$GN = 0.094:0.094:0.094,
       thold_posedge$RN$GN = 0:0:0,
       trec$SN$GN = 0:0:0,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRX2 (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_6, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_6);
   buf (Q, QINT_6);
   not (QN, QINT_6);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.13:0.13:0.13,
       tphhl$D$Q = 0.17:0.17:0.17,
       tplhl$D$QN = 0.11:0.11:0.11,
       tphlh$D$QN = 0.15:0.15:0.15,
       tphlh$GN$Q = 0.21:0.21:0.21,
       tphhl$GN$Q = 0.22:0.22:0.22,
       tphlh$GN$QN = 0.2:0.2:0.2,
       tphhl$GN$QN = 0.19:0.19:0.19,
       tpllh$RN$Q = 0.19:0.19:0.19,
       tphhl$RN$Q = 0.17:0.17:0.17,
       tplhl$RN$QN = 0.17:0.17:0.17,
       tphlh$RN$QN = 0.15:0.15:0.15,
       tplhl$SN$Q = 0.1:0.1:0.1,
       tphlh$SN$Q = 0.086:0.087:0.088,
       tpllh$SN$QN = 0.083:0.083:0.083,
       tphhl$SN$QN = 0.064:0.064:0.064,
       tminpwl$GN = 0.11:0.22:0.22,
       tminpwl$RN = 0.058:0.17:0.17,
       tminpwl$SN = 0.053:0.12:0.12,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0,
       tsetup_posedge$RN$GN = 0.094:0.094:0.094,
       thold_posedge$RN$GN = 0:0:0,
       trec$SN$GN = 0.094:0.094:0.094,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRX4 (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_31, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_7, QINT_31);
   buf (Q, QINT_31);
   not (QN, QINT_31);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.14:0.14:0.14,
       tphhl$D$Q = 0.18:0.18:0.18,
       tplhl$D$QN = 0.12:0.12:0.12,
       tphlh$D$QN = 0.16:0.16:0.16,
       tphlh$GN$Q = 0.22:0.22:0.22,
       tphhl$GN$Q = 0.23:0.23:0.23,
       tphlh$GN$QN = 0.21:0.21:0.21,
       tphhl$GN$QN = 0.19:0.19:0.19,
       tpllh$RN$Q = 0.2:0.2:0.2,
       tphhl$RN$Q = 0.19:0.19:0.19,
       tplhl$RN$QN = 0.18:0.18:0.18,
       tphlh$RN$QN = 0.17:0.17:0.17,
       tplhl$SN$Q = 0.1:0.1:0.1,
       tphlh$SN$Q = 0.084:0.084:0.084,
       tpllh$SN$QN = 0.079:0.079:0.079,
       tphhl$SN$QN = 0.059:0.059:0.06,
       tminpwl$GN = 0.12:0.23:0.23,
       tminpwl$RN = 0.074:0.19:0.19,
       tminpwl$SN = 0.05:0.13:0.13,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0:0:0,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0,
       tsetup_posedge$RN$GN = 0.094:0.094:0.094,
       thold_posedge$RN$GN = 0:0:0,
       trec$SN$GN = 0:0:0,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRXL (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_4, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_4, QINT_4);
   buf (Q, QINT_4);
   not (QN, QINT_4);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.1:0.1:0.1,
       tphhl$D$Q = 0.13:0.13:0.13,
       tplhl$D$QN = 0.082:0.082:0.082,
       tphlh$D$QN = 0.11:0.11:0.11,
       tphlh$GN$Q = 0.18:0.18:0.18,
       tphhl$GN$Q = 0.17:0.17:0.17,
       tphlh$GN$QN = 0.15:0.15:0.15,
       tphhl$GN$QN = 0.16:0.16:0.16,
       tpllh$RN$Q = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.14:0.14:0.14,
       tplhl$RN$QN = 0.14:0.14:0.14,
       tphlh$RN$QN = 0.12:0.12:0.12,
       tplhl$SN$Q = 0.075:0.075:0.075,
       tphlh$SN$Q = 0.066:0.066:0.067,
       tpllh$SN$QN = 0.058:0.058:0.058,
       tphhl$SN$QN = 0.046:0.047:0.047,
       tminpwl$GN = 0.085:0.18:0.18,
       tminpwl$RN = 0.052:0.14:0.14,
       tminpwl$SN = 0.036:0.091:0.091,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0:0:0,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0.094:0.094:0.094,
       tsetup_posedge$RN$GN = 0.094:0.094:0.094,
       thold_posedge$RN$GN = 0:0:0,
       trec$SN$GN = 0:0:0,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX12 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_18, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5, EINT_18);
   and (ECK, CK, EINT_18);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.2:0.2:0.2,
       tphhl$CK$ECK = 0.18:0.18:0.18,
       tminpwl$CK = 0.12:0.18:0.18,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX16 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_21, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_8, EINT_21);
   and (ECK, CK, EINT_21);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.21:0.21:0.21,
       tphhl$CK$ECK = 0.18:0.18:0.18,
       tminpwl$CK = 0.14:0.18:0.18,
       tsetup_negedge$E$CK = 0.15:0.15:0.15,
       thold_negedge$E$CK = -0.059:-0.059:-0.059,
       tsetup_negedge$SE$CK = 0.15:0.15:0.15,
       thold_negedge$SE$CK = -0.059:-0.059:-0.059,
       tsetup_posedge$E$CK = 0.059:0.059:0.059,
       thold_posedge$E$CK = 0.035:0.035:0.035,
       tsetup_posedge$SE$CK = 0.15:0.15:0.15,
       thold_posedge$SE$CK = -0.059:-0.059:-0.059;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX2 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_8, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_6, EINT_8);
   and (ECK, CK, EINT_8);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.27:0.27:0.27,
       tphhl$CK$ECK = 0.22:0.22:0.22,
       tminpwl$CK = 0.093:0.22:0.22,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX20 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_17, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_7, EINT_17);
   and (ECK, CK, EINT_17);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.23:0.23:0.23,
       tphhl$CK$ECK = 0.2:0.2:0.2,
       tminpwl$CK = 0.16:0.2:0.2,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX3 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_7, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_6, EINT_7);
   and (ECK, CK, EINT_7);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.23:0.23:0.23,
       tphhl$CK$ECK = 0.19:0.19:0.19,
       tminpwl$CK = 0.097:0.19:0.19,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX4 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_6, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.21:0.21:0.21,
       tphhl$CK$ECK = 0.18:0.18:0.18,
       tminpwl$CK = 0.096:0.18:0.18,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX6 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_12, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5, EINT_12);
   and (ECK, CK, EINT_12);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.19:0.19:0.19,
       tphhl$CK$ECK = 0.17:0.17:0.17,
       tminpwl$CK = 0.11:0.17:0.17,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX8 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_5, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.19:0.19:0.19,
       tphhl$CK$ECK = 0.17:0.17:0.17,
       tminpwl$CK = 0.11:0.17:0.17,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.095:0.095,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNX1 (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_3, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, QINT_3);
   buf (Q, QINT_3);
   not (QN, QINT_3);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.11:0.11:0.11,
       tphhl$D$Q = 0.12:0.12:0.12,
       tplhl$D$QN = 0.093:0.093:0.093,
       tphlh$D$QN = 0.1:0.1:0.1,
       tphlh$GN$Q = 0.14:0.14:0.14,
       tphhl$GN$Q = 0.16:0.16:0.16,
       tphlh$GN$QN = 0.14:0.14:0.14,
       tphhl$GN$QN = 0.12:0.12:0.12,
       tminpwl$GN = 0.055:0.16:0.16,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0:0:0,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNX2 (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_19, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, QINT_19);
   buf (Q, QINT_19);
   not (QN, QINT_19);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.13:0.13:0.13,
       tphhl$D$Q = 0.13:0.13:0.13,
       tplhl$D$QN = 0.1:0.1:0.1,
       tphlh$D$QN = 0.11:0.11:0.11,
       tphlh$GN$Q = 0.16:0.16:0.16,
       tphhl$GN$Q = 0.17:0.17:0.17,
       tphlh$GN$QN = 0.15:0.15:0.15,
       tphhl$GN$QN = 0.13:0.13:0.13,
       tminpwl$GN = 0.06:0.17:0.17,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNX4 (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_18, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT_18);
   buf (Q, QINT_18);
   not (QN, QINT_18);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.14:0.14:0.14,
       tphhl$D$Q = 0.15:0.15:0.15,
       tplhl$D$QN = 0.11:0.11:0.11,
       tphlh$D$QN = 0.13:0.13:0.13,
       tphlh$GN$Q = 0.17:0.17:0.17,
       tphhl$GN$Q = 0.19:0.19:0.19,
       tphlh$GN$QN = 0.17:0.17:0.17,
       tphhl$GN$QN = 0.15:0.15:0.15,
       tminpwl$GN = 0.074:0.19:0.19,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNXL (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_3, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, QINT_3);
   buf (Q, QINT_3);
   not (QN, QINT_3);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.1:0.1:0.1,
       tphhl$D$Q = 0.11:0.11:0.11,
       tplhl$D$QN = 0.083:0.083:0.083,
       tphlh$D$QN = 0.095:0.095:0.095,
       tphlh$GN$Q = 0.13:0.13:0.13,
       tphhl$GN$Q = 0.15:0.15:0.15,
       tphlh$GN$QN = 0.13:0.13:0.13,
       tphhl$GN$QN = 0.11:0.11:0.11,
       tminpwl$GN = 0.055:0.15:0.15,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRX1 (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_12, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_12);
   buf (Q, QINT_12);
   not (QN, QINT_12);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.12:0.12:0.12,
       tphhl$D$Q = 0.15:0.15:0.15,
       tplhl$D$QN = 0.096:0.096:0.096,
       tphlh$D$QN = 0.13:0.13:0.13,
       tpllh$G$Q = 0.17:0.17:0.17,
       tplhl$G$Q = 0.18:0.18:0.18,
       tpllh$G$QN = 0.16:0.16:0.16,
       tplhl$G$QN = 0.15:0.15:0.15,
       tpllh$RN$Q = 0.17:0.17:0.17,
       tphhl$RN$Q = 0.16:0.16:0.16,
       tplhl$RN$QN = 0.15:0.15:0.15,
       tphlh$RN$QN = 0.14:0.14:0.14,
       tplhl$SN$Q = 0.093:0.093:0.093,
       tphlh$SN$Q = 0.08:0.081:0.082,
       tpllh$SN$QN = 0.074:0.074:0.074,
       tphhl$SN$QN = 0.059:0.06:0.06,
       tminpwh$G = 0.076:0.18:0.18,
       tminpwl$RN = 0.054:0.16:0.16,
       tminpwl$SN = 0.048:0.11:0.11,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0:0:0,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0,
       tsetup_posedge$RN$G = 0.094:0.094:0.094,
       thold_posedge$RN$G = 0:0:0,
       trec$SN$G = 0.094:0.094:0.094,
       trem$SN$G = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRX2 (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_6, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_6);
   buf (Q, QINT_6);
   not (QN, QINT_6);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.13:0.13:0.13,
       tphhl$D$Q = 0.17:0.17:0.17,
       tplhl$D$QN = 0.11:0.11:0.11,
       tphlh$D$QN = 0.15:0.15:0.15,
       tpllh$G$Q = 0.19:0.19:0.19,
       tplhl$G$Q = 0.2:0.2:0.2,
       tpllh$G$QN = 0.18:0.18:0.18,
       tplhl$G$QN = 0.17:0.17:0.17,
       tpllh$RN$Q = 0.19:0.19:0.19,
       tphhl$RN$Q = 0.17:0.17:0.17,
       tplhl$RN$QN = 0.17:0.17:0.17,
       tphlh$RN$QN = 0.15:0.15:0.15,
       tplhl$SN$Q = 0.1:0.1:0.1,
       tphlh$SN$Q = 0.087:0.087:0.088,
       tpllh$SN$QN = 0.084:0.084:0.084,
       tphhl$SN$QN = 0.064:0.065:0.065,
       tminpwh$G = 0.086:0.2:0.2,
       tminpwl$RN = 0.057:0.17:0.17,
       tminpwl$SN = 0.053:0.12:0.12,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0:0:0,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0,
       tsetup_posedge$RN$G = 0.094:0.094:0.094,
       thold_posedge$RN$G = 0:0:0,
       trec$SN$G = 0.094:0.094:0.094,
       trem$SN$G = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRX4 (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_32, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_9, QINT_32);
   buf (Q, QINT_32);
   not (QN, QINT_32);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.14:0.14:0.14,
       tphhl$D$Q = 0.18:0.18:0.18,
       tplhl$D$QN = 0.12:0.12:0.12,
       tphlh$D$QN = 0.16:0.16:0.16,
       tpllh$G$Q = 0.21:0.21:0.21,
       tplhl$G$Q = 0.23:0.23:0.23,
       tpllh$G$QN = 0.21:0.21:0.21,
       tplhl$G$QN = 0.18:0.18:0.18,
       tpllh$RN$Q = 0.21:0.21:0.21,
       tphhl$RN$Q = 0.19:0.19:0.19,
       tplhl$RN$QN = 0.18:0.18:0.18,
       tphlh$RN$QN = 0.17:0.17:0.17,
       tplhl$SN$Q = 0.1:0.1:0.1,
       tphlh$SN$Q = 0.084:0.085:0.085,
       tpllh$SN$QN = 0.08:0.08:0.08,
       tphhl$SN$QN = 0.06:0.06:0.06,
       tminpwh$G = 0.11:0.23:0.23,
       tminpwl$RN = 0.076:0.19:0.19,
       tminpwl$SN = 0.047:0.14:0.14,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0:0:0,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0,
       tsetup_posedge$RN$G = 0.19:0.19:0.19,
       thold_posedge$RN$G = -0.094:-0.094:-0.094,
       trec$SN$G = 0.094:0.094:0.094,
       trem$SN$G = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRXL (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_12, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_12);
   buf (Q, QINT_12);
   not (QN, QINT_12);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.11:0.11:0.11,
       tphhl$D$Q = 0.13:0.13:0.13,
       tplhl$D$QN = 0.085:0.085:0.085,
       tphlh$D$QN = 0.12:0.12:0.12,
       tpllh$G$Q = 0.16:0.16:0.16,
       tplhl$G$Q = 0.16:0.16:0.16,
       tpllh$G$QN = 0.15:0.15:0.15,
       tplhl$G$QN = 0.14:0.14:0.14,
       tpllh$RN$Q = 0.16:0.16:0.16,
       tphhl$RN$Q = 0.14:0.14:0.14,
       tplhl$RN$QN = 0.14:0.14:0.14,
       tphlh$RN$QN = 0.13:0.13:0.13,
       tplhl$SN$Q = 0.078:0.078:0.078,
       tphlh$SN$Q = 0.068:0.069:0.07,
       tpllh$SN$QN = 0.061:0.061:0.061,
       tphhl$SN$QN = 0.048:0.049:0.05,
       tminpwh$G = 0.076:0.16:0.16,
       tminpwl$RN = 0.054:0.14:0.14,
       tminpwl$SN = 0.038:0.096:0.096,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0:0:0,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0,
       tsetup_posedge$RN$G = 0.094:0.094:0.094,
       thold_posedge$RN$G = 0:0:0,
       trec$SN$G = 0:0:0,
       trem$SN$G = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATX1 (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT);
   buf (Q, QINT);
   not (QN, QINT);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.11:0.11:0.11,
       tphhl$D$Q = 0.12:0.12:0.12,
       tplhl$D$QN = 0.092:0.092:0.092,
       tphlh$D$QN = 0.1:0.1:0.1,
       tpllh$G$Q = 0.15:0.15:0.15,
       tplhl$G$Q = 0.13:0.13:0.13,
       tpllh$G$QN = 0.12:0.12:0.12,
       tplhl$G$QN = 0.13:0.13:0.13,
       tminpwh$G = 0.055:0.15:0.15,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0:0:0,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATX2 (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT_18, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT_18);
   buf (Q, QINT_18);
   not (QN, QINT_18);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.12:0.12:0.12,
       tphhl$D$Q = 0.13:0.13:0.13,
       tplhl$D$QN = 0.1:0.1:0.1,
       tphlh$D$QN = 0.11:0.11:0.11,
       tpllh$G$Q = 0.16:0.16:0.16,
       tplhl$G$Q = 0.14:0.14:0.14,
       tpllh$G$QN = 0.13:0.13:0.13,
       tplhl$G$QN = 0.14:0.14:0.14,
       tminpwh$G = 0.06:0.16:0.16,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0:0:0,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATX4 (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT_20, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_5, QINT_20);
   buf (Q, QINT_20);
   not (QN, QINT_20);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.14:0.14:0.14,
       tphhl$D$Q = 0.15:0.15:0.15,
       tplhl$D$QN = 0.11:0.11:0.11,
       tphlh$D$QN = 0.13:0.13:0.13,
       tpllh$G$Q = 0.18:0.18:0.18,
       tplhl$G$Q = 0.17:0.17:0.17,
       tpllh$G$QN = 0.15:0.15:0.15,
       tplhl$G$QN = 0.16:0.16:0.16,
       tminpwh$G = 0.078:0.18:0.18,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0:0:0,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATXL (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT);
   buf (Q, QINT);
   not (QN, QINT);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.1:0.1:0.1,
       tphhl$D$Q = 0.11:0.11:0.11,
       tplhl$D$QN = 0.08:0.08:0.08,
       tphlh$D$QN = 0.092:0.092:0.092,
       tpllh$G$Q = 0.14:0.14:0.14,
       tplhl$G$Q = 0.12:0.12:0.12,
       tpllh$G$QN = 0.11:0.11:0.11,
       tplhl$G$QN = 0.12:0.12:0.12,
       tminpwh$G = 0.055:0.14:0.14,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.054:0.054:0.054,
       tplhl$A$Y = 0.081:0.081:0.081,
       tphlh$A$Y = 0.077:0.077:0.077,
       tphhl$A$Y = 0.061:0.061:0.061,
       tpllh$B$Y = 0.039:0.039:0.039,
       tplhl$B$Y = 0.048:0.048:0.048,
       tphlh$B$Y = 0.071:0.071:0.071,
       tphhl$B$Y = 0.05:0.05:0.05;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.067:0.067:0.067,
       tplhl$A$Y = 0.1:0.1:0.1,
       tphlh$A$Y = 0.093:0.093:0.093,
       tphhl$A$Y = 0.075:0.075:0.075,
       tpllh$B$Y = 0.052:0.052:0.052,
       tplhl$B$Y = 0.061:0.061:0.061,
       tphlh$B$Y = 0.088:0.088:0.088,
       tphhl$B$Y = 0.07:0.07:0.07;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.098:0.098:0.098,
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.071:0.071:0.071,
       tplhl$B$Y = 0.082:0.082:0.082,
       tphlh$B$Y = 0.093:0.093:0.093,
       tphhl$B$Y = 0.075:0.075:0.075;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.049:0.049:0.049,
       tplhl$A$Y = 0.069:0.069:0.069,
       tphlh$A$Y = 0.068:0.068:0.068,
       tphhl$A$Y = 0.054:0.054:0.054,
       tpllh$B$Y = 0.032:0.032:0.032,
       tplhl$B$Y = 0.042:0.042:0.042,
       tphlh$B$Y = 0.064:0.064:0.064,
       tphhl$B$Y = 0.04:0.04:0.04;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.087:0.089:0.091,
       tplhl$A$Y = 0.13:0.13:0.13,
       tphlh$A$Y = 0.13:0.13:0.13,
       tphhl$A$Y = 0.087:0.089:0.09,
       tpllh$B$Y = 0.065:0.071:0.076,
       tplhl$B$Y = 0.069:0.076:0.082,
       tphlh$B$Y = 0.084:0.086:0.087,
       tphhl$B$Y = 0.07:0.075:0.08,
       tpllh$C$Y = 0.038:0.039:0.039,
       tplhl$C$Y = 0.047:0.048:0.05,
       tphlh$C$Y = 0.057:0.057:0.058,
       tphhl$C$Y = 0.041:0.042:0.043;

     // path delays
     (posedge A *> (Y +: !(C^B))) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !(C^B))) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !(C^A))) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !(C^A))) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: !(B^A))) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: !(B^A))) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.088:0.09:0.093,
       tplhl$A$Y = 0.11:0.11:0.12,
       tphlh$A$Y = 0.13:0.13:0.14,
       tphhl$A$Y = 0.084:0.085:0.087,
       tpllh$B$Y = 0.068:0.072:0.077,
       tplhl$B$Y = 0.062:0.066:0.07,
       tphlh$B$Y = 0.087:0.088:0.089,
       tphhl$B$Y = 0.066:0.066:0.066,
       tpllh$C$Y = 0.04:0.04:0.04,
       tplhl$C$Y = 0.041:0.041:0.041,
       tphlh$C$Y = 0.059:0.06:0.06,
       tphhl$C$Y = 0.035:0.035:0.035;

     // path delays
     (posedge A *> (Y +: !(C^B))) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !(C^B))) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !(C^A))) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !(C^A))) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: !(B^A))) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: !(B^A))) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.057:0.057:0.057,
       tplhl$A$Y = 0.083:0.083:0.083,
       tphlh$A$Y = 0.077:0.077:0.077,
       tphhl$A$Y = 0.062:0.062:0.062,
       tpllh$B$Y = 0.044:0.044:0.044,
       tplhl$B$Y = 0.07:0.07:0.07,
       tphlh$B$Y = 0.057:0.057:0.057,
       tphhl$B$Y = 0.045:0.045:0.045;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.071:0.071:0.071,
       tplhl$A$Y = 0.1:0.1:0.1,
       tphlh$A$Y = 0.093:0.093:0.093,
       tphhl$A$Y = 0.077:0.077:0.077,
       tpllh$B$Y = 0.059:0.059:0.059,
       tplhl$B$Y = 0.092:0.092:0.092,
       tphlh$B$Y = 0.07:0.07:0.07,
       tphhl$B$Y = 0.059:0.059:0.059;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.099:0.099:0.099,
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.062:0.062:0.062,
       tplhl$B$Y = 0.099:0.099:0.099,
       tphlh$B$Y = 0.092:0.092:0.092,
       tphhl$B$Y = 0.076:0.076:0.076;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.051:0.051:0.051,
       tplhl$A$Y = 0.073:0.073:0.073,
       tphlh$A$Y = 0.07:0.07:0.07,
       tphhl$A$Y = 0.055:0.055:0.055,
       tpllh$B$Y = 0.037:0.037:0.037,
       tplhl$B$Y = 0.061:0.061:0.061,
       tphlh$B$Y = 0.052:0.052:0.052,
       tphhl$B$Y = 0.038:0.038:0.038;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (Y, I0_out, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.088:0.089:0.09,
       tplhl$A$Y = 0.13:0.13:0.13,
       tphlh$A$Y = 0.13:0.13:0.13,
       tphhl$A$Y = 0.087:0.089:0.091,
       tpllh$B$Y = 0.069:0.072:0.074,
       tplhl$B$Y = 0.072:0.075:0.078,
       tphlh$B$Y = 0.08:0.085:0.09,
       tphhl$B$Y = 0.067:0.076:0.085,
       tpllh$C$Y = 0.038:0.039:0.039,
       tplhl$C$Y = 0.047:0.049:0.05,
       tphlh$C$Y = 0.057:0.058:0.059,
       tphhl$C$Y = 0.041:0.042:0.043;

     // path delays
     (posedge A *> (Y +: C^B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: C^B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: C^A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: C^A)) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: B^A)) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: B^A)) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (Y, I0_out, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.091:0.092:0.094,
       tplhl$A$Y = 0.12:0.12:0.12,
       tphlh$A$Y = 0.13:0.13:0.14,
       tphhl$A$Y = 0.084:0.086:0.088,
       tpllh$B$Y = 0.073:0.073:0.074,
       tplhl$B$Y = 0.065:0.065:0.066,
       tphlh$B$Y = 0.084:0.087:0.09,
       tphhl$B$Y = 0.063:0.068:0.072,
       tpllh$C$Y = 0.039:0.04:0.04,
       tplhl$C$Y = 0.041:0.041:0.041,
       tphlh$C$Y = 0.059:0.06:0.06,
       tphhl$C$Y = 0.035:0.035:0.036;

     // path delays
     (posedge A *> (Y +: C^B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: C^B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: C^A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: C^A)) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: B^A)) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: B^A)) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff

primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_mux2 (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table

// in0 in1 sel :  out
//
    1  ?  0 :  1 ;
    0  ?  0 :  0 ;
    ?  1  1 :  1 ;
    ?  0  1 :  0 ;
    0  0  x :  0 ;
    1  1  x :  1 ;

   endtable
endprimitive // udp_mux2

