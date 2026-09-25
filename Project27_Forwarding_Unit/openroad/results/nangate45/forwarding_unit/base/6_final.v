module forwarding_unit (ex_mem_reg_write,
    mem_wb_reg_write,
    ex_mem_rd,
    forward_a,
    forward_b,
    id_ex_rs1,
    id_ex_rs2,
    mem_wb_rd);
 input ex_mem_reg_write;
 input mem_wb_reg_write;
 input [4:0] ex_mem_rd;
 output [1:0] forward_a;
 output [1:0] forward_b;
 input [4:0] id_ex_rs1;
 input [4:0] id_ex_rs2;
 input [4:0] mem_wb_rd;

 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire _32_;
 wire _34_;
 wire _35_;
 wire _36_;
 wire _37_;
 wire _38_;
 wire _39_;
 wire _40_;
 wire _41_;
 wire _42_;
 wire _43_;
 wire _44_;
 wire _45_;
 wire _46_;
 wire _47_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
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
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;

 XOR2_X1 _48_ (.A(net3),
    .B(net9),
    .Z(_11_));
 OR2_X1 _49_ (.A1(net2),
    .A2(net8),
    .ZN(_12_));
 NAND2_X1 _50_ (.A1(net2),
    .A2(net8),
    .ZN(_13_));
 INV_X1 _51_ (.A(net3),
    .ZN(_14_));
 NOR4_X1 _52_ (.A1(net4),
    .A2(net1),
    .A3(net2),
    .A4(net5),
    .ZN(_15_));
 AOI221_X1 _53_ (.A(_11_),
    .B1(_12_),
    .B2(_13_),
    .C1(_14_),
    .C2(_15_),
    .ZN(_16_));
 INV_X1 _54_ (.A(net6),
    .ZN(_17_));
 XOR2_X1 _55_ (.A(net1),
    .B(net7),
    .Z(_18_));
 XOR2_X1 _56_ (.A(net4),
    .B(net10),
    .Z(_19_));
 XOR2_X1 _57_ (.A(net5),
    .B(net11),
    .Z(_20_));
 NOR4_X2 _58_ (.A1(_17_),
    .A2(_18_),
    .A3(_19_),
    .A4(_20_),
    .ZN(_21_));
 AND2_X2 _59_ (.A1(_16_),
    .A2(_21_),
    .ZN(net24));
 XOR2_X1 _60_ (.A(net4),
    .B(net15),
    .Z(_22_));
 OR2_X1 _61_ (.A1(net3),
    .A2(net14),
    .ZN(_23_));
 NAND2_X1 _62_ (.A1(net3),
    .A2(net14),
    .ZN(_24_));
 AOI221_X1 _63_ (.A(_22_),
    .B1(_23_),
    .B2(_24_),
    .C1(_14_),
    .C2(_15_),
    .ZN(_25_));
 XOR2_X1 _64_ (.A(net2),
    .B(net13),
    .Z(_26_));
 XOR2_X1 _65_ (.A(net1),
    .B(net12),
    .Z(_27_));
 XOR2_X1 _66_ (.A(net16),
    .B(net5),
    .Z(_28_));
 NOR4_X2 _67_ (.A1(_17_),
    .A2(_26_),
    .A3(_27_),
    .A4(_28_),
    .ZN(_29_));
 AND2_X2 _68_ (.A1(_25_),
    .A2(_29_),
    .ZN(net26));
 XNOR2_X1 _69_ (.A(net20),
    .B(net15),
    .ZN(_30_));
 NOR2_X1 _70_ (.A1(net19),
    .A2(net14),
    .ZN(_31_));
 AND2_X1 _71_ (.A1(net19),
    .A2(net14),
    .ZN(_32_));
 OR4_X1 _73_ (.A1(net18),
    .A2(net20),
    .A3(net19),
    .A4(net21),
    .ZN(_34_));
 OAI221_X1 _74_ (.A(_30_),
    .B1(_31_),
    .B2(_32_),
    .C1(net17),
    .C2(_34_),
    .ZN(_35_));
 XNOR2_X1 _75_ (.A(net18),
    .B(net13),
    .ZN(_36_));
 XNOR2_X1 _76_ (.A(net17),
    .B(net12),
    .ZN(_37_));
 XNOR2_X1 _77_ (.A(net21),
    .B(net16),
    .ZN(_38_));
 NAND4_X1 _78_ (.A1(net22),
    .A2(_36_),
    .A3(_37_),
    .A4(_38_),
    .ZN(_39_));
 AOI211_X2 _79_ (.A(_35_),
    .B(_39_),
    .C1(_25_),
    .C2(_29_),
    .ZN(net25));
 XNOR2_X1 _80_ (.A(net19),
    .B(net9),
    .ZN(_40_));
 NOR2_X1 _81_ (.A1(net18),
    .A2(net8),
    .ZN(_41_));
 AND2_X1 _82_ (.A1(net18),
    .A2(net8),
    .ZN(_42_));
 OAI221_X1 _83_ (.A(_40_),
    .B1(_41_),
    .B2(_42_),
    .C1(net17),
    .C2(_34_),
    .ZN(_43_));
 XNOR2_X1 _84_ (.A(net17),
    .B(net7),
    .ZN(_44_));
 XNOR2_X1 _85_ (.A(net20),
    .B(net10),
    .ZN(_45_));
 XNOR2_X1 _86_ (.A(net21),
    .B(net11),
    .ZN(_46_));
 NAND4_X1 _87_ (.A1(net22),
    .A2(_44_),
    .A3(_45_),
    .A4(_46_),
    .ZN(_47_));
 AOI211_X2 _88_ (.A(_43_),
    .B(_47_),
    .C1(_16_),
    .C2(_21_),
    .ZN(net23));
 BUF_X1 input1 (.A(ex_mem_rd[0]),
    .Z(net1));
 BUF_X1 input10 (.A(id_ex_rs1[3]),
    .Z(net10));
 BUF_X1 input11 (.A(id_ex_rs1[4]),
    .Z(net11));
 BUF_X1 input12 (.A(id_ex_rs2[0]),
    .Z(net12));
 BUF_X1 input13 (.A(id_ex_rs2[1]),
    .Z(net13));
 BUF_X1 input14 (.A(id_ex_rs2[2]),
    .Z(net14));
 BUF_X1 input15 (.A(id_ex_rs2[3]),
    .Z(net15));
 BUF_X1 input16 (.A(id_ex_rs2[4]),
    .Z(net16));
 BUF_X1 input17 (.A(mem_wb_rd[0]),
    .Z(net17));
 BUF_X1 input18 (.A(mem_wb_rd[1]),
    .Z(net18));
 BUF_X1 input19 (.A(mem_wb_rd[2]),
    .Z(net19));
 BUF_X1 input2 (.A(ex_mem_rd[1]),
    .Z(net2));
 BUF_X1 input20 (.A(mem_wb_rd[3]),
    .Z(net20));
 BUF_X1 input21 (.A(mem_wb_rd[4]),
    .Z(net21));
 BUF_X1 input22 (.A(mem_wb_reg_write),
    .Z(net22));
 BUF_X1 input3 (.A(ex_mem_rd[2]),
    .Z(net3));
 BUF_X1 input4 (.A(ex_mem_rd[3]),
    .Z(net4));
 BUF_X1 input5 (.A(ex_mem_rd[4]),
    .Z(net5));
 BUF_X1 input6 (.A(ex_mem_reg_write),
    .Z(net6));
 BUF_X1 input7 (.A(id_ex_rs1[0]),
    .Z(net7));
 BUF_X1 input8 (.A(id_ex_rs1[1]),
    .Z(net8));
 BUF_X1 input9 (.A(id_ex_rs1[2]),
    .Z(net9));
 BUF_X1 output23 (.A(net23),
    .Z(forward_a[0]));
 BUF_X1 output24 (.A(net24),
    .Z(forward_a[1]));
 BUF_X1 output25 (.A(net25),
    .Z(forward_b[0]));
 BUF_X1 output26 (.A(net26),
    .Z(forward_b[1]));
endmodule
