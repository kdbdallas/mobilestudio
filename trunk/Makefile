CC=arm-apple-darwin-cc
LD=$(CC)
LDFLAGS=-lobjc -framework CoreFoundation -framework Foundation -framework UIKit -framework LayerKit

all:	Finder TextEdit Preview package
#all:	TextEdit Preview package

Finder:	src/MobileFinder/MobileFinder.o src/MobileFinder/MobileFinderApp.o src/MobileFinder/MobileFinderBrowser.m
	$(LD) $(LDFLAGS) -o $@ $^
	
TextEdit:	src/MobileTextEdit/main.o src/MobileTextEdit/MobileTextEdit.o
	$(LD) $(LDFLAGS) -o $@ $^
	
Preview:	src/MobilePreview/main.o src/MobilePreview/MobilePreview.o
	$(LD) $(LDFLAGS) -o $@ $^

%.o:	%.m
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

%.o:	%.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

%.o:	%.cpp
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

package:
	rm -rf build
	mkdir build
	cp -r ./src/MobileFinder/Finder.app ./build
	mv Finder ./build/Finder.app
	cp -r ./src/MobileTextEdit/TextEdit.app ./build
	mv TextEdit ./build/TextEdit.app
	cp -r ./src/MobilePreview/Preview.app ./build
	mv Preview ./build/Preview.app

clean:
	rm -f src/MobileFinder/*.o Finder
	rm -f src/MobileTextEdit/*.o TextEdit
	rm -f src/MobilePreview/*.o Preview
	rm -rf ./build