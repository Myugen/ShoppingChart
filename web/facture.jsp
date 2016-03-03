<%-- 
    Document   : facture
    Created on : 02-mar-2016, 23:52:54
    Author     : mcabsan
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="Carrito.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="application/javascript" src="jquery/jquery-2.2.1.min.js" ></script>
        <script type="application/javascript" src="scripts/jquery.PrintArea.js" ></script>
        <script type="text/javascript" src="scripts/imprimir.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js" ></script>
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facturación</title>
    </head>
    <body>
        <div class="container">
            <div class="page-header">
                <h1><span class='glyphicon glyphicon-book'></span>Awesome's Libraries</h1>
            </div>
            <div class="jumbotron">
                <h2>Factura del pedido</h2>
                <table class='table table-hover'>
                    <thead>
                        <tr>
                            <th>Cantidad</th>
                            <th>Artículo</th>
                            <th>Precio/Unidad</th>
                            <th>Precio total</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if(session.getAttribute("factura") == null) {
                        response.sendRedirect("index.html");
                    }
                    NumberFormat nf = NumberFormat.getInstance();
                    nf.setMaximumFractionDigits(2);
                    nf.setMinimumFractionDigits(2);
                    float total = 0;
                    ArrayList<Libro> libros = (ArrayList<Libro>)session.getAttribute("factura");
                    session.invalidate();
                    for (Libro libro : libros) {
                        total += libro.montoTotal();
                %>
                <tr>
                    <td><%=libro.getCantidad() %></td>
                    <td><%=libro.getTitulo() %></td>
                    <td><%=nf.format(libro.getPrecio()) + "€" %></td>
                    <td><%=nf.format(libro.montoTotal()) + "€" %></td>
                </tr>
                <%
                    }
                %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan='4' class='text-right'>
                                <p><strong>Total (con IGIC 7%):</strong> <%=nf.format(total) + "€" %></p>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <button id='buttonImprimir' class="btn btn-primary">Imprimir factura</button>
        </div>
        
    </body>
</html>
