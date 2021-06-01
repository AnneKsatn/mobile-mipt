package com.example.lastproject

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase

class NewNoteActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_new_note)

        val database = FirebaseDatabase.getInstance()
        val myRef = database.getReference("notes")

        var id = myRef.push().key

        var model = DatabaseModel("TITLE", "CONTENT")
        myRef.child(id!!).setValue(model)
    }
}