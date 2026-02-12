package cipher

import "core:fmt"


main :: proc()
{
    my_text := "Hello, World!!"
    my_offset: i8 = -4
    encrypted_str := encrypt(my_text, my_offset)
    fmt.printf("Before: %s\nAfter: %s\nOffset: %d\n\n", my_text, encrypted_str, my_offset)
}
