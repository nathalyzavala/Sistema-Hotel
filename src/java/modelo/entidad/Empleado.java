package modelo.entidad;


import java.util.HashSet;
import java.util.Set;

/**
 * Empleado generated by hbm2java
 */
public class Empleado implements java.io.Serializable {

    private int idempleado;
    private Cargos cargos;
    private String nombres;
    private String apellidos;
    private String tipodocumento;
    private String numerodocu;
    private String direccion;
    private String telefono;
    private String email;
    private Set reservas = new HashSet(0);
    private Set usuarioses = new HashSet(0);

    public Empleado() {
    }

    public Empleado(int idempleado) {
        this.idempleado = idempleado;
    }

    public Empleado(int idempleado, Cargos cargos, String nombres, String apellidos, String tipodocumento, String numerodocu, String direccion, String telefono, String email) {
        this.idempleado = idempleado;
        this.cargos = cargos;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.tipodocumento = tipodocumento;
        this.numerodocu = numerodocu;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }

    public Empleado(int idempleado, Cargos cargos) {
        this.idempleado = idempleado;
        this.cargos = cargos;
    }

    public Empleado(int idempleado, Cargos cargos, String nombres, String apellidos, String tipodocumento, String numerodocu, String direccion, String telefono, String email, Set reservas, Set usuarioses) {
        this.idempleado = idempleado;
        this.cargos = cargos;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.tipodocumento = tipodocumento;
        this.numerodocu = numerodocu;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.reservas = reservas;
        this.usuarioses = usuarioses;
    }

    public int getIdempleado() {
        return this.idempleado;
    }

    public void setIdempleado(int idempleado) {
        this.idempleado = idempleado;
    }

    public Cargos getCargos() {
        return this.cargos;
    }

    public void setCargos(Cargos cargos) {
        this.cargos = cargos;
    }

    public String getNombres() {
        return this.nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return this.apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTipodocumento() {
        return this.tipodocumento;
    }

    public void setTipodocumento(String tipodocumento) {
        this.tipodocumento = tipodocumento;
    }

    public String getNumerodocu() {
        return this.numerodocu;
    }

    public void setNumerodocu(String numerodocu) {
        this.numerodocu = numerodocu;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set getReservas() {
        return this.reservas;
    }

    public void setReservas(Set reservas) {
        this.reservas = reservas;
    }

    public Set getUsuarioses() {
        return this.usuarioses;
    }

    public void setUsuarioses(Set usuarioses) {
        this.usuarioses = usuarioses;
    }

    public String nombrecompleto() {

        return nombres + " " + apellidos;
    }

}
