MEMORY 
{
    HEADER  (rx) : ORIGIN = 0x0000, LENGTH = 0x000200
    ROM1    (rx) : ORIGIN = 0x0200, LENGTH = 0x020000
}

SECTIONS
{
    header :
    {
        *(header)
        . = ORIGIN(HEADER) + LENGTH(HEADER);
    }

    text : 
    {
        *(reset)
        *(text)
        . = ORIGIN(ROM2) + LENGTH(ROM2);
    } >ROM1
}

OUTPUT_FORMAT(binary)