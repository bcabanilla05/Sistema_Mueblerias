/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistema_mueblerias;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author bruno
 */
public class Conexion {

    public static Connection conectar() {
        try {
            Connection cn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:2005/Sistema_Mueblerias",
                "postgres",
                "Lucca0412"
            );
            return cn;
        } catch (SQLException e) {
            System.out.println("Error de conexión: " + e.getMessage());
            return null;
        }
    }
}