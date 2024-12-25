.text
main:
    addi $4,$0,27			//4 has 27
    xori $5,$4,5			//5 has 3
    add $6,$4,$5			//6 has 57
    sub $7,$5,$4			//7 has 3
    slt $8,$7,$6			//8 has 1
    or $9,$7,$0			    //9 has 3
    and $10,$7,$0			//10 has 0
    sll $11,$7,1			//11 has 6
    srl $12,$7,1			//12 has 1
    slt $13,$8,$7           //13 has 1
    li $14, 12              //14 has 12
    li $15, 110             //15 has 110
    li $16, 120             //16 has 120
    sw $15, 4($14)          //dmem 16 has 110
    sw $16, 8($14)          //dmem 20 has 120
    lw $17, 4($14)          //reg 16 has 110
