package cipher

import "core:fmt"
import "core:strings"


encrypt :: proc(text: string, offset: i8) -> string
{
    builder := strings.Builder{}
    base: i8 = 65

    for i := 0; i < len(text); i += 1
    {
	// Ignore chars that's not a letter
	if text[i] < 65 || (text[i] > 90 && text[i] < 97) || text[i] > 122
	{
	    strings.write_byte(&builder, text[i])
	    continue
	}

	// Check if current char is lower or upper case
	if text[i] >= 65 && text[i] <= 90
	{
	    base = 65  // ASCII code for 'A'
	}
	else if text[i] >= 97 && text[i] <= 122
        {
	    base = 97  // ASCII code for 'a'
	}

        strings.write_byte(&builder, u8((((i8(text[i]) - base) + offset) % 26) + base))
    }
    
    return strings.to_string(builder)
}
