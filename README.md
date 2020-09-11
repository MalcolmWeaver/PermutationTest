# PermutationTest
## This contains a GNU assembler implementation of the permutation test's Algorithm P (which enumerates every permutation of an array by relative magnitude) from page 64 of Seminumerical Algorithms. Donald Knuth also notes "that Algorithm P can be run backwards." A GAS implementation of this is also included. (I believed the book contains a minor error when describing the inverse algorithm, and I wrote this in order to check if it was in fact an error. I believe it is.)


### The arrays etc. are hardcoded into the assembly, but should be easy to change
#### For Algorithm P:
-`as find_max.s -o find_max.o`
-`as print_reg.s -o print_reg.o`
-`as permutations.s -o permutations.o`
-`ld find_max.o print_reg.o permutations.o -o permutations`
-`./permutations`


#### For the "inverse" of Algorithm P:
-`as print_reg.s -o print_reg.o`
-`as InverseAlgP.s -o InverseAlgP.o`
-`ld InverseAlgP.o print_reg.o find_max.o -o InverseAlgP`
-`./InverseAlgP`
