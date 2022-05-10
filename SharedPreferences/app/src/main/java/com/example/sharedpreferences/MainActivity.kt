package com.example.sharedpreferences

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import com.google.android.material.textfield.TextInputEditText

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val sharedPreferences = SharedPreferences(this)
        val btSave = findViewById<Button>(R.id.btSave)
        val btRetrieve = findViewById<Button>(R.id.btRetrieve)
        val etName = findViewById<TextInputEditText>(R.id.etName)
        val tvRetrieved = findViewById<TextView>(R.id.tvRetrieved)

        btSave.setOnClickListener{
            val name = etName.text.toString()
            sharedPreferences.save(keyName = "name", name)
            Toast.makeText(this, "Data saved", Toast.LENGTH_LONG).show()
        }

        btRetrieve.setOnClickListener {
            if (sharedPreferences.getValues("name") != null){
                tvRetrieved.setText(sharedPreferences.getValues("name"))
                Toast.makeText(this, "Data retrieved", Toast.LENGTH_LONG).show()
            }
        }
    }
}