package cipher

import "core:fmt"


main :: proc()
{
    strarr: [4]string = {"cde", "poGi", "ABC", ""}
    
    intarr: [4]i8 = {0, 26, -1, 3}
    
    for i := 0; i < 4; i += 1
    {
	encrypted_str := encrypt(strarr[i], intarr[i])
	fmt.printf("Before: %s\nAfter: %s\nOffset: %d\n\n", strarr[i], encrypted_str, intarr[i])
    }
}
