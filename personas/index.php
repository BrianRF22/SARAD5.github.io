<?php 
include '../conexion.php';
$conexion = Conexion::conectar();
$datos = pg_fetch_all(pg_query($conexion, "SELECT p.*, to_char(p.fecha_nacimiento, 'dd/mm/yyyy') fecha_nacimiento_formato FROM personas p ORDER BY id_per")); 
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SARAD - Personas</title>
    <link rel="stylesheet" href="/sarad/estilo/css/bootstrap.min.css">
    <link rel="stylesheet" href="/sarad/estilo/iconos/css/font-awesome.min.css">
    <style>
        body {
            background: linear-gradient(to bottom, #4b79a1 25%, #283e51 75%);
            color: white;
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        main {
            flex: 1;
            padding: 20px;
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            margin: 20px;
        }

        h5 {
            margin: 20px 0;
            font-family: 'Verdana', sans-serif; 
            color: white;
        }

        .btn-custom {
            background: linear-gradient(to bottom, #4b79a1, #283e51);
            color: white;
            border: 2px solid black;
            border-radius: 10px;
            transition: background-color 0.3s, transform 0.3s;
            padding: 8px 16px;
            margin: 10px 0;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-custom:hover {
            background-color: #2a2a4d; 
            transform: translateY(-3px); 
        }

        .input-group-text {
            background: transparent;
            border: none;
            color: white;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: linear-gradient(to bottom, #4b79a1, #283e51); 
            color: white; 
            border-radius: 15px;
            border: 3px solid black;
            margin-top: auto;
        }

        .btn-volver {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .modal-content {
            background: rgba(0, 0, 0, 0.8);
            border: 2px solid black;
        }

        .modal-header, .modal-footer {
            border-bottom: 1px solid black;
        }

        .text-muted {
            color: #6c757d;
        }
        .table th, .table td {
            border: 1px solid blue; /* Borde de celdas en azul */
        }
        .btn-logout {
            background: linear-gradient(to bottom, #4b79a1, #283e51); /* Mismo color que los demás botones */
            color: white; /* Color del texto en blanco */
            border: 2px solid black; /* Borde negro */
            border-radius: 30px;
            padding: 15px 50px;
            font-size: 1.3rem;
            margin: 10px 0; /* Margen vertical para centrar */
            text-decoration: none; /* Eliminar subrayado */
            display: inline-flex; /* Usar flexbox para centrar íconos y texto */
            align-items: center; /* Centrar verticalmente */
            justify-content: center; /* Centrar horizontalmente */
            font-size: 0.9rem; /* Tamaño de fuente ajustado para el botón */
        }
    </style>
</head>
<body>
    <main>
        <div>
            <h5 class="display-2 fw-bold">Personas 
                <button type="button" class="btn btn-lg btn-logout text-end" data-bs-toggle="modal" data-bs-target="#modal-agregar">
                    <i class="fa fa-plus-circle"></i>
                </button>
            </h5>
            <div class="table-responsive">
                <table class="table text-white">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nº</th>
                            <th>C.I.</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Nacimiento</th>
                            <th>Celular</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($datos as $d){ ?>
                        <tr>
                            <td>
                                <button class="btn input-group-text text-success" type="button" onclick="modificar('<?php echo $d['id_per']; ?>', '<?php echo $d['per_ci']; ?>', '<?php echo $d['per_nombre']; ?>', '<?php echo $d['per_apellido']; ?>', '<?php echo $d['fecha_nacimiento_formato']; ?>', '<?php echo $d['celular']; ?>');" data-bs-toggle="modal" data-bs-target="#modal-modificar">
                                    <i class="fa fa-pencil-square-o"></i>
                                </button>
                            </td>
                            <td><?php echo $d['id_per']; ?></td>
                            <td><?php echo $d['per_ci']; ?></td>
                            <td><?php echo $d['per_nombre']; ?></td>
                            <td><?php echo $d['per_apellido']; ?></td>
                            <td><?php echo $d['fecha_nacimiento_formato']; ?></td>
                            <td><?php echo $d['celular']; ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            <div class="btn-volver">
                <a href="/sarad/inicio" class="btn btn-logout text-end"><i class="fa fa-arrow-left"></i> Volver</a>
            </div>
        </div>
    </main>

    <!-- Modal para agregar persona -->
    <div class="modal fade" id="modal-agregar" tabindex="-1" aria-labelledby="modal-agregar" aria-hidden="true">
        <form action="agregar.php" method="POST" enctype="multipart/form-data">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-primary">Agregar Persona</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <label class="text-success">C.I.</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-address-card-o"></i>
                            </span>
                            <input type="text" class="form-control" name="ci" required>
                        </div><br>
                        <label class="text-success">Nombre</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-user"></i>
                            </span>
                            <input type="text" class="form-control" name="nombre" required>
                        </div><br>
                        <label class="text-success">Apellido</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-user"></i>
                            </span>
                            <input type="text" class="form-control" name="apellido" required>
                        </div><br>
                        <label class="text-success">Fecha de Nacimiento</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="date" class="form-control" name="fecha_nacimiento" required>
                        </div><br>
                        <label class="text-success">Celular</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-phone"></i>
                            </span>
                            <input type="text" class="form-control" name="celular" required>
                        </div><br>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Guardar</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="fa fa-ban"></i> Cancelar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Modal para modificar persona -->
    <div class="modal fade" id="modal-modificar" tabindex="-1" aria-labelledby="modal-modificar" aria-hidden="true">
        <form action="modificar.php" method="POST" enctype="multipart/form-data">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-primary">Modificar Persona</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="mod_id" name="id">
                        <label class="text-success">C.I.</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-address-card-o"></i>
                            </span>
                            <input type="text" class="form-control" id="mod_ci" name="ci" required>
                        </div><br>
                        <label class="text-success">Nombre</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-user"></i>
                            </span>
                            <input type="text" class="form-control" id="mod_nombre" name="nombre" required>
                        </div><br>
                        <label class="text-success">Apellido</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-user"></i>
                            </span>
                            <input type="text" class="form-control" id="mod_apellido" name="apellido" required>
                        </div><br>
                        <label class="text-success">Fecha de Nacimiento</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="date" class="form-control" id="mod_fecha_nacimiento" name="fecha_nacimiento" required>
                        </div><br>
                        <label class="text-success">Celular</label>
                        <div class="input-group">
                            <span class="input-group-text text-success">
                                <i class="fa fa-phone"></i>
                            </span>
                            <input type="text" class="form-control" id="mod_celular" name="celular" required>
                        </div><br>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Guardar Cambios</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="fa fa-ban"></i> Cancelar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <footer>
        <div>
            <p>© 2024 Aplicación de Registros Anecdóticos</p>
        </div>
    </footer>

    <script src="/sarad/estilo/js/bootstrap.bundle.min.js"></script>
    <script>
        function modificar(id, ci, nombre, apellido, fecha_nacimiento, celular) {
            document.getElementById('mod_id').value = id;
            document.getElementById('mod_ci').value = ci;
            document.getElementById('mod_nombre').value = nombre;
            document.getElementById('mod_apellido').value = apellido;
            document.getElementById('mod_fecha_nacimiento').value = fecha_nacimiento;
            document.getElementById('mod_celular').value = celular;
        }
    </script>
</body>
</html>