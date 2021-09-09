 #Author: María Alejandra Moreno (cod_end = 3; cc_end =3)
#Date 21-09-09 
#Version 1.0.0
line=Oh poetas por que cantais la rosa sino hacedla florecer. 
line_bi=1001000 1101111 1101100 1100001 0100000 1101101 1110101 1101110 1100100 1101111 0100000
line_oct=May the force be with you

chrbin() {
    echo \
} 

 function textobinario () {
    echo -n $* | while IFS= read -r -n1 char 
    do
        ordbin $char | tr -d `
`
    
        echo -n  
    done
} 

function binariotexto () {
    for bin in $* 
    do
        chrbin $bin | tr -d 

        
    done
}
function textooctal () {
    echo -n $* | while IFS= read -r -n1 char2 
    do
        ordoct  $char2| tr -d 

    
        echo -n  
    done
}
touch textobinario.txt textooctal.txt binariotexto.txt
-e echo -e textobinario $line>>textotextobinario.txt
echo -e   
echo -e binariotexto $line_bi>>binariotexto.txt
echo -e textooctal $line_oct >>textooctal.txt
