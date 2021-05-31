package com.example.appandroid

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.provider.Telephony
import android.util.Log
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btn_registr.setOnClickListener {
            val email = email_registr.text.toString()
            val password = password_registr.text.toString()

            Log.d("MainActivity", "Email is " + email)
            Log.d("MainActivity", "Password " + password)

        }

        have_account_text.setOnClickListener {
            Log.d("MainActivity", "Show Login Page")

            val intent = Intent(this, LoginActivity::class.java)
            startActivity(intent)
        }
    }
}