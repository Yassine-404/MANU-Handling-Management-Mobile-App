package com.example.manu;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;

public class IndexOR extends AppCompatActivity {

    TextView nom_utilisateur;
    CardView cardaddmanu3, cardsearchmanu3, cardverifmanu3, carddeconnecter3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_indexor);

        SharedPreferences sp=getSharedPreferences("credentials",MODE_PRIVATE);
    }

}