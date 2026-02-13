package cipher

import "core:fmt"
import "core:os"
import "core:bufio"
import "core:strings"


display_menu :: proc()
{
    fmt.println("=====|CAESAR CIPHER PROGRAM|=====\n")
    fmt.println("[1] ENCRYPT a message")
    fmt.println("[2] DECRYPT an enrypted message")
    fmt.print(">> ")
}


get_user_selection :: proc() -> (string, bool)
{
    scanner: bufio.Scanner
    stdin := os.stream_from_handle(os.stdin)
    bufio.scanner_init(&scanner, stdin, context.temp_allocator)
    
    // Prompt user and get input
    fmt.print("Enter message to encrypt >> ")
    if !bufio.scanner_scan(&scanner)
    {
	fmt.eprint("[ERROR] scan failed")
	return "", false
    }
    
    // Get text from input buf and trim newline and whitespaces
    input := bufio.scanner_text(&scanner)
    input = strings.trim_space(input)
    
    return input, true
}
