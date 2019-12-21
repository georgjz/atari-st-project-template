MEMORY 
{
    CODE    (rx) : ORIGIN = 0x0000, LENGTH = 0x000200
}

SECTIONS
{
    /*. = 0x001a; */
    code :
    {
        /* . = 0x001a; */
        *(init)
        *(main)
        /*. = ORIGIN(CODE) + LENGTH(CODE);*/
    } /* >CODE */
    . = ALIGN(32);
    bss : 
    {
        *(bss BSS)
    }
}

/* OUTPUT_FORMAT(binary) */