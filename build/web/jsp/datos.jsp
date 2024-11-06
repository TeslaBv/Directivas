<%-- 
    Document   : DatosForm
    Created on : 28/10/2024, 08:15:46 PM
    Author     : CruzF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Datos de Canción</title>
    </head>
    <body>
        <div class="container shadow p-4 rounded bg-white" style="margin-top: 60px; max-width: 600px;">
            <h3 class="text-center text-dark font-weight-bold mb-4">Registrar Nueva Canción</h3>
            <form role="form" name="cancion" action="procesarC.jsp" method="POST" onsubmit="return validarFormulario()">
                <div class="form-group">
                    <label for="cancion">Nombre de la Canción:</label>
                    <input type="text" class="form-control" name="cancion" id="cancion" placeholder="Nombre de la Canción" required>
                </div>
                <div class="form-group">
                    <label for="artista">Artista:</label>
                    <input type="text" class="form-control" name="artista" id="artista" placeholder="Artista" required>
                </div>
                <div class="form-group">
                    <label for="fechaLanzamiento">Fecha de Lanzamiento:</label>
                    <input type="date" class="form-control" name="fechaLanzamiento" id="fechaLanzamiento" required>
                </div>
                <div class="form-group">
                    <label for="duracion">Duración en Minutos:</label>
                    <input type="number" class="form-control" name="duracion" id="duracion" placeholder="Duración en minutos" min="1" required>
                </div>
                <div class="form-group">
                    <label for="genero">Género:</label>
                    <input type="text" class="form-control" name="genero" id="genero" placeholder="Género" required>
                </div>
                <div class="form-group">
                    <label for="album">Álbum:</label>
                    <input type="text" class="form-control" name="album" id="album" placeholder="Álbum" required>
                </div>
                <input type="submit" class="btn btn-primary font-weight-bold w-100" style="background: green; color: white;" value="Registrar Canción">
            </form>
        </div>

        <script>
            function validarFormulario() {
                const cancion = document.getElementById('cancion').value.trim();
                const artista = document.getElementById('artista').value.trim();
                const fechaLanzamiento = document.getElementById('fechaLanzamiento').value;
                const duracion = parseInt(document.getElementById('duracion').value);
                const genero = document.getElementById('genero').value.trim();
                const album = document.getElementById('album').value.trim();

                // Validar nombre de la canción
                if (cancion.length < 1) {
                    alert('El nombre de la canción debe tener al menos 2 caracteres.');
                    return false;
                }

                // Validar artista
                if (artista.length < 1) {
                    alert('El nombre del artista debe tener al menos 2 caracteres.');
                    return false;
                }

                // Validar fecha de lanzamiento
                const fechaActual = new Date().toISOString().split('T')[0];
                if (fechaLanzamiento > fechaActual) {
                    alert('La fecha de lanzamiento no puede ser en el futuro.');
                    return false;
                }

                // Validar duración
                if (isNaN(duracion) || duracion <= 0) {
                    alert('La duración debe ser un número positivo.');
                    return false;
                }

                // Validar género
                if (genero.length < 3) {
                    alert('El género debe tener al menos 3 caracteres.');
                    return false;
                }

                // Validar álbum
                if (album.length < 1) {
                    alert('El nombre del álbum debe tener al menos 2 caracteres.');
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
