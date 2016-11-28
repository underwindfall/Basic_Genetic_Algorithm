function [num]=Hamming_distance(A,B)

num =sum(xor(A,B));

end