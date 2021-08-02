package com.ucreativa.servicesuma;

import org.springframework.data.annotation.Id;

import java.util.Date;

public class Suma {
    @Id
    public String id;
    public String operacion;
    public Date fecha;
    public int resultado;

    public Suma(){};
    public Suma(String operacion, int resultado){
        this.operacion = operacion;
        this.resultado = resultado;
        this.fecha = new Date();
    }
    @Override
    public String toString() {
        return String.format(
                "Suma[id=%s, fecha='%s', operacion='%s', resultado='%s']",
                id, fecha, operacion, resultado);
    }
}
