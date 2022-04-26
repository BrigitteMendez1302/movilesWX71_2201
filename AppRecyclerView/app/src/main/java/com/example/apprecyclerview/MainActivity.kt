package com.example.apprecyclerview

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class MainActivity : AppCompatActivity() {
    var contacts = ArrayList<Contact>()

    // creando el adapter
    var contactAdapter = ContactAdapter(contacts)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        loadContacts()
        initView()
    }

    private fun initView() {
        val rvContact = findViewById<RecyclerView>(R.id.rvContact)
        rvContact.adapter = contactAdapter
        rvContact.layoutManager = LinearLayoutManager(this)
    }

    private fun loadContacts() {
        contacts.add(Contact("Arturo B.", "998656235"))
        contacts.add(Contact("Daniel B.", "559598123"))
        contacts.add(Contact("Brigitte B.", "559598123"))
        contacts.add(Contact("Fio B.", "559598123"))
        contacts.add(Contact("Brigitte B.", "559598123"))
        contacts.add(Contact("Fio B.", "559598123"))
        contacts.add(Contact("Brigitte B.", "559598123"))
        contacts.add(Contact("Fio B.", "559598123"))
        contacts.add(Contact("Brigitte B.", "837378"))
        contacts.add(Contact("Fio B.", "559598123"))
        contacts.add(Contact("Brigitte B.", "3275378"))
        contacts.add(Contact("Brigitte B.", "559598123"))
        contacts.add(Contact("Fio B.", "0262626"))
        contacts.add(Contact("Brigitte B.", "559783783598123"))
        contacts.add(Contact("Fio B.", "559598123"))
        contacts.add(Contact("Brigitte B.", "559598123"))
        contacts.add(Contact("Brigitte B.", "83378378378"))


    }
}