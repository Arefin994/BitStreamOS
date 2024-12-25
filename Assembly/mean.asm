.data 
	 array: .word 5 
	 size: .word 5
.text
.globl main

main:
    la $t0, array       		#loading the base address of the array 
    lw $t1, size        		#loading the base size of the array

    move $t5, $zero     		#initializing sum to 0

    li $t6, 0           		#index
	
loop_mean:
    beq $t6, $t1, end_mean 		#if index == size of array, the loop will end

    lw $t7, 0($t0)      		#loading the current array element into $t7

    add $t5, $t5, $t7			#sum += next_value

    addi $t6, $t6, 1			#index += 1
    addi $t0, $t0, 4    		#moving to the next word in memory
	
    j loop_mean

end_mean:						#calculating the mean: sum/size
    div $t5, $t1        		#mean = sum/size = $t5/$t1
	
								#quotient in LO, remainder in HI
								#We only need the quotient i.e. mean here, so we will be using mflo
	
    mflo $a0            		#storing the mean value to $a0 for output

    li $v0, 10          		#syscall to exit
    syscall
