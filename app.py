from flask import Flask, render_template, request, redirect
from controller_db import *
from nosotros import *

app = Flask(__name__)
unMenu = [("/", "Inicio"), ("/recetas/", "Recetas"), ("/nosotros/", "Nosotros"), ("/contacto/", "Contacto")]

@app.route("/")
def cargarIndex():
    return render_template("index.html", unMenu=unMenu)

@app.route("/recetas/")
def cargarRecetas():
    recetas_list = getRecetas()
    ingredientes_list = getIngredientes()
    return render_template("recetas.html", unMenu=unMenu, recetas_list=recetas_list, ingredientes_list=ingredientes_list)

@app.route("/nosotros/")
def cargarNosotros():
    resenias_list = getContactosResenias()
    return render_template("nosotros.html", unMenu=unMenu, nosotros_list=nosotros_list, resenias_list=resenias_list)

@app.route("/contacto/")
def cargarContacto():
    return render_template("contacto.html", unMenu=unMenu)

@app.route('/new_contacto', methods=['POST'])
def new_contacto():
    nombre = request.form['txtNombre']
    email = request.form['txtEmail']
    mensaje = request.form['txtMensaje']
    newContacto(nombre=nombre, email=email, mensaje=mensaje)
    return redirect("/contacto")

@app.route('/listar_contacto')
def listar_contacto():
    contactos=getContactos()
    return render_template("new_contacto.html", unMenu=unMenu, contactos=contactos)

@app.route('/modificar/<int:id>')
def modificar(id):
    contacto=getContactoById(id)
    return render_template("modificar.html", contacto=contacto)

@app.route('/modify_contacto', methods=['POST'])
def modify_contacto():
    id = request.form['id']
    nombre = request.form['txtNombre']
    email = request.form['txtEmail']
    mensaje = request.form['txtMensaje']
    updContactoById(idcontacto=id, nombre=nombre, email=email, mensaje=mensaje)
    return redirect("/listar_contacto")

@app.route('/borrar_contacto/<int:id>')
def borrar_contacto(id):
    delContactoById(id=id)
    return redirect("/listar_contacto")