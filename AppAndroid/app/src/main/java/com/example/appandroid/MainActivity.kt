package com.example.appandroid

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val email = email_registr.text.toString()
        val password = password_registr.text.toString()

        Log.d("MainActivity", "Email is " + email)
        Log.d("MainActivity", "Password " + password)
    }
}