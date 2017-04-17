`include "constant.v"
module cache(memRead, memWrite,value,address,out,hit,led1,led2,led3,led4);
	
	parameter mode = 0;//0 = direct map, 1 = set associative, 2 = fully associative
	input memRead;
	input memWrite;
	input [31:0]value;
	input [31:0]address;
	output reg [31:0]out;
	output reg hit;
	output reg led1;
	output reg led2;
	output reg led3;
	output reg led4;
	integer i;
	reg[31:0]mem_array[255:0];
	integer updateLeft;
	integer largestAge;
	reg [31:0]location;
	reg[31:0]tag[255:0];
	reg[7:0]age[255:0];//keep track of last use block (age counter)
	
	initial
	begin
		//Initialize every memory block in increasement of 5
		for(i = 0; i < 256; i = i + 1)
			mem_array[i] = i * 5;
		//Initialize tag
		for(i = 0; i < 256; i = i + 1)
			tag[i] = 0;
		//Initialize age counter
		for(i = 0; i < 256;i = i + 1)
			age[i] = i;
	end
	
	always @ (memRead or memWrite or value or address)
	begin
	hit = 0;
		if(mode == 0)
		begin
			location = address[9:2];
		end
		else if(mode == 1)
		begin
			location = address[8:2];
			location = location + (address[9])*128;//Change to the correct location for set associative mapping address[9] is the index
		end
				
		if (memRead == 1)//READ
		begin
			//READ PROCESS FOR DIRECT MAPPING AND SET ASSOCIATIVE
			if(mode != 2)
			begin
				if(tagCheck(address[31:10],tag[location][31:10]))//Verilog does not allow size using variable ( address[31:32-tagSize])
				begin
					hit = 1;
					out = mem_array[location];//set output
					//Update age counter
					if(age[location] != 0)
					begin
						updateLeft = age[location];
						largestAge = age[location];
						age[location] = 0;
						i = 0;
						while(i < 256 & updateLeft > 0)
						begin
							if(age[i] < largestAge & i != location)
							begin
								age[i] = age[i] + 1;
								updateLeft = updateLeft - 1;
							end
							i = i + 1;
						end
					end
				end
				else
				begin
					//miss handle
					
					//Update age counter
					if(age[location] != 0)
					begin
						updateLeft = age[location];
						largestAge = age[location];
						age[location] = 0;
						i = 0;
						while(i < 256 & updateLeft > 0)
						begin
							if(age[i] < largestAge & i != location)
							begin
								age[i] = age[i] + 1;
								updateLeft = updateLeft - 1;
							end
							i = i + 1;
						end
					end
					
					//update the tag BUT WE DON'T HAVE THE VALUE YET
					tag[location] = address[31:10];
				end
			end
			//READ PROCESS FOR FULLY ASSOCIATIVE
			else
			begin
				location = 0;
				while(location < 256 & hit == 0)//Going through the cache until we find a hit
				begin
					
					if(tagCheck(address[31:2],tag[location][31:2]))
					begin
						out = mem_array[i];
						hit = 1;
						//Update age counter
						if(age[i] != 0)
						begin
							updateLeft = age[location];
							largestAge = age[location];
							age[location] = 0;
							i = 0;
							while(i < 256 & updateLeft > 0)
							begin
								if(age[i] < largestAge & i != location)
								begin
									age[i] = age[i] + 1;
									updateLeft = updateLeft - 1;
								end
								i = i + 1;
							end
						end
					end
					
					location = location + 1;
				end
			end
		end
		
		else if (memWrite == 1)//WRITE
		begin
		
			//WRITE PROCESS FOR DIRECT MAPPING AND SET ASSOCIATIVE
			
			mem_array[location] = value;
			if(mode != 2)
			begin
				if(tagCheck(address[31:10],tag[location][31:10]))
					hit = 1;
				else
					hit = 0;
				tag[location] = address[31:10];
			end
			//WRITE PROCESS FOR FULLY ASSOCIATIVE
			else
			begin
				if(tagCheck(address[31:2],tag[location][31:2]))
					hit = 1;
				else
					hit = 0;
				tag[location] = address[31:2];
			end
			
			//Update age counter
					if(age[location] != 0)
					begin
						updateLeft = age[location];
						largestAge = age[location];
						age[location] = 0;
						i = 0;
						while(i < 256 & updateLeft > 0)
						begin
							if(age[i] < largestAge & i != location)
							begin
								age[i] = age[i] + 1;
								updateLeft = updateLeft - 1;
							end
							i = i + 1;
						end
					end
		end
		led1 = mem_array[1][0];
		led2 = mem_array[1][1];
		led3 = mem_array[1][2];
		led4 = mem_array[1][3];
	end
	
	//Function to check if the tags match
	function tagCheck;
	input requestTag, memoryTag;
	begin
		if(requestTag == memoryTag)
			tagCheck = 1;
		else
			tagCheck = 0;
	end
	endfunction
	
endmodule
