package com.example.lastproject

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.firebase.database.FirebaseDatabase
import kotlinx.android.synthetic.main.activity_new_note.*

class NewNoteActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_new_note)

        val database = FirebaseDatabase.getInstance()
        val myRef = database.getReference("notes")

        new_note_btn.setOnClickListener {

            var id = myRef.push().key

            val title = new_note_title.text.toString()
            val content = new_note_content.text.toString()

            var model = DatabaseModel(title, content, id)
            myRef.child(id!!).setValue(model)

            val intent = Intent(this, ListActivity::class.java)
            intent.flags =
                Intent.FLAG_ACTIVITY_CLEAR_TASK.or(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
        }
    }
}