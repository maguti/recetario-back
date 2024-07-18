import pymysql
from db import conectarMySQL

# CRUD -> Create, Read, Update, Delete - Rectas e Ingredientes

# Read -> SELECT 1) Leer todos
def getRecetas():
    # conexion mysql
    conexion = conectarMySQL()
    result = []
    with conexion.cursor() as cursor:
        # Create a new record
        sql = "SELECT * FROM recetas"
        cursor.execute(sql)
        result = cursor.fetchall()
        conexion.commit()
        conexion.close()
        return result
    
# Read 2) Leer solo uno
def getRecetaById(id):
    conexion = conectarMySQL()
    result = None
    with conexion.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM recetas WHERE idreceta = %s", (id,))
        result = cursor.fetchone()
    conexion.close()
    return result

# Create -> Insert
def newReceta(nombre, correo, foto):
    conexion = conectarMySQL()
    with conexion.cursor() as cursor:
        sql = "INSERT INTO recetas (nombre, correo, foto) VALUES (%s, %s, %s)"
        cursor.execute(sql,(nombre, correo, foto))
        result = cursor
        conexion.commit()
        conexion.close()
        return result
    

# Update) ubicar por id el producto a modificar
def updRecetaById(idreceta, nombre, correo, foto):
    conexion = conectarMySQL()
    with conexion.cursor() as cursor:
        cursor.execute("UPDATE recetas SET nombre = %s, correo = %s, foto = %s WHERE idreceta = %s",(nombre, correo, foto, idreceta))
        result = cursor
    conexion.commit()
    conexion.close()
    return result

# Delete
def delRecetaById(id):
    conexion = conectarMySQL()
    with conexion.cursor() as cursor:
        cursor.execute("DELETE FROM recetas WHERE idreceta = %s", (id))
        result = cursor
    conexion.commit()
    conexion.close()
    return result

def getIngredientes():
    # conexion mysql
    conexion = conectarMySQL()
    result = []
    with conexion.cursor() as cursor:
        # Create a new record
        sql = "SELECT idreceta,orden,ingrediente FROM ingredientes order by idreceta,orden"
        cursor.execute(sql)
        result = cursor.fetchall()
        conexion.commit()
        conexion.close()
        return result

# CRUD -> Create, Read, Update, Delete - Contactos

# Read -> SELECT 1) Leer todos
def getContactos():
    # conexion mysql
    conexion = conectarMySQL()
    result = []
    with conexion.cursor() as cursor:
        # Create a new record
        sql = "SELECT * FROM contactos"
        cursor.execute(sql)
        result = cursor.fetchall()
        conexion.commit()
        conexion.close()
        return result
    
# Read 2) Leer solo uno
def getContactoById(id):
    conexion = conectarMySQL()
    result = None
    with conexion.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM contactos WHERE idcontacto = %s", (id,))
        result = cursor.fetchone()
    conexion.close()
    return result

def getContactosResenias():
    # conexion mysql
    conexion = conectarMySQL()
    result = []
    with conexion.cursor() as cursor:
        # Create a new record
        sql = "SELECT * FROM contactos WHERE tipo='RESENIA' LIMIT 6"
        cursor.execute(sql)
        result = cursor.fetchall()
        conexion.commit()
        conexion.close()
        return result
    
# Create -> Insert
def newContacto(nombre, email, mensaje):
    conexion = conectarMySQL()
    with conexion.cursor() as cursor:
        sql = "INSERT INTO contactos (nombre, email, mensaje) VALUES (%s, %s, %s)"
        cursor.execute(sql,(nombre, email, mensaje))
        result = cursor
        conexion.commit()
        conexion.close()
        return result
    

# Update) ubicar por id el producto a modificar
def updContactoById(idcontacto, nombre, email, mensaje):
    conexion = conectarMySQL()
    with conexion.cursor() as cursor:
        cursor.execute("UPDATE contactos SET nombre = %s, email = %s, mensaje = %s WHERE idcontacto = %s",(nombre, email, mensaje, idcontacto))
        result = cursor
    conexion.commit()
    conexion.close()
    return result

# Delete
def delContactoById(id):
    conexion = conectarMySQL()
    with conexion.cursor() as cursor:
        cursor.execute("DELETE FROM contactos WHERE idcontacto = %s", (id))
        result = cursor
    conexion.commit()
    conexion.close()
    return result

