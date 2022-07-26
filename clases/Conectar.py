import mysql.connector


class Conectar:
    def __init__(self) -> None:
        self.__bd = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='mydb',
            port="3308"
        )

        self.__cursor = self.__bd.cursor()

    def ejecutar(self, sql):
        try:
            self.__cursor.execute(sql)
            self.__bd.commit()

            return self.__cursor.rowcount

        except mysql.connector.Error as e:
            return 'Error: '+str(e)

    def listar(self, sql):
        try:
            self.__cursor.execute(sql)
            lista = self.__cursor.fetchall()

            return lista

        except mysql.connector.Error as e:
            return 'Error: '+str(e)

    def listar1(self, sql):
        try:
            self.__cursor.execute(sql)
            lista = self.__cursor.fetchone()

            return lista

        except mysql.connector.Error as e:
            return 'Error: '+str(e)
