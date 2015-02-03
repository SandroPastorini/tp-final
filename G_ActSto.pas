unit G_ActSto;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, tipos;

	Procedure opcion2 (var A: arbolArt; var B: arbolArt; var arA:ArchivoArt);
	
implementation
	
	Procedure opcion2 (var A: arbolArt; var B: arbolArt; var arA:ArchivoArt);
	var
		op: word;
		cod: word;
		buscado: word;
		nodo:Art;
		datoA:tipoArt;
		cond: word;
		cantid: word;
		desc: string;
		valor: real;
		pos: word;
		salir: boolean;
	begin
		presActSto;
		codig;
		writeln(' ');
		writeln('  ');
		writeln('                       3: Agregar un nuevo producto al stock ');
		read(op);
		case op of
			1: begin
				presActSto;
				writeln('                         Ingrese el codigo del producto: ');
				read(cod);
				buscarCodigo (A, buscado, nodo, salir);
				if (salir=false) then
				begin
					leerArt(arA, datoA, nodo.pos);
					presActSto;
					cambioStock (datoA.stock);
					read(cond);
					if cond=1 then
						begin
							presActSto;
							writeln('                    Cuantos producto desea agregar al stock? ');
							read(cantid);
							leerArt(arA, datoA, nodo.pos);
							datoA.stock := datoA.stock + cantid;
							ReEscArt(arA, datoA, nodo.pos);
							leerArt(arA, datoA, nodo.pos);
							presActSto;
							Stock (datoA.stock);
						end
					else
					begin
						if cond=2 then
						begin
							presActSto;
							writeln('                    Cuantos producto desea remover del stock? ');
							read(cantid);
							leerArt(arA, datoA, nodo.pos);
							datoA.stock := datoA.stock - cantid;
							ReEscArt(arA, datoA, nodo.pos);
							presActSto;
							Stock (datoA.stock);
						end
					end;
				end;
			end;
			2: begin
				presActSto;
				writeln('                       Ingrese la descripcion del producto: ');
				read(desc);
				buscarDesc (B, desc, nodo, salir);
				if (salir=false) then
				begin
					leerArt(arA, datoA, nodo.pos);
					presActSto;
					cambioStock (datoA.stock);
					read(cond);
					if cond=1 then
						begin
							presActSto;
							writeln('                    Cuantos producto desea agregar al stock? ');
							read(cantid);
							leerArt(arA, datoA, nodo.pos);
							datoA.stock := datoA.stock + cantid;
							ReEscArt(arA, datoA, nodo.pos);
							leerArt(arA, datoA, nodo.pos);
							presActSto;
							Stock (datoA.stock);
						end
					else
					begin
						if cond=2 then
						begin
							presActSto;
							writeln('                    Cuantos producto desea remover del stock? ');
							read(cantid);
							leerArt(arA, datoA, nodo.pos);
							datoA.stock := datoA.stock - cantid;
							ReEscArt(arA, datoA, nodo.pos);
							presActSto;
							Stock (datoA.stock);
						end
					end;
				end;
			end;
			3: begin
				presActSto;
				writeln('                      Ingrese el codigo del nuevo producto: ');
				read(cod);
				datoA.codigo:= cod;
				nodo.codigo:= cod;
				presActSto;
				writeln('                   Ingrese la descripcion del nuevo producto: ');
				read(desc);
				datoA.descri := desc;
				nodo.descri:= desc;
				presActSto;
				writeln('               Ingrese el nombre del proveedor del nuevo producto: ');
				read(desc);
				datoA.prove:=desc;
				presActSto;
				writeln('                      Ingrese el stock del nuevo producto: ');
				read(cantid);
				datoA.stock := cantid;
				presActSto;
				writeln('                    Ingrese el stock minimo del nuevo producto: ');
				read(cantid);
				datoA.stockMin := cantid;
				presActSto;
				writeln('                    Ingrese el precio de costo del nuevo producto: ');
				read(valor);
				datoA.pCosto := valor;
				presActSto;
				writeln('             Ingrese el porcentaje de ganancias para el nuevo producto: ');
				read(valor);
				valor:= valor*datoA.pCosto;
				valor:= valor/100;
				valor:= valor+datoA.pCosto;
				datoA.pVenta:=valor;
				escribirArt(arA, datoA);
				posicion(arA, pos);
				nodo.pos:= pos;
				insertarArbol (A, nodo, B);			
				presActSto;
				writeln('                  El nuevo producto ha sido ingresado con exito! ');
				readkey;
			end;
		end;
	end;

end.
