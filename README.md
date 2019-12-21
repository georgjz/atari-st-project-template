# Simple Atari ST Project Template

This is a simple project template for assembly programming projects for cross-developing for the Atari ST. You'll need [make][3], [vasm][1], and [vlink][2] installed for it to work. Check your distribution's package manager.

The example code in this repository loads a palette into VDP and displays a simple sprite. Then it enters an endless loop.

I prefer to assemble files into object files first and link them into an executable/ROM in a separate step. So the Makefile in this repository uses both the [vasm assembler][1] and [vlink linker][2].

## Usage 

Use git to clone this repository:

```bash
git clone https://github.com/georgjz/atari-st-project-template
cd atari-st-project-template
make
```

The makefile will look for all source files ending with `*.s` in the directory `src/` and all its subdirectories. Include files ending with `*.inc` will automatically added to the assembler arguments with `-I`. These files are translated into object files and listings will be placed in the directory `obj/`. Finally, the linker will build the final executable and place it in `build/`.

### Switching between Syntax Standards

I prefer vasm's [Motorola Syntax][4]; if you wish to use another syntax, you'll need to modify line 20 in the Makefile.

**WARNING**: Switching to another syntax/assembler might break the example code given here.

## Example Code 

There's two source files in `src/`:
- `init.s` contains the code that GEMDOS requires the program to execute. It will calculate its own size, and uses [`Mshrink`][8] to shrink the TPA to the correct size. It then jumps to the `Main` routine.
- `main.s` contains the `Main` routine. It switches to supervisor mode. Then it waits for the space key to be pressed. Once space it pressed, it calls [`Pterm`][9] to exit the program and return to TOS. It also contains the bss definition for the user stack.

## License 

All code in this repository is under the [MIT license][6].

[1]: http://sun.hasenbraten.de/vasm/
[2]: http://sun.hasenbraten.de/vlink/
[3]: https://www.gnu.org/software/make/
[4]: http://sun.hasenbraten.de/vasm/release/vasm.html
[5]: https://www.reaktor.com/blog/crash-course-to-amiga-assembly-programming/
[6]: https://opensource.org/licenses/MIT
[7]: https://darkdust.net/writings/megadrive/initializing
[8]: https://freemint.github.io/tos.hyp/en/gemdos_memory.html#Mshrink
[9]: https://freemint.github.io/tos.hyp/en/gemdos_process.html#Pterm