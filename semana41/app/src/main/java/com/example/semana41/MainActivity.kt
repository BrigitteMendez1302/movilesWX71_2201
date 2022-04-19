package com.example.semana41

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    //global variables
    lateinit var questions: ArrayList<Question> // se empieza a crear in execution time
    var position = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        loadQuestions()
        setUpViews()
    }

    private fun loadQuestions() {
        questions = ArrayList()
        val question = Question("Es Lima capital de Peru", true)
        questions.add(question)
        questions.add(Question("Es Lima capital de Chile", false))
        questions.add(Question("Es Ica capital de Chile", false))
        questions.add(Question("Es La Paz capital de Bolivia", true))
    }

    private fun setUpViews() {
        val btYes = findViewById<Button>(R.id.btYes)
        val btNo = findViewById<Button>(R.id.btNo)
        val btNext = findViewById<Button>(R.id.btNext)
        val tvSentence = findViewById<TextView>(R.id.tvSentence)

        tvSentence.text  = questions[position].sentence

        btYes.setOnClickListener{
            if (questions[position].answer === true)
            Toast.makeText(this, "Correct", Toast.LENGTH_LONG).show()
            else
                Toast.makeText(this, "Incorrect", Toast.LENGTH_LONG).show()
        }

        btNo.setOnClickListener{
            if (!questions[position].answer === true)
                Toast.makeText(this, "Correct", Toast.LENGTH_LONG).show()
            else
                Toast.makeText(this, "Incorrect", Toast.LENGTH_LONG).show()
        }

        btNext.setOnClickListener{
            position++
            showSentence()
        }
    }

    private fun showSentence() {
        val tvSentence = findViewById<TextView>(R.id.tvSentence)
        tvSentence.text  = questions[position].sentence
    }

}