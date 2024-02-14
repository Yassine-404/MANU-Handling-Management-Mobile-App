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

public class IndexAS extends AppCompatActivity {

    TextView nom_utilisateur;
    CardView cardaddmanu, cardsearchmanu1, carddeconnecter1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_indexas);

        SharedPreferences sp=getSharedPreferences("credentials",MODE_PRIVATE);
        nom_utilisateur = findViewById(R.id.nom_utilisateur);
        if(sp.contains("uname"))
            nom_utilisateur.setText(sp.getString("uname",""));

         YoYo.with(Techniques.SlideInDown)
                .duration(1000)
                .playOn(findViewById(R.id.cardaddmanu));
        YoYo.with(Techniques.SlideInDown)
                .duration(1000)
                .playOn(findViewById(R.id.cardsearchmanu1));
        YoYo.with(Techniques.SlideInDown)
                .duration(1000)
                .playOn(findViewById(R.id.carddeconnecter1));

        cardaddmanu = findViewById(R.id.cardaddmanu);
        cardaddmanu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v1) {
                Intent intent1 =new Intent(getApplicationContext(),Add_manu.class);
                startActivity(intent1);
            }
        });

        cardsearchmanu1 = findViewById(R.id.cardsearchmanu1);

        carddeconnecter1 = findViewById(R.id.carddeconnecter1);
        carddeconnecter1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v2) {
                final ProgressDialog progressDialog = new ProgressDialog(IndexAS.this);
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