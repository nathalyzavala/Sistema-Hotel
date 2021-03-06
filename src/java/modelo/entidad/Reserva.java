package modelo.entidad;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Reserva generated by hbm2java
 */
public class Reserva implements java.io.Serializable {

    private int idreserva;
    private Clientes clientes;
    private Empleado empleado;
    private Habitacion habitacion;
    private String tiporeserva;
    private Date fechareserva;
    private Date fechaingresada;
    private Date fechasalida;
    private String estado;
    private Set pagos = new HashSet(0);
    private Set consumos = new HashSet(0);

    public Reserva() {
    }

    public Reserva(int idreserva) {
        this.idreserva = idreserva;
    }

    public Reserva(int idreserva, Clientes clientes, Empleado empleado, Habitacion habitacion, String tiporeserva, Date fechareserva, Date fechaingresada, Date fechasalida, String estado) {
        this.idreserva = idreserva;
        this.clientes = clientes;
        this.empleado = empleado;
        this.habitacion = habitacion;
        this.tiporeserva = tiporeserva;
        this.fechareserva = fechareserva;
        this.fechaingresada = fechaingresada;
        this.fechasalida = fechasalida;
        this.estado = estado;
    }

    public Reserva(int idreserva, Clientes clientes, Empleado empleado, Habitacion habitacion) {
        this.idreserva = idreserva;
        this.clientes = clientes;
        this.empleado = empleado;
        this.habitacion = habitacion;
    }

    public Reserva(int idreserva, Clientes clientes, Empleado empleado, Habitacion habitacion, String tiporeserva, Date fechareserva, Date fechaingresada, Date fechasalida, String estado, Set pagos, Set consumos) {
        this.idreserva = idreserva;
        this.clientes = clientes;
        this.empleado = empleado;
        this.habitacion = habitacion;
        this.tiporeserva = tiporeserva;
        this.fechareserva = fechareserva;
        this.fechaingresada = fechaingresada;
        this.fechasalida = fechasalida;
        this.estado = estado;
        this.pagos = pagos;
        this.consumos = consumos;
    }

    public int getIdreserva() {
        return this.idreserva;
    }

    public void setIdreserva(int idreserva) {
        this.idreserva = idreserva;
    }

    public Clientes getClientes() {
        return this.clientes;
    }

    public void setClientes(Clientes clientes) {
        this.clientes = clientes;
    }

    public Empleado getEmpleado() {
        return this.empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Habitacion getHabitacion() {
        return this.habitacion;
    }

    public void setHabitacion(Habitacion habitacion) {
        this.habitacion = habitacion;
    }

    public String getTiporeserva() {
        return this.tiporeserva;
    }

    public void setTiporeserva(String tiporeserva) {
        this.tiporeserva = tiporeserva;
    }

    public Date getFechareserva() {
        return this.fechareserva;
    }

    public void setFechareserva(Date fechareserva) {
        this.fechareserva = fechareserva;
    }

    public Date getFechaingresada() {
        return this.fechaingresada;
    }

    public void setFechaingresada(Date fechaingresada) {
        this.fechaingresada = fechaingresada;
    }

    public Date getFechasalida() {
        return this.fechasalida;
    }

    public void setFechasalida(Date fechasalida) {
        this.fechasalida = fechasalida;
    }

    public String getEstado() {
        return this.estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Set getPagos() {
        return this.pagos;
    }

    public void setPagos(Set pagos) {
        this.pagos = pagos;
    }

    public Set getConsumos() {
        return this.consumos;
    }

    public void setConsumos(Set consumos) {
        this.consumos = consumos;
    }

    /*calculando el costo de pago total por los dias de instancias*/
    public double pagohabitacion() {
        double pagototal = 0;
        int dias=(int)((getFechasalida().getTime()-getFechaingresada().getTime())/86400000);
        pagototal=(dias*Double.parseDouble(String.valueOf(getHabitacion().getPreciodiario())));
        return pagototal;
    }
    
    public int dias() {
        int dias=(int)((getFechasalida().getTime()-getFechaingresada().getTime())/86400000);
        return dias;
    }

}
