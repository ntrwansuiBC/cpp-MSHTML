all: MSHTMLTest.exe DisplayHTML.exe

DisplayHTML.exe: DisplayHTML.o HTMLWindow.o DocHostUiHandler.o OleClientSite.o OleInPlaceSite.o win32_Unicode.o VariantHelper.o UrlHelper.o Tracer.o stdHelpers.o
	g++ -mwindows -o $@ $? -luuid -loleaut32 -lole32 

MSHTMLTest.exe: MSHTMLTest.o HTMLWindow.o DocHostUiHandler.o OleClientSite.o OleInPlaceSite.o win32_Unicode.o VariantHelper.o UrlHelper.o Tracer.o stdHelpers.o
	g++ -mwindows -o $@ $? -luuid -loleaut32 -lole32 

DisplayHTML.o: DisplayHTML.cpp
	g++ -c $<

MSHTMLTest.o: MSHTMLTest.cpp
	g++ -c $<

HTMLWindow.o: HTMLWindow.cpp HTMLWindow.h OleInPlaceSite.h
	g++ -c $<

DocHostUiHandler.o: DocHostUiHandler.cpp DocHostUiHandler.h HTMLWindow.h
	g++ -c $<

OleInPlaceSite.o: OleInPlaceSite.cpp OleInPlaceSite.h
	g++ -c $<

OleClientSite.o: OleClientSite.cpp OleClientSite.h
	g++ -c $<

win32_Unicode.o: todoMoveSrc\win32_Unicode.cpp todoMoveSrc\win32_Unicode.h
	g++ -c $<

VariantHelper.o: todoMoveSrc\VariantHelper.cpp todoMoveSrc\VariantHelper.h
	g++ -c $<

UrlHelper.o: todoMoveSrc\UrlHelper.cpp todoMoveSrc\UrlHelper.h
	g++ -c $<

Tracer.o: todoMoveSrc\Tracer.cpp todoMoveSrc\Tracer.h
	g++ -c $<

stdHelpers.o: todoMoveSrc\stdHelpers.cpp todoMoveSrc\stdHelpers.h
	g++ -c $<

clean:
	@del *.o