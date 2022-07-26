from cProfile import label
from msilib.schema import Font
from os import read
from tkinter import font, ttk
from tkinter import messagebox
from tkinter import *
import tkinter
from clases.Producto import Producto
from clases.Conectar import Conectar

root = Tk()
root.configure(bg = 'black')
root.geometry ('1200x700')


root.title("maquinarias jimenez")

#para escribir un texto
etiqueta = tkinter.Label(root, text="HOLA BIENVENIDO A MAQUINARIA JIMENEZ" ,font="arial 40") 

#para que este en el centro o en cualquier lado que uno quiera 
etiqueta.pack()

def saludo(nombre):
    print("")


def readFrame():
    producto = Producto()

    listaProductos = producto.mostrarProductos()

    for widget in root.winfo_children():
        widget.pack_forget()

    for i in tabla.get_children():  # Con esto se limpian las filas de la tabla
        tabla.delete(i)
    root.update()  # Con esto actualizamos la vista de la tabla

    frmTitulo = Frame(root)
    frmTitulo.pack()
    Label(frmTitulo, text="Lista de Maquinas", font=("Arial", 20)).pack()

    frmTabla.pack()
    tabla.pack()
    frmRead.pack()

    contador = 0
    for p in listaProductos:
        tabla.insert(parent="", index="end", iid=contador, values=(
            p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]
        ))

        contador += 1


def deleteFrame():
    for widget in root.winfo_children():
        widget.pack_forget()

    frmEliminar.pack()

def editFrame():
    for widget in root.winfo_children():
        widget.pack_forget()

    frmEditar.pack()

    #limpiarTexto()


# Menu de opciones
menubar = Menu(root)
root.config(menu=menubar)

createmenu = Menu(menubar, tearoff=0)

#maquinas=Menu(menubar)

menubar.add_command(label="listar maquina", command=readFrame)
menubar.add_command(label="editar maquina", command=editFrame)
menubar .add_command(label="eliminar maquina", command=deleteFrame)


def eliminarProducto():
    try:
        p = Producto(codigo=codigo.get())
        productoxd =p.buscarProducto()   
        code = productoxd[0]
        print(code)
        eliminar = p.eliminarProducto()
        
        print("Eliminar", eliminar)


        if eliminar:

            messagebox.showinfo(
                "Eliminado", f"La maquina con código: {codigo.get()} se eliminó.")

            #limpiarTexto()

        else:
            messagebox.showinfo(
                "No existe", f"La maquina con código: {codigo.get()} no existe.")
            #limpiarTexto()


    except:
        messagebox.showerror("Error", "Debe ingresar datos válidos.")


def editarProducto():
    try:
        
        h = Producto(id= id.get(), codigo= codigo.get(), estado= estado.get())
        

        if int(id.get()) <= 0:

            messagebox.showerror("Editado", "debe ingresar un id.")


        elif h.editarProducto() == 1:
            editado = h.editarProducto()
            messagebox.showinfo("Editado", "Se ha editado con exito")
            


    except:
        messagebox.showerror("Error", ".")
        

    #limpiarTexto()


def buscarProducto():
    try:
        p = Producto(codigo=codigo.get())
        buscar = p.buscarProducto()
        print(buscar)

        modelo.set(buscar[7])
        estado.set(buscar[5])
        id.set(buscar[0])

    except:
        messagebox.showerror("Error", "No se pudo encontrar el producto.")
        #limpiarTexto()



id = StringVar()
codigo = StringVar()
idEstado = StringVar()
idOperador = StringVar()
idTipoM = BooleanVar()
estado = StringVar()
modelo = StringVar()
tipoMaquina = StringVar()
# FRAMES

# Frame read
frmRead = Frame(root)
# Frame Tabla
frmTabla = Frame(frmRead)
tabla = ttk.Treeview(frmTabla)

tabla["columns"] = ("id","codigo" , "Id_Estado", 
                    "Id_Op", "id_TipoM","Estados Maquina_idEstado","tipoMaquina","Modelo")

tabla.column("#0", width=0, stretch=NO)
tabla.heading("id", text="id", anchor=CENTER)
tabla.heading("codigo", text="codigo", anchor=CENTER)
tabla.heading("Id_Estado", text="Id_Estado", anchor=CENTER)
tabla.heading("Id_Op", text="Operador", anchor=CENTER)
tabla.heading("id_TipoM", text="id_TipoM", anchor=CENTER)
tabla.heading("Estados Maquina_idEstado", text="Estados Maquina", anchor=CENTER)
tabla.heading("tipoMaquina", text="tipo maquina", anchor=CENTER)
tabla.heading("Modelo", text="Modelo", anchor=CENTER)


# Frame para Eliminar
frmEliminar = Frame(root)

frmTituloEliminar = Frame(frmEliminar)
frmTituloEliminar.pack()

Label(frmEliminar, text="Eliminar maquinas", font=("Arial", 20)).pack()

frmFormEliminar = Frame(frmEliminar)
frmFormEliminar.pack(padx=60, pady=5)

Label(frmFormEliminar, text="Codigo de la Maquina").grid(
    column=0, row=0, pady=5, padx=5, sticky="w")
Entry(frmFormEliminar, textvariable=codigo).grid(column=1, row=0, pady=5)

Button(frmFormEliminar, text="Eliminar", command=eliminarProducto).grid(
    column=1, row=6, sticky="w", pady=5, padx=2
)

# Frame para Editar
frmEditar = Frame(root)

frmTituloEditar = Frame(frmEditar)
frmTituloEditar.pack()


Label(frmTituloEditar, text="Editar maquinas", font=("Arial", 20)).pack()

frmFormEditar = Frame(frmEditar)
frmFormEditar.pack(padx=60, pady=5)

Label(frmFormEditar, text="Codigo de la maquina").grid(
    column=0, row=0, pady=5, padx=5, sticky="w")
Entry(frmFormEditar, textvariable=codigo).grid(column=1, row=0, pady=5)


Button(frmFormEditar, text="Buscar maquina", command=buscarProducto).grid(
    column=1, row=1, sticky="w", pady=5, padx=2
)

Label(frmFormEditar, text="id de la maquina").grid(
    column=0, row=2, pady=5, padx=5, sticky="w")
Entry(frmFormEditar, textvariable=id).grid(column=1, row=2, pady=5)

Label(frmFormEditar, text="codigo de la maquina").grid(
    column=0, row=3, pady=5, padx=5, sticky="w")
Entry(frmFormEditar, textvariable=codigo).grid(column=1, row=3, pady=5)

Label(frmFormEditar, text="modelo de la maquina").grid(
    column=0, row=4, pady=5, padx=5, sticky="w")
Entry(frmFormEditar, textvariable=modelo).grid(column=1, row=4, pady=5)

Label(frmFormEditar, text="estado de la maquina").grid(
    column=0, row=5, pady=5, padx=5, sticky="w")
Entry(frmFormEditar, textvariable=estado).grid(column=1, row=5, pady=5)



Button(frmFormEditar, text="Editar", command=editarProducto).grid(
    column=1, row=6, sticky="w", pady=5, padx=2
)


    # Variables













root.mainloop()
