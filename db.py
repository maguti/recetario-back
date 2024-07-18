# instalar pymysql -> pip install pymysql
# importar pymysql / SQLachemy / dbmysql
import pymysql

# conectar con el servidor MySQL
def conectarMySQL():
    # datos sensibles -> variables de entorno
    
    # local
    host="localhost"
    user="root"
    password="root"
    db="recetario"
    
    # deploy -> Pythonanywhere
    # host="maguti.mysql.pythonanywhere-services.com"
    # user="maguti"
    # password="codo2024"
    # db="maguti$recetario"

    return pymysql.connect(host=host,user=user,password=password,database=db)