module rO (enable, w1, w2, w3);
    input enable;
    output w1, w2, w3;
    wire w4;

    and (w4, enable, w1);
    not #2(w1, w2);
    not #2(w2, w3);
    not #2(w3, w4);
endmodule


/*	module RO (enable, w1, w2, w3, w4);
    input enable;
    output w1, w2, w3, w4;
    wire w5;

    and (w4, enable, w1);
    not #2(w1, w4);

    tff (w4, 0, 1, w2);*/