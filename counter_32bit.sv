module counter_32bit (clk, mode, load, din, up_down, sat_count, enable, reset, count, timer_event);
input logic clk;
input logic [2:0] mode;
input logic load;
input logic [31:0] din;
input logic up_down;
input logic [31:0] sat_count;
input logic enable;
input logic reset;
  output logic [31:0] count;
output bit timer_event;

   always@(posedge clk)
   begin
	if(reset)
      begin
		count<=32'b0;
      end        
     else if ( enable==1 && load==0)
  begin
     if (up_down )
      begin
      case (mode)
          3'd0: count <= count + 1;
          3'd1: count <= count + 2;
          3'd2: count <= count + 3;
          3'd3: count <= count + 4;
          3'd4: count <= count + 5;
          3'd5: count <= count + 6;
          3'd6: count <= count + 7;
          3'd7: count <= count + 8;
          default: count <= count;
       endcase
       end 
       else 
       begin
    case (mode)
         3'd0: count <= count - 1;
         3'd1: count <= count - 2; 
         3'd2: count <= count - 3;
         3'd3: count <= count - 4;
         3'd4: count <= count - 5;
         3'd5: count <= count - 6;
         3'd6: count <= count - 7;
         3'd7: count <= count - 8;
         default: count <= count;
    endcase
       end
  end
     
     else if(load==1)
       begin
       count<=din;
       end
     assign timer_event =( (up_down==1 && count >= sat_count)|| (up_down==0 && count ==0));
     
//      else if(up_down==1 && count >= sat_count)
//        begin
//         timer_event<=1'b1;
//        end
//      else if((up_down==0 && count ==0))
//        begin
//         timer_event<=1'b1;
//        end
    end
     endmodule
