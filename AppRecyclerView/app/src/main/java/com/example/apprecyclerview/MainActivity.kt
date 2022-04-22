package com.example.apprecyclerview

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    var contacts = ArrayList<Contact>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadContacts()
    }

    private fun loadContacts() {
        contacts.add(Contact("Arturo B.", "998656235"))
        contacts.add(Contact("Daniel B.", "559598123"))
    }
}