module counter_32bit_tb();

logic clk;
logic [2:0] mode;
logic load;
logic [31:0] din;
logic up_down;
logic [31:0] sat_count;
logic enable;
logic reset;
logic [31:0] count;
bit timer_event;
initial clk=1;
  
counter_32bit DUT(.*);
  
 always #5 clk=~clk;
  
  initial begin
    $monitor("Time %0d mode=%0d load=%0b din=%0d up_down=%0b sat_count=%0d enable=%0b count=%0d timer_event=%0b", $time, mode, load, din, up_down, sat_count, enable, count, timer_event);
  end
  
  
  task Expected_result;
    input logic [31:0] exp_out;
    
    if (count == exp_out) 
     begin 
       $display("TEST PASSED B/C Expected_result Was ==> %d", count);
     $display("------------------------------------------------------------------------------------- ");
     end
   else
     $display("TEST FAILED B/C Expected_result Was ==> %d",count);

  endtask
  
  initial begin
         //reset
         $display("################ reset: ################");
         $display("------------------------------------------------------------------------------------- ");
         mode=3'd0; load=0; din=32'd10; up_down=0; enable=0; reset=1; sat_count=32'd44; #10  Expected_result (32'd0);
         $display(" ");

         //upcount
         $display("################ up count wrt mode: ################### ");
         $display("------------------------------------------------------------------------------------- ");
         mode=3'd0; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd1);
         mode=3'd1; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd3);
         mode=3'd2; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd6);
         mode=3'd3; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd10);
         mode=3'd4; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd15);
         mode=3'd5; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd21);
         mode=3'd6; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd28);
         mode=3'd7; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd36);
         mode=3'd7; load=0; din=32'd0; up_down=1; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd44);
         $display(" ");

         //load data
         $display("################ load data: ################");
         $display("------------------------------------------------------------------------------------- ");
         mode=3'd0; load=1; din=32'd36; up_down=0; enable=0; reset=0; sat_count=32'd44; #10  Expected_result (32'd36);
         $display(" ");
    
         $display("################ down count wrt mode: ################");
         $display("------------------------------------------------------------------------------------- ");
         mode=3'd0; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd35);
         mode=3'd1; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd33);
         mode=3'd2; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd30);
         mode=3'd3; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd26);
         mode=3'd4; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd21);
         mode=3'd5; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd15);
         mode=3'd6; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd8);
         mode=3'd7; load=0; din=32'd0; up_down=0; enable=1; reset=0; sat_count=32'd44; #10  Expected_result (32'd0);
         $display(" ");
            
         
    $finish;
  end
 

endmodule