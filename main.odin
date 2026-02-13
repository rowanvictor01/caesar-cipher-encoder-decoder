package cipher

import "core:fmt"


main :: proc()
{
    my_text := "Learn First Lesson In Programming: THE THE FUNDAMENTALS"
    my_offset: i8 = 83
    // Encrypt
    encrypted_str := encrypt(my_text, my_offset)
    fmt.printf("Before: %s\nAfter: %s\nOffset: %d\n\n", my_text, encrypted_str, my_offset)
    // Decrypt
    decrypted_str := encrypt(encrypted_str, -my_offset)
    fmt.printf("Encrypted: %s\nDecrypted: %s\nOffset: %d\n\n", encrypted_str, decrypted_str, my_offset)
    

    // START
    display_menu()
    input, ok := get_user_selection()

    if !ok
    {
	fmt.eprintfln("[ERROR] failed getting valid input\n")
	return
    }

    fmt.printfln("Your input: %s", input)
}
