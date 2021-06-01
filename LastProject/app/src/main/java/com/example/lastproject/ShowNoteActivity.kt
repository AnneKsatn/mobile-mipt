package com.example.lastproject

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import kotlinx.android.synthetic.main.activity_show_note.*
import kotlinx.android.synthetic.main.activity_show_note.view.*

class ShowNoteActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_show_note)

        val title = intent.getStringExtra("title")
        val content = intent.getStringExtra("content")

        val id = intent.getStringExtra("id").toString()

        title_edit.setText(title)
        content_edit.setText(content)

        val uid = FirebaseAuth.getInstance().uid
        val database = FirebaseDatabase.getInstance()
        val myRef = database.getReference("notes/" + uid.toString())

        save_btn.setOnClickListener {

            var model = DatabaseModel(title_edit.text.toString(), content_edit.text.toString(), id)
            myRef.child(id!!).setValue(model)
            finish()
        }


        delete_btn.setOnClickListener {
            myRef.child(id!!).removeValue();
            finish()
        }
    }
}