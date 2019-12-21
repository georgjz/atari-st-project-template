# Simple Sega Genesis/Mega Drive Project Template

This is a simple project template for assembly programming projects for cross-developing for the Sega Genesis/Mega Drive. You'll need [make][3], [vasm][1], and [m68k-elf-ld][2] installed for it to work. Check your distribution's package manager.

The example code in this repository loads a palette into VDP and displays a simple sprite. Then it enters an endless loop.

I prefer to assemble files into object files first and link them into an executable/ROM in a separate step. So the Makefile in this repository uses both the [vasm assembler][1] and [m68k-elf-ld linker][2].


## Usage 

Use git to clone this repository:

```bash
git clone https://github.com/georgjz/genesis-project-template
cd genesis-project-template
make
```

The makefile will look for all source files ending with `*.s` in the directory `src/` and all its subdirectories. Include files ending with `*.inc` will automatically added to the assembler arguments with `-I`. These files are translated into object files and listings will be placed in the directory `obj/`. Finally, the linker will build the final executable and place it in `build/release`.

**NOTE**: There's no difference between the `debug` and `release` configuration as of now. Standard is `release`. You can add your own `debug` configuration if you wish so.

### Switching between Syntax Standards

I prefer vasm's [Motorola Syntax][4]; if you wish to use another syntax, you'll need to modify line 20 in the Makefile.

**WARNING**: Switching to another syntax/assembler might break the example code given here.

## Example Code 

Parts of this code was taken from [Marc's excellent introduction][7]. If you prefer to use gcc-based tools instead of [vasm][1], check out his amazing blog. 

Add description here.

## License 

All code in this repository is under the [MIT license][6].

[1]: http://sun.hasenbraten.de/vasm/
[2]: https://linux.die.net/man/1/m68k-linux-gnu-ld
[3]: https://www.gnu.org/software/make/
[4]: http://sun.hasenbraten.de/vasm/release/vasm.html
[5]: https://www.reaktor.com/blog/crash-course-to-amiga-assembly-programming/
[6]: https://opensource.org/licenses/MIT
[7]: https://darkdust.net/writings/megadrive/initializing