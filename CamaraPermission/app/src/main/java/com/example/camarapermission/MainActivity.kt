package com.example.camarapermission

import android.Manifest
import android.content.pm.PackageManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

class MainActivity : AppCompatActivity() {
    private val CAMERA_REQUEST_CODE = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btRequest = findViewById<Button>(R.id.btRequest)
        btRequest.setOnClickListener{
            checkCameraPermission()
        }
    }

    private fun checkCameraPermission() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED)
        {
            //Permiso rechazado
            requestCameraPermission()
        } else {
            //Permiso aceptado
            Toast.makeText(this, "Permission acepted", Toast.LENGTH_LONG).show()
        }
    }

    private fun requestCameraPermission() {
        if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.CAMERA)) {
            // si el usuario rechazo el permiso anteriormente, que vaya a ajustes de manera manual
            Toast.makeText(this, "You denied the permission, go to settings and activate it manually", Toast.LENGTH_LONG).show()
        } else {
            // si el usuario nunca ha rechazado ni aceptado, se le pedira permiso
            Toast.makeText(this, "Accept permission please", Toast.LENGTH_LONG).show()
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CAMERA), CAMERA_REQUEST_CODE)
        }
    }

    // voy a ver que me respondio el usuario acerca del permiso que pedi
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when (requestCode) {
            CAMERA_REQUEST_CODE -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    //permiso aceptado por el usuario
                    // llamaria a la funcionalidad que quiera hacer
                    Toast.makeText(this, "Se autorizo el acceso a la camara", Toast.LENGTH_LONG).show()
                } else {
                    Toast.makeText(this, "No se autorizo el acceso a la camara", Toast.LENGTH_LONG).show()
                }
                return
            }
        }
    }
}