module accel_and_break(clk,rst,accel,break,gear,key2,count_out);


parameter MOD = 10;
parameter BITS = 4;

input clk ,rst,accel,break,key2;
input [2:0] gear;
output reg [ BITS -1:0] count_out ;


always@(posedge clk)
begin
      if( rst )
      begin
         if(key2)
         begin
            if(gear==5)
               begin
                  if ( break )
                  begin
                     if ( count_out > 75)
                     begin
                      count_out <= count_out - 1;              
                     end
                  end
                  else if( !break )
                  begin
                     if(accel)
                     begin
                        if ( count_out < 99 )
                        begin
                        count_out <= count_out + 1;
                        end
                     end
                  end              
                  else 
                    begin
                    count_out <= count_out; 
                    end
               end
            else if(gear==4)
                  begin
                  if ( break )
                  begin
                     if ( count_out > 55)
                     begin
                      count_out <= count_out - 1;               
                     end
                  end
                  else if( !break )
                  begin
                     if(accel)
                     begin
                        if ( count_out < 85 )
                        begin
                        count_out <= count_out + 1;
                        end
                     end
                  end             
                  else 
                    begin
                    count_out <= count_out; 
                  end
               end
            else if(gear==3)
               begin
                  if ( break )
                  begin
                     if ( count_out > 35)
                     begin
                      count_out <= count_out - 1;              
                     end
                  end
                  else if( !break )
                  begin
                     if(accel)
                     begin
                        if ( count_out < 65 )
                        begin
                        count_out <= count_out + 1;
                        end
                     end
                  end
                  else 
                    begin
                    count_out <= count_out; 
                    end
               end
            else if(gear==2)
               begin
                  if ( break )
                  begin
                     if ( count_out > 15)
                     begin
                      count_out <= count_out - 1;            
                     end
                  end
                  else if( !break )
                  begin
                     if(accel)
                     begin
                        if ( count_out < 45 )
                        begin
                        count_out <= count_out + 1;
                        end
                     end
                  end
                  else 
                    begin
                    count_out <= count_out; 
                    end
               end
            else if(gear==1)
            begin
               if ( break )
               begin
                  if ( count_out > 0)
                  begin
                   count_out <= count_out - 1;
                  end
               end
               else if( !break )
               begin
                  if(accel)
                  begin
                     if ( count_out < 25 )
                     begin
                     count_out <= count_out + 1;
                     end
                  end
               end
               else 
                    begin
                    count_out <= count_out; 
                    end
            end
            else if(gear==6)
            begin
               if ( break )
               begin
                  if ( count_out > 0)
                  begin
                   count_out <= count_out - 1;
                  end
               end
               else if( !break )
               begin
                  if(accel)
                  begin
                     if ( count_out < 99 )
                     begin
                     count_out <= count_out + 1;
                     end
                  end
               end
               else 
                    begin
                    count_out <= count_out; 
                    end
            end
            else
            begin
               if (break)
               begin
                  if (count_out == 0)
                  begin
                  count_out <= count_out;
                  end
               end
               else if( !break )
               begin
                  if(accel)
                  begin
                     if(count_out == 0 );
                     begin
                     count_out <= count_out;
                     end
                  end
               end            
               else 
                 begin
                 count_out <= count_out; 
                 end
            end
         end
         else
         begin
            if (break)
               begin
                  if (count_out > 10 )
                  begin
                  count_out <= count_out - 10;
                  end
                  else if(count_out >5)
                  begin
                     count_out <= count_out -5;
                  end
                  else if(count_out>0)
                  begin
                     count_out <= count_out -1;
                  end
               end            
            else 
               begin
                 count_out <= count_out; 
              end
         end
      end
      else 
         begin
         count_out <= 0;
         end
end

endmodule