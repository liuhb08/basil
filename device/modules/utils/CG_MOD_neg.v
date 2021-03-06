
module CG_MOD_neg (ck_in, enable, ck_out);
    input ck_in,enable;
    output ck_out;
    reg enl;

        always @ (ck_in or enable)
        if (ck_in)
            enl = enable ;
        assign ck_out = ck_in | ~enl;
endmodule

