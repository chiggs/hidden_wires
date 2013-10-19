SOURCE_FILES = $(wildcard ../hdl/*.sv)

all : hidden_wires

.PHONY: hidden_wires

hidden_wires: $(SOURCE_FILES)
	quartus_map hidden_wires
	quartus_fit hidden_wires
	quartus_sta hidden_wires

