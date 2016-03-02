<%-- 
    Document   : preview
    Created on : 02-mar-2016, 15:32:28
    Author     : mcabsan
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="Carrito.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="tex/javascript" src="jquery/jquery-2.2.1.min.js" ></script>
        <script type="tex/javascript" src="bootstrap/js/bootstrap.min.js" ></script>
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <title>Detalles de compra</title>
    </head>
    <body>
        <div class="container">
            <h1 class="page-header">Awesome's Libraries</h1>
            <small>Carrito de la compra</small>
            <div class="jumbotron">
                <h2>Detalles</h2>
                <%
                    ArrayList<Libro> libros = (ArrayList<Libro>)session.getAttribute("factura");
                    if(request.getParameter("id") != null) {
                        String c = request.getParameter("id");
                        int indice = Integer.parseInt(c);
                        libros.remove(indice);
                    }
                    if ((libros == null) || (libros.isEmpty())) {
                %>
                <p class="text-warning"><span class='glyphicon glypicon-exclamation-sign'></span>La cesta de la compra está vacía</p>
                <a href='index.html'>Volver al programa de gestión</a>
                
                <%
                    } else {
                %>
                <form action="facture.jsp" method="post">
                <table class="table table-bordered table-responsive table-hover">
                    <tr>
                        <th>Título</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                        <th></th>
                    </tr>
                <%
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMaximumFractionDigits(2);
                        nf.setMinimumFractionDigits(2);
                        for(Libro libro: libros) {
                %>
                    <tr>
                        <td><% out.print(libro.getTitulo()); %></td>
                        <td><% out.print(nf.format(libro.getPrecio()) + " €"); %></td>
                        <td><% out.print(libro.getCantidad()); %></td>
                        <td><% out.print(nf.format(libro.montoTotal()) + " €"); %></td>
                        <td><% out.print("<a href='preview.jsp?id=" + libros.indexOf(libro) + "' role='button' class='btn btn-danger'>Borrar</a>"); %></td>
                    </tr>
                <%
                        }
                %>
                    <tr>
                        <td colspan="5">
                            <input type="submit" value="Comprar" class="btn btn-success" />
                        </td>
                    </tr>
                </table>
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
