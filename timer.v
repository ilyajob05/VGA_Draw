// �����: ��������� ���� ����������
// ����: 02:06:2014�.
// �����������: ���"����������"

// ������ ������ ��������� ������� �� ��������� ��������� �������

`timescale 1ns / 1ps


module timer #(parameter period = 10) // period-������ ������ �������
(
input clk,
input rst,
output reg out); // ����� �������
	
function integer log2;
input integer value;
begin
	for (log2=0; value>0; log2=log2+1)
		value = value>>1;
end
endfunction

parameter N = log2(period);

reg [N-1:0]counter;

always @(posedge clk, posedge rst)
if(rst)
	begin
	// �������� �������� �������
	counter <= 0;
	end
else
	// ��������� �������, ������������ �������
	if(counter == 0)
		begin
			counter <= period - 1; // �������� +1
			out <= 1;
		end
	else
		// ������� ���� �������
		begin
			counter <= counter - 1;
			out <= 0;
		end

endmodule
