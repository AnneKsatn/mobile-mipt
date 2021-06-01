package com.example.lastproject

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.rv_layout.view.*

class DataAdapter(var list: ArrayList<DatabaseModel>): RecyclerView.Adapter<DataAdapter.ViewHolder>() {


    class ViewHolder(itemView: View): RecyclerView.ViewHolder(itemView)  {
        var title = itemView.title
        var content = itemView.content

        init {
            itemView.setOnClickListener {
                Log.d("Data", "Выбран элемент")

//                val intent = Intent(, ListActivity::class.java)
//                intent.flags =
//                    Intent.FLAG_ACTIVITY_CLEAR_TASK.or(Intent.FLAG_ACTIVITY_NEW_TASK)
//                startActivity(intent)

            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.rv_layout, parent, false))
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.title.text = list[position].title
        holder.content.text = list[position].content
    }

    override fun getItemCount(): Int {
        return list.size
    }

}