

<%@page import="Adicionales.NoEliminacion"%>
<%@page import="modelo.entidad.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="modelo.entidad.Producto"%>
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
        <title>Registro de Productos</title>
        <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap/font-awesome/css/font-awesome.min.css">    
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500" rel="stylesheet">

        <link href="resources/bootstrapvalidator/dist/css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrapvalidator/src/css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>

        <link href="resources/bootstrap/css/diseño.css" rel="stylesheet" type="text/css"/>
        <link href="resources/tablas/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            NoEliminacion ne = new NoEliminacion();
            Producto productos = (Producto) request.getAttribute("producto");
            String tipo = String.valueOf(session.getAttribute("tipo"));
        %>

        <%if (tipo.equals("Ordenanza")) {%>
        <%@include file="menuencabezadoempleado.jsp" %>
        <%} else {%>
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
                                    <h3>Registro de Productos</h3>
                                </div>
                                <hr>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form id="form-producto" <%if (productos != null) {%> 
                                      action="EditarProductos.do"
                                      <%} else {%> 
                                      action="AgregarProductos.do"
                                      <%}%> method="GET" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Nombre</label>
                                            <div class="col-sm-6">
                                                <input type="text" <%if (productos != null) {%>  value="<%= productos.getNombre()%>"<%}%> class="form-control" name="nombre" required>
                                                <!--variable para jugar-->
                                                <input type="text" <%if (productos != null) {%>  value="<%= productos.getNombre()%>"<%}%> class="form-control" name="jugar" style="display: none;">
                                                <input type="text" <%if (productos != null) {%>  value="<%= productos.getIdproducto()%>"<%}%> name="idproducto" style="display: none;" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Categoria</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="idcategoria" required>
                                                    <option selected="selected" value=" ">Seleccione</option>
                                                    <%
                                                        List<Categoria> lstcategoria = (List<Categoria>) request.getAttribute("listacategorias");
                                                        for (Categoria c : lstcategoria) {
                                                            if (productos != null) {
                                                                if (c.getIdcategoria() == productos.getCategoria().getIdcategoria()) {
                                                    %>
                                                    <option selected="selected" value="<%= c.getIdcategoria()%>"><%= c.getNombre()%></option>
                                                    <%} else {%>
                                                    <option value="<%= c.getIdcategoria()%>"><%= c.getNombre()%></option>
                                                    <%}%>
                                                    <%} else {%>
                                                    <option value="<%= c.getIdcategoria()%>"><%= c.getNombre()%></option>
                                                    <%}
                                                        }%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Descripción</label>
                                            <div class="col-sm-6">
                                                <textarea name="descripcion" required><%if (productos != null) {%><%= productos.getDescripcion()%><%} else {%><%}%></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Precio de Venta</label>
                                            <div class="col-sm-6">
                                                <%if (productos != null) {%>
                                                <input type="text" readonly="readonly" value="<%= productos.getPrecioventa()%>" class="form-control" name="precioventamodificar">
                                                <%} else {%>
                                                <input type="text"  class="form-control" name="precioventa" required>
                                                <%}%>
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
                                    <h3 class="box-title">Listado de Productos</h3>
                                </div>
                                <hr>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Categoría</th>
                                                <th>Descripción</th>
                                                <th>Precio de Venta</th>
                                                <th>Acciones</th>
                                                <th>Mensaje</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Producto> lstproductos = (List<Producto>) request.getAttribute("listaproductos");
                                                for (Producto p : lstproductos) {
                                            %>
                                            <tr>
                                                <td><%= p.getNombre()%></td>
                                                <td><%= p.getCategoria().getNombre()%></td>
                                                <td><%= p.getDescripcion()%></td>
                                                <td><%= p.getPrecioventa()%></td>
                                                <td>
                                                    <a name="editar" href="ModificarProductos.do?idproducto=<%= p.getIdproducto()%>"  class="btn btn-success"><span class="fa fa-edit"></span></a>
                                                        <%if (ne.buscaridproductoconsumo(p.getIdproducto()) != null) {%>
                                                    <button name="borrar" onclick=" swal('Error', 'Este registro no se puede eliminar!', 'error');" class="btn btn-danger" id="btn-eliminar"><span class="fa fa-remove"></span></button>
                                                        <%} else {%>
                                                    <a name="borrar" href="BorrarProductos.do?idproducto=<%= p.getIdproducto()%>"  class="btn btn-danger"><span class="fa fa-trash"></span></a>
                                                        <%}%>
                                                </td>
                                                <td>
                                                    <%if (ne.buscaridproductoconsumo(p.getIdproducto()) != null) {%>
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
        <script src="resources/bootstrapvalidator/dist/js/bootstrapValidator.min.js" type="text/javascript"></script>
        <script src="resources/sweetalert-master/docs/assets/sweetalert/sweetalert.min.js" type="text/javascript"></script>
        <script src="resources/tablas/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="resources/tablas/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/dist/js/diseño.js" type="text/javascript"></script>
        <script src="resources/dist/js/validacionesformularios.js" type="text/javascript"></script>
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
            location.href = "Login.jsp";
        }
    }</script> 