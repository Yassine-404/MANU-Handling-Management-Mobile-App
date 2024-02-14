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

public class IndexVE extends AppCompatActivity {

    TextView nom_utilisateur;
    CardView cardverifmanu, cardconsmanu2, carddeconnecter2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState); 
        setContentView(R.layout.activity_indexve);

        SharedPreferences sp=getSharedPreferences("credentials",MODE_PRIVATE);
        nom_utilisateur = findViewById(R.id.nom_utilisateur1);

        if(sp.contains("uname"))
            nom_utilisateur.setText(sp.getString("uname",""));

        YoYo.with(Techniques.SlideInDown)
                .duration(1000)
                .playOn(findViewById(R.id.cardverifmanu));
        YoYo.with(Techniques.SlideInDown)
                .duration(1000)
                .playOn(findViewById(R.id.cardconsmanu2));
        YoYo.with(Techniques.SlideInDown)
                .duration(1000)
                .playOn(findViewById(R.id.carddeconnecter2));

        cardverifmanu = findViewById(R.id.cardverifmanu);
        cardverifmanu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(getApplicationContext(),Verif.class);
                startActivity(intent);
            }
        });

        carddeconnecter2 = findViewById(R.id.carddeconnecter2);
        carddeconnecter2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v2) {
                final ProgressDialog progressDialog = new ProgressDialog(IndexVE.this);
                progressDialog.setMessage("Deconnexion...");
                SharedPreferences sp=getSharedPreferences("credentials",MODE_PRIVATE);
                if(sp.contains("uname"))
                {
                    progressDialog.show();
                    SharedPreferences.Editor editor=sp.edit();
                    editor.remove("uname");
                    editor.commit();
                    startActivity(new Intent(getApplicationContext(),MainActivity.class));
                }
            }
        });
    }
    @Override
    public void onBackPressed(){

    }
}