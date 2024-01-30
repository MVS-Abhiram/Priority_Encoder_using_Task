`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 09:51:12
// Design Name: 
// Module Name: coding_test_2
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


module coding_test_2(in_vector , out_priority, valid_output);
input wire [7:0] in_vector;
output reg [2:0] out_priority;
output reg valid_output;
// Task to implement the priority encoder logic
task priority_encoder_task;
input [7:0] in_vector_task;
output reg [2:0] out_priority_task;
output reg valid_output_task;
// For , for loop iteration
integer i;
begin
    // Initialize to lowest priority
    out_priority_task = 3'b111; 
    // Initialize to invalid output
    valid_output_task = 0; 
    for (i = 0; i < 8; i = i + 1) 
    begin
        if (in_vector_task[i] == 1'b1) 
        begin
            // Update priority
            out_priority_task = i; 
            // Set valid output
            valid_output_task = 1;  
        end
    end
end
endtask

  // To call the task and assign inputs always
  // To map top module inputs to task inputs
  always@(*)
  begin
    priority_encoder_task(in_vector, out_priority, valid_output);
  end

endmodule
