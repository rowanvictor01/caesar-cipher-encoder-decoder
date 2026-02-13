package cipher

import "core:fmt"
import "core:os"
import "core:bufio"
import "core:strings"
import "core:strconv"


display_menu :: proc()
{
    fmt.println("=====|CAESAR CIPHER PROGRAM|=====\n")
    fmt.println("[1] ENCRYPT a message")
    fmt.println("[2] DECRYPT an enrypted message")
    fmt.println("[3] Quit ('q')")
}


get_user_input :: proc(prompt: string) -> (string, bool)
{
    scanner: bufio.Scanner
    stdin := os.stream_from_handle(os.stdin)
    bufio.scanner_init(&scanner, stdin, context.temp_allocator)
    
    // Prompt user and get input
    fmt.printf("%s >> ", prompt)
    if !bufio.scanner_scan(&scanner)
    {
	fmt.eprintln("\n[ERROR] scan failed\n")
	return "", false
    }
    
    // Get text from input buf and trim newline and whitespaces
    input := bufio.scanner_text(&scanner)
    input = strings.trim_space(input)
    
    return input, true
}


is_input_valid :: proc(input: string) -> bool
{
    switch input
    {
	case "q":
	    fallthrough
	case "1":
	    fallthrough
	case "2":
	    return true
	case:
	    return false
    }
}


get_text :: proc() -> (string, i8)
{
    // Declare variables
    txt: string
    shift: i64
    shift_str: string
    ok: bool

    for
    {
	// Prompt user for text and shift value
	txt, ok = get_user_input("Enter text")

	// Check if no errors on text
	if !ok
	{
	    continue
	}

	shift_str, ok = get_user_input("Enter shift value") 

	// Check if no errors on shift
	if !ok
	{
	    continue
	}
	
	// Parse string representation of shift value to u64
        // before casting to u8

	shift, ok = strconv.parse_i64(shift_str)
	if !ok || shift > 255
	{
	    fmt.eprintfln("\n[ERROR] invalid shift value\n")
	    continue
	}
	break
    }

    return txt, i8(shift)
}
