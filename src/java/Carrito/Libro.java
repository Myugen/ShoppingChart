/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Carrito;

/**
 *
 * @author mcabsan
 */
public class Libro {
    int id;
    String titulo;
    float precio;
    int cantidad;
    
    //Constructor
    public Libro (int i, String t, float p, int c) {
        id = i;
        titulo = t;
        precio = p;
        cantidad = c;
    }
    
    //Setters/Getters
    public int getId () {
        return id;
    }
    public void setId (int i) {
        id = i;
    }
    public String getTitulo () {
        return titulo;
    }
    public void setTitulo (String t) {
        titulo = t;
    }
    public float getPrecio () {
        return precio;
    }
    public void setPrecio (float p) {
        precio = p;
    }
    public int getCantidad () {
        return cantidad;
    }
    public void setCantidad (int c) {
        cantidad = c;
    }
    
    //Métodos
    public float montoTotal () {
        return precio * cantidad;
    }
}
