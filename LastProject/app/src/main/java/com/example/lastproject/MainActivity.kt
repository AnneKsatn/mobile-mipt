package com.example.lastproject

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btn_registr.setOnClickListener {
            registration()
        }

        go_to_login.setOnClickListener {
            val intent = Intent(this, LoginActivity::class.java)
            startActivity(intent)
        }
    }

    private fun registration() {
        val email = email_registr.text.toString()
        val password = password_registr.text.toString()

        if (email.isEmpty() || password.isEmpty()) {
            Toast.makeText(this, "Пожалуйста, введите email и пароль", Toast.LENGTH_SHORT).show()
            return
        }

        FirebaseAuth.getInstance().createUserWithEmailAndPassword(email, password)
            .addOnCompleteListener(this) { task ->
                if (task.isSuccessful) {
                        Log.d("Main", "Successfully created user")
                        val intent = Intent(this, ListActivity::class.java)
                        intent.flags =
                            Intent.FLAG_ACTIVITY_CLEAR_TASK.or(Intent.FLAG_ACTIVITY_NEW_TASK)
                        startActivity(intent)
                        return@addOnCompleteListener
                    }

            }
            .addOnFailureListener {
                Log.d("MainActivity", "Ошибка создания пользователя")
                Toast.makeText(this, "email/пароль не корректен", Toast.LENGTH_SHORT).show()
            }
    }
}

class User(val email: String, val uid: String)