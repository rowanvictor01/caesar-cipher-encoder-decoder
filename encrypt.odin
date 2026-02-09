package cipher

import "core:fmt"
import "core:strings"


encrypt :: proc(text: string, offset: i8) -> string
{
    //chars: [dynamic]u8
    builder := strings.Builder{}

    for i := 0; i < len(text); i += 1
    {
	// Store the string's chars seprately into an array
        // with the offset calculated

        strings.write_byte(&builder, u8(i8(text[i]) + offset)) // [FIX]: Z should wrap around back to A
    }
    
    return strings.to_string(builder)
}