package cipher

import "core:fmt"


main :: proc()
{
    input: string
    for
    {
	ok: bool

	// Prompt user to make selection
	display_menu()
	input, ok = get_user_input("")

	// Check if scan failed
	if !ok
	{
	    continue
	}

	// Check if input is valid
	if !is_input_valid(input)
	{
	    fmt.printfln("\n[WARNING] Your input (%s) is invalid. Please enter based on given selection!\n", input)
	    continue
	}

	// Check if user wants to quit
	if input == "q"
	{
	    break
	}
	break
    }
    
    switch input
    {
	case "1":
	    txt, shift := get_text()
	    encrypted_txt := encrypt(txt, shift)
	    fmt.printfln("Encrypted Text: %s", encrypted_txt)

	case "2":
	    txt, shift := get_text()
	    encrypted_txt := encrypt(txt, -shift)
	    fmt.printfln("Decrypted Text: %s", encrypted_txt)
    }
}
