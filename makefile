all: tp-final

util: util.ppu

util.ppu:
	fpc util.pas

tp-final: tipos.ppu archivos.ppu arboles.ppu ventas.ppu
	fpc tp-final.pas

tipos.ppu:
	fpc tipos.pas

archivos.ppu:
	fpc archivos.pas


arboles.ppu:
	fpc arboles.pas

ventas.ppu:
	fpc ventas.pas

clean:
	rm -rf *ppu *o tp-final
