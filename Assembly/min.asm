.data 
	 array: .word 5 
	 size: .word 5 
.text
.globl main

main:
    la $t0, array       		#loading the base address of the array 
    lw $t1, size        		#loading the base size of the array

    lw $t2, 0($t0)      		#first element of the array
    move $t3, $t2       		#moving the first element of the array in $t3, here, we will compare the value in $t3 with other values and keep the min value here

    li $t6, 0           		#index
	
loop_min:
    beq $t6, $t1, end_min 		#if index == size of array, the loop will end

    lw $t7, 0($t0)      		#loading the current array element into $t7

    blt $t7, $t3, update_min	#undating the min value
    j skip_min
	
update_min:
    move $t3, $t7				#keeping the min value in $t3
	
skip_min:						#moving to the next element
    addi $t6, $t6, 1			#index += 1
    addi $t0, $t0, 4    		#moving to the next word in memory
    j loop_min

end_min:						#storing the min value to $a0 for output
    move $a0, $t3
	
    li $v0, 10          		#syscall to exit
    syscall
