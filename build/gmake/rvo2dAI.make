# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/rvo2dAI
  TARGETDIR  = ../lib
  TARGET     = $(TARGETDIR)/librvo2dAI.so
  DEFINES   += -DENABLE_GUI -DENABLE_GLFW -DDEBUG
  INCLUDES  += -I../../steerlib/include -I../../rvo2AI/include -I../../external -I../../util/include -I../../kdtree/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -Wall -g -fPIC -std=c++11 -g -std=c++0x -ggdb
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared -Wl,-rpath,/home/parthmehrotra/a5/steersuite-rutgers/build/lib -L../lib
  LIBS      += -lsteerlib -lutil
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../lib/libsteerlib.so ../lib/libutil.so
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/rvo2dAI
  TARGETDIR  = ../lib
  TARGET     = $(TARGETDIR)/librvo2dAI.so
  DEFINES   += -DENABLE_GUI -DENABLE_GLFW -DNDEBUG
  INCLUDES  += -I../../steerlib/include -I../../rvo2AI/include -I../../external -I../../util/include -I../../kdtree/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -Wall -g -O2 -fPIC -std=c++11 -g -std=c++0x -ggdb
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared -Wl,-rpath,/home/parthmehrotra/a5/steersuite-rutgers/build/lib -L../lib
  LIBS      += -lsteerlib -lutil
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../lib/libsteerlib.so ../lib/libutil.so
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/RVO2DAgent.o \
	$(OBJDIR)/RVO2DAIModule.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking rvo2dAI
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning rvo2dAI
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/RVO2DAgent.o: ../../rvo2AI/src/RVO2DAgent.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/RVO2DAIModule.o: ../../rvo2AI/src/RVO2DAIModule.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
