MXMLC = ~/Development/flex_sdk_4.1/bin/mxmlc
SRC = src
MAIN = src/Main.as
SWF = bin/game.swf

$(SWF) : $(SRC)
	$(MXMLC) -o $(SWF) -- $(MAIN)
