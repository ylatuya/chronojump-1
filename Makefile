# **************************************************************************
# Fichero makefile.
# --------------------------------------------------------------------------
# Licencia GPL. Juan Gonzalez Gomez, Xavier de Blas Foix
# --------------------------------------------------------------------------
#
#***************************************************************************


#---- Compilador de C
CC = gcc
CFLAGS = -Wall

#-- Compilador de C#
MCS = mcs

#-------- Nombres y dependencias de los programas a construir

CHRONOJUMP = chronojump

CHRONOJUMP_DEP_GUI = src/gui/confirm.cs src/gui/error.cs src/gui/jump.cs src/gui/jumpType.cs src/gui/person.cs src/gui/preferences.cs src/gui/session.cs
CHRONOJUMP_DEP_STATS = src/stats/main.cs src/stats/global.cs src/stats/sjCmjAbk.cs src/stats/sjCmjAbkPlus.cs src/stats/dj.cs src/stats/djIndex.cs src/stats/rjIndex.cs src/stats/rjPotencyAguado.cs src/stats/ieIub.cs
CHRONOJUMP_DEP_GRAPHS = src/stats/graphs/global.cs src/stats/graphs/sjCmjAbk.cs

CHRONOJUMP_DEP_SQLITE = src/sqlite/main.cs src/sqlite/preferences.cs src/sqlite/person.cs src/sqlite/session.cs src/sqlite/jump.cs src/sqlite/jumpType.cs src/sqlite/personSession.cs src/sqlite/stat.cs

CHRONOJUMP_DEP = src/chronojump.cs src/person.cs src/jump.cs src/jumpType.cs src/session.cs src/catalog.cs src/exportSession.cs src/treeViewJump.cs src/util.cs $(CHRONOJUMP_DEP_GUI) $(CHRONOJUMP_DEP_STATS) $(CHRONOJUMP_DEP_GRAPHS) $(CHRONOJUMP_DEP_SQLITE)

RESOURCES = -resource:glade/chronojump.glade,chronojump.glade 
CHRONOJUMP_LIB =  -pkg:gtk-sharp -pkg:gnome-sharp -pkg:glade-sharp -r System.Data -r Mono.Data.SqliteClient

#all: $(CHRONOJUMP).exe $(TEST1).exe 
all: $(CHRONOJUMP).exe test-mono 

LIBCHRONOPIC = libchronopic.so
LIBCHRONOPIC_DEP = chronopic.o 

DLL_CHRONOPIC = chronopic


NAME5= test-saltos.mono
DEP5 = $(NAME5).cs $(DLL_CHRONOPIC).dll


#-- Construccion de los ejemplos de prueba en Mono
test-mono: $(NAME5).exe

#--------------------------
#  Reglas
#--------------------------

# ---- Generacion de la libreria libchronopic
$(LIBCHRONOPIC):  $(LIBCHRONOPIC_DEP)
	           $(CC) -shared -W1,-soname,$(LIBCHRONOPIC) -o $(LIBCHRONOPIC) \
                   $(LIBCHRONOPIC_DEP)
clean::
	  rm -f $(LIBCHRONOPIC) $(LIBCHRONOPIC_DEP)
    
#----- Crear la DLL
$(DLL_CHRONOPIC).dll: $(LIBCHRONOPIC) $(DLL_CHRONOPIC).cs
	 $(MCS) -unsafe -target:library $(DLL_CHRONOPIC).cs \
          -o $(DLL_CHRONOPIC).dll     
    
clean::
	  rm -f $(DLL_CHRONOPIC).dll 
    
#-------------------------------
# Regla para compilar CHRONOJUMP (C#)
#-------------------------------

$(CHRONOJUMP).exe: $(DLL_CHRONOPIC).dll NPlot.dll NPlot.Gtk.dll $(CHRONOJUMP_DEP) 
	 $(MCS) $(CHRONOJUMP_DEP) $(RESOURCES) -unsafe -r $(DLL_CHRONOPIC).dll -r NPlot.dll -r NPlot.Gtk.dll -r System.Drawing $(CHRONOJUMP_LIB) -o $(CHRONOJUMP).exe 
   
clean::
	  rm -f $(CHRONOJUMP).exe  
    
#---------------------------------
#--- Dependencias con ficheros .h
#---------------------------------
sg-serial.o    : sg-serial.h

#-------------------------------
# EJEMPLOS DE PRUEBA EN C#
#-------------------------------
$(NAME5).exe: $(DEP5)
	 $(MCS) $(NAME5).cs -unsafe -r $(DLL_CHRONOPIC).dll -o $(NAME5).exe 
   
clean::
	  rm -f $(NAME5).exe       
    
#--------------------------
#  REGLAS GENERICAS
#--------------------------
.c.o:		
		$(CC) $(CFLAGS) -c $<
