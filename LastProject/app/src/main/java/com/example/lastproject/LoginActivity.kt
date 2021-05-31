package com.example.lastproject

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.ktx.Firebase
import kotlinx.android.synthetic.main.activity_login.*
import kotlinx.android.synthetic.main.activity_main.*

class LoginActivity: AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        btn_login.setOnClickListener {
            val email = email_login.text.toString()
            val password = password_login.text.toString()

            FirebaseAuth.getInstance().signInWithEmailAndPassword(email, password)
//                .addOnCompleteListener()
//                .ad
        }

        go_to_redistr.setOnClickListener {
            finish()
        }
    }
}