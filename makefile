# Makefile for a dummy Atari ST assembly project
# -------------------------------------------

# Edit this portion to fit your project
BUILDNAME    = demo.prg     # name of the final ROM
LINKERSCRIPT = MemMap.ld

################################################
##### DO NOT EDIT ANYTHING BELOW THIS LINE #####
###### UNLESS YOU KNOW WHAT YOU ARE DOING ######
################################################

# determine which version to build

# Assembler and Linker
AS      = vasmm68k_mot
ASFLAGS = -spaces -Felf $(INCARGS) # $(BINARGS)
LD      = vlink
LDFLAGS = -s -b ataritos -M -T $(LINKERSCRIPT) -t 

# Directories
SRCDIR   = src
OBJDIR   = obj
BUILDDIR = build

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# Generate include directories list
INCLUDES := $(call rwildcard,./,*.inc)          # find all *.inc files
INCDIRS  := $(sort $(dir $(INCLUDES)))          # remove file names, sort them
INCARGS  := $(foreach inc, $(INCDIRS),-I$(inc)) # add to list of include paths

# Sources
SOURCES := $(call rwildcard,./,*.s)             # list all source files
SSRC := $(notdir $(SOURCES))                    # remove file paths
SOBJ := $(patsubst %.s, $(OBJDIR)/%.o, $(SSRC))
vpath %.s $(dir $(SOURCES))                     # add source directories to vpath

# Recipes
EXECUTABLE = $(BUILDDIR)/$(BUILDNAME)

$(EXECUTABLE): $(SOBJ)
	$(LD) $(LDFLAGS) -o $@ $^

$(OBJDIR)/%.o: %.s
	$(AS) $(ASFLAGS) -L $@Listing.txt -o $@ $< 

.PHONY: clean
clean:
	@rm -f $(OBJDIR)/*.*
	@rm -f $(EXECUTABLE)

dir:
	@mkdir -p $(OBJDIR)
	@mkdir -p $(BUILDDIR)