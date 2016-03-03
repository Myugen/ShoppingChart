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
            <div class="page-header">
                <h1><span class='glyphicon glyphicon-book'></span>Awesome's Libraries</h1>
                <small>Carrito de la compra</small>
            </div>
            <div class="jumbotron">
                <h2>Detalles del pedido</h2>
                <%
                    if(session.getAttribute("factura") == null) {
                        response.sendRedirect("index.html");
                    }
                    ArrayList<Libro> libros = (ArrayList<Libro>)session.getAttribute("factura");
                    if(request.getParameter("id") != null) {
                        String c = request.getParameter("id");
                        int indice = Integer.parseInt(c);
                        libros.remove(indice);
                    }
                    if (libros.isEmpty()) {
                %>
                <p class="text-warning"><span class='glyphicon glypicon-exclamation-sign'></span>La cesta de la compra está vacía</p>
                <a href='index.html'>Volver al programa de gestión</a>
                
                <%
                    } else {
                %>
                <form action="facture.jsp" method="post" accept-charset="UTF-8">
                <table class="table table-bordered table-responsive table-hover">
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMaximumFractionDigits(2);
                        nf.setMinimumFractionDigits(2);
                        for(Libro libro: libros) {
                %>
                    <tr>
                        <td><%= libro.getTitulo() %></td>
                        <td><%= nf.format(libro.getPrecio()) + " €" %></td>
                        <td><%= libro.getCantidad() %></td>
                        <td><%= nf.format(libro.montoTotal()) + " €" %></td>
                        <td><% out.print("<a href='preview.jsp?id=" + libros.indexOf(libro) + "' role='button' class='btn btn-danger'>Borrar</a>"); %></td>
                    </tr>
                <%
                        }
                %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">
                            <input type="submit" value="Comprar" class="btn btn-success" />
                        </td>
                    </tr>
                </tfoot>
                </table>
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
