from ast import Return
from tkinter.constants import S
from clases.Conectar import Conectar


class Producto:
    def __init__(self, id = 0, codigo = '', idEstado = 0, idOp = 0 ,idTipoM = 0, estadoMaquina ='', tipoMaquina = "", modelo ="") -> None:
        self.__id = id
        self.__codigo = codigo
        self.__idEstado = idEstado
        self.__idOp = idOp
        self.__idTipoM = idTipoM
        self.__estadoMaquina = estadoMaquina
        self.__tipoMaquina = tipoMaquina
        self.__Modelo = modelo

        self.__conectar = Conectar()

    @property
    def id(self):
        return self.__id

    @property
    def codigo(self):
        return self.__codigo


    @property
    def idEstado(self):
        return self.__idEstado

    @property
    def idOp(self, value):
       return self.__idOp 

    @property
    def idTipoM(self):
        return self.__idTipoM


    @property
    def estadoMaquina(self):
        return self.__estadoMaquina

    @property
    def tipoMaquina(self):
        return self.__tipoMaquina

    @property
    def modelo(self):
        return self.__Modelo



    def mostrarProductos(self):
        sql = 'SELECT * FROM maquina'
        lista = self.__conectar.listar(sql)

        return lista

    def buscarProducto(self):
        sql = f"SELECT * FROM maquina WHERE codigo ={self.__codigo}"
        buscar = self.__conectar.listar1(sql)
        
        return buscar

    def editarProducto(self):
        sql = f"UPDATE maquina SET id ='{self.__id}' , codigo ={self.__codigo} , id_Estado = {self.__idEstado}, id_Op = {self.__idOp} , id_TipoM = {self.__idTipoM} , estadosMaquina = {self.__estadoMaquina} , tipoMaquinas = {self.__tipoMaquina} , Modelo = {self.__Modelo}  WHERE codigo = {self.__codigo} "
        editar = self.__conectar.ejecutar(sql)
        return editar

    def eliminarProducto(self):
        sql = f"DELETE FROM maquina WHERE codigo = {self.__codigo}"
        eliminar = self.__conectar.ejecutar(sql)
        return eliminar

