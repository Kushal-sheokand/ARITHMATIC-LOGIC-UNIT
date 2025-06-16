module alu (
  input  [3:0] A, B,
  input  [2:0] sel,
  output reg [3:0] result
);

always @(*) begin
  case (sel)
    3'b000: result = A + B;       // Addition
    3'b001: result = A - B;       // Subtraction
    3'b010: result = A & B;       // AND
    3'b011: result = A | B;       // OR
    3'b100: result = ~A;          // NOT (only on A)
    default: result = 4'b0000;    // Default
  endcase
end

endmodule
