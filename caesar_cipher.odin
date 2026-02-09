package cipher

import "core:fmt"


main :: proc()
{
    my_str := "xyz"
    
    encrypted_str := encrypt(my_str, 2)
    fmt.printf("Before: %s\nAfter: %s\n", my_str, encrypted_str)
}