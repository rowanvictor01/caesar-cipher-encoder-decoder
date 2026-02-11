package cipher

import "core:fmt"


main :: proc()
{
    my_str := "HELLO WORLD!"
    
    encrypted_str := encrypt(my_str, 3)
    fmt.printf("Before: %s\nAfter: %s\n", my_str, encrypted_str)
}
