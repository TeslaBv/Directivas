<%-- 
    Document   : procesarC.jsp
    Created on : 5/11/2024, 10:27:03 PM
    Author     : CruzF
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>

<%
    ArrayList<HashMap<String, String>> canciones = (ArrayList<HashMap<String, String>>) session.getAttribute("canciones");
    if (canciones == null) {
        canciones = new ArrayList<>();
        session.setAttribute("canciones", canciones);
    }
    String cancion = request.getParameter("cancion");
    String artista = request.getParameter("artista");
    String fechaLanzamiento = request.getParameter("fechaLanzamiento");
    String duracion = request.getParameter("duracion");
    String genero = request.getParameter("genero");
    String album = request.getParameter("album");

    if (cancion != null && artista != null && fechaLanzamiento != null && duracion != null && genero != null && album != null) {
        HashMap<String, String> nuevaCancion = new HashMap<>();
        nuevaCancion.put("id", String.valueOf(canciones.size() + 1));
        nuevaCancion.put("cancion", cancion);
        nuevaCancion.put("artista", artista);
        nuevaCancion.put("fechaLanzamiento", fechaLanzamiento);
        nuevaCancion.put("duracion", duracion);
        nuevaCancion.put("genero", genero);
        nuevaCancion.put("album", album);
        canciones.add(nuevaCancion);
        session.setAttribute("canciones", canciones);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .container {
                margin-top: 40px;
            }
            h3 {
                text-align: center;
                font-weight: bold;
                color: #343a40;
            }
            .table {
                margin-top: 20px;
            }
            .table thead {
                background-color: #343a40;
                color: white;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #f2f2f2;
            }
        </style>
        <title>Lista de Canciones</title>
    </head>
    <body>
        <div class="container">
            <h3>Lista de Canciones</h3>
            <table class="table table-striped table-bordered shadow-sm">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Canción</th>
                        <th>Artista</th>
                        <th>Fecha de Lanzamiento</th>
                        <th>Duración (min)</th>
                        <th>Género</th>
                        <th>Álbum</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cancion" items="${sessionScope.canciones}">
                        <tr>
                            <td>${cancion.id}</td>
                            <td>${cancion.cancion}</td>
                            <td>${cancion.artista}</td>
                            <td>${cancion.fechaLanzamiento}</td>
                            <td>${cancion.duracion}</td>
                            <td>${cancion.genero}</td>
                            <td>${cancion.album}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty sessionScope.canciones}">
                        <tr>
                            <td colspan="7" class="text-center">No se han agregado canciones todavía.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <div>
                <a href="../jsp/datos.jsp" class="btn btn-lg" style="background: green; color: white; display: block">Agregar canciones</a>
            </div>
        </div>
    </body>
</html>
