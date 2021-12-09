

<%@page import="Adicionales.NoEliminacion"%>
<%@page import="java.util.List"%>
<%@page import="modelo.entidad.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
    try {
        if (session.getAttribute("user") == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro de Clientes</title>
        <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap/font-awesome/css/font-awesome.min.css">    
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500" rel="stylesheet">
        <!--validator-->
        <link href="resources/bootstrapvalidator/dist/css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrapvalidator/src/css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrap/css/diseño.css" rel="stylesheet" type="text/css"/>
        <link href="resources/tablas/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            NoEliminacion ne =new NoEliminacion();
            Clientes clientes = (Clientes) request.getAttribute("clientes");
        
            String tipo = String.valueOf(session.getAttribute("tipo"));
        %>
        
        <%if(tipo.equals("Ordenanza")){%>
        <%@include file="menuencabezadoempleado.jsp" %>
        <%}else{%>
        <%@include file="menuencabezado.jsp" %>
        <%}%>
        <main class="page-content">
            <div class="row">
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <%if (clientes != null) {%> 
                                    <h3>Modificar Registro de Clientes</h3>
                                    <%} else {%> 
                                    <h3>Registro de Clientes</h3>
                                    <%}%>
                                </div>
                                <hr>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form id="form-cliente" <%if (clientes != null) {%> 
                                      action="EditarClientes.do"
                                      <%} else {%> 
                                      action="AgregarClientes.do"
                                      <%}%> method="GET" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Nombre</label>
                                            <div class="col-sm-6">
                                                <input type="text" <%if (clientes != null) {%>  value="<%= clientes.getNombres()%>"<%}%> class="form-control" name="nombre" required>
                                                <input type="text" <%if (clientes != null) {%>  value="<%= clientes.getIdcliente()%>"<%}%> name="idcliente" style="display: none;" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Apellidos</label>
                                            <div class="col-sm-6">
                                                <input type="text" <%if (clientes != null) {%>  value="<%= clientes.getApellidos()%>"<%}%> class="form-control" name="apellido" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Tipo de Documento</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="tipodocumento" required>
                                                    <option selected="selected" value=" ">Seleccione</option>
                                                    <%if (clientes == null) {%>
                                                    <option value="Dui">Dui</option>
                                                    <option value="Nit">Nit</option>
                                                    <option value="Pasaporte">Pasaporte</option>
                                                    <%} else {%>

                                                    <%if (clientes.getTipodocu().equals("Dui")) {%>
                                                    <option selected="selected" value="<%= clientes.getTipodocu()%>"><%= clientes.getTipodocu()%></option>
                                                    <option value="Nit">Nit</option>
                                                    <option value="Pasaporte">Pasaporte</option>
                                                    <%} else if (clientes.getTipodocu().equals("Nit")) {%>
                                                    <option value="Dui">Dui</option>
                                                    <option selected="selected" value="<%= clientes.getTipodocu()%>"><%= clientes.getTipodocu()%></option>
                                                    <option value="Pasaporte">Pasaporte</option>
                                                    <%} else {%>
                                                    <option value="Dui">Dui</option>
                                                    <option value="Nit">Nit</option>
                                                    <option selected="selected" value="<%= clientes.getTipodocu()%>"><%= clientes.getTipodocu()%></option>
                                                    <%}
                                                        }%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Numero de Documento</label>
                                            <div class="col-sm-6">
                                                <input type="text" <%if (clientes != null) {%>  value="<%= clientes.getNumdocu()%>"<%}%> class="form-control" name="numdocumento" required>
                                                <!--variable para jugar-->
                                                <input type="text" <%if (clientes != null) {%>  value="<%= clientes.getNumdocu()%>"<%}%> class="form-control" name="jugar" style="display: none;">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Direccion</label>
                                            <div class="col-sm-6">
                                                <textarea name="direccion"><%if (clientes != null) {%><%= clientes.getDireccion()%><%} else {%> <%}%></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Telefono</label>
                                            <div class="col-sm-6">
                                                <input type="text" <%if (clientes != null) {%>  value="<%= clientes.getTelefono()%>"<%}%> class="form-control" name="telefono" required>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.box-footer -->
                                    <hr>
                                    <div class="box-footer">
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <button type="submit" class="btn btn-primary pull-right"><span class="fa fa-save"></span> Guardar</button>
                                            </div>
                                            <div class="col-sm-3">
                                                <button id="limpiar" name="limpiar" type="reset" class="btn btn-warning"><span class="fa fa-dedent"></span> Limpiar</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.box-footer -->
                                </form>
                            </div>
                            <!-- /.box -->

                            <!-- Input addon -->
                        </div>
                        <!--/.col (left) -->
                    </div>
                    <!-- /.row -->
                </section>
                <br>
                <br>
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Listado de Clientes</h3>
                                </div>
                                <hr>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table data-table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nombres</th>
                                                <th>Apellidos</th>
                                                <th>Documento</th>
                                                <th>No. Documento</th>
                                                <th>Dirección</th>
                                                <th>Teléfono</th>
                                                <th>Acciones</th>
                                                <th>Mensaje</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Clientes> lstclientes = (List<Clientes>) request.getAttribute("listadoclientes");
                                                for (Clientes c : lstclientes) {
                                            %>
                                            <tr>
                                                <td><%= c.getNombres()%></td>
                                                <td><%= c.getApellidos()%></td>
                                                <td><%= c.getTipodocu()%></td>
                                                <td><%= c.getNumdocu()%></td>
                                                <td><%= c.getDireccion()%></td>
                                                <td><%= c.getTelefono()%></td>
                                                <td>
                                                    <a name="editar" href="ModificarClientes.do?idcliente=<%= c.getIdcliente()%>" class="btn btn-success"><span class="fa fa-edit"></span></a>

                                                    <%if (ne.buscaridclienteidhabitacionreserva(c.getIdcliente(),0,0) != null) {%>
                                                    <button name="borrar" onclick=" swal('Error', 'Este registro no se puede eliminar!', 'error');" class="btn btn-danger" id="btn-eliminar"><span class="fa fa-remove"></span></button>
                                                        <%} else {%>
                                                    <a name="borrar" href="BorrarClientes.do?idcliente=<%= c.getIdcliente()%>" class="btn btn-danger"><span class="fa fa-trash"></span></a>
                                                        <%}%>
                                                </td>
                                                <td>
                                                    <%if (ne.buscaridclienteidhabitacionreserva(c.getIdcliente(),0,0) != null) {%>
                                                    <span class="badge badge-pill badge-noeliminar">No Eliminable</span>
                                                    <%} else {%>
                                                    <span class="badge badge-pill badge-eliminar">Eliminable</span>
                                                    <%}%>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
            </div>
        </main>
        <%@include file="footer.jsp" %>
        <!-- /#page-content-wrapper -->
        <script src="resources/jquery/jquery-3.4.0.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/tablas/scrolltable.js" type="text/javascript"></script>

        <!--validator-->
        <script src="resources/bootstrapvalidator/dist/js/bootstrapValidator.min.js" type="text/javascript"></script>
        <script src="resources/dist/js/validacionesformularios.js" type="text/javascript"></script>

        <!--sweet alert-->
        <script src="resources/sweetalert-master/docs/assets/sweetalert/sweetalert.min.js" type="text/javascript"></script>
        <script src="resources/tablas/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="resources/tablas/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/dist/js/diseño.js" type="text/javascript"></script>
        <!-- page script -->
        <script>
                                                        $(function () {
                                                            $('#example1').DataTable()
                                                            $('#example2').DataTable({
                                                                'paging': true,
                                                                'lengthChange': false,
                                                                'searching': false,
                                                                'ordering': true,
                                                                'info': true,
                                                                'autoWidth': false
                                                            });
                                                        });
        </script>
    </body>
</html>
<script type="text/javascript"> var idleTime = 0;
    $(document).ready(function () {
        var idleInterval = setInterval(timerIncrement, 600); // 1 minute //Zero the idle timer on mouse movement.
        $(this).mousemove(function (e) {
            idleTime = 0;
        });
        $(this).keypress(function (e) {
            idleTime = 0;
        });
    });
    function timerIncrement() {
        idleTime = idleTime + 1;
        if (idleTime > 50) { // 20 minutes 
            location.href="Login.jsp";
        }
    }</script> 