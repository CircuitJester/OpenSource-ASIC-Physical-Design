module hazard_detection_unit (id_ex_flush,
    id_ex_mem_read,
    if_id_write,
    pc_write,
    id_ex_rd,
    if_id_rs1,
    if_id_rs2);
 output id_ex_flush;
 input id_ex_mem_read;
 output if_id_write;
 output pc_write;
 input [4:0] id_ex_rd;
 input [4:0] if_id_rs1;
 input [4:0] if_id_rs2;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire net17;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net18;

 XNOR2_X1 _16_ (.A(net4),
    .B(net9),
    .ZN(_00_));
 XNOR2_X1 _17_ (.A(net5),
    .B(net10),
    .ZN(_01_));
 XNOR2_X1 _18_ (.A(net6),
    .B(net11),
    .ZN(_02_));
 NAND3_X1 _19_ (.A1(_00_),
    .A2(_01_),
    .A3(_02_),
    .ZN(_03_));
 XOR2_X1 _20_ (.A(net2),
    .B(net7),
    .Z(_04_));
 XOR2_X1 _21_ (.A(net3),
    .B(net8),
    .Z(_05_));
 XNOR2_X1 _22_ (.A(net4),
    .B(net14),
    .ZN(_06_));
 XNOR2_X1 _23_ (.A(net3),
    .B(net13),
    .ZN(_07_));
 XNOR2_X1 _24_ (.A(net6),
    .B(net16),
    .ZN(_08_));
 NAND3_X1 _25_ (.A1(_06_),
    .A2(_07_),
    .A3(_08_),
    .ZN(_09_));
 XOR2_X2 _26_ (.A(net2),
    .B(net12),
    .Z(_10_));
 XOR2_X1 _27_ (.A(net5),
    .B(net15),
    .Z(_11_));
 OAI33_X1 _28_ (.A1(_03_),
    .A2(_04_),
    .A3(_05_),
    .B1(_09_),
    .B2(_10_),
    .B3(_11_),
    .ZN(_12_));
 INV_X1 _29_ (.A(net2),
    .ZN(_13_));
 NOR4_X1 _30_ (.A1(net3),
    .A2(net5),
    .A3(net4),
    .A4(net6),
    .ZN(_14_));
 NAND2_X1 _31_ (.A1(_13_),
    .A2(_14_),
    .ZN(_15_));
 AND3_X2 _32_ (.A1(net1),
    .A2(_12_),
    .A3(_15_),
    .ZN(net17));
 NAND3_X1 _33_ (.A1(net1),
    .A2(_12_),
    .A3(_15_),
    .ZN(net18));
 BUF_X1 input1 (.A(id_ex_mem_read),
    .Z(net1));
 BUF_X1 input10 (.A(if_id_rs1[3]),
    .Z(net10));
 BUF_X1 input11 (.A(if_id_rs1[4]),
    .Z(net11));
 BUF_X1 input12 (.A(if_id_rs2[0]),
    .Z(net12));
 BUF_X1 input13 (.A(if_id_rs2[1]),
    .Z(net13));
 BUF_X1 input14 (.A(if_id_rs2[2]),
    .Z(net14));
 BUF_X1 input15 (.A(if_id_rs2[3]),
    .Z(net15));
 BUF_X1 input16 (.A(if_id_rs2[4]),
    .Z(net16));
 BUF_X1 input2 (.A(id_ex_rd[0]),
    .Z(net2));
 BUF_X1 input3 (.A(id_ex_rd[1]),
    .Z(net3));
 BUF_X1 input4 (.A(id_ex_rd[2]),
    .Z(net4));
 BUF_X1 input5 (.A(id_ex_rd[3]),
    .Z(net5));
 BUF_X1 input6 (.A(id_ex_rd[4]),
    .Z(net6));
 BUF_X1 input7 (.A(if_id_rs1[0]),
    .Z(net7));
 BUF_X1 input8 (.A(if_id_rs1[1]),
    .Z(net8));
 BUF_X1 input9 (.A(if_id_rs1[2]),
    .Z(net9));
 BUF_X1 output17 (.A(net17),
    .Z(id_ex_flush));
 BUF_X1 output18 (.A(net18),
    .Z(if_id_write));
 BUF_X1 output19 (.A(net18),
    .Z(pc_write));
endmodule
