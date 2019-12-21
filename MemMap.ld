MEMORY 
{
    CODE    (rx) : ORIGIN = 0x0000, LENGTH = 0x000200
}

SECTIONS
{
    code :
    {
        *(init)
        *(main)
    } 
    . = ALIGN(32);
    bss : 
    {
        *(bss BSS)
    }
}