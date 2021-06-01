package com.example.lastproject

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_show_note.*

class ShowNoteActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_show_note)

        val title = intent.getStringExtra("title")
        val content = intent.getStringExtra("content")

        show_title.setText(title)
        show_content.setText(content)
    }
}