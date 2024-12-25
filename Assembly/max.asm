.data
	array: .word 5 
	size: .word 5 
.text
.globl main

main:
    la $t0, array       		#loading the base address of the array 
    lw $t1, size        		#loading the base size of the array

    lw $t2, 0($t0)      		#first element of the array
    move $t4, $t2       		#moving the first element of the array in $t3, here, we will compare the value in $t3 with other values and keep the max value here

    li $t6, 0           		#index
	
loop_max:
    beq $t6, $t1, end_max 		#if index == size of array, the loop will end

    lw $t7, 0($t0)      		#loading the current array element into $t7

    bgt $t7, $t4, update_max	#undating the max value
    j skip_max
	
update_max:
    move $t4, $t7				#keeping the max value in $t3
	
skip_max:						#moving to the next element
    addi $t6, $t6, 1			#index += 1
    addi $t0, $t0, 4    		#moving to the next word in memory
    j loop_max

end_max:						#storing the max value to $a0 for output
    move $a0, $t4
	
    li $v0, 10          		#syscall to exit
    syscall
