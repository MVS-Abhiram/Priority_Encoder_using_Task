`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 10:22:31
// Design Name: 
// Module Name: coding_test2_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module coding_test2_tb();
reg [7:0] in_vector;
  wire [2:0] out_priority;
  wire valid_output;

  // Instantiate the priority encoder module
  coding_test_2 uut (
    .in_vector(in_vector),
    .out_priority(out_priority),
    .valid_output(valid_output)
  );

  // Task to apply different test cases
  task run_test;
    input [7:0] test_input;
    input [2:0] expected_output;
    begin
    in_vector = test_input;
    #10;

    if (valid_output !== 1'b1) begin
      $display("Test failed: Input = %b, Expected Output = %b (Invalid)", test_input, expected_output);
      $stop;
    end

    if (out_priority !== expected_output) begin
      $display("Test failed: Input = %b, Expected Output = %b, Actual Output = %b (Valid)", test_input, expected_output, out_priority);
      $stop;
    end
    end
  endtask

  // Initial block to execute test cases
  initial begin
    run_test(8'b00000001, 3'b000);
    #10; 
    run_test(8'b00000010, 3'b001); 
    #10; 
    run_test(8'b00000100, 3'b010);
    #10; 
    run_test(8'b00001000, 3'b011);
    #10; 
    run_test(8'b00010000, 3'b100);
    #10; 
    run_test(8'b00100000, 3'b101);
    #10; 
    run_test(8'b01000000, 3'b110);
    #10; 
    run_test(8'b10000000, 3'b111);

    $stop; // Stop simulation after all test cases are done
  end
endmodule
