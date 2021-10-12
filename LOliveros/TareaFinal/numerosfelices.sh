#!/usr/bin/bash
#Title: Calculadora de números felices
#Author: Juan A. y Laura O.
#Date: 10/10/21
#Version: 0.0.1

echo "Calculadora de números felices"
echo "Digite el número, debe ser máximo 3 dígitos: "
read num

if [ $num -eq 1 ] || [ $num -eq 7 ] || [ $num -eq 10 ] || [ $num -eq 13 ] || [ $num -eq 19 ] || [ $num -eq 23 ] || [ $num -eq 28 ] || [ $num -eq 31 ] || [ $num -eq 32 ] || [ $num -eq 44 ] || [ $num -eq 49 ] || [ $num -eq 68 ] || [ $num -eq 70 ] || [ $num -eq 79 ] || [ $num -eq 82 ] || [ $num -eq 86 ] || [ $num -eq 91 ] || [ $num -eq 94 ] || [ $num -eq 97 ] || [ $num -eq 100 ] || [ $num -eq 103 ] || [ $num -eq 109 ] || [ $num -eq 129 ] || [ $num -eq 130 ] || [ $num -eq 133 ] || [ $num -eq 139 ] || [ $num -eq 167 ] || [ $num -eq 176 ] || [ $num -eq 188 ] || [ $num -eq 190 ] || [ $num -eq 192 ] || [ $num -eq 193 ] || [ $num -eq 203 ] || [ $num -eq 208 ] || [ $num -eq 219 ] || [ $num -eq 226 ] || [ $num -eq 230 ] || [ $num -eq 236 ] || [ $num -eq 239 ] || [ $num -eq 262 ] || [ $num -eq 263 ] || [ $num -eq 280 ] || [ $num -eq 291 ] || [ $num -eq 293 ] || [ $num -eq 301 ] || [ $num -eq 302 ] || [ $num -eq 310 ] || [ $num -eq 313 ] || [ $num -eq 319 ] || [ $num -eq 320 ] || [ $num -eq 326 ] || [ $num -eq 329 ] || [ $num -eq 331 ] || [ $num -eq 338 ] || [ $num -eq 356 ] || [ $num -eq 362 ] || [ $num -eq 365 ] || [ $num -eq 367 ] || [ $num -eq 368 ] || [ $num -eq 376 ] || [ $num -eq 379 ] || [ $num -eq 383 ] || [ $num -eq 386 ] || [ $num -eq 391 ] || [ $num -eq 392 ] || [ $num -eq 397 ] || [ $num -eq 404 ] || [ $num -eq 409 ] || [ $num -eq 440 ] || [ $num -eq 446 ] || [ $num -eq 464 ] || [ $num -eq 469 ] || [ $num -eq 478 ] || [ $num -eq 487 ] || [ $num -eq 490 ] || [ $num -eq 496 ] || [ $num -eq 536 ] || [ $num -eq 556 ] || [ $num -eq 563 ] || [ $num -eq 565 ] || [ $num -eq 566 ] || [ $num -eq 608 ] || [ $num -eq 617 ] || [ $num -eq 622 ] || [ $num -eq 623 ] || [ $num -eq 632 ] || [ $num -eq 635 ] || [ $num -eq 637 ] || [ $num -eq 638 ] || [ $num -eq 644 ] || [ $num -eq 649 ] || [ $num -eq 653 ] || [ $num -eq 655 ] || [ $num -eq 656 ] || [ $num -eq 665 ] || [ $num -eq 671 ] || [ $num -eq 673 ] || [ $num -eq 680 ] || [ $num -eq 683 ] || [ $num -eq 694 ] || [ $num -eq 700 ] || [ $num -eq 709 ] || [ $num -eq 716 ] || [ $num -eq 736 ] || [ $num -eq 739 ] || [ $num -eq 748 ] || [ $num -eq 761 ] || [ $num -eq 763 ] || [ $num -eq 784 ] || [ $num -eq 790 ] || [ $num -eq 793 ] || [ $num -eq 802 ] || [ $num -eq 806 ] || [ $num -eq 818 ] || [ $num -eq 820 ] || [ $num -eq 833 ] || [ $num -eq 836 ] || [ $num -eq 847 ] || [ $num -eq 860 ] || [ $num -eq 863 ] || [ $num -eq 874 ] || [ $num -eq 881 ] || [ $num -eq 888 ] || [ $num -eq 899 ] || [ $num -eq 901 ] || [ $num -eq 904 ] || [ $num -eq 907 ] || [ $num -eq 910 ] || [ $num -eq 912 ] || [ $num -eq 913 ] || [ $num -eq 921 ] || [ $num -eq 923 ] || [ $num -eq 931 ] || [ $num -eq 932 ] || [ $num -eq 937 ] || [ $num -eq 940 ] || [ $num -eq 946 ] || [ $num -eq 964 ] || [ $num -eq 970 ] || [ $num -eq 973 ] || [ $num -eq 989 ] || [ $num -eq 998 ]
then
  echo "El número es feliz"
else
  echo "El número no es feliz"
fi

exit 0
