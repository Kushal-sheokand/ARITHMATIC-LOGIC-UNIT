module tb_alu;

  reg [3:0] A, B;
  reg [2:0] sel;
  wire [3:0] result;

  alu uut (.A(A), .B(B), .sel(sel), .result(result));

  initial begin
    $display("Time\tA\tB\tSel\tResult");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, A, B, sel, result);

    // Test Addition
    A = 4'b0011; B = 4'b0001; sel = 3'b000; #10;

    // Test Subtraction
    A = 4'b0110; B = 4'b0010; sel = 3'b001; #10;

    // Test AND
    A = 4'b1100; B = 4'b1010; sel = 3'b010; #10;

    // Test OR
    A = 4'b1100; B = 4'b1010; sel = 3'b011; #10;

    // Test NOT (only A is considered)
    A = 4'b1100; B = 4'bxxxx; sel = 3'b100; #10;

    // Default case
    sel = 3'b111; #10;

    $finish;
  end

  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);
  end

endmodule
